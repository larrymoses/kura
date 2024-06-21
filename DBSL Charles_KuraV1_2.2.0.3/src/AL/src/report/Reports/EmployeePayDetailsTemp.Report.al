#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 89039 "Employee Pay Details Temp"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Pay Details Temp.rdlc';

    dataset
    {
        dataitem("Temporary Employee";"Temporary Employee")
        {
            CalcFields = "Total Allowances","Total Deductions","Bank Name","Bank Branch Name";
            RequestFilterFields = "No.","Pay Period Filter",Status,"Posting Group";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee;"Temporary Employee"."No.")
            {
            }
            column(Name_Employee;"Temporary Employee"."First Name"+' '+"Temporary Employee"."Middle Name"+' '+"Temporary Employee"."Last Name")
            {
            }
            column(EmployeesBank_Employee;"Temporary Employee"."Employee's Bank")
            {
            }
            column(BankBranch_Employee;"Temporary Employee"."Bank Branch")
            {
            }
            column(BankName_Employee;"Temporary Employee"."Bank Name")
            {
            }
            column(BankBranchName_Employee;"Temporary Employee"."Bank Branch Name")
            {
            }
            column(BankAccountNumber_Employee;"Temporary Employee"."Bank Account Number")
            {
            }
            column(NetPay;Abs("Temporary Employee"."Total Allowances")-Abs("Temporary Employee"."Total Deductions"+"Temporary Employee".interest))
            {
            }
            column(CompanyInfoName;CompInfo.Name)
            {
            }
            column(CompanyInfoPicture;CompInfo.Picture)
            {
            }
            column(DateSpecified;DateSpecified)
            {
            }
            column(PreparedBy;Approver[1])
            {
            }
            column(DatePrepared;ApproverDate[1])
            {
            }
            column(PreparedBy_Signature;UserSetup1.Picture)
            {
            }
            column(CheckedBy;Approver[2])
            {
            }
            column(DateChecked;ApproverDate[2])
            {
            }
            column(CheckedBy_Signature;UserSetup2.Picture)
            {
            }
            column(AuthorizedBy;Approver[3])
            {
            }
            column(DateAuthorized;ApproverDate[3])
            {
            }
            column(AuthorizedBy_Signature;UserSetup2.Picture)
            {
            }
            column(AuditedBy;Approver[4])
            {
            }
            column(DateAudited;ApproverDate[4])
            {
            }
            column(AuditedBy_Signature;UserSetup3.Picture)
            {
            }
            column(ApprovedBy;Approver[5])
            {
            }
            column(DateApproved;ApproverDate[5])
            {
            }
            column(ApprovedBy_Signature;UserSetup4.Picture)
            {
            }
            column(interest_Employee;"Temporary Employee".interest)
            {
            }
            column(counter;Counter)
            {
            }

            trigger OnAfterGetRecord()
            var
                Int: Integer;
            begin
                CalcFields("Total Allowances","Total Deductions",interest);
                // IF ABS("Total Allowances")-ABS("Total Deductions"+interest)=0 THEN
                //  CurrReport.SKIP;

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID",69000);
                ApprovalEntries.SetRange("Document No.",Format(DateSpecified));
                ApprovalEntries.SetRange(Status,ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                   i:=0;
                 repeat
                 i:=i+1;
                if i=1 then begin
                Approver[1]:=ApprovalEntries."Sender ID";
                ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                 if UserSetup.Get(Approver[1]) then
                    UserSetup.CalcFields(Picture);

                Approver[2]:=ApprovalEntries."Approver ID";
                ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup1.Get(Approver[2]) then
                    UserSetup1.CalcFields(Picture);
                end;
                if i=2 then
                begin
                Approver[3]:=ApprovalEntries."Approver ID";
                ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup2.Get(Approver[3]) then
                    UserSetup2.CalcFields(Picture);
                end;
                if i=3 then
                begin
                Approver[4]:=ApprovalEntries."Approver ID";
                ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup3.Get(Approver[4]) then
                    UserSetup3.CalcFields(Picture);
                end;
                if i=4 then
                begin
                Approver[5]:=ApprovalEntries."Approver ID";
                ApproverDate[5]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup4.Get(Approver[5]) then
                    UserSetup4.CalcFields(Picture);
                end;
                until
                ApprovalEntries.Next=0;

                end;

                Counter:=Counter+1;
                if Counter>1 then
                  Clear(CompInfo.Picture);
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
        ReportName = 'STAFF SALARY PAY DETAIL';
    }

    trigger OnInitReport()
    var
        Int: Integer;
    begin
    end;

    trigger OnPreReport()
    begin
        DateSpecified:="Temporary Employee".GetRangeMin("Pay Period Filter");
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
        Counter:=0;
    end;

    var
        CompInfo: Record "Company Information";
        DateSpecified: Date;
        Counter: Integer;
        ApprovalEntries: Record "Approval Entry";
        Approver: array [10] of Code[20];
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        UserSetup4: Record "User Setup";
}

