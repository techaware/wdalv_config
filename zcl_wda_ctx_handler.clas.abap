class ZCL_WDA_CTX_HANDLER definition
  public
  create public .

public section.
*"* public components of class ZCL_WDA_CTX_HANDLER
*"* do not include other source files here!!!

  interfaces ZIF_WDA_CTX_HANDLER .

  methods CONSTRUCTOR
    importing
      !CTX type ref to IF_WD_CONTEXT_NODE .
  class-methods CREATE
    importing
      !CTX type ref to IF_WD_CONTEXT_NODE
    returning
      value(CTX_HANDLER) type ref to ZCL_WDA_CTX_HANDLER .
protected section.
*"* protected components of class ZCL_WDA_CTX_HANDLER
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_WDA_CTX_HANDLER
*"* do not include other source files here!!!

  data CTX type ref to IF_WD_CONTEXT_NODE .
ENDCLASS.



CLASS ZCL_WDA_CTX_HANDLER IMPLEMENTATION.


method CONSTRUCTOR.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  me->ctx = ctx.

endmethod.


method CREATE.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  create object ctx_handler exporting ctx = ctx.

endmethod.


method ZIF_WDA_CTX_HANDLER~DELETE_ELEMENT.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  DATA lo_nd TYPE REF TO if_wd_context_node.
  DATA lo_el TYPE REF TO if_wd_context_element.

* navigate from <CONTEXT> to <NEW_STRGRP> via lead selection
  lo_nd = ctx->path_get_node( path ).

* @TODO handle non existant child
 IF lo_nd IS INITIAL.
   return.
 ENDIF.

* get element via lead selection
  if index is initial.
  lo_el = lo_nd->get_element( ).
  else.
  lo_el = lo_nd->get_element( index ).
  endif.
* @TODO handle not set lead selection
  IF lo_el IS INITIAL.
    return.
  ENDIF.

  lo_nd->remove_element( lo_el ).

endmethod.


method ZIF_WDA_CTX_HANDLER~GET_LEAD_INDEX.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : GET_LEAD_INDEX                                       *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
* 07/07/2015 C1573346RA                        R20277985   DV3K959872  *
* Fixed issue related to no lead selection                             *
************************************************************************

  DATA lo_nd TYPE REF TO if_wd_context_node.
  DATA lo_el TYPE REF TO if_wd_context_element.

* navigate from <CONTEXT> to <NEW_STRGRP> via lead selection
  lo_nd = ctx->path_get_node( path ).

* @TODO handle non existant child
 IF lo_nd IS INITIAL.
   return.
 ENDIF.

 r_index = lo_nd->GET_LEAD_SELECTION_INDEX( ).

* if nothing is selected then r_index = -2
 if r_index lt 0.
   clear r_index.
 endif.

endmethod.


METHOD zif_wda_ctx_handler~invalidate.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  DATA lo_nd TYPE REF TO if_wd_context_node.

  IF path IS SUPPLIED.
* navigate from <CONTEXT> to <STRGRP> via lead selection
    lo_nd = ctx->path_get_node( path ).

* @TODO handle non existant child
    IF lo_nd IS INITIAL.
      RETURN.
    ENDIF.

    lo_nd->invalidate( ).
  ELSE.
    ctx->invalidate( ).
  ENDIF.

ENDMETHOD.


method ZIF_WDA_CTX_HANDLER~KEEP_ONLY_SELECTED.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  DATA lo_nd TYPE REF TO if_wd_context_node.
  data lt_all_elements type WDR_CONTEXT_ELEMENT_SET.
  data ls_all_elements like line of lt_all_elements.

*   navigate from <CONTEXT> to <STRGRP> via lead selection
  lo_nd = me->ctx->path_get_node( path ).

*   @TODO handle non existant child
  IF lo_nd IS INITIAL.
    RETURN.
  ENDIF.

  lt_all_elements = lo_nd->get_elements( ).
  loop at lt_all_elements into ls_all_elements.
    if ls_all_elements->is_selected( ) is initial.
      lo_nd->remove_element( ls_all_elements ).
    endif.
  endloop.
endmethod.


METHOD ZIF_WDA_CTX_HANDLER~LEAD_SELECT_ELEMENT.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
* 07/07/2015 C1573346RA                        R20277985   DV3K959872  *
* Fixed issue related to no lead selection                             *
* 08/25/2015 C1573346RA                        R22363129   DV3K961237  *
* replace select_element with lead_select_element method of            *
* ZIF_WDA_CTX_HANDLER                                                  *
************************************************************************

* index has preference over first and last.

  DATA lo_nd TYPE REF TO if_wd_context_node.
  DATA lt_all_elements TYPE wdr_context_element_set.
  data l_count type i.

*   navigate from <CONTEXT> to <STRGRP> via lead selection
  lo_nd = me->ctx->path_get_node( path ).

*   @TODO handle non existant child
  IF lo_nd IS INITIAL.
    RETURN.
  ENDIF.

  l_count = lo_nd->get_element_count( ).

  if l_count is initial.
    return.
  endif.

  if index is supplied
    and index LE l_count
    and index gt 0.
    lo_nd->SET_LEAD_SELECTION_INDEX( index ).
    done = abap_true.
  endif.

  if last is supplied.
    lo_nd->SET_LEAD_SELECTION_INDEX( l_count ).
    done = abap_true.
  endif.

  if first is supplied.
    lo_nd->SET_LEAD_SELECTION_INDEX( 1 ).
    done = abap_true.
  endif.

ENDMETHOD.


METHOD zif_wda_ctx_handler~read_attribute.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  DATA lo_nd TYPE REF TO if_wd_context_node.
  DATA lo_el TYPE REF TO if_wd_context_element.
*    DATA ls_el TYPE wd_this->element_strgrp.
*    DATA lv_store_group TYPE wd_this->element_strgrp-store_group.

*   navigate from <CONTEXT> to <STRGRP> via lead selection
  lo_nd = me->ctx->path_get_node( path ).

*   @TODO handle non existant child
  IF lo_nd IS INITIAL.
    RETURN.
  ENDIF.

*   get element via lead selection or Index.
  IF index IS INITIAL.
    lo_el = lo_nd->get_element( ).
  ELSE.
    lo_el = lo_nd->get_element( index ).
  ENDIF.

*   @TODO handle not set lead selection
  IF lo_el IS INITIAL.
    RETURN.
  ENDIF.

*   get single attribute
  lo_el->get_attribute(
    EXPORTING
      name =  attribute
    IMPORTING
      value = value ).

ENDMETHOD.


method ZIF_WDA_CTX_HANDLER~READ_ELEMENT.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  DATA lo_nd TYPE REF TO if_wd_context_node.
  DATA lo_el TYPE REF TO if_wd_context_element.

* navigate from <CONTEXT> to <NEW_STRGRP> via lead selection
  lo_nd = ctx->path_get_node( path ).

* @TODO handle non existant child
 IF lo_nd IS INITIAL.
   return.
 ENDIF.

* get element via lead selection
  if index is initial.
  lo_el = lo_nd->get_element( ).
  else.
  lo_el = lo_nd->get_element( index ).
  endif.
* @TODO handle not set lead selection
  IF lo_el IS INITIAL.
    return.
  ENDIF.

* get all declared attributes
  lo_el->get_static_attributes(
    IMPORTING
      static_attributes = row_data ).
endmethod.


METHOD zif_wda_ctx_handler~read_table.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************


  DATA: lo_nd           TYPE REF TO if_wd_context_node,
        lt_el_selected  type wdr_context_element_set,
        lwa_el_selected like line of lt_el_selected,
        lr_row          type ref to data.

  DATA lo_nd_info     TYPE REF TO if_wd_context_node_info.
  DATA nd_str_descr   TYPE REF TO cl_abap_structdescr.
  DATA nd_tbl_descr   TYPE REF TO cl_abap_tabledescr.

  field-symbols: <lfs_row> type data.

* navigate from <CONTEXT> to <STRGRP> via lead selection
  lo_nd = ctx->path_get_node( path ).

* @TODO handle non existant child
  IF lo_nd IS INITIAL.
    RETURN.
  ENDIF.

  IF selected_only IS INITIAL.
    lo_nd->get_static_attributes_table( IMPORTING table = table ).
  ELSE.
    lt_el_selected = lo_nd->get_selected_elements( ).
    lo_nd_info = lo_nd->get_node_info( ).
    nd_str_descr = lo_nd_info->get_static_attributes_type( ).
*    nd_tbl_descr = cl_abap_tabledescr=>create( nd_str_descr ).

    CREATE DATA lr_row TYPE HANDLE nd_str_descr.
    assign lr_row->* to <lfs_row>.
    LOOP AT lt_el_selected INTO lwa_el_selected.
      lwa_el_selected->get_static_attributes( IMPORTING static_attributes = <lfs_row> ).
      insert <lfs_row> into table table.
    ENDLOOP.
  ENDIF.
ENDMETHOD.


method ZIF_WDA_CTX_HANDLER~SELECT_ALL_ELEMENTS.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  DATA lo_nd TYPE REF TO if_wd_context_node.
  data lt_all_elements type WDR_CONTEXT_ELEMENT_SET.
  data ls_all_elements like line of lt_all_elements.

*   navigate from <CONTEXT> to <STRGRP> via lead selection
  lo_nd = me->ctx->path_get_node( path ).

*   @TODO handle non existant child
  IF lo_nd IS INITIAL.
    RETURN.
  ENDIF.

  lt_all_elements = lo_nd->get_elements( ).
  loop at lt_all_elements into ls_all_elements.
    ls_all_elements->set_selected( abap_true ).
  endloop.

endmethod.


METHOD zif_wda_ctx_handler~select_element.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
* 07/07/2015 C1573346RA                        R20277985   DV3K959872  *
* Fixed issue related to no lead selection                             *
* 08/25/2015 C1573346RA                        R22363129   DV3K961237  *
* replace select_element with lead_select_element method of            *
* ZIF_WDA_CTX_HANDLER                                                  *
************************************************************************

* index has preference over first and last.

  DATA lo_nd TYPE REF TO if_wd_context_node.
  DATA lt_all_elements TYPE wdr_context_element_set.
  DATA l_count TYPE i.

*   navigate from <CONTEXT> to <STRGRP> via lead selection
  lo_nd = me->ctx->path_get_node( path ).

*   @TODO handle non existant child
  IF lo_nd IS INITIAL.
    RETURN.
  ENDIF.

  l_count = lo_nd->get_element_count( ).

  IF l_count IS INITIAL.
    RETURN.
  ENDIF.

  IF index IS SUPPLIED
    AND index LE l_count
    AND index GT 0.
    lo_nd->set_selected( index ).
    done = abap_true.
  ENDIF.

  IF last IS SUPPLIED.
    lo_nd->set_selected( l_count ).
    done = abap_true.
  ENDIF.

  IF first IS SUPPLIED.
    lo_nd->set_selected( 1 ).
    done = abap_true.
  ENDIF.

ENDMETHOD.


method ZIF_WDA_CTX_HANDLER~WRITE_ATTRIBUTE.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

    DATA lo_nd TYPE REF TO if_wd_context_node.
    DATA lo_el TYPE REF TO if_wd_context_element.
*    DATA ls_el TYPE wd_this->element_strgrp.
*    DATA lv_store_group TYPE wd_this->element_strgrp-store_group.

*   navigate from <CONTEXT> to <STRGRP> via lead selection
    lo_nd = me->ctx->PATH_GET_NODE( path ).

*   @TODO handle non existant child
   IF lo_nd IS INITIAL.
     return.
   ENDIF.

*   get element via lead selection
    if index is initial.
    lo_el = lo_nd->get_element( ).
    else.
    lo_el = lo_nd->get_element( index ).
    endif.

*   @TODO handle not set lead selection
    IF lo_el IS INITIAL.
      return.
    ENDIF.

*   set single attribute
    lo_el->set_attribute(
      EXPORTING
        name =  attribute
        value = value ).

endmethod.


method ZIF_WDA_CTX_HANDLER~WRITE_ELEMENT.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************
endmethod.


METHOD zif_wda_ctx_handler~write_table.
************************************************************************
* PROJECT       : RCI Phase 2                                          *
* DESCRIPTION   : Initialize                                           *
* CREATED BY    : C1573346RA                                           *
* CREATION DATE : 05/15/2015                                           *
************************************************************************
*                        MODIFICATION HISTORY                          *
************************************************************************
* Date       Programmer  Description            Ticket    Correction   *
*----------------------------------------------------------------------*
* 05/15/2015 C1573346RA  Initial Dev.           20277985  DV3K958284   *
************************************************************************

  DATA lo_nd TYPE     REF TO if_wd_context_node.
  DATA l_set_init     TYPE boolean.
  DATA lo_nd_info     TYPE REF TO if_wd_context_node_info.
  DATA nd_str_descr   TYPE REF TO cl_abap_structdescr.
  DATA nd_tbl_descr   TYPE REF TO cl_abap_tabledescr.
  DATA lr_nd_table    TYPE REF TO data.

  FIELD-SYMBOLS: <lfs_nd_table> TYPE standard table,
                 <lfs_nd_line>  TYPE data,
                 <lfs_in_line>  TYPE data.

* navigate from <CONTEXT> to <STRGRP> via lead selection
  lo_nd = ctx->path_get_node( path ).

* @TODO handle non existant child
  IF lo_nd IS INITIAL.
    RETURN.
  ENDIF.

  IF append IS NOT INITIAL.
    l_set_init = abap_false.
  ELSE.
    l_set_init = abap_true.
  ENDIF.

  IF adjust IS NOT INITIAL.
*  get structure of node
    lo_nd_info = lo_nd->get_node_info( ).
    nd_str_descr = lo_nd_info->get_static_attributes_type( ).
    nd_tbl_descr = cl_abap_tabledescr=>create( nd_str_descr ).
    CREATE DATA lr_nd_table TYPE HANDLE nd_tbl_descr.
    ASSIGN lr_nd_table->* TO <lfs_nd_table>.

    LOOP AT table ASSIGNING <lfs_in_line>.
      APPEND INITIAL LINE TO <lfs_nd_table> ASSIGNING <lfs_nd_line>.
      MOVE-CORRESPONDING <lfs_in_line> TO <lfs_nd_line>.
    ENDLOOP.

    lo_nd->bind_table( new_items = <lfs_nd_table> set_initial_elements = l_set_init ).

  ELSE.
    lo_nd->bind_table( new_items = table set_initial_elements = l_set_init ).
  ENDIF.



ENDMETHOD.
ENDCLASS.