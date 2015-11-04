
Steps for installation
1) Install NUGG_WDA_CONTEXT_HANDLER.nugg using SAPLINK.
2) Install NUGG_ZALV.nugg 
3) Confirm that all the objects are activated
4) Add usage of ZALV component to any component that uses SAP standand ALV component - SALV_WD_TABLE
5) Instantiate ZALV component and pass ALV usage object of original ALV to ZALV by calling interface method set_alv_usage. 

lo_cmp_usage =   wd_this->wd_cpuse_zalv( ).
IF lo_cmp_usage->has_active_component( ) IS INITIAL.
  lo_cmp_usage->create_component( ).
ENDIF.

DATA lo_interfacecontroller TYPE REF TO ziwci_alv .
lo_interfacecontroller =   wd_this->wd_cpifc_zalv( ).

  lo_interfacecontroller->set_alv_usage(
    alv_usage =  lo_alv_usage                       " ref to if_wd_component_usage
  ).
  
6) Mandatory step: Execute the application (Required for updating Z tables with config meta data )
7) Run ALV configurator app (component ZALV_COMP_CONFIG) to change ALV config
