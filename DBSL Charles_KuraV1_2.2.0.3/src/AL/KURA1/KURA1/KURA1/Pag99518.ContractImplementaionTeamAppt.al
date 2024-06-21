/// <summary>
/// Page ContractImplementaionTeamAppt (ID 99518).
/// </summary>
page 99518 ContractImplementationTeamAppt
{
    Caption = 'Contract Implementation Team Appt';
    PageType = Card;
    SourceTable = "IFS Tender Committee";
    PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Approvals,Post,Customer';
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
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Contract No.";Rec."Contract No.")
                {
                    ApplicationArea = All;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    Visible =false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    Visible =false;
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = All;
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = All;
                }
            }
            part(Control23; "IFS Tender Committee Member")
            {
                Caption = 'Committee Members';
                SubPageLink = "Document No." = field("Document No."),
                              "Committee Type" = field("Committee Type");
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

                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;

                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        RecRef: RecordRef;
                        CustomApprovalEntry: Record "Custom Approval Entry";
                        OldStatus: Option;
                        VarVariant: Variant;
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //   Message('The approval request has been cancelled.');
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalMgt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ProcurementProcessing: Codeunit "Procurement Processing";
                    begin
                        ProcurementProcessing.FnSendTenderCommitteNotificationProject(Rec);
                    end;
                }

            }
        }
    }
    var
        ApprovalEntry: Record "Approval Entry";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
}
