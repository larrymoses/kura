#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69013 "Loan Applications"
{
    ApplicationArea = Basic;
    CardPageID = "Loan Applications Card";
    Editable = false;
    PageType = List;
    SourceTable = "Loan Application";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No"; Rec."Loan No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name."; Rec."Employee Name.")
                {
                    ApplicationArea = Basic;
                }
                field("Description."; Rec."Description.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Loan Product Type"; Rec."Loan Product Type")
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
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000043; Notes)
            {
            }
            systempart(Control1000000044; Links)
            {
            }
            systempart(Control1000000045; MyNotes)
            {
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
                var
                    LoanRepaymentSchedule: record "Loan Repayment Schedule";
                    //   lanAmount: Decimal;
                    schedule1: Record "Loan Repayment Schedule";

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
                        IF NOT Schedule1.FIND('-') THEN
                            ERROR('No schedule created yet');
                        if Schedule1.FindSet then
                            lanAmount := Schedule1."Monthly Repayment";
                        Emp.Get(Rec."Employee No");
                        Schedule1.RESET;
                        Schedule1.SETRANGE("Loan No.", REC."Loan No");
                        Schedule1.SETRANGE(Schedule1."Employee No.", REC."Employee No");
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
        lanAmount: Decimal;
        EmpRec2: Record Employee;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            PayPeriodtext := PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
    end;
}

#pragma implicitwith restore

