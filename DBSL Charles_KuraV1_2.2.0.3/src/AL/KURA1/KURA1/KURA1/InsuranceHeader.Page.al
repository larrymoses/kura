#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69827 "Insurance Header"
{
    PageType = Card;
    SourceTable = "Insurance Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID No."; "ID No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("KRA PIN No."; "KRA PIN No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Sum Assuared"; "Sum Assuared")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Monthly Premium"; "Monthly Premium")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Number"; "Policy Number")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part("Insurance Lines"; "Insurance Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Beneficiaries)
            {
                ApplicationArea = Basic;
                Image = List;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Insurance Beneficiaries";
                RunPageLink = "Document No" = field("Document No.");
                Visible = false;
            }
            separator(Action19)
            {
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rfpevalrec: Record "RFQ Evaluation Lists";
                    filesrec2: Record "Document Attachment";
                    docrec: Record "Document Attachment";
                begin
                    TestField(Status, Status::Open);//status must be open.
                                                    // if ApprovalsMgmt.CheckInsuranceApprovalsWorkflowEnabled(Rec) then
                                                    //  ApprovalsMgmt.OnSendInsuranceForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField(Status, Status::"Pending Approval");//status must be PENDING.
                                                                  //  ApprovalsMgmt.OnCancelInsuranceApprovalRequest(Rec);
                end;
            }
            separator(Action23)
            {
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    // SETRANGE("No.","No.");
                    // REPORT.RUN(50097,TRUE,TRUE,Rec)
                end;
            }
            separator(Action25)
            {
            }
            action("Post Insurance Policy")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    DeducePayPeriod;
                    CreateNewEntries(PayperiodStart);
                end;
            }
        }
    }

    var
        //PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        users: Record "User Setup";
        UserSetup: Record "User Setup";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        DMSManagement: Codeunit "DMS Management";
        INLines: Record "Insurance Lines";
        Proceed: Boolean;
        CurrentPeriodEnd: Date;
        DaysAdded: Code[10];
        PayPeriod: Record "Payroll PeriodX";
        StartingDate: Date;
        PayperiodStart: Date;
        LoansUpdate: Boolean;
        PayHistory: Record "Employee Ledger EntryX";
        EmpRec: Record Employee;
        TaxableAmount: Decimal;
        RightBracket: Boolean;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        NetPay: Decimal;
        Loan: Record "Loans transactionsX";
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        relief: Decimal;
        Outstanding: Decimal;
        CreateRec: Boolean;
        benefits: Record EarningsX;
        deductions: Record DeductionsX;
        InterestDiff: Decimal;
        Rounding: Boolean;
        PD: Record "Assignment Matrix-X";
        Pay: Record EarningsX;
        Ded: Record DeductionsX;
        TaxCode: Code[10];
        CfAmount: Decimal;
        TempAmount: Decimal;
        EmpRec1: Record Employee;
        Emprec2: Record Employee;
        NewPeriod: Date;
        AssMatrix: Record "Assignment Matrix-X";
        PayrollRun: Report "Payroll Run";
        Schedule: Record "Repayment Schedule";
        Window: Dialog;
        EmployeeName: Text[200];
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        LoanApplicationForm: Record "Loan Application";
        Discontinue: Boolean;
        INHead: Record "Insurance Header";


    procedure GetCurrentPeriod(var Payperiod: Record "Payroll PeriodX")
    begin
        CurrentPeriodEnd := Payperiod."Starting Date";
        StartingDate := CurrentPeriodEnd;
        CurrentPeriodEnd := CalcDate('1M', CurrentPeriodEnd - 1);
    end;


    procedure DeducePayPeriod()
    var
        PayPeriodRec: Record "Payroll PeriodX";
    begin
        PayPeriodRec.Reset;
        EmployeeName := "Employee Name";
        PayPeriodRec.SetRange(PayPeriodRec."Close Pay", false);
        if PayPeriodRec.FindFirst then
            PayperiodStart := PayPeriodRec."Starting Date";
        //MESSAGE('%1',PayperiodStart);
    end;


    procedure ClosePeriodTrans()
    var
        EarnDeduct: Record "Assignment Matrix-X";
    begin
        EarnDeduct.Reset;
        EarnDeduct.SetRange(EarnDeduct."Payroll Period", PayperiodStart);
        if EarnDeduct.Find('-') then
            repeat
                EarnDeduct.Closed := true;
                EarnDeduct."Payroll Period" := PayperiodStart;
                EarnDeduct.Modify;
            until EarnDeduct.Next = 0;
    end;


    procedure CreateNewEntries(var CurrPeriodStat: Date)
    var
        PaymentDed: Record "Assignment Matrix-X";
        AssignMatrix: Record "Assignment Matrix-X";
    begin
        NewPeriod := CalcDate('1M', PayperiodStart);
        Window.Open('Creating Insurance Policy entries ##############################1', EmployeeName);

        INLines.Reset;
        INLines.SetRange("Document No.", INLines."Document No.");
        if INLines.FindSet then begin

            //MESSAGE('%1',PayperiodStart);

            PaymentDed.Reset;
            PaymentDed.SetRange(PaymentDed."Payroll Period", PayperiodStart);
            // PaymentDed.SETRANGE(PaymentDed."Next Period Entry",TRUE);
            PaymentDed.SetRange("Employee No", PaymentDed."Employee No");
            if PaymentDed.Find('-') then begin
                repeat
                    CreateRec := true;
                    AssignMatrix.Init;
                    AssignMatrix."Employee No" := INHead."Employee No.";
                    AssignMatrix.Type := PaymentDed.Type::Deduction;
                    AssignMatrix.Code := deductions.Code;
                    AssignMatrix."Payroll Period" := CalcDate('1M', PayperiodStart);
                    AssignMatrix.Amount := INLines."Monthly Deduction";
                    AssignMatrix.Description := INLines."Insurance Name";
                    AssignMatrix.Taxable := false;
                    AssignMatrix."Is Insuarance?" := true;
                    AssignMatrix."Pay Period" := Format(NewPeriod);
                    AssignMatrix."Non-Cash Benefit" := true;
                    AssignMatrix.Insert(true);
                    AssignMatrix.Modify(true);
                    Message('This is the monthly Deduction %1', INLines."Monthly Deduction");

                //       IF EmpRec.GET(PaymentDed."Employee No") THEN BEGIN
                //       Window.UPDATE(1,EmpRec."First Name"+' '+EmpRec."Middle Name"+ ' '+EmpRec."Last Name");
                //
                //           IF (EmpRec.Status=EmpRec.Status::Active) AND (CreateRec=TRUE) THEN BEGIN
                //              IF NOT AssignMatrix.INSERT(TRUE) THEN
                //           AssignMatrix.MODIFY(TRUE);
                //           END;
                //           END;
                until PaymentDed.Next = 0;
            end;

            Message('Posted Sucessfully');
        end;
    end;
}

