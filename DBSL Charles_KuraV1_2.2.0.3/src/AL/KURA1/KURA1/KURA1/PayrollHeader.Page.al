#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69029 "Payroll Header"
{
    PageType = Card;
    SourceTable = "Payroll Header";
    caption = 'Salary Vouchers';
    SourceTableView = where(Posted = const(false));
   
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release,Navigate';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
            part("Payroll Lines"; "Payroll Lines")
            {
                SubPageLink = "Payroll Header" = field("No.");
                visible = true;
            }

        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup16)
            {
                action("Insert SV Lines")
                {
                    ApplicationArea = Basic;
                    Image = Recalculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction()
                    var
                        emp: Record Employee;
                    begin
                        //CurrPage.SETSELECTIONFILTER(FORMAT("Payroll Period"));
                        //REPORT.RUNMODAL(69004,TRUE,FALSE,REC);

                        /*
                        emp.SETFILTER(emp."Pay Period Filter",FORMAT("Payroll Period"));
                        REPORT.RUN(69004,TRUE,TRUE,emp);
                        */
                        PayrollHeaderT.SetRange(PayrollHeaderT."No.", Rec."No.");
                        Report.Run(Report::"Import payroll details", true, true, PayrollHeaderT);


                        /*
                        Assignmat.RESET;
                        Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Payment);
                        Assignmat.SETRANGE(Assignmat."Payroll Period","Payroll Period");
                        IF Assignmat.FIND('-') THEN BEGIN
                         REPEAT
                           LineNo:=LineNo+1000;
                           PayrollLines."Line No":=LineNo;
                           PayrollLines."Payroll Header":="No.";
                           PayrollLines."Payroll Group":=Assignmat."Posting Group Filter";
                           PayrollLines."Annuitant Name":=Assignmat."First Name"+' '+Assignmat."Last Name"+' '+Assignmat."Middle Name";
                           //PayrollLines."Basic Arrears":=Assignmat."Basic Pay Arrears";
                           PayrollLines."Basic Pension":=Assignmat."Basic Pay";
                           PayrollLines."Gross Pay":=Assignmat.Amount;
                           PayrollLines.Netpay:=Assignmat.Amount;
                           PayrollLines.Wtax:=Assignmat.Amount;
                           PayrollLines."Annuitant No":=Assignmat."Employee No";
                           PayrollLines."Payroll Period":="Payroll Period";
                           PayrollLines.INSERT;
                         UNTIL Assignmat.NEXT=0;
                        END;
                        */

                    end;
                }
                // action("Master Roll")
                // {
                //     ApplicationArea = Basic;
                //     Image = "Report";
                //     Promoted = true;
                //     PromotedCategory = "Report";
                //     PromotedIsBig = true;
                //     Visible = false;

                //     trigger OnAction()
                //     begin
                //         emp.SetFilter(emp."Pay Period Filter",Format("Payroll Period"));
                //         Report.Run(69032,true,true,emp)
                //     end;
                // }
                action("Post Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Payroll';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        // IF Status<>Status::Approved THEN
                        //   ERROR('Payroll Must be fully approved first before Posting');

                        PayPeriod.SetFilter(PayPeriod."Starting Date", Format(Rec."Payroll Period"));
                        Report.Run(69059, true, true, PayPeriod);

                        DocNumber := 'PAYROLL' + Format(Date2dmy(Rec."Payroll Period", 2)) + Format(Date2dmy(Rec."Payroll Period", 3));
                        GLEntry.Reset;
                        GLEntry.SetRange(GLEntry."Document No.", DocNumber);
                        GLEntry.SetRange(GLEntry.Reversed, false);
                        if GLEntry.FindFirst then begin
                            Rec.Posted := true;
                            Rec."Posted By" := UserId;
                            Rec."Date Created" := Today;
                            Rec."Time Posted" := Time;
                            Rec.Modify;


                        end;
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
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
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(69001, true, true, Rec)
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        //cc//18072023
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                separator(Action29)
                {
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // ApprovalEntries.SetRecordFilters(Database::"Payroll Header"."No.","No.");
                        //ApprovalEntries.Run;
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //OpenDoc.ReopenPayroll(Rec)
                    end;
                }
            }
            group(ActionGroup26)
            {
                action("&Navigate")
                {
                    ApplicationArea = Basic;
                    Caption = '&Navigate';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    Scope = Repeater;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Navigate.SetDoc(Rec."Payroll Period", Rec."No.");
                        Navigate.Run;
                    end;
                }
                action("General Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "General Ledger Entries";
                    RunPageLink = "Document No." = field("No."),
                                  "Posting Date" = field("Payroll Period");
                    Visible = false;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    //  RunObject = Page "Default Dimensions";
                    //   RunPageLink = "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                }
            }
            group("Payroll Reconcilliation Reports")
            {
                Caption = 'Payroll Reconcilliation Reports';
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Zero Earnings Report";
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Zero Deductions Report";
                }
                action("Employees Joining Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Joining Payroll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Employees Joining Payroll";
                }
                action("Employees Leaving Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Leaving Payroll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Employees Leaving Payroll";
                }
                action("Payroll Cost Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = ' Payroll Cost Analysis';
                    Image = "Report";
                    // RunObject = Report "Payroll Cost Analysis";

                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69055, true, true, emp)
                    end;
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Employee Master Roll";
                }
                action("Payroll Reconciliation Earning Detailed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Earning Detailed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Payroll Reconciliation Earnin";
                }
                action("<Report Payroll Reconciliation D")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Deduction Detailed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Payroll Reconciliation Deduc.";
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Payroll Recon Summary KeRRA";
                }
                action(" Child Support Schedule Report")
                {
                    ApplicationArea = Basic;
                    Caption = ' Child Support Schedule Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Child Support Schedule";
                }
                action("Pension Contribution Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Contribution Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Pension Contribution Report";
                }
                action(" Monthly PAYE Report")
                {
                    ApplicationArea = Basic;
                    Caption = ' Monthly PAYE Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Monthly PAYE Export";
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payroll Type" := Rec."payroll type"::Normal;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    var
        emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        PayrollLines: Record "Payroll Pay Mode";
        LineNo: Integer;
        [InDataSet]
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Navigate: Page Navigate;
        Post: Boolean;
        GenLedgerSetup: Record "General Ledger Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Sclaims,"Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition";
        PayPeriod: Record "Payroll PeriodX";
        DocNumber: Text;
        GLEntry: Record "G/L Entry";
        PayrollHeaderT: Record "Payroll Header";
}

#pragma implicitwith restore

