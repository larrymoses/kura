report 99119 "Top Up Report"
{
    ApplicationArea = All;
    Caption = 'Top Up Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/TopUp.rdl';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(FuelMaintenanceRequisition; "Fuel & Maintenance Requisition")
        {
            column(RequisitionNo; "Requisition No")
            {
            }
            column(VehicleRegNo; "Vehicle Reg No")
            {
            }
            column(VendorInvoiceNo; "Vendor Invoice No")
            {
            }
            column(PostedInvoiceNo; "Posted Invoice No")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(FuelCardNo; "Fuel Card No.")
            {
            }
            column(FixedAssetNo; "Fixed Asset No")
            {
            }
            column(Driver; Driver)
            {
            }
            column(DriverName; "Driver Name")
            {
            }
            column(LitresofOil; "Litres of Oil")
            {
            }
            column(Mileage; Mileage)
            {
            }
            column(NextOdometerReading; "Next Odometer Reading")
            {
            }
            column(OdometerReading; "Odometer Reading")
            {
            }
            column(POCreated; "PO Created")
            {
            }
            column(DatePOCreated; "Date PO Created")
            {
            }
            column(ServiceCode; "Service Code")
            {
            }
            column(ServiceName; "Service Name")
            {
            }
            column(ServiceType; "Service Type")
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(Status; Status)
            {
            }
            column(ProjectName; "Project Name")
            {
            }
            column(QuantityofFuelLitres; "Quantity of Fuel(Litres)")
            {
            }
            column(PreviousOdometerReading; "Previous Odometer Reading")
            {
            }
            column(PriceLitre; "Price/Litre")
            {
            }
            column(BatteryWater; "Battery Water")
            {
            }
            column(CarWash; "Car Wash")
            {
            }
            column(DateClosed; "Date Closed")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(VendorDealer; "Vendor(Dealer)")
            {
            }
            dataitem(payments; payments)
            {
                DataItemLinkReference = FuelMaintenanceRequisition;
                DataItemLink = "Pre-Assigned No." = field("Requisition No"), "Account No." = field(Driver);
                column(Currency; Currency)
                {

                }
                column(No_; "No.")
                {

                }
                column(Reference_No_; "Reference No.")
                {

                }
                column(Total_Amount; "Total Amount")
                {

                }
                column(Project_Description; "Project Description")
                {

                }
                column(Total_Net_Amount; "Total Net Amount")
                {

                }
                column(Total_VAT_Amount; "Total VAT Amount")
                {

                }
                column(PVStatus; Status)
                {

                }
                column(Posted_Date; "Posted Date")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields("Total Amount");
                end;
            }
            trigger OnAfterGetRecord()
            begin

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
