#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59015 "Fuel Requisition Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fuel Requisition Report.rdlc';

    dataset
    {
        dataitem("Fuel & Maintenance Requisition";"Fuel & Maintenance Requisition")
        {
            DataItemTableView = where(Type=const(Fuel));
            column(ReportForNavId_1; 1)
            {
            }
            column(RequisitionNo_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Requisition No")
            {
            }
            column(CI_Picture;CI.Picture)
            {
            }
            column(VendorDealer_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Vendor(Dealer)")
            {
            }
            column(VendorName_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Vendor Name")
            {
            }
            column(RequestDate_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Request Date")
            {
            }
            column(PreparedBy_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Prepared By")
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
            column(JobNo_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Driver Name")
            {
            }
            column(JobName_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Type of Fuel")
            {
            }
            column(TotalPriceofFuel_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Total Price of Fuel")
            {
            }
            column(ClosedBy_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Closed By")
            {
            }
            column(Status_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition".Status)
            {
            }
            column(DateClosed_FuelMaintenanceRequisition;"Fuel & Maintenance Requisition"."Date Closed")
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
