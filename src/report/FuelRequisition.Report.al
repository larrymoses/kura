#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59019 "Fuel  Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fuel  Requisition.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Fuel & Maintenance Requisition";"Fuel & Maintenance Requisition")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CI_Picture;CI.Picture)
            {
            }
            column(FuelMaintenanceRequisition_RequisitionNo;"Fuel & Maintenance Requisition"."Requisition No")
            {
            }
            column(FuelMaintenanceRequisition_VehicleRegNo;"Fuel & Maintenance Requisition"."Vehicle Reg No")
            {
            }
            column(FuelMaintenanceRequisition_FuelType;"Fuel & Maintenance Requisition"."Type of Fuel")
            {
            }
            column(FuelMaintenanceRequisition_LitresRequested;"Fuel & Maintenance Requisition"."Litres of Oil")
            {
            }
            column(FuelMaintenanceRequisition_PriceLitre;Format("Fuel & Maintenance Requisition"."Price/Litre"))
            {
            }
            column(FuelMaintenanceRequisition_RequestDate;Format("Fuel & Maintenance Requisition"."Request Date"))
            {
            }
            column(FuelMaintenanceRequisition_DriverName;"Fuel & Maintenance Requisition"."Driver Name")
            {
            }
            column(FuelMaintenanceRequisition_RegionName;"Fuel & Maintenance Requisition"."Department Name")
            {
            }
            column(FuelMaintenanceRequisition_Description;"Fuel & Maintenance Requisition".Description)
            {
            }
            column(FuelMaintenanceRequisition_OdometerReading;Format("Fuel & Maintenance Requisition"."Odometer Reading"))
            {
            }
            column(FuelMaintenanceRequisition_PreviousOdometerReading;Format("Fuel & Maintenance Requisition"."Previous Odometer Reading"))
            {
            }
            column(FuelMaintenanceRequisition_VendorName;"Fuel & Maintenance Requisition"."Vendor Name")
            {
            }
            column(FuelMaintenanceRequisition_Status;"Fuel & Maintenance Requisition".Status)
            {
            }
            column(FuelMaintenanceRequisition_TotalAmount;"Fuel & Maintenance Requisition"."Total Price of Fuel")
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
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
}