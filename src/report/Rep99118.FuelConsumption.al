report 99118 "Fuel Consumption"
{
    ApplicationArea = All;
    Caption = 'Fuel Consumption';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/FuelConsumption.rdl';

    dataset
    {
        dataitem(FuelMaintenanceRequisition; "Fuel & Maintenance Requisition")
        {
            RequestFilterFields = "Vehicle Reg No";
            DataItemTableView = sorting("Requisition No") where(Status = filter(Approved));

            column(Driver; Driver)
            {
            }
            column(DriverName; "Driver Name")
            {
            }
            column(RequisitionNo; "Requisition No")
            {
            }
            column(RequestDate; "Request Date")
            {
            }
            column(CarWash; "Car Wash")
            {
            }
            column(DateTakenforMaintenance; "Date Taken for Maintenance")
            {
            }
            column(DateTakenforFueling; "Date Taken for Fueling")
            {
            }
            column(Department; Department)
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(DateReturnedfromMaintenance; "Date Returned from Maintenance")
            {
            }
            column(Description; Description)
            {
            }
            column(FuelCardNo; "Fuel Card No.")
            {
            }
            column(Garage; Garage)
            {
            }
            column(LitresofOil; "Litres of Oil")
            {
            }
            column(NextOdometerReading; "Next Odometer Reading")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(OdometerReading; "Odometer Reading")
            {
            }
            column(Previous_Odometer_Reading; "Previous Odometer Reading")
            {

            }
            column(Quantity_of_Fuel_Litres_;"Quantity of Fuel(Litres)")
            {

            }
            column(Total_Price_of_Fuel;"Total Price of Fuel")
            {

            }
            column(VehicleRegNo; "Vehicle Reg No")
            {
            }
            column(VendorInvoiceNo; "Vendor Invoice No")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(VendorDealer; "Vendor(Dealer)")
            {
            }
            column(TotalPriceofFuel; "Total Price of Fuel")
            {
            }
            column(PriceLitre; "Price/Litre")
            {
            }
            column(ProjectName; "Project Name")
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
            column(BatteryWater; "Battery Water")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(FixedAssetNo; "Fixed Asset No")
            {
            }
            column(WheelAlignment; "Wheel Alignment")
            {
            }
            column(WheelBalancing; "Wheel Balancing")
            {
            }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {

            }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            {

            }
            column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
            {

            }
            column(ConsumptionPer100;ConsumptionPer100)
            {

            }
            column(CompanyPicture; CompanyInformation.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {

            }
            column(CompanyAddress2; CompanyAddr[2])
            {

            }
            column(CompanyAddress3; CompanyAddr[3])
            {

            }
            column(CompanyAddress4; CompanyAddr[4])
            {

            }
            column(CompanyAddress5; CompanyAddr[5])
            {

            }
            column(CompanyAddress6; CompanyAddr[6])
            {

            }
            column(CompanyMotto; CompanyInformation.Motto)
            {

            }
            column(OdometerDifference;OdometerDifference)
            {
            }
            column(ConsumptionRate;ConsumptionRate)
            {
            }

            trigger OnAfterGetRecord()
            var
                Text001: Label 'The Start Date field is required.';
                Text002: Label 'The End Date field is required.';
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Shortcut Dimension 1 Code", ResponsibilityCenter, CompanyInformation, CompanyAddr);

                if StartDate = 0D then
                    Error(Text001);

                if EndDate = 0D then
                    Error(Text002);

                FuelMaintenanceRequisition.SetRange("Request Date", StartDate, EndDate);
                
                if "Odometer Reading" <> 0 then begin
                    ConsumptionPer100:=("Total Price of Fuel"*100)/"Odometer Reading";
                    OdometerDifference := "Odometer Reading" - "Previous Odometer Reading";
                    if "Litres of Oil" <> 0 then
                        ConsumptionRate := OdometerDifference/"Litres of Oil";
                end;
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    field(StartDate;StartDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Start Date';
                    }
                    field(EndDate;EndDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'End Date';
                    }
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
    var

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        ConsumptionPer100: Decimal;
        OdometerDifference: Decimal;
        ConsumptionRate: Decimal;
        StartDate: Date;
        EndDate: Date;
}
