#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59017 "Fleet Vehicle Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fleet Vehicle Report.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Fleet Vehicles."; "Fleet Vehicles.")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code")
            {
            }
            column(CI_City; CI.City)
            {
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Description_FleetVehicles; "Fleet Vehicles.".Description)
            {
            }
            column(Make_FleetVehicles; "Fleet Vehicles.".Make)
            {
            }
            column(Model_FleetVehicles; "Fleet Vehicles.".Model)
            {
            }
            column(YearOfManufacture_FleetVehicles; "Fleet Vehicles."."Year Of Manufacture")
            {
            }
            column(CountryOfOrigin_FleetVehicles; "Fleet Vehicles."."Country Of Origin")
            {
            }
            column(StartReading_FleetVehicles; "Fleet Vehicles."."Start Reading")
            {
            }
            column(Ownership_FleetVehicles; "Fleet Vehicles.".Ownership)
            {
            }
            column(ChassisSerialNo_FleetVehicles; "Fleet Vehicles."."Chassis Serial No.")
            {
            }
            column(EngineSerialNo_FleetVehicles; "Fleet Vehicles."."Engine Serial No.")
            {
            }
            column(FuelType_FleetVehicles; "Fleet Vehicles."."Fuel Type")
            {
            }
            column(FuelRating_FleetVehicles; "Fleet Vehicles."."Fuel Rating")
            {
            }
            column(RegistrationNo_FleetVehicles; "Fleet Vehicles."."Registration No.")
            {
            }
            column(No_FleetVehicles; "Fleet Vehicles."."No.")
            {
            }
            column(FALocationCode_FleetVehicles; "Fleet Vehicles."."FA Location Code")
            {
            }
            column(SerialNo_FleetVehicles; "Fleet Vehicles."."Serial No.")
            {
            }
            column(Insured_FleetVehicles; "Fleet Vehicles.".Insured)
            {
            }
            column(Inactive_FleetVehicles; "Fleet Vehicles.".Inactive)
            {
            }
            column(BodyColor_FleetVehicles; "Fleet Vehicles."."Body Color")
            {
            }
            column(LicensingCompany_FleetVehicles; "Fleet Vehicles."."Licensing Company")
            {
            }
            column(VehicleStatus_FleetVehicles; "Fleet Vehicles."."Vehicle Status")
            {
            }
            column(VehicleLocationName; VehicleLocationName)
            {
            }
            dataitem("Fuel Milleage Req"; "Fuel Milleage Req")
            {
                DataItemLink = No = field("No.");
                column(ReportForNavId_36; 36)
                {
                }
                column(No_FuelMilleageReq; "Fuel Milleage Req".No)
                {
                }
                column(Date_FuelMilleageReq; Format("Fuel Milleage Req".Date))
                {
                }
                column(Month_FuelMilleageReq; "Fuel Milleage Req".Month)
                {
                }
                column(FuelDrawn_FuelMilleageReq; "Fuel Milleage Req"."Fuel Drawn")
                {
                }
                column(MileageKM_FuelMilleageReq; "Fuel Milleage Req"."Mileage (KM)")
                {
                }
            }
            dataitem("Vehicle Accident Details"; "Vehicle Accident Details")
            {
                DataItemLink = RegNo = field("Registration No.");
                column(ReportForNavId_12; 12)
                {
                }
                column(Driver_VehicleAccidentDetails; "Vehicle Accident Details".Driver)
                {
                }
                column(Accidentdate_VehicleAccidentDetails; Format("Vehicle Accident Details"."Accident date"))
                {
                }
                column(AccidentDetails_VehicleAccidentDetails; "Vehicle Accident Details"."Accident Details")
                {
                }
                column(DriverNames_VehicleAccidentDetails; "Vehicle Accident Details"."Driver Names")
                {
                }
                column(No_VehicleAccidentDetails; "Vehicle Accident Details".No)
                {
                }
                column(PoliceAbstractNo_VehicleAccidentDetails; "Vehicle Accident Details"."Police Abstract No")
                {
                }
            }
            dataitem("Fuel & Maintenance Requisition"; "Fuel & Maintenance Requisition")
            {
                DataItemLink = "Vehicle Reg No" = field("Registration No.");
                DataItemTableView = where(Status = filter(Approved));
                column(ReportForNavId_19; 19)
                {
                }
                column(RequisitionNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Requisition No")
                {
                }
                column(VendorDealer_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Vendor(Dealer)")
                {
                }
                column(TotalPriceofFuel_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Total Price of Fuel")
                {
                }
                column(DateTakenforFueling_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Date Taken for Fueling")
                {
                }
                column(Type_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition".Type)
                {
                }
                column(TypeofMaintenance_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Type of Maintenance")
                {
                }
                column(DriverName_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Driver Name")
                {
                }
                column(PostedInvoiceNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Posted Invoice No")
                {
                }
                column(RequestDate_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Request Date")
                {
                }
                column(OdometerReading_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Odometer Reading")
                {
                }
            }
            dataitem("Vehicle Insurance Lines"; "Vehicle Insurance Lines")
            {
                DataItemLink = "FA No." = field("No.");
                column(ReportForNavId_47; 47)
                {
                }
                column(No_VehicleInsuranceLines; "Vehicle Insurance Lines"."No.")
                {
                }
                column(EffectiveDate_VehicleInsuranceLines; "Vehicle Insurance Lines"."Effective Date")
                {
                }
                column(ExpirationDate_VehicleInsuranceLines; "Vehicle Insurance Lines"."Expiration Date")
                {
                }
                column(InsuranceVendorName_VehicleInsuranceLines; "Vehicle Insurance Lines"."Insurance Vendor Name")
                {
                }
                column(InsuanceDetails_VehicleInsuranceLines; "Vehicle Insurance Lines"."Insuance Details")
                {
                }
                column(FANo_VehicleInsuranceLines; "Vehicle Insurance Lines"."FA No.")
                {
                }
                column(PolicyNumber_VehicleInsuranceLines; "Vehicle Insurance Lines"."Policy Number")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Fleet Vehicles."."FA Location Code");
                if ResponsibilityCenter.FindSet then begin
                    VehicleLocationName := ResponsibilityCenter.Name;
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        VehicleLocationName: Text[250];
        ResponsibilityCenter: Record "Responsibility Center";
}
