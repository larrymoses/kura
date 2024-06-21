page 60016 "Evaluation ForPCSumExpensing"
{
    Caption = 'Evaluations For PC SumExpensing';
    PageType = Card;
    SourceTable = "Request for PC sum Expensing";
    PromotedActionCategories = 'New,Process,Report,Approve,Print,Request Approval,Approvals,Submit to Procurement,Prices & Discounts';
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Contractor ID"; Rec."Contractor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contractor ID field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("CIT Comm No."; Rec."CIT Comm No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CIT Comm No. field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part("Request for PC Sum Lines"; "Request for PC Sum Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("Document No."), "Document Type" = field("Document Type");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = true;

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin

                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    ;
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = true;

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RECORDID);
                end;
            }
            action(Print)
            {
                Caption = 'Print';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    Rec.Reset();
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(Report::"Request for PC Sum Expensing", true, true, Rec);
                    Rec.Reset();
                end;
            }
            action("Submit to Procurement")
            {
                Caption = 'Submit to Procurement';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    Rec.SubmittoProcurement(Rec);
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Evaluation;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
