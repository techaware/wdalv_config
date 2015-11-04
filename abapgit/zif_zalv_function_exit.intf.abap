interface ZIF_ZALV_FUNCTION_EXIT
  public .


  interface IF_FDT_DOC_SPREADSHEET load .
  methods GET_EXPORT_DATA
    importing
      !I_DEFINATION type ref to CL_ABAP_TABLEDESCR
    changing
      !EXCEL_COLUMNS type IF_FDT_DOC_SPREADSHEET=>T_COLUMN
      !EXCEL_RECORDS type ref to DATA .
endinterface.
