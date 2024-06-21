#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69234 "Posted Leave Applications.."
{
    ApplicationArea = Basic;
    CardPageID = "Posted Leave Application";
    PageType = List;
    SourceTable = "HR Leave Applications";
    SourceTableView = where(Posted = const(true), Status = filter('Released'));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action("&Post Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = '&Post Leave Application';
                    Image = Post;

                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::Released);
                        HRLeaveApp.SetRange(HRLeaveApp.Posted, true);
                        if HRLeaveApp.Find('-') then begin
                            ProgressWindow.Open('Processing Leave number #1#######');
                            repeat
                                Sleep(100);
                                ProgressWindow.Update(1, HRLeaveApp."Application Code");
                                dTaken := 0;
                                if HREmp.Get(HRLeaveApp."Employee No") then begin
                                    HREmp.CalcFields(HREmp."Total Leave Taken");
                                    dTaken := HREmp."Total Leave Taken";
                                end;
                                CummDays := Rec."Days Applied" + Abs(dTaken);
                                PayrollPeriod.Reset;
                                PayrollPeriod.SetRange(PayrollPeriod.Closed, false);
                                if PayrollPeriod.FindFirst then
                                    NextPayDate := PayrollPeriod."Starting Date";
                                if Rec."Leave Type" = 'ANNUAL' then begin
                                    HRSetup.Get();
                                    HRSetup.TestField("Leave Allowance Threshold");
                                    AssignMatrixX.Reset;
                                    AssignMatrixX.SetRange(AssignMatrixX."Employee No", HRLeaveApp."Employee No");
                                    AssignMatrixX.SetRange(AssignMatrixX.Code, HRSetup."Leave Allowance Code");
                                    AssignMatrixX.SetRange(AssignMatrixX."Payroll Period", HRSetup."Leave Posting Period[FROM]", HRSetup."Leave Posting Period[TO]");
                                    if not AssignMatrixX.FindSet then begin
                                        if CummDays >= HRSetup."Leave Allowance Threshold" then begin
                                            AssignmentMatrixX.Init;
                                            AssignmentMatrixX.Code := HRSetup."Leave Allowance Code";
                                            AssignmentMatrixX."Employee No" := HRLeaveApp."Employee No";
                                            AssignmentMatrixX.Validate(AssignmentMatrixX.Code);
                                            AssignmentMatrixX.Frequency := AssignmentMatrixX.Frequency::"Non-recurring";
                                            AssignmentMatrixX."Payroll Period" := NextPayDate;//CALCDATE('<CM+1D>', TODAY);
                                            if AssignmentMatrixX.Insert(true) then
                                                i := i + 1;
                                        end;
                                    end;
                                end;
                            until HRLeaveApp.Next = 0;

                            ProgressWindow.Close;
                            Message('%1 Added', i);
                        end;
                    end;
                }
            }
        }
    }

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        HREmp: Record Employee;
        EmpJobDesc: Text[50];
        HRJobs: Record "ManPower Planning Lines";
        SupervisorName: Text[60];
        SMTP: Codeunit Mail;
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "Human Resources Setup";
        EmpDept: Text[30];
        //   ApprovalMgt: Codeunit "Approvals Mgmt.";
        HRLeaveApp: Record "HR Leave Applications";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer"," ";
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Application CodeEditable": Boolean;
        [InDataSet]
        "Leave TypeEditable": Boolean;
        [InDataSet]
        "Days AppliedEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Start DateEditable": Boolean;
        [InDataSet]
        "Leave Allowance AmountEditable": Boolean;
        [InDataSet]
        RelieverEditable: Boolean;
        [InDataSet]
        RequestLeaveAllowanceEditable: Boolean;
        [InDataSet]
        SupervisorEditable: Boolean;
        [InDataSet]
        "Cell Phone NumberEditable": Boolean;
        [InDataSet]
        "Details of ExaminationEditable": Boolean;
        [InDataSet]
        "Date of ExamEditable": Boolean;
        [InDataSet]
        NumberofPreviousAttemptsEditab: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "Base Calendar";
        HREmailParameters: Record "Hr E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Template";
        ApprovedDaysEditable: Boolean;
        CummDays: Integer;
        dTaken1: Decimal;
        AssignmentMatrixX: Record "Assignment Matrix-X";
        EarnX: Record EarningsX;
        AssignMatrixX: Record "Assignment Matrix-X";
        HRLeaveApp1: Record "HR Leave Applications";
        Emp1: Record Employee;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        PayrollPeriod: Record "Payroll PeriodX";
        NextPayDate: Date;
        LeaveApplicationX: Record "HR Leave Applications";
        ProgressWindow: Dialog;
        i: Integer;
}

#pragma implicitwith restore

