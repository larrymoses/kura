#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75274 "Final Evaluation  Report"
{
    ApplicationArea = Basic;
    CardPageID = "Final Evaluation Report Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Bid Tabulation Header";
    SourceTableView = where("Document Type"=const("Evaluation Report"),
                            "Approval Status"=filter("Pending Approval"|Open),
                            "Process Type"=filter(IFS));
    UsageCategory = Tasks;
        PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release,Navigate';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Report ID";"Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Raised By";"Raised By")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Committee Role";"Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title";"Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Procurement Plan ID";"Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Date";"Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code";"Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Line No.";"Procurement Plan Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No";"Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget";"Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Narration";"Budget Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date";"Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date";"Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm";"Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com";"Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region";"Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Professional Opinion ID";"Professional Opinion ID")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bid No";"Awarded Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder No.";"Awarded Bidder No.")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder Name";"Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes";"Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Deadline";"Award Acceptance Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Response";"Award Acceptance Response")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Contract Holding";"Min. Contract Holding")
                {
                    ApplicationArea = Basic;
                }
                field("Earliest Contract Issuance Dt";"Earliest Contract Issuance Dt")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder NoA Response Type";"Bidder NoA Response Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder NoA Response Date";"Bidder NoA Response Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Post-Award Disputes";"No. of Post-Award Disputes")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
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
            }
        }
    }
    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Contact: Page "Contact Card";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable(false);

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

