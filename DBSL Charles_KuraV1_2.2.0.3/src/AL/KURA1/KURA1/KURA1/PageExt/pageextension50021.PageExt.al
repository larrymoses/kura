#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50021 "pageextension50021" extends "Purchase Credit Memo"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Description"(Control 66)".

    }
    actions
    {

        modify(CancelApprovalRequest)
        {
            visible = false;
            Enabled = true;

        }
        ////Unsupported feature: Property Deletion (Enabled) on "SendApprovalRequest(Action 146)".

        addafter("Remove From Job Queue")
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadPurchaseorderDocuments(Rec."No.", 'Purchase Credit Memo', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                end;
            }
            action(CancelApprovalReques1t)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Visible = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    VarVariant: Variant;
                    RecRef: RecordRef;
                    CustomApprovalEntry: Record "Approval Entry";
                    OldStatus: Option;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    TXT0002: label 'An approval request has been cancelled.';
                begin
                    // VarVariant := Rec;
                    //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    // if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                    //cc//cc// ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    //cc//cc// WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    //Procurement.FnUncommitPRN(Rec);
                    //
                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                        repeat
                            //   OldStatus :=ApprovalEntry.Status;
                            CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                            CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next = 0;

                    //Notify The User
                    // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                    Message(TXT0002);
                end;
            }
        }


    }
    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore


