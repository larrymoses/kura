/// <summary>
/// Report Staff Exits (ID 50020).
/// </summary>
report 50020 "Staff Exits"
{
    // ApplicationArea = BasicHR;
    Caption = 'Staff Exits';
    // UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Exits.rdl';

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Staff Exit Code";
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
            column(Gender; Gender)
            {
            }
            column(DateOfBirth; "Date Of Birth")
            {
            }
            column(DateOfJoin; "Date Of Join")
            {
            }
            column(DateOfLeaving; "Date Of Leaving")
            {
            }
            column(StaffExitCode; "Staff Exit Code")
            {
            }
            column(StaffExitDescription; "Staff Exit Description")
            {
            }
            column(AllowReEmploymentInFuture; "Allow Re-Employment In Future")
            {
            }
            column(EmployeeCategory; "Employee Category")
            {
            }
            column(Age; Age)
            {
            }
            column(NationalID; "National ID")
            {
            }
            column(PINNumber; "PIN Number")
            {
            }
            column(SocialSecurityNo; "Social Security No.")
            {
            }
            column(Balance; Balance)
            {
            }
            column(NHIFNo; "NHIF No.")
            {
            }
            column(LeaveBalance; "Leave Balance")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(CompanyEMail; "Company E-Mail")
            {
            }
            column(EMail; "E-Mail")
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
}
