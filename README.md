# wdalv_config
SAP Web Dynpro ABAP ALV configurator

# Steps for installation #

- Import the objects from nugget file under latest git release using SAPLINK
- Activate imported objects
- Add usage of ZALV component to any component that uses SAP standand ALV component - SALV_WD_TABLE
- Instantiate ZALV component and pass ALV usage object of original ALV to ZALV by calling interface method set_alv_usage. 


```abap
lo_cmp_usage =   wd_this->wd_cpuse_zalv( ).
IF lo_cmp_usage->has_active_component( ) IS INITIAL.
    lo_cmp_usage->create_component( ).
ENDIF.

DATA lo_interfacecontroller TYPE REF TO ziwci_alv .
lo_interfacecontroller =   wd_this->wd_cpifc_zalv( ).

lo_interfacecontroller->set_alv_usage(
    alv_usage =  lo_alv_usage
  ).
```

- In method UPDATE_DB_FROM_CONFIG of component controller of component ZALV - check if the current system is your development system. This ensures that Z tables are updated with config meta data only in Dev system. 

```abap
  CHECK sy-sysid cp 'D*'.
```

- Mandatory step: Execute the application (Required for updating Z tables with config meta data )
- Run ALV configurator app (component ZALV_COMP_CONFIG) to change ALV config

