#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69151 "Payroll Header Temp"
{
    PageType = Card;
    SourceTable = "Payroll HeaderT";
    SourceTableView = where("Account Type" = const(Casuals),
                            Status = filter(<> Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payroll Period"; "Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Pay"; "Gross Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Net Pay"; "Net Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; "Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Created"; "Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Created"; "Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Time Posted"; "Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field(Description; Description)
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
            group(ActionGroup16)
            {
                action("Insert SV Lines")
                {
                    ApplicationArea = Basic;
                    Image = Recalculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        emp: Record Employee;
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        //REPORT.RUN(69400,TRUE,TRUE,EmpT);

                        PayrollHeaderT.SetRange(PayrollHeaderT."No.", "No.");
                        Report.Run(69406, true, true, PayrollHeaderT)
                    end;
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        Report.Run(69402, true, true, EmpT)
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        SetRange("No.", "No.");
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
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //MESSAGE('%1',ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec));
                        // if ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec) then
                        //   ApprovalsMgmt.OnSendTSalaryForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        // ApprovalsMgmt.OnCancelTSalaryApprovalRequest(Rec);
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
                    PromotedCategory = Process;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //  ApprovalEntries.Setfilters(DATABASE::"Payroll HeaderT",19,"No.");
                        //  ApprovalEntries.RUN;

                        // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Image = Check;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //OpenDoc.ReopenPayroll(Rec)
                        Status := Status::Released;
                        Modify;
                        CurrPage.Close;
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
                        Navigate.SetDoc("Payroll Period", "No.");
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
                    // RunObject = Page "Default Dimensions";
                    //  RunPageLink = "No." = field("No.");
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
                action("Master Roll Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Master Roll Report Temporary E";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Payroll Reconciliation SummarT";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Payroll Reconciliation Detailed")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Payroll Reconciliation DetailT";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Monthly PAYE Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Monthly PAYE Report Export";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("NHIF Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'NHIF Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "NHIF T";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("NSSF Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "NSSF Report T";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format("Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Status = Status::Released then
            CurrPage.Editable := false;
        "Account Type" := "account type"::Casuals;
    end;

    trigger OnAfterGetRecord()
    begin
        if Status = Status::Released then
            CurrPage.Editable := false;
        "Account Type" := "account type"::Casuals;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Account Type" := "account type"::Casuals;
        "Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnOpenPage()
    begin
        if Status = Status::Released then
            CurrPage.Editable := false;
        "Account Type" := "account type"::Casuals;
        UserSetup.Get(UserId);
        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
    end;

    var
        emp: Record "Temporary Employee";
        Assignmat: Record "Assignment Matrix-X Temp-E";
        PayrollLines: Record "Payroll Pay Mode";
        LineNo: Integer;
        [InDataSet]
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Navigate: Page Navigate;
        Post: Boolean;
        GenLedgerSetup: Record "General Ledger Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Sclaims,"Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition";
        PayPeriod: Record "Payroll PeriodXT";
        DocNumber: Text;
        GLEntry: Record "G/L Entry";
        EmpT: Record "Temporary Employee";
        PayrollHeaderT: Record "Payroll HeaderT";
        UserSetup: Record "User Setup";
}

