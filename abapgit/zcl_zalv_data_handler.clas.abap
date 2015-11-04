class ZCL_ZALV_DATA_HANDLER definition
  public
  final
  create public .

public section.
*"* public components of class ZCL_ZALV_DATA_HANDLER
*"* do not include other source files here!!!

  methods CONSTRUCTOR
    importing
      !ALV_USAGE type ref to IF_WD_COMPONENT_USAGE .
  methods REGISTER .
  methods DEREGISTER .
  methods GET_RECORD_COUNT .
  methods GET_EXPORT_DATA
    returning
      value(R_XSTRING) type XSTRING .
protected section.
*"* protected components of class ZCL_ZALV_DATA_HANDLER
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_ZALV_DATA_HANDLER
*"* do not include other source files here!!!

  data NODE_NAME type STRING .
  data CONTROLLER type ref to CL_WDR_CONTROLLER .
  data ALV_USAGE type ref to IF_WD_COMPONENT_USAGE .
  data EXTERNAL_MAPPING type WDR_REVERSE_MAPPED_NODE_INFOS .
  data FUNCTION_EXIT type SEOCLSNAME .
  data USAGE_NAME type STRING .
  data CMP_NAME type STRING .

  methods HDL_NEW_DATA
    for event ON_COLLECTION_CHANGED of CL_WDR_CONTEXT_NODE
    importing
      !CONTROLLER
      !NODE
      !NODE_NAME .
ENDCLASS.



CLASS ZCL_ZALV_DATA_HANDLER IMPLEMENTATION.


method CONSTRUCTOR.

  DATA: lo_ref_ic            TYPE REF TO iwci_salv_wd_table,
        lo_ref_usage         TYPE REF TO cl_wdr_component_usage,
        lo_ref_cmp           TYPE REF TO cl_wdr_component,
        lt_external_mapping  TYPE wdr_reverse_mapped_node_infos,
        lwa_external_mapping TYPE wdr_reverse_mapped_node_info.

  DATA: lt_path TYPE string_table,
        l_count TYPE i,
        l_node  TYPE string.

  lo_ref_usage       ?= alv_usage.
  lo_ref_cmp          = lo_ref_usage->get_child_component( ).
  lt_external_mapping = lo_ref_cmp->get_external_mappings( ).

* save usage name and component for later DB queries
  me->usage_name  = lo_ref_usage->name.
  me->cmp_name    = lo_ref_usage->parent_component->component_name.

*  get the path of mapped context node (one that's mapped with data node of ALV)

   me->alv_usage        = alv_usage.
   me->EXTERNAL_MAPPING = lt_external_mapping.

  READ TABLE lt_external_mapping INTO lwa_external_mapping
    WITH KEY ext_path = 'CONTEXT.DATA'.

  IF sy-subrc EQ 0.
* get the node name from the path

    SPLIT lwa_external_mapping-path AT '.' INTO TABLE lt_path.
    l_count = lines( lt_path ).
    READ TABLE lt_path INDEX l_count INTO l_node.

   me->node_name        = l_node.
   me->controller       = lwa_external_mapping-controller.
  endif.

endmethod.


method DEREGISTER.

set handler hdl_new_data ACTIVATION abap_false.

endmethod.


method GET_EXPORT_DATA.

*
  DATA :
   lo_nd_data         TYPE REF TO if_wd_context_node,
   lv_idx             TYPE sy-tabix,
   lv_refresh         TYPE C ,
   lo_column              TYPE REF TO cl_salv_wd_column,
   lt_alv_columns         TYPE salv_wd_t_column_ref,
   lwa_alv_columns        TYPE salv_wd_s_column_ref,
   lo_rowdesc          TYPE REF TO cl_abap_structdescr,
   lt_fields           TYPE cl_abap_structdescr=>component_table,
   lwa_fields          LIKE LINE OF lt_fields,
   l_file_name         TYPE string,
   l_xstring           TYPE xstring,
   lwa_column          TYPE LINE OF if_fdt_doc_spreadsheet=>t_column,
   lt_column           TYPE if_fdt_doc_spreadsheet=>t_column,
   lo_data             TYPE REF TO data ,
   lr_column_settings TYPE REF TO if_salv_wd_column_settings,
   lr_column          TYPE REF TO cl_salv_wd_column,
   l_index            type i.

  DATA lr_table TYPE REF TO data.
  FIELD-SYMBOLS: <lfs_table> TYPE table,
                 <lfs_row>   type any.

  DATA lo_nd_info     TYPE REF TO if_wd_context_node_info.
  DATA nd_str_descr   TYPE REF TO cl_abap_structdescr.
  DATA nd_tbl_descr   TYPE REF TO cl_abap_tabledescr.

  DATA lt_rows                 TYPE if_salv_bs=>t_type_row.
  data lwa_rows                like line of lt_rows.
  DATA lt_row_outside          TYPE if_salv_bs=>t_type_row.

  data: lr_exit             type ref to   ZIF_ZALV_FUNCTION_EXIT.


* get config model
  DATA lo_interfacecontroller TYPE REF TO iwci_salv_wd_table .
  lo_interfacecontroller ?= me->alv_usage->get_interface_controller( ).

  DATA lo_config TYPE REF TO cl_salv_wd_config_table.
  lo_config = lo_interfacecontroller->get_model(
  ).

* get data node
  DATA: lwa_external_mapping TYPE wdr_reverse_mapped_node_info,
        lo_ctr               TYPE REF TO cl_wdr_controller,
        l_path               TYPE string.

  READ TABLE me->external_mapping INTO lwa_external_mapping
    WITH KEY ext_path = 'CONTEXT.DATA'.

    lo_ctr = lwa_external_mapping-controller.
    l_path = lwa_external_mapping-path+8.

    lo_nd_data ?= lo_ctr->if_wdr_context~get_node( path = l_path  ).

    lo_nd_info = lo_nd_data->get_node_info( ).
    nd_str_descr = lo_nd_info->get_static_attributes_type( ).
    nd_tbl_descr = cl_abap_tabledescr=>create( nd_str_descr ).

    CREATE DATA lr_table TYPE HANDLE nd_tbl_descr.
    ASSIGN lr_table->* TO <lfs_table>.

    lo_nd_data->get_static_attributes_table( IMPORTING table = <lfs_table> ).

*-- If filter is applied
    IF  cl_salv_wd_model_table_util=>if_salv_wd_table_util_fields~is_filter_defined( lo_config ) EQ abap_true.
      cl_salv_wd_filter=>execute(
       EXPORTING
         t_input          = <lfs_table>
         t_fields         = lo_config->if_salv_wd_field_settings~t_fields
         r_config_model   = lo_config
       CHANGING
         t_rows           = lt_rows
         t_row_outside    = lt_row_outside
       EXCEPTIONS
         no_filter_rules = 1 ).

*      clear <lfs_table>.

*      loop at lt_rows into lwa_rows.
*        read table <lfs_table> assigning <lfs_row> index lwa_rows-index.
*        if sy-subrc eq 0.
*          append <lfs_row> to
*        endif.
*
*        assign lwa_rows-R_ROW->* to <lfs_row>.
*        append <lfs_row> to <lfs_table>.
*      endloop.

      loop at <lfs_table> assigning <lfs_row>.
        l_index = sy-tabix.
        read table lt_rows into lwa_rows with key row_index = l_index.
        if sy-subrc ne 0.
          delete <lfs_table> index l_index.
        endif.
      endloop.

    ENDIF.


* get column descriptions from ALV model

  lt_alv_columns = lo_config->if_salv_wd_column_settings~get_columns( ).


* start download logic
  IF nd_str_descr IS NOT INITIAL.
    lt_fields = nd_str_descr->get_components( ).
  ENDIF.

  LOOP AT lt_fields INTO lwa_fields.

*   check if columns exists in ALV Config (deleted columns should be exported)
    READ TABLE lt_alv_columns INTO lwa_alv_columns WITH KEY id = lwa_fields-name.
    IF sy-subrc EQ 0.
      lwa_column-display_name = lwa_alv_columns-r_column->r_header->get_text( ).
    ELSE.
       continue.
*      lwa_column-display_name = lwa_fields-name.
    ENDIF.

* Prepare structure for header text
    lwa_column-id           = sy-tabix.
    lwa_column-name         = lwa_fields-name.

    lwa_column-is_result    = abap_true.
    lwa_column-type         = lwa_fields-type.
    APPEND lwa_column TO lt_column.
    CLEAR lwa_column.
  ENDLOOP.

* call function exit to update the excel data
  if me->function_exit is initial.
    select single function_exit from ztalv_config_var
      into me->function_exit
    WHERE component     = me->cmp_name
      AND alv_usage     = me->usage_name
      and config_source = zcl_zalv_ui=>c_wrapper_config.
  endif.

* If function exit is maintained, then call the exit method
  if me->function_exit is not initial.
    create object lr_exit type (me->function_exit).
    lr_exit->GET_EXPORT_DATA( exporting I_DEFINATION  = nd_tbl_descr
                              changing  EXCEL_COLUMNS = lt_column
                                        EXCEL_RECORDS = lr_table  ).
  endif.

** Call class method to convert data to be downloaded to .xlsx
*compatible xstring
  cl_fdt_xl_spreadsheet=>if_fdt_doc_spreadsheet~create_document(
        EXPORTING
          columns      = lt_column
          itab         = lr_table
          iv_call_type = 1
        RECEIVING
          xdocument    = r_xstring ).

endmethod.


METHOD get_record_count.

  DATA: lo_r_param             TYPE REF TO if_salv_wd_table_std_function,
        l_value                TYPE string,
        l_count                TYPE i.

  DATA lo_nd_data TYPE REF TO if_wd_context_node.
  DATA lr_table TYPE REF TO data.
  FIELD-SYMBOLS: <lfs_table> TYPE table.

  DATA lo_nd_info     TYPE REF TO if_wd_context_node_info.
  DATA nd_str_descr   TYPE REF TO cl_abap_structdescr.
  DATA nd_tbl_descr   TYPE REF TO cl_abap_tabledescr.

  DATA lt_rows                 TYPE if_salv_bs=>t_type_row.
  DATA lt_row_outside          TYPE if_salv_bs=>t_type_row.

  CONSTANTS: lc_swfd TYPE string VALUE 'SALV_WD_FILTER_DEFINE',
             lc_swvl TYPE string VALUE 'SALV_WD_VIEW_LOAD'.

* get config model
  DATA lo_interfacecontroller TYPE REF TO iwci_salv_wd_table .
  lo_interfacecontroller ?= me->alv_usage->get_interface_controller( ).

  DATA lo_config TYPE REF TO cl_salv_wd_config_table.
  lo_config = lo_interfacecontroller->get_model(
  ).

* get data node
  DATA: lwa_external_mapping TYPE wdr_reverse_mapped_node_info,
        lo_ctr               TYPE REF TO cl_wdr_controller,
        l_path               TYPE string.

  READ TABLE me->external_mapping INTO lwa_external_mapping
    WITH KEY ext_path = 'CONTEXT.DATA'.
  IF sy-subrc EQ 0.
    lo_ctr = lwa_external_mapping-controller.
    l_path = lwa_external_mapping-path+8.

    lo_nd_data ?= lo_ctr->if_wdr_context~get_node( path = l_path  ).

    lo_nd_info = lo_nd_data->get_node_info( ).
    nd_str_descr = lo_nd_info->get_static_attributes_type( ).
    nd_tbl_descr = cl_abap_tabledescr=>create( nd_str_descr ).

    CREATE DATA lr_table TYPE HANDLE nd_tbl_descr.
    ASSIGN lr_table->* TO <lfs_table>.

    lo_nd_data->get_static_attributes_table( IMPORTING table = <lfs_table> ).
    l_count = lines( <lfs_table> ).

*-- If filter is applied
    IF  cl_salv_wd_model_table_util=>if_salv_wd_table_util_fields~is_filter_defined( lo_config ) EQ abap_true.
      cl_salv_wd_filter=>execute(
       EXPORTING
         t_input          = <lfs_table>
         t_fields         = lo_config->if_salv_wd_field_settings~t_fields
         r_config_model   = lo_config
       CHANGING
         t_rows           = lt_rows
         t_row_outside    = lt_row_outside
       EXCEPTIONS
         no_filter_rules = 1 ).

      l_count = lines( lt_rows ).

    ENDIF.

    DATA lo_nd_function_elements TYPE REF TO if_wd_context_node.
    DATA lo_el_function_elements TYPE REF TO if_wd_context_element.

    READ TABLE me->external_mapping INTO lwa_external_mapping
    WITH KEY ext_path = 'CONTEXT.FUNCTION_ELEMENTS'.

    IF sy-subrc EQ 0.
      lo_ctr = lwa_external_mapping-controller.
      l_path = lwa_external_mapping-path+8.
*      REPLACE 'CONTEXT' IN l_path WITH 'COMPONENTCONTROLLER'.
      lo_nd_function_elements ?= lo_ctr->if_wdr_context~get_node( path = l_path ).
      lo_el_function_elements = lo_nd_function_elements->get_element( ).

      lo_el_function_elements->set_attribute(
        name =  `ZALV_COUNT`
        value = l_count ).
    ENDIF.
  ENDIF.

ENDMETHOD.


method HDL_NEW_DATA.

  data: l_path_tab type string_table,
        l_node_name type string,
        l_length type I.

  split node_name at '.' into table l_path_tab.
  l_length = lines( l_path_tab ).
  read table l_path_tab index l_length into l_node_name.

  if me->controller = controller
    and me->node_name = l_node_name.

*   ALV data is updated. Carry out downstream activities (count, etc)
    me->get_record_count( ).

  endif.

endmethod.


method REGISTER.

* register event handler for -

  set handler hdl_new_data ACTIVATION abap_true.

endmethod.
ENDCLASS.
