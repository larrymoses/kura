#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69141 "HR Leave Balance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Balance.rdlc';
    Caption = 'Leave Balances';

    dataset
    {
        dataitem("HR Employees"; Employee)
        {
            DataItemTableView = where(Status = filter('Active'));
            RequestFilterFields = "No.", "Leave Type Filter", "Leave Period Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No; "HR Employees"."No.")
            {
            }
            column(FullName; "HR Employees"."First Name" + ' ' + "HR Employees"."Last Name" + '  ' + "HR Employees"."Middle Name")
            {
            }
            column(Region_Name; "Region Name") { }
            column(DepartmentName; "HR Employees"."Department Name")
            {
            }
            column(LeaveDaysBF; "HR Employees"."Reimbursed Leave Days")
            {
            }
            column(LeaveDaysEarned; "HR Employees"."Allocated Leave Days")
            {
            }
            column(LeaveTotal;LeaveTotal)
            {
            }
            column(LeaveDaysApplied; "HR Employees"."Total Leave Taken")
            {
            }
            column(LeaveBalance; "HR Employees"."Leave Outstanding Bal")
            {
            }
            column(LeaveTypeFilter_HREmployees; "HR Employees"."Leave Type Filter")
            {
            }
            column(RecalledLeave_HREmployees; "HR Employees"."Recalled Leave")
            {
            }
            column(RegionCode; "HR Employees"."Global Dimension 1 Code")
            {
            }
            column(Picture; CI.Picture)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(UserID; UserId)
            {
            }
            column(regionname; regionname) { }

            trigger OnAfterGetRecord()
            var

            begin
                Responsibility.Reset();
                Responsibility.SetRange(Responsibility.Code, "Global Dimension 1 Code");
                if Responsibility.FindSet() then
                    regionname := Responsibility.Name;

                LeaveTotal := "HR Employees"."Reimbursed Leave Days" + "HR Employees"."Allocated Leave Days";
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

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        regionname: text[100];
        Responsibility: Record "Responsibility Center";
        LeaveTotal: Decimal;
}

