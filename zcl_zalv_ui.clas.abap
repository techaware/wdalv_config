class ZCL_ZALV_UI definition
  public
  final
  create public .

public section.

  types:
*"* public components of class ZCL_ZALV_UI
*"* do not include other source files here!!!
    BEGIN OF ty_usage_list,
            component  TYPE wdy_wb_vc_component,
            alv_usage  TYPE wdy_wb_componentusage_name,
           END OF ty_usage_list .
  types:
    tty_usage_list TYPE TABLE OF ty_usage_list .
  types:
    begin of ty_columns_ui,
config_source_02         type SALV_WD_CONSTANT,
alv_column_01            type ztalv_columns-alv_column,
filter_fieldname_01    type ztalv_columns-filter_fieldname,
filter_fieldname_02    type ztalv_columns-filter_fieldname,
sort_fieldname_01    type ztalv_columns-sort_fieldname,
sort_fieldname_02    type ztalv_columns-sort_fieldname,
text_fieldname_01    type ztalv_columns-text_fieldname,
text_fieldname_02    type ztalv_columns-text_fieldname,
hierarchy_column_01    type ztalv_columns-hierarchy_column,
hierarchy_column_02    type ztalv_columns-hierarchy_column,
accessibility_descr_01    type ztalv_columns-accessibility_descr,
accessibility_descr_02    type ztalv_columns-accessibility_descr,
explanation_01            type ztalv_columns-explanation,
explanation_02            type ztalv_columns-explanation,
fixed_position_01    type ztalv_columns-fixed_position,
fixed_position_02    type ztalv_columns-fixed_position,
col_position_01            type ztalv_columns-col_position,
col_position_02            type ztalv_columns-col_position,
visible_01            type ztalv_columns-visible,
visible_02            type ztalv_columns-visible,
cell_design_01            type ztalv_columns-cell_design,
cell_design_02            type ztalv_columns-cell_design,
cell_design_fieldname_01        type ztalv_columns-cell_design_fieldname,
cell_design_fieldname_02  type ztalv_columns-cell_design_fieldname,
h_align_01                  type ztalv_columns-h_align,
h_align_02                  type ztalv_columns-h_align,
resizable_01                  type ztalv_columns-resizable,
resizable_02                  type ztalv_columns-resizable,
selected_cell_variant_01  type ztalv_columns-selected_cell_variant,
selected_cell_variant_02  type ztalv_columns-selected_cell_variant,
selection_state_01          type ztalv_columns-selection_state,
selection_state_02          type ztalv_columns-selection_state,
sel_cell_variant_fieldname_01  type ztalv_columns-sel_cell_variant_fieldname,
sel_cell_variant_fieldname_02  type ztalv_columns-sel_cell_variant_fieldname,
width_01                  type ztalv_columns-width,
width_02                  type ztalv_columns-width,
hdr_text_direction_01          type ztalv_columns-hdr_text_direction,
hdr_text_direction_02          type ztalv_columns-hdr_text_direction,
hdr_image_first_01          type ztalv_columns-hdr_image_first,
hdr_image_first_02          type ztalv_columns-hdr_image_first,
hdr_image_source_01          type ztalv_columns-hdr_image_source,
hdr_image_source_02          type ztalv_columns-hdr_image_source,
hdr_prop_ddic_binding_element1  type ztalv_columns-hdr_prop_ddic_binding_element,
hdr_prop_ddic_binding_element2  type ztalv_columns-hdr_prop_ddic_binding_element,
hdr_prop_ddic_binding_field_01  type ztalv_columns-hdr_prop_ddic_binding_field,
hdr_prop_ddic_binding_field_02  type ztalv_columns-hdr_prop_ddic_binding_field,
hdr_text_01            type ztalv_columns-hdr_text,
hdr_text_02            type ztalv_columns-hdr_text,
hdr_tooltip_01            type ztalv_columns-hdr_tooltip,
hdr_tooltip_02            type ztalv_columns-hdr_tooltip,
hdr_header_text_wrapping_01     type ztalv_columns-hdr_header_text_wrapping,
hdr_header_text_wrapping_02     type ztalv_columns-hdr_header_text_wrapping,
col_delete_02                   type ztalv_columns-col_delete,
         end of ty_columns_ui .
  types:
    tty_columns_ui type table of ty_columns_ui .
  types:
    begin of ty_functions_ui,
            selected type    wdy_boolean,
            FUNCTION_ID      type char10,
            FUNCTION_TEXT    type string,
            FUNCTION_POSITION type CHAR1,
         end of ty_functions_ui .
  types:
    tty_functions_ui type table of ty_functions_ui .
  types:
    begin of ty_ui_elements,
      ui_element     type string,
      ctx_attribute  type string,
      ctx_path       type string,
    end of ty_ui_elements .
  types:
    tty_ui_elements type sorted table of ty_ui_elements
      WITH UNIQUE KEY ui_element .
  types:
    begin of ty_config_var,
      config_source   type ZTALV_CONFIG_VAR-CONFIG_SOURCE,
      QUALIFIER1      type ZTALV_CONFIG_VAR-QUALIFIER1,
      QUALIFIER2      type ZTALV_CONFIG_VAR-QUALIFIER2,
      QUALIFIER3      type ZTALV_CONFIG_VAR-QUALIFIER2,
      BROWSER_HEIGHT  type ZTALV_CONFIG_VAR-BROWSER_HEIGHT,
      BROWSER_WIDTH   type ZTALV_CONFIG_VAR-BROWSER_WIDTH,
      VAR_DESC        type ZTALV_CONFIG_VAR-VAR_DESC,
    end of ty_config_var .
  types:
    tty_config_var type table of ty_config_var .

  constants C_ORIGINAL_CONFIG type SALV_WD_CONSTANT value '01' ##NO_TEXT.
  constants C_WRAPPER_CONFIG type SALV_WD_CONSTANT value '02' ##NO_TEXT.
  constants C_ZALV_COMP_NAME type WDY_COMPONENT_NAME value 'ZALV' ##NO_TEXT.
  constants C_ALV_COMP type WDY_COMPONENT_NAME value 'SALV_WD_TABLE' ##NO_TEXT.
  constants C_FUNCTION_RECORD_COUNT type STRING value 'ZALV_COUNT' ##NO_TEXT.
  constants C_FUNCTION_FULL_SCREEN type STRING value 'ZALV_FULL' ##NO_TEXT.
  constants C_FUNCTION_EXPORT type STRING value 'ZALV_EXPOR' ##NO_TEXT.

  methods CONSTRUCTOR
    importing
      !I_CONTEXT type ref to IF_WD_CONTEXT_NODE
      !I_MSG_MANAGER type ref to IF_WD_MESSAGE_MANAGER .
  methods GET_CONFIG
    importing
      !I_WRAPPER_CONFIG type NUMC2 default '02' .
  methods GET_ALV_USAGES .
  methods INITIALIZE .
  methods SAVE .
  methods GET_COLUMNS_VALUESET
    returning
      value(R_COLUMNS_VALUESET) type WDR_CONTEXT_ATTR_VALUE_LIST .
  methods SET_XFLAG
    importing
      !UI_ELEMENT type STRING
      !XFLAG type WDY_BOOLEAN .
  methods GET_XFLAG
    importing
      !UI_ELEMENT type STRING
    returning
      value(XFLAG) type WDY_BOOLEAN .
  methods CHECK_UI_ELEMENT
    importing
      !UI_ELEMENT type STRING
    returning
      value(R_IN_SCOPE) type WDY_BOOLEAN .
  methods DELETE_CONFIG .
  methods CREATE_NEW_VARIANT
    returning
      value(R_DONE) type BOOLEAN .
  methods CANCEL_NEW_VARIANT .
  methods DEFAULT_CONFIG_EXISTS
    returning
      value(R_EXIST) type BOOLEAN .
  methods SELECT_VARIANT .
  methods GET_VARIANT_DDK
    returning
      value(R_VALUESET) type WDR_CONTEXT_ATTR_VALUE_LIST .
  methods STANDARD_CONFIG_EXISTS
    returning
      value(R_EXIST) type BOOLEAN .
protected section.
*"* protected components of class ZCL_ZALV_UI
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_ZALV_UI
*"* do not include other source files here!!!

  data CTX type ref to ZIF_WDA_CTX_HANDLER .
  data MSG type ref to IF_WD_MESSAGE_MANAGER .
  constants C_COMP_USAGE type STRING value 'COMP_USAGE'. "#EC NOTEXT
  constants C_CONFIG01 type STRING value 'COMP_USAGE.CONFIG01'. "#EC NOTEXT
  constants C_CONFIG02 type STRING value 'COMP_USAGE.CONFIG02'. "#EC NOTEXT
  constants C_SEARCH type STRING value 'SEARCH'. "#EC NOTEXT
  constants C_UI_PROP type STRING value 'UI_PROP'. "#EC NOTEXT
  constants C_COLUMNS_UI type STRING value 'COMP_USAGE.COLUMNS_UI'. "#EC NOTEXT
  constants C_FUNCTIONS type STRING value 'COMP_USAGE.FUNCTIONS'. "#EC NOTEXT
  constants C_FUNCTIONS_UI type STRING value 'FUNCTIONS_UI'. "#EC NOTEXT
  constants C_CONFIG02_X type STRING value 'COMP_USAGE.CONFIG02.CONFIG02_X'. "#EC NOTEXT
  data T_UI_ELEMENTS type TTY_UI_ELEMENTS .
  constants C_COLUMNS_UI_X type STRING value 'COMP_USAGE.COLUMNS_UI.COLUMNS_UI_X'. "#EC NOTEXT
  constants C_CONFIG_VAR type STRING value 'COMP_USAGE.CONFIG_VAR'. "#EC NOTEXT

  methods UPDATE_COLUMNS_UI
    importing
      !I_COLUMNS01 type ZALV_COLUMNS_TT
      !I_COLUMNS02 type ZALV_COLUMNS_TT .
  methods GET_WRAPPER_COLUMNS_FR_UI
    importing
      !I_COLUMNS_UI type TTY_COLUMNS_UI
      !I_COMPONENT type ZTALV_COLUMNS-COMPONENT
      !I_ALV_USAGE type ZTALV_COLUMNS-ALV_USAGE
    returning
      value(E_COLUMNS_02) type ZALV_COLUMNS_TT .
  methods GET_ALL_FUNCTIONS .
  methods UPDATE_FUNCTIONS_UI
    importing
      !I_FUNCTIONS type ZALV_FUNCTIONS_TT .
  methods FILL_UI_ELEMENTS .
  methods UPDATE_COLUMNS_UI_X
    importing
      !T_COLUMNS_X type ZALV_COLUMNS_X_TT .
  methods SET_HEADER_TEXT
    importing
      !I_COMPONENT type WDY_WB_VC_COMPONENT
      !I_USAGE type WDY_WB_COMPONENTUSAGE_NAME
      !I_VARIANT type NUMC2 .
  methods CONFIG_EXISTS
    importing
      !I_CONFIG type NUMC2
    returning
      value(R_EXIST) type BOOLEAN .
  methods PROPOSE_NEXT_CONFIG_ID
    returning
      value(R_CONFIG_ID) type NUMC2 .
  methods COPY_CONFIG
    importing
      !I_REF_CONFIG type NUMC2
      !I_NEW_CONFIG type NUMC2 .
  methods DISPLAY_VARIANT_PROP
    importing
      !I_CONFIG type NUMC2 .
ENDCLASS.



CLASS ZCL_ZALV_UI IMPLEMENTATION.


  method CANCEL_NEW_VARIANT.

  ctx->invalidate( path = c_config_var ).

  endmethod.


  method CHECK_UI_ELEMENT.

  read table t_ui_elements transporting no fields
    with key ui_element = ui_element binary search.
  if sy-subrc eq 0.
    r_in_scope = abap_true.
  endif.

  endmethod.


  method CONFIG_EXISTS.

  DATA: l_comp          TYPE wdy_wb_vc_component,
        l_alv_usage     TYPE wdy_wb_componentusage_name,
        lwa_config_var  TYPE ztalv_config_var,
        lwa_config      type ztalv_config.

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'COMPONENT'
                     IMPORTING value     = l_comp ).

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'ALV_USAGE'
                     IMPORTING value     = l_alv_usage ).

  IF i_config EQ c_original_config.
*   Check in ZTALV_CONFIG
    SELECT single * FROM ztalv_config INTO lwa_config
      WHERE component     = l_comp
        AND alv_usage     = l_alv_usage
        AND config_source = i_config.
    IF sy-subrc EQ 0.
      r_exist = abap_true.
    ENDIF.

  ELSE.
* Check in ZTALV_CONFIG_VAR
    SELECT SINGLE * FROM ztalv_config_var INTO lwa_config_var
      WHERE component     = l_comp
        AND alv_usage     = l_alv_usage
        AND config_source = i_config.
    IF sy-subrc EQ 0.
      r_exist = abap_true.
    ENDIF.

  ENDIF.

  endmethod.


  method CONSTRUCTOR.

  CTX ?= ZCL_WDA_CTX_HANDLER=>create( i_context ).
  msg ?= I_MSG_MANAGER.

* Update t_ui_elements table with all the config related UI elements and its CTX attributes
  me->FILL_UI_ELEMENTS( ).

  endmethod.


  method COPY_CONFIG.

  DATA: l_comp          TYPE wdy_wb_vc_component,
        l_alv_usage     TYPE wdy_wb_componentusage_name,
        lwa_config      TYPE ztalv_config,
        lt_config01     TYPE TABLE OF ztalv_config,
        lt_config02     TYPE TABLE OF ztalv_config,
        lt_columns01    TYPE TABLE OF ztalv_columns,
        lt_columns02    TYPE TABLE OF ztalv_columns,
        lt_functions    TYPE TABLE OF ztalv_functions,
        lwa_config_x    TYPE ztalv_config_x,
        lt_config_x     TYPE TABLE OF ztalv_config_x,
        lt_columns_x    TYPE TABLE OF ztalv_columns_x,
        l_variant       TYPE salv_wd_constant,
        lt_config_var   TYPE TABLE OF ztalv_config_var,
        lwa_config_var  TYPE ztalv_config_var.

  FIELD-SYMBOLS:  <fs_config02>  TYPE ztalv_config,
                  <fs_column02>  TYPE ztalv_columns,
                  <fs_functions> TYPE ztalv_functions.

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'COMPONENT'
                     IMPORTING value     = l_comp ).

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'ALV_USAGE'
                     IMPORTING value     = l_alv_usage ).



* get user entered variant values
  ctx->read_element(  EXPORTING  path     = c_config_var
                      IMPORTING  row_data = lwa_config_var ).
  lwa_config_var-config_source = i_new_config.

* If this is copy 01 to 02(default)
  if i_ref_config eq c_original_config.
    lwa_config_var-var_desc = 'Default'.
  endif.

  APPEND lwa_config_var TO lt_config_var.

* update config_var context
  ctx->write_table( path  = c_config_var
                    table = lt_config_var
                    adjust = abap_true ).


* get original config from DB
  SELECT * FROM ztalv_config INTO TABLE lt_config01
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = c_original_config.
  IF sy-subrc EQ 0.
* update config01 context
    ctx->write_table( path  = c_config01
                      table = lt_config01
                      adjust = abap_true ).
  ELSE.
    EXIT.
  ENDIF.

* get ref config from DB
  CLEAR lt_config01.
  SELECT * FROM ztalv_config INTO TABLE lt_config01
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_ref_config.
  IF sy-subrc NE 0..
    EXIT.
  ENDIF.

  lt_config02 = lt_config01.

* Set config source to new config
  LOOP AT lt_config02 ASSIGNING <fs_config02>.
    <fs_config02>-config_source = i_new_config.
  ENDLOOP.

* update config02 context
  IF lt_config02 IS NOT INITIAL.
    ctx->write_table( path  = c_config02
                      table = lt_config02
                      adjust = abap_true ).
  ENDIF.

* Get X values
  SELECT * FROM ztalv_config_x INTO TABLE lt_config_x
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_ref_config.
* update config02_X context
  IF lt_config_x IS NOT INITIAL.
    ctx->write_table( path  = c_config02_x
                      table = lt_config_x
                      adjust = abap_true ).
  ENDIF.



* get columns from DB *************************************

  SELECT * FROM ztalv_columns INTO TABLE lt_columns01
    WHERE component       = l_comp
      AND alv_usage       = l_alv_usage
      AND config_source   = c_original_config.
  IF sy-subrc EQ 0.
  ENDIF.

  SELECT * FROM ztalv_columns INTO TABLE lt_columns02
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_ref_config.
  IF sy-subrc NE 0.
  ENDIF.

* Set config source to new config
  LOOP AT lt_columns02  ASSIGNING <fs_column02>.
    <fs_column02>-config_source = i_new_config.
  ENDLOOP.


* move lt_columns01 and lt_columns02 to columns_ui node
  me->update_columns_ui( i_columns01 = lt_columns01
                         i_columns02 = lt_columns02 ).

* get X values
  SELECT * FROM ztalv_columns_x INTO TABLE lt_columns_x
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_ref_config.
* update columns_ui_x context
  IF lt_columns_x IS NOT INITIAL.
    me->update_columns_ui_x( lt_columns_x ).
  ENDIF.

* get functions
  SELECT * FROM ztalv_functions INTO TABLE lt_functions
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_ref_config.
* Set config source to new config
  LOOP AT lt_functions  ASSIGNING <fs_functions>.
    <fs_functions>-config_source = i_new_config.
  ENDLOOP.

  IF lt_functions IS NOT INITIAL.
    ctx->write_table( path  = c_functions
                      table = lt_functions
                      adjust = abap_true ).
  ENDIF.

  me->update_functions_ui( lt_functions ).

* Update header text
  l_variant = c_wrapper_config.
  me->set_header_text( i_component = l_comp
                       i_usage     = l_alv_usage
                       i_variant   = i_new_config ).
  endmethod.


  method CREATE_NEW_VARIANT.

  r_done = abap_true.

* check if variant description is entered
  data: l_var_desc type string .
  ctx->read_attribute( EXPORTING path      = c_config_var
                                 attribute = 'VAR_DESC'
                       IMPORTING value     = l_var_desc ).
  if l_var_desc is initial.
    clear r_done.
    exit.
  endif.

* Variant is a copy for wrapper config from DB

  data: lt_config02 type table of ztalv_config,
        l_config_id type numc2.

  DATA: l_comp          TYPE wdy_wb_vc_component,
        l_alv_usage     TYPE wdy_wb_componentusage_name.

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'COMPONENT'
                     IMPORTING value     = l_comp ).

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'ALV_USAGE'
                     IMPORTING value     = l_alv_usage ).

* check if default (02) config exist
*  SELECT * FROM ztalv_config INTO TABLE lt_config02
*    WHERE component       = l_comp
*    AND   alv_usage       = l_alv_usage
*    AND   config_source   = c_wrapper_config.
*  if config_exists( c_wrapper_config ) is initial.
**   issue error message
*    msg->REPORT_ERROR_MESSAGE( 'Default Wrapper Config does not exist.First save default config and then try creating a variant.').
*    exit.
*  endif.

* copy default to new variant
  l_config_id = me->PROPOSE_NEXT_CONFIG_ID( ).

* load the config
  me->get_config( l_config_id ).

* show variant properties box

  endmethod.


  method DEFAULT_CONFIG_EXISTS.

  if config_exists( c_wrapper_config ) is initial.
*   issue error message
    msg->REPORT_ERROR_MESSAGE( 'Default Wrapper Config does not exist.First save default config and then try creating a variant.').
  else.
    r_exist = abap_true.
  endif.

  endmethod.


  method DELETE_CONFIG.

* delete currently selected config variant
  DATA: lwa_comp_usage    TYPE ty_usage_list,
        lwa_config02      TYPE ztalv_config,
        lt_columns_ui     TYPE tty_columns_ui,
        lt_columns_01     TYPE zalv_columns_tt,
        lt_columns_02     TYPE zalv_columns_tt,
        lt_functions_ui   TYPE tty_functions_ui,
        lwa_functions_ui  TYPE ty_functions_ui,
        lt_functions      TYPE zalv_functions_tt,
        lt_functions_del  TYPE zalv_functions_tt,
        lwa_functions     TYPE ztalv_functions,
        lwa_config02_x    TYPE ztalv_config_x,
        lwa_columns_ui_x  TYPE ztalv_columns_x,
        lt_columns_ui_x   TYPE TABLE OF ztalv_columns_x,
        l_alv_col         TYPE string,
        lwa_config_var    type ztalv_config_var.

* get config var
  ctx->read_element( EXPORTING path       = c_config_var
                     IMPORTING row_data   = lwa_config_var ).

  IF lwa_config_var-component IS NOT INITIAL
  AND lwa_config_var-alv_usage IS NOT INITIAL.
    delete ztalv_config_var FROM lwa_config_var.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get wrapper config
  ctx->read_element( EXPORTING path       = c_config02
                     IMPORTING row_data   = lwa_config02 ).

  IF lwa_config02-component IS NOT INITIAL
  AND lwa_config02-alv_usage IS NOT INITIAL.
    delete ztalv_config FROM lwa_config02.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get X values
  ctx->read_element( EXPORTING path       = c_config02_x
                     IMPORTING row_data   = lwa_config02_x ).
  IF lwa_config02_x IS NOT INITIAL.
    delete ztalv_config_x FROM lwa_config02_x.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get column config
  ctx->read_table( EXPORTING path       = c_columns_ui
                     IMPORTING table    = lt_columns_ui ).

  lt_columns_02 = get_wrapper_columns_fr_ui( i_columns_ui = lt_columns_ui
                                             i_component  = lwa_config02-component
                                             i_alv_usage  = lwa_config02-alv_usage ).

  IF lwa_config02-component IS NOT INITIAL
  AND lwa_config02-alv_usage IS NOT INITIAL.
    delete ztalv_columns FROM TABLE lt_columns_02.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get X values
  DO.
    IF ctx->lead_select_element( path  = c_columns_ui
                                 index = sy-index ) IS INITIAL.
      EXIT.
    ENDIF.

* get alv column
    CLEAR l_alv_col.
    ctx->read_attribute( EXPORTING path       = c_columns_ui
                                   attribute  = 'ALV_COLUMN_01'
                         IMPORTING value      = l_alv_col ).

    ctx->read_element( EXPORTING path       = c_columns_ui_x
                       IMPORTING row_data   = lwa_columns_ui_x ).

    IF lwa_columns_ui_x IS NOT INITIAL.
      lwa_columns_ui_x-component      = lwa_config02-component.
      lwa_columns_ui_x-alv_usage      = lwa_config02-alv_usage.
      lwa_columns_ui_x-config_source  = lwa_config02-config_source.
      lwa_columns_ui_x-alv_column     = l_alv_col.
      APPEND lwa_columns_ui_x TO lt_columns_ui_x.
    ENDIF.
  ENDDO.

  IF lt_columns_ui_x IS NOT INITIAL.
    delete ztalv_columns_x FROM TABLE lt_columns_ui_x.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get functions
  ctx->read_table( EXPORTING path       = c_functions_ui
                     IMPORTING table    = lt_functions_ui ).
  LOOP AT lt_functions_ui INTO lwa_functions_ui.
    MOVE-CORRESPONDING lwa_functions_ui TO lwa_functions.
    lwa_functions-component     = lwa_config02-component.
    lwa_functions-alv_usage     = lwa_config02-alv_usage.
    lwa_functions-config_source = lwa_config02-config_source.
    IF lwa_functions_ui-selected IS NOT INITIAL.
      APPEND lwa_functions TO lt_functions.
    ENDIF.
  ENDLOOP.

  IF lt_functions IS NOT INITIAL.
    delete ztalv_functions FROM TABLE lt_functions.
  ENDIF.

  endmethod.


  method DISPLAY_VARIANT_PROP.


  if i_config eq c_wrapper_config. "02
    ctx->write_attribute( path      = c_ui_prop
                          attribute = 'VISIBLE_VARIANT_PN'
                          value     = '01' ).
  else.
    ctx->write_attribute( path      = c_ui_prop
                          attribute = 'VISIBLE_VARIANT_PN'
                          value     = '02' ).
  endif.

  endmethod.


  method FILL_UI_ELEMENTS.

  data: lwa_ui_element type ty_ui_elements.

   lwa_ui_element-ui_element     = 'INP_ACC_DESCR'.
   lwa_ui_element-ctx_attribute  = 'ACC_DESCRIPTION'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_CELL_ACTION'.
   lwa_ui_element-ctx_attribute  = 'CELL_ACTION_EVENT_ENABLED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_DESIGN'.
   lwa_ui_element-ctx_attribute  = 'DESIGN'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_DISPLAY_AS'.
   lwa_ui_element-ctx_attribute  = 'DISPLAY_AS'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_DISPLAY_EMPTY_ROWS'.
   lwa_ui_element-ctx_attribute  = 'DISPLAY_EMPTY_ROWS'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_DISPLAY_TYPE'.
   lwa_ui_element-ctx_attribute  = 'DISPLAY_TYPE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_EDIT_MODE'.
   lwa_ui_element-ctx_attribute  = 'EDIT_MODE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'INP_EMPTY_TABLE_TEST'.
   lwa_ui_element-ctx_attribute  = 'EMPTY_TABLE_TEXT'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_ENABLED'.
   lwa_ui_element-ctx_attribute  = 'ENABLED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_END_OF_LIST_VISIBLE'.
   lwa_ui_element-ctx_attribute  = 'END_OF_LIST_VISIBLE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'INP_FIRST_VISIBLE_ROW'.
   lwa_ui_element-ctx_attribute  = 'FIRST_VISIBLE_ROW'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_FIRST_VISIBLE_SCROLL_COL'.
   lwa_ui_element-ctx_attribute  = 'FIRST_VISIBLE_SCROLL_COL'.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_FIXED_TABLE_LAYOUT'.
   lwa_ui_element-ctx_attribute  = 'FIXED_TABLE_LAYOUT'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_FOOTER_VISIBLE'.
   lwa_ui_element-ctx_attribute  = 'FOOTER_VISIBLE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_GRID_MODE'.
   lwa_ui_element-ctx_attribute  = 'GRID_MODE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_MULTI_COLUMN_SORT'.
   lwa_ui_element-ctx_attribute  = 'MULTI_COLUMN_SORT'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_ON_SELECT_ENABLED'.
   lwa_ui_element-ctx_attribute  = 'ON_SELECT_ENABLED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_READ_ONLY'.
   lwa_ui_element-ctx_attribute  = 'READ_ONLY'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_REFRESH_ON_DATA_CHANGE'.
   lwa_ui_element-ctx_attribute  = 'REFRESH_ON_DATA_CHANGE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_REFRESH_ON_DATA_CHECK'.
   lwa_ui_element-ctx_attribute  = 'REFRESH_ON_DATA_CHECK'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_ROW_SELECTABLE'.
   lwa_ui_element-ctx_attribute  = 'ROW_SELECTABLE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_ROW_SELECTABLE_FIELDNAME'.
   lwa_ui_element-ctx_attribute  = 'ROW_SELECTABLE_FIELDNAME'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'INP_SCROLLABLE_COL_COUNT'.
   lwa_ui_element-ctx_attribute  = 'SCROLLABLE_COL_COUNT'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_SELECTION_MODE'.
   lwa_ui_element-ctx_attribute  = 'SELECTION_MODE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'INP_TOOLTIP'.
   lwa_ui_element-ctx_attribute  = 'TOOLTIP'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_TOP_OF_LIST_VISIBLE'.
   lwa_ui_element-ctx_attribute  = 'TOP_OF_LIST_VISIBLE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_VISIBLE'.
   lwa_ui_element-ctx_attribute  = 'VISIBLE'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_VISIBLE_ROW_COUNT'.
   lwa_ui_element-ctx_attribute  = 'VISIBLE_ROW_COUNT'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'INP_WIDTH'.
   lwa_ui_element-ctx_attribute  = 'WIDTH'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_IMPLICIT_P13N_ENABLED'.
   lwa_ui_element-ctx_attribute  = 'IMPLICIT_P13N_ENABLED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'EXPORT_NO_SUMS'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'EXPORT_NO_TOL'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'EXPORT_NO_EOL'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'AGGR_BEFORE_ITEMS'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'COUNT_RECORDS_ENABLED'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'EXPAND_LEVEL'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'GROUP_AGGR_COLLAPSED'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'GROUP_AGGR_DISPLAYED'.
*   insert lwa_ui_element into table t_ui_elements.
*
*   lwa_ui_element-ui_element     = ''.
*   lwa_ui_element-ctx_attribute  = 'FILTER_IGNORING_CASE'.
*   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_AGGREGATION_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'AGGREGATION_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_BEX_ANALYZER_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'BEX_ANALYZER_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_BI_BROADCASTING_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'BI_BROADCASTING_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_COLUMN_SELECTION_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'COLUMN_SELECTION_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_COUNT_RECORDS_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'COUNT_RECORDS_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_CR_INPLACE_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'CR_INPLACE_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_DIALOG_SETTINGS_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'DIALOG_SETTINGS_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_DIALOG_SETTINGS_AS_POPUP'.
   lwa_ui_element-ctx_attribute  = 'DIALOG_SETTINGS_AS_POPUP'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_DISPLAY_AS_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'DISPLAY_AS_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_DISPLAY_SETTINGS_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'DISPLAY_SETTINGS_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EDIT_APPEND_ROWS_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EDIT_APPEND_ROWS_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EDIT_APPEND_ROW_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EDIT_APPEND_ROW_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EDIT_CHECK_AVAILABLE'.
   lwa_ui_element-ctx_attribute  = 'EDIT_CHECK_AVAILABLE'.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EDIT_DELETE_ROW_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EDIT_DELETE_ROW_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EDIT_INSERT_ROWS_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EDIT_INSERT_ROWS_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EDIT_INSERT_ROW_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EDIT_INSERT_ROW_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EDIT_UNDO_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EDIT_UNDO_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EXCEL_INPLACE_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EXCEL_INPLACE_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_EXPORT_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'EXPORT_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_FILTER_COMPLEX_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'FILTER_COMPLEX_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_FILTER_FILTERLINE_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'FILTER_FILTERLINE_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_FIXED_COLS_LEFT_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'FIXED_COLS_LEFT_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_FIXED_COLS_RIGHT_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'FIXED_COLS_RIGHT_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_GRAPHIC_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'GRAPHIC_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_GROUP_AGGREGATION_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'GROUP_AGGREGATION_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_HIERARCHY_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'HIERARCHY_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_PDF_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'PDF_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_SORT_COMPLEX_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'SORT_COMPLEX_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

    lwa_ui_element-ui_element     = 'CB_SORT_HEADERCLICK_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'SORT_HEADERCLICK_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_VIEW_LIST_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'VIEW_LIST_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'CB_VIEW_QUICK_SAVE_ALLOWED'.
   lwa_ui_element-ctx_attribute  = 'VIEW_QUICK_SAVE_ALLOWED'.
   lwa_ui_element-ctx_path       = c_config02_x.
   insert lwa_ui_element into table t_ui_elements.

* columns
   lwa_ui_element-ui_element     = 'TB_COLUMNS_FILTER_FIELDNAME_4'.
   lwa_ui_element-ctx_attribute  = 'FILTER_FIELDNAME'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_SORT_FIELDNAME_0_3'.
   lwa_ui_element-ctx_attribute  = 'SORT_FIELDNAME'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_TEXT_FIELDNAME_0_3'.
   lwa_ui_element-ctx_attribute  = 'TEXT_FIELDNAME'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HIERARCHY_COLUMN_4'.
   lwa_ui_element-ctx_attribute  = 'HIERARCHY_COLUMN'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_ACCESSIBILITY_DE_5'.
   lwa_ui_element-ctx_attribute  = 'ACCESSIBILITY_DESCR'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_EXPLANATION_02_ED_1'.
   lwa_ui_element-ctx_attribute  = 'EXPLANATION'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_COLUMNS_FIXED_POSITION_0_3'.
   lwa_ui_element-ctx_attribute  = 'FIXED_POSITION'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_COL_POSITION_02_E_1'.
   lwa_ui_element-ctx_attribute  = 'COL_POSITION'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_COLUMNS_VISIBLE_02_EDITOR'.
   lwa_ui_element-ctx_attribute  = 'VISIBLE'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_COLUMNS_CELL_DESIGN_02_ED_1'.
   lwa_ui_element-ctx_attribute  = 'CELL_DESIGN'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_CELL_DESIGN_FIEL_5'.
   lwa_ui_element-ctx_attribute  = 'CELL_DESIGN_FIELDNAME'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_H_ALIGN_02_EDITOR'.
   lwa_ui_element-ctx_attribute  = 'H_ALIGN'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_RESIZABLE_02_EDITOR'.
   lwa_ui_element-ctx_attribute  = 'RESIZABLE'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'IN_COLUMNS_SELECTED_CELL_VA_5'.
   lwa_ui_element-ctx_attribute  = 'SELECTED_CELL_VARIANT'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_COLUMNS_SELECTION_STATE__4'.
   lwa_ui_element-ctx_attribute  = 'SELECTION_STATE'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_SEL_CELL_VARIANT_6'.
   lwa_ui_element-ctx_attribute  = 'SEL_CELL_VARIANT_FIELDNAME'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_WIDTH_02_EDITOR'.
   lwa_ui_element-ctx_attribute  = 'WIDTH'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HDR_TEXT_DIRECTI_5'.
   lwa_ui_element-ctx_attribute  = 'HDR_TEXT_DIRECTION'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HDR_IMAGE_FIRST__4'.
   lwa_ui_element-ctx_attribute  = 'HDR_IMAGE_FIRST'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HDR_IMAGE_SOURCE_4'.
   lwa_ui_element-ctx_attribute  = 'HDR_IMAGE_SOURCE'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HDR_PROP_DDIC_BI_5'.
   lwa_ui_element-ctx_attribute  = 'HDR_PROP_DDIC_BINDING_ELEMENT'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'DD_COLUMNS_HDR_PROP_DDIC_B_11'.
   lwa_ui_element-ctx_attribute  = 'HDR_PROP_DDIC_BINDING_FIELD'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HDR_TEXT_02_EDITOR'.
   lwa_ui_element-ctx_attribute  = 'HDR_TEXT'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HDR_TOOLTIP_02_ED_1'.
   lwa_ui_element-ctx_attribute  = 'HDR_TOOLTIP'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

   lwa_ui_element-ui_element     = 'TB_COLUMNS_HDR_HEADER_TEXT__5'.
   lwa_ui_element-ctx_attribute  = 'HDR_HEADER_TEXT_WRAPPING'.
   lwa_ui_element-ctx_path       = C_COLUMNS_UI_X.
   insert lwa_ui_element into table t_ui_elements.

*   sort t_ui_elements by ui_element.

  endmethod.


  method GET_ALL_FUNCTIONS.

  data: lt_functions type table of ztalv_functions,
        lwa_functions type ztalv_functions.


    lwa_functions-FUNCTION_ID         = C_FUNCTION_RECORD_COUNT.
    append lwa_functions to lt_functions.

    lwa_functions-FUNCTION_ID         = C_FUNCTION_FULL_SCREEN.
    append lwa_functions to lt_functions.

    lwa_functions-FUNCTION_ID         = C_FUNCTION_EXPORT.
    append lwa_functions to lt_functions.

    ctx->write_table( path  = c_functions_ui
                      table = lt_functions
                      adjust = abap_true ).


  endmethod.


  method GET_ALV_USAGES.

* get usages from table WDY_COMPO_USAGE

   data: lt_usages_zalv       type table of wdy_compo_usage,
         lwa_usages_zalv      type wdy_compo_usage,
         lt_usages_alv        type table of wdy_compo_usage,
         lwa_usages_alv       type wdy_compo_usage,
         lwa_usage_list       type ty_usage_list,
         lt_usage_list        type tty_usage_list.

*   select * from WDY_COMPO_USAGE into table lt_usages_zalv
*     where USED_COMPONENT = c_zalv_comp_name.
*
** now get the ALV usages for these components
*  if lt_usages_zalv is not initial.
*  select * from WDY_COMPO_USAGE into table lt_usages_alv
*    for all entries in lt_usages_zalv
*      where COMPONENT_NAME = lt_usages_zalv-COMPONENT_NAME
*        and USED_COMPONENT = c_alv_comp.
*  endif.
*
*   loop at lt_usages_alv into lwa_usages_alv.
*     lwa_usage_list-component = lwa_usages_alv-COMPONENT_NAME.
*     lwa_usage_list-alv_usage = lwa_usages_alv-COMPO_USAGE_NAME.
*     append lwa_usage_list to lt_usage_list.
*   endloop.

* get the usages from ztalv_config directly. As this will be updated whenever
* ZALV usage is defined for the component and app is executed for first time.

  SELECT component alv_usage FROM ztalv_config INTO TABLE lt_usage_list
    WHERE config_source = c_original_config.

  IF sy-subrc EQ 0.
* update comp_usage context
    ctx->write_table( path  = c_comp_usage
                      table = lt_usage_list ).
  ELSE.
    msg->report_error_message( 'Standard Config does not exist. Kindly define usage of ZALV in your application and execute it once to generate stadard config.').
  ENDIF.

  endmethod.


  method GET_COLUMNS_VALUESET.

  data: lt_columns     type TTY_COLUMNS_UI,
        lwa_columns    type TY_COLUMNS_UI,
        lwa_valueset   type WDR_CONTEXT_ATTR_VALUE.

  ctx->read_table( exporting path  = c_columns_ui
                   importing table = lt_columns ).

  loop at lt_columns into lwa_columns.
    lwa_valueset-value = lwa_columns-alv_column_01.
    lwa_valueset-text  = lwa_columns-alv_column_01.
    append lwa_valueset to r_columns_valueset.
  endloop.

  endmethod.


  method GET_CONFIG.

* control visibility of Variant properties based on i_wrapper_config.

  me->display_variant_prop( i_wrapper_config ).

* first check if i_wrapper_config exists
* if not- then propose new config - by copying
  IF me->config_exists( i_wrapper_config ) IS INITIAL.
    IF i_wrapper_config EQ c_wrapper_config. "02
      me->copy_config( i_ref_config = c_original_config
                       i_new_config = i_wrapper_config ).
    ELSE.
      me->copy_config( i_ref_config = c_wrapper_config
                       i_new_config = i_wrapper_config ).
    ENDIF.
    EXIT.
  ENDIF.

* Load the existing config
  DATA: l_comp          TYPE wdy_wb_vc_component,
        l_alv_usage     TYPE wdy_wb_componentusage_name,
        lwa_config      TYPE ztalv_config,
        lt_config01     TYPE TABLE OF ztalv_config,
        lt_config02     TYPE TABLE OF ztalv_config,
        lt_config_var   TYPE TABLE OF ztalv_config_var,
        lt_columns01    TYPE TABLE OF ztalv_columns,
        lt_columns02    TYPE TABLE OF ztalv_columns,
        lt_functions    TYPE TABLE OF ztalv_functions,
        lwa_config_x    TYPE ztalv_config_x,
        lt_config_x     TYPE TABLE OF ztalv_config_x,
        lt_columns_x    TYPE TABLE OF ztalv_columns_x,
        l_variant       TYPE salv_wd_constant.

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'COMPONENT'
                     IMPORTING value     = l_comp ).

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'ALV_USAGE'
                     IMPORTING value     = l_alv_usage ).



  SELECT * FROM ztalv_config INTO TABLE lt_config01
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = c_original_config.
  IF sy-subrc EQ 0.
* update config01 context
    ctx->write_table( path  = c_config01
                      table = lt_config01
                      adjust = abap_true ).
  ELSE.
    EXIT.
  ENDIF.

* get config from DB
  SELECT * FROM ztalv_config_var INTO TABLE lt_config_var
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_wrapper_config.
  IF sy-subrc EQ 0.
* update config_var context
    ctx->write_table( path  = c_config_var
                      table = lt_config_var
                      adjust = abap_true ).
  ENDIF.

  SELECT * FROM ztalv_config INTO TABLE lt_config02
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_wrapper_config.

* update config02 context
  IF lt_config02 IS NOT INITIAL.
    ctx->write_table( path  = c_config02
                      table = lt_config02
                      adjust = abap_true ).
  ENDIF.

* Get X values
  SELECT * FROM ztalv_config_x INTO TABLE lt_config_x
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_wrapper_config.
* update config02_X context
  IF lt_config_x IS NOT INITIAL.
    ctx->write_table( path  = c_config02_x
                      table = lt_config_x
                      adjust = abap_true ).
  ELSE.
    ctx->invalidate( path = c_config02_x ).
  ENDIF.



* get columns from DB *************************************

  SELECT * FROM ztalv_columns INTO TABLE lt_columns01
    WHERE component       = l_comp
      AND alv_usage       = l_alv_usage
      AND config_source   = c_original_config.
  IF sy-subrc EQ 0.
  ENDIF.

  SELECT * FROM ztalv_columns INTO TABLE lt_columns02
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_wrapper_config.
  IF sy-subrc NE 0.
  ENDIF.

* move lt_columns01 and lt_columns02 to columns_ui node
  me->update_columns_ui( i_columns01 = lt_columns01
                         i_columns02 = lt_columns02 ).

* get X values
  SELECT * FROM ztalv_columns_x INTO TABLE lt_columns_x
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_wrapper_config.
* update columns_ui_x context
  me->update_columns_ui_x( lt_columns_x ).


* get functions
  SELECT * FROM ztalv_functions INTO TABLE lt_functions
    WHERE component       = l_comp
    AND   alv_usage       = l_alv_usage
    AND   config_source   = i_wrapper_config.

  IF lt_functions IS NOT INITIAL.
    ctx->write_table( path  = c_functions
                      table = lt_functions
                      adjust = abap_true ).
  ELSE.
    ctx->invalidate( path  = c_functions ).
  ENDIF.

  me->update_functions_ui( lt_functions ).

* Update header text
  l_variant = i_wrapper_config.
  me->set_header_text( i_component = l_comp
                       i_usage     = l_alv_usage
                       i_variant   = l_variant ).
  endmethod.


  method GET_VARIANT_DDK.


  data: lt_config_var       type table of ztalv_config_var,
        lwa_config_var      type ztalv_config_var,
        l_comp              TYPE wdy_wb_vc_component,
        l_alv_usage         TYPE wdy_wb_componentusage_name,
        lwa_valueset        type wdr_context_attr_value,
        lwa_config_var_db   type ztalv_config_var.

* get variant from DB
  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'COMPONENT'
                     IMPORTING value     = l_comp ).

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'ALV_USAGE'
                     IMPORTING value     = l_alv_usage ).

  select * from ztalv_config_var into table lt_config_var
    where component = l_comp
      and alv_usage = l_alv_usage.

* get variant from CTX
  ctx->read_element( exporting path     = c_config_var
                     importing row_data = lwa_config_var ).
  lwa_config_var-component = l_comp.
  lwa_config_var-alv_usage = l_alv_usage.
* if this variant not yet saved to DB
  read table lt_config_var into lwa_config_var_db with key config_source = lwa_config_var-config_source.
  if sy-subrc ne 0.
    lwa_config_var-var_desc = '*' && lwa_config_var-var_desc.
    append lwa_config_var to lt_config_var.
  endif.

  sort lt_config_var by config_source.
  delete adjacent duplicates from lt_config_var comparing config_source.

* prepare DDK
  loop at lt_config_var into lwa_config_var.
    lwa_valueset-value = lwa_config_var-config_source.
    lwa_valueset-text  = lwa_config_var-var_desc.
    append lwa_valueset to r_valueset.
  endloop.

* Update context valueset
  endmethod.


  method GET_WRAPPER_COLUMNS_FR_UI.

  DATA: lwa_columns_ui TYPE ty_columns_ui,
        lwa_columns_01 TYPE ztalv_columns,
        lwa_columns_02 TYPE ztalv_columns.

  LOOP AT i_columns_ui INTO lwa_columns_ui.
    lwa_columns_02-component               = i_component.
    lwa_columns_02-alv_usage               = i_alv_usage.
    lwa_columns_02-config_source           = lwa_columns_ui-config_source_02.
    lwa_columns_02-alv_column              = lwa_columns_ui-alv_column_01.
    lwa_columns_02-filter_fieldname        = lwa_columns_ui-filter_fieldname_02.
    lwa_columns_02-sort_fieldname          = lwa_columns_ui-sort_fieldname_02.
    lwa_columns_02-text_fieldname          = lwa_columns_ui-text_fieldname_02.
    lwa_columns_02-hierarchy_column        = lwa_columns_ui-hierarchy_column_02.
    lwa_columns_02-accessibility_descr     = lwa_columns_ui-accessibility_descr_02.
    lwa_columns_02-explanation             = lwa_columns_ui-explanation_02.
    lwa_columns_02-fixed_position          = lwa_columns_ui-fixed_position_02.
    lwa_columns_02-col_position            = lwa_columns_ui-col_position_02.
    lwa_columns_02-visible                 = lwa_columns_ui-visible_02.
    lwa_columns_02-cell_design             = lwa_columns_ui-cell_design_02.
    lwa_columns_02-cell_design_fieldname   = lwa_columns_ui-cell_design_fieldname_02.
    lwa_columns_02-h_align                 = lwa_columns_ui-h_align_02.
    lwa_columns_02-resizable               = lwa_columns_ui-resizable_02.
    lwa_columns_02-selected_cell_variant   = lwa_columns_ui-selected_cell_variant_02.
    lwa_columns_02-selection_state         = lwa_columns_ui-selection_state_02.
    lwa_columns_02-sel_cell_variant_fieldname    = lwa_columns_ui-sel_cell_variant_fieldname_02.
    lwa_columns_02-width                         = lwa_columns_ui-width_02.
    lwa_columns_02-hdr_text_direction            = lwa_columns_ui-hdr_text_direction_02.
    lwa_columns_02-hdr_image_first               = lwa_columns_ui-hdr_image_first_02.
    lwa_columns_02-hdr_image_source              = lwa_columns_ui-hdr_image_source_02.
    lwa_columns_02-hdr_prop_ddic_binding_element = lwa_columns_ui-hdr_prop_ddic_binding_element2.
    lwa_columns_02-hdr_prop_ddic_binding_field   = lwa_columns_ui-hdr_prop_ddic_binding_field_02.
    lwa_columns_02-hdr_text                      = lwa_columns_ui-hdr_text_02.
    lwa_columns_02-hdr_tooltip                   = lwa_columns_ui-hdr_tooltip_02.
    lwa_columns_02-hdr_header_text_wrapping      = lwa_columns_ui-hdr_header_text_wrapping_02.
    lwa_columns_02-col_delete                    = lwa_columns_ui-col_delete_02.
    APPEND lwa_columns_02 TO e_columns_02.

  ENDLOOP.

endmethod.


  method GET_XFLAG.

  DATA: lwa_ui_element TYPE ty_ui_elements.

  READ TABLE t_ui_elements INTO lwa_ui_element WITH KEY ui_element = ui_element BINARY SEARCH.
  CHECK sy-subrc EQ 0.


  ctx->read_attribute( EXPORTING path      = lwa_ui_element-ctx_path
                                 attribute = lwa_ui_element-ctx_attribute
                       IMPORTING value     = xflag  ).

  endmethod.


  method INITIALIZE.

* invalidate context
  ctx->invalidate( ).

* get list
  GET_ALV_USAGES( ).

* get all posible functions
  get_all_functions( ).

* select first comp
  IF ctx->lead_select_element( path = c_comp_usage
                         index = 1 ) IS not INITIAL.
    GET_CONFIG( ).

  endif.
  endmethod.


  method PROPOSE_NEXT_CONFIG_ID.

  DATA: l_comp          TYPE wdy_wb_vc_component,
        l_alv_usage     TYPE wdy_wb_componentusage_name,
        lt_config_var   type table of ztalv_config_var,
        lwa_config_var  type ztalv_config_var,
        l_config_source type numc2.

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'COMPONENT'
                     IMPORTING value     = l_comp ).

  ctx->read_attribute( EXPORTING path      = c_comp_usage
                               attribute = 'ALV_USAGE'
                     IMPORTING value     = l_alv_usage ).

* Check in ZTALV_CONFIG_VAR
  select  * from ztalv_config_var into table lt_config_var
    where component     = l_comp
      and alv_usage     = l_alv_usage.

* get next config id - check for gaps as well
  l_config_source = '02'.
  do 98 times.
    read table lt_config_var into lwa_config_var
      with key config_source = l_config_source.
    if sy-subrc eq 0.
      l_config_source = l_config_source + 1.
    else.
      exit.
    endif.
  enddo .

* all 99 ids used - condition is not yet handlers !!!!

  r_config_id = l_config_source.

  endmethod.


  method SAVE.

  DATA: lwa_comp_usage    TYPE ty_usage_list,
        lwa_config02      TYPE ztalv_config,
        lt_columns_ui     TYPE tty_columns_ui,
        lt_columns_01     TYPE zalv_columns_tt,
        lt_columns_02     TYPE zalv_columns_tt,
        lt_functions_ui   TYPE tty_functions_ui,
        lwa_functions_ui  TYPE ty_functions_ui,
        lt_functions      TYPE zalv_functions_tt,
        lt_functions_del  TYPE zalv_functions_tt,
        lwa_functions     TYPE ztalv_functions,
        lwa_config02_x    TYPE ztalv_config_x,
        lwa_columns_ui_x  TYPE ztalv_columns_x,
        lt_columns_ui_x   TYPE TABLE OF ztalv_columns_x,
        l_alv_col         TYPE string,
        lwa_config_var    TYPE ztalv_config_var.


* get wrapper config
  ctx->read_element( EXPORTING path       = c_config02
                     IMPORTING row_data   = lwa_config02 ).

  IF lwa_config02-component IS NOT INITIAL
  AND lwa_config02-alv_usage IS NOT INITIAL.
    MODIFY ztalv_config FROM lwa_config02.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* save config to ztalv_config_var
  ctx->read_element( EXPORTING path       = c_config_var
                     IMPORTING row_data   = lwa_config_var ).

  lwa_config_var-component = lwa_config02-component.
  lwa_config_var-alv_usage = lwa_config02-alv_usage.
  IF lwa_config_var-config_source EQ c_wrapper_config.
    lwa_config_var-var_desc = 'Default'.
  ENDIF.
* get rid of *
  IF lwa_config_var-var_desc(1) EQ '*'.
    lwa_config_var-var_desc = lwa_config_var-var_desc+1.
  ENDIF.

  MODIFY ztalv_config_var FROM lwa_config_var.
  IF sy-subrc NE 0.
  ENDIF.


* get X values
  ctx->read_element( EXPORTING path       = c_config02_x
                     IMPORTING row_data   = lwa_config02_x ).
  IF lwa_config02_x IS NOT INITIAL.
    lwa_config02_x-component     = lwa_config02-component.
    lwa_config02_x-alv_usage     = lwa_config02-alv_usage.
    lwa_config02_x-config_source = lwa_config02-config_source.
    MODIFY ztalv_config_x FROM lwa_config02_x.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get column config
  ctx->read_table( EXPORTING path       = c_columns_ui
                     IMPORTING table    = lt_columns_ui ).

  lt_columns_02 = get_wrapper_columns_fr_ui( i_columns_ui = lt_columns_ui
                                             i_component  = lwa_config02-component
                                             i_alv_usage  = lwa_config02-alv_usage ).

  IF lwa_config02-component IS NOT INITIAL
  AND lwa_config02-alv_usage IS NOT INITIAL.
    MODIFY ztalv_columns FROM TABLE lt_columns_02.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get X values
  DO.
    IF ctx->lead_select_element( path  = c_columns_ui
                                 index = sy-index ) IS INITIAL.
      EXIT.
    ENDIF.

* get alv column
    CLEAR l_alv_col.
    ctx->read_attribute( EXPORTING path       = c_columns_ui
                                   attribute  = 'ALV_COLUMN_01'
                         IMPORTING value      = l_alv_col ).

    ctx->read_element( EXPORTING path       = c_columns_ui_x
                       IMPORTING row_data   = lwa_columns_ui_x ).

    IF lwa_columns_ui_x IS NOT INITIAL.
      lwa_columns_ui_x-component      = lwa_config02-component.
      lwa_columns_ui_x-alv_usage      = lwa_config02-alv_usage.
      lwa_columns_ui_x-config_source  = lwa_config02-config_source.
      lwa_columns_ui_x-alv_column     = l_alv_col.
      APPEND lwa_columns_ui_x TO lt_columns_ui_x.
    ENDIF.
  ENDDO.

  IF lt_columns_ui_x IS NOT INITIAL.
    MODIFY ztalv_columns_x FROM TABLE lt_columns_ui_x.
    IF sy-subrc NE 0.
    ENDIF.
  ENDIF.

* get functions
  ctx->read_table( EXPORTING path       = c_functions_ui
                     IMPORTING table    = lt_functions_ui ).
  LOOP AT lt_functions_ui INTO lwa_functions_ui.
    MOVE-CORRESPONDING lwa_functions_ui TO lwa_functions.
    lwa_functions-component     = lwa_config02-component.
    lwa_functions-alv_usage     = lwa_config02-alv_usage.
    lwa_functions-config_source = lwa_config02-config_source.
    IF lwa_functions_ui-selected IS NOT INITIAL.
      APPEND lwa_functions TO lt_functions.
    ELSE.
*     delete from ztalv_functions
      APPEND lwa_functions TO lt_functions_del.
    ENDIF.
  ENDLOOP.

  IF lt_functions IS NOT INITIAL.
    MODIFY ztalv_functions FROM TABLE lt_functions.
  ENDIF.

  IF lt_functions_del IS NOT INITIAL.
    DELETE ztalv_functions FROM TABLE lt_functions_del.
  ENDIF.
  endmethod.


  method SELECT_VARIANT.

* get selected varint
  data: l_config type numc2.

  ctx->read_attribute( exporting path      = c_config_var
                                 attribute = 'CONFIG_SOURCE'
                       importing value     = l_config ).

  me->get_config( l_config ).

  endmethod.


  method SET_HEADER_TEXT.

  data: l_string type string,
        l_var    type string.

  l_var = i_variant.
  l_string = i_component && ` / ` && i_usage && ` / ` && l_var.

  ctx->WRITE_ATTRIBUTE( path       = C_UI_PROP
                        ATTRIBUTE  = 'HEADER_TEXT'
                        VALUE      = l_string ).
  endmethod.


  method SET_XFLAG.


  DATA: lwa_ui_element TYPE ty_ui_elements.

  READ TABLE t_ui_elements INTO lwa_ui_element WITH KEY ui_element = ui_element BINARY SEARCH.
  CHECK sy-subrc EQ 0.

  ctx->write_attribute( path      = lwa_ui_element-ctx_path
                        attribute = lwa_ui_element-ctx_attribute
                        value     = xflag ).
  endmethod.


  METHOD STANDARD_CONFIG_EXISTS.
    IF config_exists( c_original_config ) IS INITIAL.
*   issue error message
*    msg->REPORT_ERROR_MESSAGE( 'Standard Config does not exist').
    ELSE.
      r_exist = abap_true.
    ENDIF.
  ENDMETHOD.


  method UPDATE_COLUMNS_UI.

  DATA: lt_columns_ui   TYPE tty_columns_ui,
        lwa_columns_ui  TYPE ty_columns_ui,
        lwa_columns01   TYPE ztalv_columns,
        lwa_columns02   TYPE ztalv_columns,
        lt_columns02    TYPE ZALV_COLUMNS_TT.

  lt_columns02 = i_columns02.
  SORT lt_columns02 BY alv_column.

  LOOP AT i_columns01 INTO lwa_columns01.
    READ TABLE lt_columns02 INTO lwa_columns02 WITH KEY alv_column = lwa_columns01-alv_column binary search.
    CHECK sy-subrc EQ 0.

    lwa_columns_ui-config_source_02         = lwa_columns02-config_source.
    lwa_columns_ui-alv_column_01            = lwa_columns01-alv_column.
    lwa_columns_ui-filter_fieldname_01      = lwa_columns01-filter_fieldname.
    lwa_columns_ui-filter_fieldname_02      = lwa_columns02-filter_fieldname.
    lwa_columns_ui-sort_fieldname_01        = lwa_columns01-sort_fieldname.
    lwa_columns_ui-sort_fieldname_02        = lwa_columns02-sort_fieldname.
    lwa_columns_ui-text_fieldname_01        = lwa_columns01-text_fieldname.
    lwa_columns_ui-text_fieldname_02        = lwa_columns02-text_fieldname.
    lwa_columns_ui-hierarchy_column_01      = lwa_columns01-hierarchy_column.
    lwa_columns_ui-hierarchy_column_02      = lwa_columns02-hierarchy_column.
    lwa_columns_ui-accessibility_descr_01   = lwa_columns01-accessibility_descr.
    lwa_columns_ui-accessibility_descr_02   = lwa_columns02-accessibility_descr.
    lwa_columns_ui-explanation_01           = lwa_columns01-explanation.
    lwa_columns_ui-explanation_02           = lwa_columns02-explanation.
    lwa_columns_ui-fixed_position_01        = lwa_columns01-fixed_position.
    lwa_columns_ui-fixed_position_02        = lwa_columns02-fixed_position.
    lwa_columns_ui-col_position_01          = lwa_columns01-col_position.
    lwa_columns_ui-col_position_02          = lwa_columns02-col_position.
    lwa_columns_ui-visible_01               = lwa_columns01-visible.
    lwa_columns_ui-visible_02               = lwa_columns02-visible.
    lwa_columns_ui-cell_design_01           = lwa_columns01-cell_design.
    lwa_columns_ui-cell_design_02           = lwa_columns02-cell_design.
    lwa_columns_ui-cell_design_fieldname_01 = lwa_columns01-cell_design_fieldname.
    lwa_columns_ui-cell_design_fieldname_02 = lwa_columns02-cell_design_fieldname.
    lwa_columns_ui-h_align_01               = lwa_columns01-h_align.
    lwa_columns_ui-h_align_02               = lwa_columns02-h_align.
    lwa_columns_ui-resizable_01             = lwa_columns01-resizable.
    lwa_columns_ui-resizable_02             = lwa_columns02-resizable.
    lwa_columns_ui-selected_cell_variant_01 = lwa_columns01-selected_cell_variant.
    lwa_columns_ui-selected_cell_variant_02 = lwa_columns02-selected_cell_variant.
    lwa_columns_ui-selection_state_01       = lwa_columns01-selection_state.
    lwa_columns_ui-selection_state_02       = lwa_columns02-selection_state.
    lwa_columns_ui-sel_cell_variant_fieldname_01 = lwa_columns01-sel_cell_variant_fieldname.
    lwa_columns_ui-sel_cell_variant_fieldname_02 = lwa_columns02-sel_cell_variant_fieldname.
    lwa_columns_ui-width_01                       = lwa_columns01-width.
    lwa_columns_ui-width_02                       = lwa_columns02-width.
    lwa_columns_ui-hdr_text_direction_01          = lwa_columns01-hdr_text_direction.
    lwa_columns_ui-hdr_text_direction_02          = lwa_columns02-hdr_text_direction.
    lwa_columns_ui-hdr_image_first_01             = lwa_columns01-hdr_image_first.
    lwa_columns_ui-hdr_image_first_02             = lwa_columns02-hdr_image_first.
    lwa_columns_ui-hdr_image_source_01            = lwa_columns01-hdr_image_source.
    lwa_columns_ui-hdr_image_source_02            = lwa_columns02-hdr_image_source.
    lwa_columns_ui-hdr_prop_ddic_binding_element1 = lwa_columns01-hdr_prop_ddic_binding_element.
    lwa_columns_ui-hdr_prop_ddic_binding_element2 = lwa_columns02-hdr_prop_ddic_binding_element.
    lwa_columns_ui-hdr_prop_ddic_binding_field_01 = lwa_columns01-hdr_prop_ddic_binding_field.
    lwa_columns_ui-hdr_prop_ddic_binding_field_02 = lwa_columns02-hdr_prop_ddic_binding_field.
    lwa_columns_ui-hdr_text_01                     = lwa_columns01-hdr_text .
    lwa_columns_ui-hdr_text_02                     = lwa_columns02-hdr_text.
    lwa_columns_ui-hdr_tooltip_01                  = lwa_columns01-hdr_tooltip.
    lwa_columns_ui-hdr_tooltip_02                  = lwa_columns02-hdr_tooltip.
    lwa_columns_ui-hdr_header_text_wrapping_01     = lwa_columns01-hdr_header_text_wrapping.
    lwa_columns_ui-hdr_header_text_wrapping_02     = lwa_columns02-hdr_header_text_wrapping.
    lwa_columns_ui-col_delete_02                   = lwa_columns02-col_delete.
    APPEND lwa_columns_ui TO lt_columns_ui.
  ENDLOOP.

    sort lt_columns_ui by col_position_01.

    ctx->write_table( path  = c_columns_ui
                      table = lt_columns_ui
                      adjust = abap_true ).
  endmethod.


  method UPDATE_COLUMNS_UI_X.

  data: lwa_columns_x  type ztalv_columns_x,
        lt_columns     type tty_columns_ui,
        lwa_column     type ty_columns_ui,
        lt_columns_x   type zalv_columns_x_tt.

  ctx->read_table( exporting path  = c_columns_ui
                   importing table = lt_columns ).

  loop at t_columns_x into lwa_columns_x.
    read table lt_columns transporting no fields with key alv_column_01 = lwa_columns_x-alv_column.
    if sy-subrc eq 0.
      ctx->LEAD_SELECT_ELEMENT( path  = c_columns_ui
                                INDEX = sy-tabix ).

      clear lt_columns_x .
      append lwa_columns_x to lt_columns_x.
      ctx->write_table( path   = c_columns_ui_x
                        adjust = abap_true
                        table  = lt_columns_x  ).
    endif.
  endloop.

  endmethod.


  method UPDATE_FUNCTIONS_UI.


  DATA: lt_functions TYPE tty_functions_ui,
        lwa_functions TYPE ztalv_functions.

  FIELD-SYMBOLS: <fs_function> TYPE ty_functions_ui.

  ctx->read_table( EXPORTING path  = c_functions_ui
                   IMPORTING table = lt_functions ).


  LOOP AT lt_functions ASSIGNING <fs_function>.
    READ TABLE i_functions INTO lwa_functions WITH KEY function_id = <fs_function>-function_id.
    IF sy-subrc EQ 0.
      <fs_function>-selected = abap_true.
      MOVE-CORRESPONDING lwa_functions TO <fs_function>.
    ELSE.
      CLEAR: <fs_function>-selected, <fs_function>-function_text, <fs_function>-function_position.

    ENDIF.
  ENDLOOP.

  ctx->write_table( path  = c_functions_ui
                    table = lt_functions
                    adjust = abap_true ).

  endmethod.
.
ENDCLASS.