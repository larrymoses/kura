/// <summary>
/// Report Transport Allocation (ID 50029).
/// </summary>
report 50029 "Transport Allocation"
{
    Caption = 'Transport Allocation';
    // ApplicationArea = All;
    // UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/TransportAllocation.rdl';

    dataset
    {
        dataitem("Vehicle Driver Allocation"; "Vehicle Driver Allocation")
        {
            column(Driver_Code;"Driver Code")
            {
            }
            column(Driver_Name;"Driver Name")
            {
            }
            column(Number_of_Days;"Number of Days")
            {
            }
            column(Date_of_Trip;"Date of Trip")
            {
            }
            column(Trip_End_Date;"Trip End Date")
            {
            }
            column(Registration_Number;"Registration Number")
            {
            }
            column(Vehicle_Description;"Vehicle Description")
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
            dataitem(Employee;Employee)
            {
                DataItemLink = "No." = field("Driver Code");
                DataItemTableView = sorting("No.");

                column(No_;"No.")
                {
                }
                column(Job_Title;"Job Title")
                {
                }
            }

            trigger OnAfterGetRecord()
            var
                Text001: Label 'The Start Date field is required.';
                Text002: Label 'The End Date field is required.';
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);

                if StartDate = 0D then
                    Error(Text001);

                if EndDate = 0D then
                    Error(Text002);

                "Vehicle Driver Allocation".SetRange("Date of Trip", StartDate, EndDate);
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
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        StartDate: Date;
        EndDate: Date;
}
