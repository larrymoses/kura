#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69142 "HR Leave Allowance Status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Allowance Status.rdlc';
    Caption = 'Leave Allowance Payment  Status';

    dataset
    {
        dataitem("HR Employees";Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No;"HR Employees"."No.")
            {
            }
            column(FullName;"HR Employees"."Last Name" + '  '+ "HR Employees"."Middle Name")
            {
            }
            column(DepartmentName;"HR Employees"."Department Name")
            {
            }
            column(LeaveDaysBF;"HR Employees"."Reimbursed Leave Days")
            {
            }
            column(LeaveDaysEarned;"HR Employees"."Allocated Leave Days")
            {
            }
            column(LeaveDaysApplied;"HR Employees"."Total Leave Taken")
            {
            }
            column(LeaveBalance;"HR Employees"."Leave Outstanding Bal")
            {
            }
            column(Picture;CI.Picture)
            {
            }
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(UserID;UserId)
            {
            }
            column(PaidStatus;PaidStatus)
            {
            }
            column(PCode;PCode)
            {
            }
            column(Amount;Amount)
            {
            }
            column(PayPeriod;PayPeriod)
            {
            }

            trigger OnAfterGetRecord()
            begin
                AsRec.Reset;
                AsRec.SetRange("Employee No","HR Employees"."No.");
                AsRec.SetRange(Code,LeaveCode);
                if AsRec.Find('-') then begin
                  PayPeriod := AsRec."Payroll Period";
                  PCode := AsRec.Code;
                  Amount := AsRec.Amount;
                  if AsRec.Closed = true then
                    PaidStatus := Paidstatus::Paid
                  else if AsRec.Closed = false then
                    PaidStatus := Paidstatus::"Not Paid";
                end else begin
                  PayPeriod := 0D;
                  PCode := LeaveCode;
                  Amount := 0;
                  PaidStatus := Paidstatus::"Not Earned";
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

    trigger OnPreReport()
    begin
                         CI.Get();
                         CI.CalcFields(CI.Picture);
        HRSetup.Get;
        LeaveCode := HRSetup."Leave Allowance Code";
    end;

    var
        CI: Record "Company Information";
        HRSetup: Record "Human Resources Setup";
        PaidStatus: Option Paid,"Not Paid","Not Earned";
        PCode: Code[10];
        Amount: Decimal;
        PayPeriod: Date;
        AsRec: Record "Assignment Matrix-X";
        LeaveCode: Code[10];
}

