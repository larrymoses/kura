
page 99527 "Salary Voucher Temp"
{
    Caption = 'Salary Voucher Temp';
    PageType = Card;
    SourceTable = "Payroll HeaderT";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release,Navigate,Voucher';
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
                    Visible = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;

                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Payroll Lines Temp"; "Payroll Lines Temp")
            {
                SubPageLink ="Payroll Header"=field("No.");
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(Processing)
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
                    PayrollHeaderT.Reset();
                    PayrollHeaderT.SetRange(PayrollHeaderT."No.", Rec."No.");
                    PayrollHeaderT.SetRange("Payroll Period", Rec."Payroll Period");
                    Report.Run(Report::"Import payroll details Temp", true, true, PayrollHeaderT);

                end;
            }
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
                    Rec.TestField("Global Dimension 1 Code");
                    Rec.TestField(Description);
                    VarVariant := Rec;
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
            action(Dimension)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                ShortCutKey = 'Shift+Ctrl+D';
                PromotedCategory = Category8;
                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
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
            action("Post Payroll")
            {
                ApplicationArea = Basic;
                Caption = 'Post to Payroll Jounal';
                Image = Post;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                Visible = (Rec.Status = Rec.Status::Released);

                trigger OnAction()
                begin
                    // IF Status<>Status::Approved THEN
                    //   ERROR('Payroll Must be fully approved first before Posting');
                    PayPeriod.Reset();
                    PayPeriod.SetFilter(PayPeriod."Starting Date", Format(Rec."Payroll Period"));
                    PayPeriod.SetRange("Responsibility Center", Rec."Responsibility Center");
                    Report.Run(Report::"Post Payroll Salary Voucher T", true, true, PayPeriod);

                    //DocNumber:='PAYROLL'+FORMAT(DATE2DMY("Payroll Period", 2))+FORMAT(DATE2DMY("Payroll Period", 3));
                    // GLEntry.RESET;
                    // GLEntry.SETRANGE(GLEntry."Document No.",DocNumber);
                    // GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
                    // IF GLEntry.FINDFIRST THEN
                    //  BEGIN
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Date Created" := Today;
                    Rec."Time Posted" := Time;
                    Rec.Modify;
                    //END;
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Rec."Account Type" =Rec."Account Type"::Casuals;
    end;

    var
        PayrollHeaderT: Record "Payroll HeaderT";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        PayPeriod: Record "Payroll PeriodXT";
}


