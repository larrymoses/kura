#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69012 "Loan Applications Card"
{
    Editable = true;
    SourceTable = "Loan Application";

    layout
    {
        area(content)
        {
            field("Loan No"; Rec."Loan No")
            {
                ApplicationArea = Basic;
            }
            field("Description."; Rec."Description.")
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
            field("Application Date"; Rec."Application Date")
            {
                ApplicationArea = Basic;
            }
            field("Amount Requested"; Rec."Amount Requested")
            {
                ApplicationArea = Basic;
            }
            field("Approved Amount"; Rec."Approved Amount")
            {
                ApplicationArea = Basic;
            }
            field("Loan Status"; Rec."Loan Status")
            {
                ApplicationArea = Basic;
            }
            field("Issued Date"; Rec."Issued Date")
            {
                ApplicationArea = Basic;
            }
            field(Instalment; Rec.Instalment)
            {
                ApplicationArea = Basic;
            }
            field(Repayment; Rec.Repayment)
            {
                ApplicationArea = Basic;
            }
            field("Flat Rate Principal"; Rec."Flat Rate Principal")
            {
                ApplicationArea = Basic;
            }
            field("Flat Rate Interest"; Rec."Flat Rate Interest")
            {
                ApplicationArea = Basic;
            }
            field("Interest Rate"; Rec."Interest Rate")
            {
                ApplicationArea = Basic;
            }
            field("Interest Calculation Method"; Rec."Interest Calculation Method")
            {
                ApplicationArea = Basic;
            }
            field("Payroll Group"; Rec."Payroll Group")
            {
                ApplicationArea = Basic;
            }
            field("Opening Loan"; Rec."Opening Loan")
            {
                ApplicationArea = Basic;
            }
            field("Total Repayment"; Rec."Total Repayment")
            {
                ApplicationArea = Basic;
            }
            field("Period Repayment"; Rec."Period Repayment")
            {
                ApplicationArea = Basic;
            }
            field("Interest Amount"; Rec."Interest Amount")
            {
                ApplicationArea = Basic;
            }
            field("External Document No"; Rec."External Document No")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field(Receipts; Rec.Receipts)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("HELB No."; Rec."HELB No.")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("University Name"; Rec."University Name")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Stop Loan"; Rec."Stop Loan")
            {
                ApplicationArea = Basic;
            }
            field("Refinanced From Loan:"; Rec."Refinanced From Loan:")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Create Schedule';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    LM.GenerateRepaymentSchedule(Rec);
                    Message('Created Successfully');
                end;
            }
            action("Preview Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Preview Schedule';
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Loan Repayment Schedule";
                RunPageLink = "Loan No." = field("Loan No"),
                              "Employee No." = field("Employee No");
                RunPageView = sorting("Loan No.", "Instalment No", "Employee No.")
                              order(ascending);

                trigger OnAction()
                begin
                    //   LM.GenerateRepaymentSchedule(Rec);
                end;
            }
            action("Issue Loan")
            {
                ApplicationArea = Basic;
                Caption = 'Issue Loan';
                Image = IssueFinanceCharge;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                VAR
                    LoanRepaymentSchedule: record "Loan Repayment Schedule";
                    // lanAmount: Decimal;
                    Schedule1: Record "Loan Repayment Schedule";

                begin
                    //   LM.GenerateRepaymentSchedule(Rec);


                    if Rec."Loan Status" = Rec."loan status"::Issued then
                        Error('Loan Already Issued');

                    if Rec."Issued Date" = 0D then
                        Error('You must specify the issue date before issuing the loan');

                    if Rec."Approved Amount" = 0 then
                        Error('You must specify the Approved amount before issuing the loan');



                    if Rec."Opening Loan" = false then begin
                        Schedule1.RESET;
                        Schedule1.SETRANGE("Loan No.", REC."Loan No");
                        Schedule1.SETRANGE(Schedule1."Employee No.", REC."Employee No");
                        IF NOT Schedule1.FINDSET THEN
                            ERROR('No schedule created yet');
                        if Schedule1.FindSet then
                            lanAmount := Schedule1."Monthly Repayment";
                        Emp.Get(Rec."Employee No");
                        Schedule1.RESET;
                        Schedule1.SETRANGE("Loan No.", REC."Loan No");
                        Schedule1.SETRANGE(Schedule1."Employee No.", REC."Employee No");
                        IF NOT Schedule1.FINDSET THEN
                            if Schedule1.FindSet then
                                lanAmount := Schedule1."Monthly Repayment";
                        AssMatrix.Init;
                        AssMatrix."Employee No" := Rec."Employee No";
                        AssMatrix.Type := AssMatrix.Type::Deduction;
                        AssMatrix."Reference No" := Rec."Loan No";
                        Rec.CalcFields("Deduction Code");
                        if Rec."Deduction Code" = '' then
                            Error('Loan %1 must be associated with a deduction', Rec."Loan Product Type")
                        else
                            AssMatrix.Code := Rec."Deduction Code";
                        AssMatrix."Payroll Period" := Rec."Issued Date";

                        AssMatrix.Description := Rec.Description;
                        AssMatrix."Payroll Group" := Emp."Posting Group";
                        AssMatrix."Department Code" := Emp."Global Dimension 1 Code";
                        LoanRepaymentSchedule.Get(Rec."Employee No");
                        LoanRepaymentSchedule.SetRange(LoanRepaymentSchedule."Repayment Date", rec."Issued Date");
                        if LoanRepaymentSchedule.FindSet then
                            AssMatrix.Amount := lanAmount;
                        //  Message('%1', IanAmount);
                        //CC  AssMatrix.Amount := Rec.Repayment;
                        AssMatrix."Next Period Entry" := true;
                        AssMatrix.Validate(AssMatrix.Amount);
                        AssMatrix.Insert;

                        Rec."Loan Status" := Rec."loan status"::Issued;
                        Rec.Modify;
                        Message('Loan Issued');
                    end else begin

                        Emp.Get(Rec."Employee No");
                        AssMatrix.Init;
                        AssMatrix."Employee No" := Rec."Employee No";
                        AssMatrix.Type := AssMatrix.Type::Deduction;
                        Rec.CalcFields("Deduction Code");
                        AssMatrix.Code := Rec."Deduction Code";
                        AssMatrix."Payroll Period" := Rec."Issued Date";
                        AssMatrix."Reference No" := Rec."Loan No";
                        AssMatrix.Description := Rec.Description;
                        AssMatrix."Payroll Group" := Emp."Posting Group";
                        AssMatrix."Department Code" := Emp."Global Dimension 1 Code";
                        AssMatrix.Amount := Rec.Repayment;
                        AssMatrix.Validate(AssMatrix.Amount);
                        AssMatrix."Next Period Entry" := true;
                        AssMatrix.Insert;

                        Rec."Loan Status" := Rec."loan status"::Issued;
                        Rec.Modify;
                        Message('Loan Issued');

                    end;

                end;
            }
            action("Delete Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Delete Schedule';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // LM.GenerateRepaymentSchedule(Rec);
                    LM.DeleteRepaymentSchedule(Rec);
                end;
            }
        }
    }

    var
        LoanProduct: Record "Loan Product Type";
        EmpRec: Record Employee;
        PreviewShedule: Record "Repayment Schedule";
        RunningDate: Date;
        AssMatrix: Record "Assignment Matrix-X";
        Schedule: Record "Repayment Schedule";
        Emp: Record Employee;
        LM: Codeunit LoansManagement;
        GroupCode: Code[20];
        CUser: Code[20];
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        EmpRec2: Record Employee;
        lanAmount: Decimal;
}

#pragma implicitwith restore

