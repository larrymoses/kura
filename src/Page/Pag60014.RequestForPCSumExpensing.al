/// <summary>
/// Page Request For PC Sum Expensing (ID 60014).
/// </summary>
page 60014 "Request For PC Sum Expensing"
{
    Caption = 'Request For PC Sum Expensing';
    PageType = Card;
    SourceTable = "Request for PC sum Expensing";
    PromotedActionCategories = 'New,Process,Report,Approve,Print,Request Approval,Approvals,Post,Prices & Discounts';
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Contractor ID"; Rec."Contractor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor ID field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("CIT Comm No."; Rec."CIT Comm No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CIT Comm No. field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("Requested Total Amount"; Rec."Requested Total Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Request for PC Sum Lines"; "Request for PC Sum Lines")
            {
                ApplicationArea = Basic;
                SubPageLink = "Document No." = field("Document No."), "Document Type" = field("Document Type");
            }
        }
        area(FactBoxes)
        {
              part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = Basic;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(99604),
                              "No." = field("Document No.");
                // , "Document Type" = field("Document Type");
            }
            systempart(Control55; Links)
            {
            }
            systempart(Control57; Notes)
            {
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
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    Rec.PostSumExpensing(Rec);
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Request;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
