#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75092 "Vendor Reinstatement card"
{
    // DeleteAllowed = false;
    // PageType = Card;
    // SourceTable = "Vendor Debarment Voucher";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Source Type"; "Source Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Description; Description)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Document Date"; "Document Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("External Document No"; "External Document No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Approval Status"; "Approval Status")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Posted; Posted)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Created By"; "Created By")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Created Date"; "Created Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Created Time"; "Created Time")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         part(Control18; "Vendor Reinstatement Line")
    //         {
    //             SubPageLink = "Document No" = field("Document No"),
    //                           "Document Type" = field("Document Type");
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         part("Attached Documents"; "Document Attachment Factbox")
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Attachments';
    //             SubPageLink = "Table ID" = const(70116),
    //                           "No." = field("Document No");
    //         }
    //         part(ApprovalFactBox; "Approval FactBox")
    //         {
    //             ApplicationArea = Suite;
    //             Visible = true;
    //         }
    //         part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
    //         {
    //             ApplicationArea = Suite;
    //             ShowFilter = false;
    //             Visible = true;
    //         }
    //         part(WorkflowStatus; "Workflow Status FactBox")
    //         {
    //             ApplicationArea = Suite;
    //             Editable = true;
    //             Enabled = true;
    //             ShowFilter = false;
    //             Visible = ShowWorkflowStatus;
    //         }
    //         systempart(Control14; Outlook)
    //         {
    //         }
    //         systempart(Control15; Notes)
    //         {
    //         }
    //         systempart(Control16; MyNotes)
    //         {
    //         }
    //         systempart(Control17; Links)
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group(IFP)
    //         {
    //             Caption = 'IFP';
    //             Image = "Order";
    //             action(Dimensions)
    //             {
    //                 AccessByPermission = TableData Dimension = R;
    //                 ApplicationArea = Dimensions;
    //                 Caption = 'Dimensions';
    //                 Enabled = "Document No" <> '';
    //                 Image = Dimensions;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 PromotedIsBig = true;
    //                 ShortCutKey = 'Shift+Ctrl+D';
    //                 ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

    //                 trigger OnAction()
    //                 begin
    //                     ShowDocDim;
    //                     CurrPage.SaveRecord;
    //                 end;
    //             }
    //             action(Approvals)
    //             {
    //                 AccessByPermission = TableData "Approval Entry" = R;
    //                 ApplicationArea = Suite;
    //                 Caption = 'Approvals';
    //                 Image = Approvals;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

    //                 trigger OnAction()
    //                 var
    //                     WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
    //                 begin
    //                     ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
    //                 end;
    //             }
    //             action("Co&mments")
    //             {
    //                 ApplicationArea = Comments;
    //                 Caption = 'Co&mments';
    //                 Image = ViewComments;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 RunObject = Page "Purch. Comment Sheet";
    //                 RunPageLink = "No." = field("Document No");
    //                 ToolTip = 'View or add comments for the record.';
    //             }
    //             action(DocAttach)
    //             {
    //                 ApplicationArea = All;
    //                 Caption = 'Attachments';
    //                 Image = Attach;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

    //                 trigger OnAction()
    //                 var
    //                     DocumentAttachmentDetails: Page "Document Attachment Details";
    //                     RecRef: RecordRef;
    //                 begin
    //                     RecRef.GetTable(Rec);
    //                     DocumentAttachmentDetails.OpenForRecRef(RecRef);
    //                     DocumentAttachmentDetails.RunModal;
    //                 end;
    //             }
    //             action(Navigate)
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Navigate;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 RunObject = Page "Vendor Debarment Entry";
    //                 RunPageLink = "Source Voucher No." = field("Document No");
    //             }
    //         }
    //     }
    //     area(processing)
    //     {
    //         group(Approval)
    //         {
    //             Caption = 'Approval';
    //             action(Approve)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Approve';
    //                 Image = Approve;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 ToolTip = 'Approve the requested changes.';
    //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
    //                 end;
    //             }
    //             action(Reject)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Reject';
    //                 Image = Reject;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 ToolTip = 'Reject the requested changes.';
    //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
    //                 end;
    //             }
    //             action(Delegate)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Delegate';
    //                 Image = Delegate;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 PromotedOnly = true;
    //                 ToolTip = 'Delegate the requested changes to the substitute approver.';
    //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
    //                 end;
    //             }
    //             action(Comment)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Comments';
    //                 Image = ViewComments;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 PromotedOnly = true;
    //                 ToolTip = 'View or add comments for the record.';
    //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     ApprovalsMgmt.GetApprovalComment(Rec);
    //                 end;
    //             }
    //         }
    //         group(ActionGroup25)
    //         {
    //             Caption = 'Release';
    //             Image = ReleaseDoc;
    //             action(Release)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Re&lease';
    //                 Image = ReleaseDoc;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 ShortCutKey = 'Ctrl+F9';
    //                 ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Approval Document";
    //                 begin
    //                     ReleasePurchDoc.ReleaseVendDebarment(Rec);
    //                 end;
    //             }
    //             action(Reopen)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Re&open';
    //                 Enabled = "Approval Status" <> "Approval Status"::Open;
    //                 Image = ReOpen;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 PromotedOnly = true;
    //                 ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Approval Document";
    //                 begin
    //                     ReleasePurchDoc.ReopenVendDebarment(Rec);
    //                 end;
    //             }
    //         }
    //         group("F&unctions")
    //         {
    //             Caption = 'F&unctions';
    //             Image = "Action";
    //             action(Post)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Post';
    //                 Ellipsis = true;
    //                 Enabled = ("Approval Status" = "Approval Status"::Released);
    //                 Image = PostDocument;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

    //                 trigger OnAction()
    //                 begin

    //                     Procurement.PostVendReinstatement(Rec);
    //                 end;
    //             }
    //         }
    //         group("Request Approval")
    //         {
    //             Caption = 'Request Approval';
    //             action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Send A&pproval Request';
    //                 Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;
    //                 PromotedIsBig = true;
    //                 ToolTip = 'Request approval of the document.';

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     //     if ApprovalsMgmt.CheckVendDebarmentApprovalPossible(Rec) then
    //                     ///   ApprovalsMgmt.OnSendVendDebarmentForApproval(Rec);

    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
    //                 Image = CancelApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;
    //                 ToolTip = 'Cancel the approval request.';

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                     WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    //                 begin
    //                     //   ApprovalsMgmt.OnCancelVendDebarmentApprovalRequest(Rec);
    //                     //    WorkflowWebhookMgt.FindAndCancel(RecordId);
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnAfterGetCurrRecord()
    // begin
    //     SetControlAppearance;
    //     CurrPage.IncomingDocAttachFactBox.Page.LoadDataFromRecord(Rec);
    //     CurrPage.ApprovalFactBox.Page.UpdateApprovalEntriesFromSourceRecord(RecordId);
    //     ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(RecordId);
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Document Type" := "document type"::Reinstatement;
    //     "Document Date" := Today;
    // end;

    // var
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     OpenApprovalEntriesExistCurrUser: Boolean;
    //     OpenApprovalEntriesExist: Boolean;
    //     OpenApprovalEntriesExistForCurrUser: Boolean;
    //     CanCancelApprovalForRecord: Boolean;
    //     CanRequestApprovalForFlow: Boolean;
    //     CanCancelApprovalForFlow: Boolean;
    //     ShowWorkflowStatus: Boolean;
    //     Procurement: Codeunit "Procurement Processing";
    //     Posted: Boolean;

    // local procedure SetControlAppearance()
    // var
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    // begin



    //     OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    //     OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    //     CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

    //     WorkflowWebhookMgt.GetCanRequestAndCanCancel(RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    // end;
}

