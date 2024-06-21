#pragma implicitwith disable
page 75449 "Vendor Appraisal Voucher"
{
    PageType = Card;
    SourceTable = "Vendor Appraisal Voucher";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Notify,Post,Navigate,Appraisal';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Appraisal Method"; Rec."Appraisal Method")
                {
                    trigger OnValidate()
                    var

                    begin
                        visibleField := false;
                        if rec."Appraisal Method" = rec."Appraisal Method"::GRN then BEGIN
                            visibleField := true;
                            rec.Modify(true);
                        END;

                        if rec."Appraisal Method" = rec."Appraisal Method"::Inspection then BEGIN
                            visibleField1 := true;
                            rec.Modify(true);
                        END;
                    end;
                }
                field("GRN No."; Rec."GRN No.")
                {
                    ApplicationArea = BASIC;
                    Enabled = visiblefield;
                }
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = basic;
                    Enabled = visiblefield1;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Tendor Category"; Rec."Tendor Category")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Tender Category Description"; Rec."Tender Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Template"; Rec."Evaluation Template")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Vendor Evaluation Score Entry"; "Vendor Evaluation Score Entry")
            {
                Caption = 'Vendor Evaluation';
                ApplicationArea = Basic;
                SubPageLink = Code = FIELD("Document No");
            }
            group(Recommendation)
            {
                field("Recommendation(s)"; Rec."Recommendation(s)")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                }
                field("Suggested Areas of Imprevement"; Rec."Suggested Areas of Imprevement")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Appraisal)
            {
                action(Approvals)
                {
                    AccessByPermission = TableData 454 = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflow Buffer";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RECORDID);
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        Lines: Record "Vendor Evaluation Score Entry";
                    begin
                        Rec.TestField("Tendor Category");
                        Rec.TestField("Document Date");
                        Rec.TestField("Document No");
                        Rec.TestField("Vendor Name");
                        Rec.TestField("Appraisal Period");
                        Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                        Rec.TestField(Posted, false);
                        Lines.Reset();
                        Lines.SetRange(Code, Rec."Document No");
                        if Lines.FindSet() then begin
                            repeat
                                Lines.TestField("Vendor No.");
                                Lines.TestField("Scores Remarks");
                                Lines.TestField("Evaluation Results");
                            until Lines.Next() = 0;
                        end;
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant)
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action(Print)
                {
                    Image = Print;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Report;
                    trigger OnAction()
                    var
                        VendorAppraisalVoucher: Record "Vendor Appraisal Voucher";
                    begin
                        VendorAppraisalVoucher.RESET;
                        VendorAppraisalVoucher.SETRANGE("Document No", Rec."Document No");
                        IF VendorAppraisalVoucher.FINDFIRST() THEN BEGIN
                            REPORT.RUN(70146, TRUE, FALSE, VendorAppraisalVoucher);
                        END;
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
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
                    ApplicationArea = All;
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
                    ApplicationArea = All;
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
                    ApplicationArea = All;
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
    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

        OpenApprovalEntriesExistCurrUser: Boolean;

        visiblefield1: boolean;
        visiblefield: boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";


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

#pragma implicitwith restore

