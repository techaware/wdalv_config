# wdalv_config
SAP Web Dynpro ABAP ALV configurator


**Install**
* Import the objects from nugget file under latest git release using SAPLINK
* Activate all the objects
* Create WD applications for ZALV_COMP_CONFIG

**Demo**
* Create WD application for ZALV_DEMO
* Execute the application
* Execute configurator application (ZALV_COMP_CONFIG)
* Change some config values and save
* Relaunch ZALV_DEMO application to see the changes


**Use**
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
- For other systems in the transport path(QA,IT,UT,PD), simply transport the table entries from ZTALV* tables where config_type = 02 (Wrapper Config)

**Note**
- Mandatory step: Execute the application (Required for updating Z tables with config meta data ) before running ALV configurator App
- If ALV functions from configurator (like - record count, full screen, excel export) are to be published then main application need to have node mapping for FUNCTION_ELEMENTS node of ALV. 

