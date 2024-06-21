page 99534 "ARICS card"
{
    Caption = 'ARICS';
    PageType = Card;
    SourceTable = "Road Inv. Condition Survey";
    PopulateAllFields = true;
    DataCaptionFields="Document No.",Description;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release,Navigate';
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
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                }
                Field("Financial Year";Rec."Financial Year")
                {
                   ApplicationArea = Basic; 
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Primary Vendor No."; Rec."Primary Vendor No.")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Target Road Inventory Type"; Rec."Target Road Inventory Type")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Branch/Center"; Rec."Branch/Center")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Constituencies"; Rec."No. of Constituencies")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("No.Of Existing Roads"; Rec."No.Of Existing Roads")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("No. of New Roads"; Rec."No. of New Roads")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }

            }
            part("RICS Lines"; "RICS Lines")
            {
                Caption ='Road Links';
                UpdatePropagation = Both;
                SubPageLink = "Document No." = field("Document No."),"Shortcut Dimension 1 Code"=field(Region);
                ApplicationArea = Basic;
            }
        }
    }
    actions{
        area(Processing)
        {
             group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant)
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                      Caption = '&Approvals';
                      Image = Approvals;
                      Promoted = true;
                      PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
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
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Report;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        RICS: Record "Road Inv. Condition Survey";
                    begin
                        RICS.Reset();
                        RICS.SetRange("Document No.", Rec."Document No.");
                        if RICS.FindFirst() then
                            Report.Run(Report::"RICS Report", true, true, RICS);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin

     if (Rec."Approval Status" = Rec."Approval Status"::"Pending Approval") or (Rec."Approval Status" = Rec."Approval Status"::Approved) then
        CurrPage.Editable(false);
        SetControlAppearance;

    end;

    trigger OnAfterGetRecord()
    begin
        if (Rec."Approval Status" = Rec."Approval Status"::"Pending Approval") or (Rec."Approval Status" = Rec."Approval Status"::Approved) then
        CurrPage.Editable(false);
        SetControlAppearance();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

    end;

    trigger OnOpenPage()
    begin
        if (Rec."Approval Status" = Rec."Approval Status"::"Pending Approval") or (Rec."Approval Status" = Rec."Approval Status"::Approved) then
        CurrPage.Editable(false);
        SetControlAppearance;
    end;
    var
    TXT0001: label 'An approval request has been sent and approvers notified successfully.';
        TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
           local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        if Rec."Approval Status" <>Rec."Approval Status"::Open then
        CurrPage.Editable(false);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}
