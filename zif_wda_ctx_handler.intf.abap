interface ZIF_WDA_CTX_HANDLER
  public .


  methods READ_ATTRIBUTE
    importing
      !PATH type STRING
      !ATTRIBUTE type STRING
      !INDEX type I optional
    exporting
      !VALUE type DATA .
  methods WRITE_ATTRIBUTE
    importing
      !PATH type STRING
      !ATTRIBUTE type STRING
      !INDEX type I optional
      !VALUE type DATA .
  methods READ_TABLE
    importing
      !PATH type STRING
      !SELECTED_ONLY type BOOLEAN optional
    exporting
      !TABLE type ANY TABLE .
  methods WRITE_TABLE
    importing
      !PATH type STRING
      !APPEND type BOOLEAN optional
      !TABLE type ANY TABLE
      !ADJUST type BOOLEAN optional .
  methods READ_ELEMENT
    importing
      !PATH type STRING
      !INDEX type I optional
    exporting
      !ROW_DATA type DATA .
  methods WRITE_ELEMENT .
  methods DELETE_ELEMENT
    importing
      !PATH type STRING
      !INDEX type I optional .
  methods LEAD_SELECT_ELEMENT
    importing
      !PATH type STRING
      !LAST type BOOLEAN optional
      !FIRST type BOOLEAN optional
      !INDEX type I optional
    returning
      value(DONE) type BOOLEAN .
  methods SELECT_ALL_ELEMENTS
    importing
      !PATH type STRING .
  methods KEEP_ONLY_SELECTED
    importing
      !PATH type STRING .
  methods INVALIDATE
    importing
      !PATH type STRING optional .
  methods GET_LEAD_INDEX
    importing
      !PATH type STRING
    returning
      value(R_INDEX) type I .
  methods SELECT_ELEMENT
    importing
      !PATH type STRING
      !LAST type BOOLEAN optional
      !FIRST type BOOLEAN optional
      !INDEX type I optional
    returning
      value(DONE) type BOOLEAN .
endinterface.