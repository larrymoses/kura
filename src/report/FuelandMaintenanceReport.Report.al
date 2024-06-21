#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59013 "Fuel and Maintenance Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fuel and Maintenance Report.rdlc';

    dataset
    {
        dataitem("Fuel & Maintenance Requisition"; "Fuel & Maintenance Requisition")
        {
            DataItemTableView = where(Type = filter(Maintenance));
            RequestFilterFields = Type, "Vehicle Reg No";
            column(ReportForNavId_1; 1)
            {
            }
            column(Type_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition".Type)
            {
            }
            column(RequisitionNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Requisition No")
            {
            }
            column(VehicleRegNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Vehicle Reg No")
            {
            }
            column(VendorDealer_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Vendor(Dealer)")
            {
            }
            column(QuantityofFuelLitres_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Quantity of Fuel(Litres)")
            {
            }
            column(TotalPriceofFuel_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Total Price of Fuel")
            {
            }
            column(OdometerReading_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Odometer Reading")
            {
            }
            column(RequestDate_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Request Date")
            {
            }
            column(DateTakenforFueling_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Date Taken for Fueling")
            {
            }
            column(Status_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition".Status)
            {
            }
            column(PreparedBy_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Prepared By")
            {
            }
            column(ClosedBy_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Closed By")
            {
            }
            column(DateClosed_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Date Closed")
            {
            }
            column(VendorInvoiceNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Vendor Invoice No")
            {
            }
            column(PostedInvoiceNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Posted Invoice No")
            {
            }
            column(Description_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition".Description)
            {
            }
            column(Department_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition".Department)
            {
            }
            column(NoSeries_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."No. Series")
            {
            }
            column(VendorName_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Vendor Name")
            {
            }
            column(DateTakenforMaintenance_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Date Taken for Maintenance")
            {
            }
            column(TypeofMaintenance_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Type of Maintenance")
            {
            }
            column(Driver_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition".Driver)
            {
            }
            column(DriverName_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Driver Name")
            {
            }
            column(FixedAssetNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Fixed Asset No")
            {
            }
            column(LitresofOil_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Litres of Oil")
            {
            }
            column(ChequeNo_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Cheque No")
            {
            }
            column(PriceLitre_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Price/Litre")
            {
            }
            column(TypeofFuel_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Type of Fuel")
            {
            }
            column(Coolant_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition".Coolant)
            {
            }
            column(BatteryWater_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Battery Water")
            {
            }
            column(WheelAlignment_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Wheel Alignment")
            {
            }
            column(WheelBalancing_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Wheel Balancing")
            {
            }
            column(CarWash_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Car Wash")
            {
            }
            column(ServiceCode_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Service Code")
            {
            }
            column(ServiceName_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Service Name")
            {
            }
            column(GLAccount_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."G/L Account")
            {
            }
            column(GLAccountName_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."G/L Account Name")
            {
            }
            column(POCreatedBy_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."PO Created By")
            {
            }
            column(DatePOCreated_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Date PO Created")
            {
            }
            column(POCreated_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."PO Created")
            {
            }
            column(ShortcutDimension1Code_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Shortcut Dimension 1 Code")
            {
            }
            column(MaintenanceCost_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Previous Odometer Reading")
            {
            }
            column(ShortcutDimension2Code_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Shortcut Dimension 2 Code")
            {
            }
            column(RegionName_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Department Name")
            {
            }
            column(ProjectNumber_FuelMaintenanceRequisition; "Fuel & Maintenance Requisition"."Date Returned from Maintenance")
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

            trigger OnAfterGetRecord()
            begin
                FuelM.Reset;
                FuelM.SetRange(Type, "Fuel & Maintenance Requisition".Type::Maintenance);
                if FuelM.FindSet then begin
                end;
            end;

            trigger OnPreDataItem()
            begin
                FuelM.Reset;
                FuelM.SetRange(Type, "Fuel & Maintenance Requisition".Type::Maintenance);
                if FuelM.FindSet then begin
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
        FuelM: Record "Fuel & Maintenance Requisition";
}
