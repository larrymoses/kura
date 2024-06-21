/// <summary>
/// Report Certificate of Service (ID 50019).
/// </summary>
report 50019 "Certificate of Service"
{
    ApplicationArea = All;
    Caption = 'Certificate of Service';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Certificate of Service.rdl';

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Staff Exit Code", "No.";
            DataItemTableView = where(Status = filter(Inactive | Terminated));
            column(No; "No.")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(MiddleName; "Middle Name")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(Names; Names)
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(RegionName; "Region Name")
            {
            }
            column(Workstation; Workstation)
            {
            }
            column(DateOfJoin; "Date Of Join")
            {
            }
            column(DateOfLeaving; "Date Of Leaving")
            {
            }
            column(Start_Position;Position)
            {
            }
            column(End_Position;Position1)
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
            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
                Names := Employee.FullName();

                EmployeeHistory.Reset();
                EmployeeHistory.SetRange("Employee No.", Employee."No.");
                EmployeeHistory.SetRange("Current Organization", true);
                if EmployeeHistory.FindFirst then
                    Positions.Reset();
                    Positions.SetRange("Position ID", EmployeeHistory."Job Position");
                    if Positions.Find('-') then
                        Position := Positions."Job Title";
                
                EmployeeHistory1.Reset();
                EmployeeHistory1.SetRange("Employee No.", Employee."No.");
                EmployeeHistory1.SetRange("Current Organization", true);
                if EmployeeHistory1.FindLast then
                    Positions1.Reset();
                    Positions1.SetRange("Position ID", EmployeeHistory1."Job Position");
                    if Positions1.Find('-') then
                        Position1 := Positions1."Job Title";

                DimensionVal.Reset();
                DimensionVal.SetRange(Code, "Global Dimension 1 Code");
                if DimensionVal.Find('-') then
                    Employee."Region Name" := DimensionVal.Name;
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
    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        Names: Text[100];
        EmployeeHistory: Record "Employment History";
        EmployeeHistory1: Record "Employment History";
        Positions: Record Positions;
        Positions1: Record Positions;
        Position: Text[100];
        Position1: Text[100];
        DimensionVal: Record "Dimension Value";
}
