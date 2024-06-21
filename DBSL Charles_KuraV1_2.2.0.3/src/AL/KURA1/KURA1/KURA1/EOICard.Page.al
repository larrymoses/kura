#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75214 "EOI Card"
{
    // Caption = 'Expression of Interest(EOI)';
    // PageType = Card;
    // SourceTable = "Request For Information";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Code"; Code)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Solicitation Type"; "Solicitation Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Invitation for Supply No."; "Invitation for Supply No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Tender Name"; "Tender Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Description; Description)
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'This is used for categorization of the prequalifications since the different supplier clusters may have different sets of unique requirements. NB: We separate Contractors because of the dedicated Contractors Portal used during Project execution';
    //             }
    //             field("Tender Summary"; "Tender Summary")
    //             {
    //                 ApplicationArea = Basic;
    //                 MultiLine = true;
    //             }
    //             field("Primary Target Vendor Cluster"; "Primary Target Vendor Cluster")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("External Document No"; "External Document No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Responsibility Centre"; "Responsibility Centre")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("RFI Scoring Template"; "RFI Scoring Template")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'EOI Scoring Template';
    //             }
    //             field(Published; Published)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("No. of Submission"; "No. of Submission")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Status; Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //         }
    //         part(Control47; "RFI Prequalification Category")
    //         {
    //             Caption = 'EOI Prequalification Category';
    //             SubPageLink = "Document No" = field(Code);
    //         }
    //         group("Submission Details")
    //         {
    //             Caption = 'Submission Details';
    //             group("Critical Submission Date")
    //             {
    //                 Caption = 'Critical Submission Date';
    //                 field("Submission Start Date"; "Submission Start Date")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Submission Start Time"; "Submission Start Time")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Submission End Date"; "Submission End Date")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Submission End Time"; "Submission End Time")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //             }
    //             group("Submission Address Details")
    //             {
    //                 Caption = 'Submission Address Details';
    //                 field(Name; Name)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Procuring Entity Name';
    //                 }
    //                 field(Address; Address)
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Address 2"; "Address 2")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Post Code"; "Post Code")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field(City; City)
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Country/Region Code"; "Country/Region Code")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Phone No."; "Phone No.")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("E-Mail"; "E-Mail")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Tender Box Location Code"; "Tender Box Location Code")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //             }
    //         }
    //         group("EOI Charges")
    //         {
    //             Caption = 'EOI Charges';
    //             field("Prequalification Charge Code"; "Prequalification Charge Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'EOI Charge Code';
    //             }
    //             field("Charge Amount (LCY)"; "Charge Amount (LCY)")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Charge Bank Code"; "Charge Bank Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Bank Name"; "Bank Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Account Holder Name"; "Account Holder Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Charge Bank Branch"; "Charge Bank Branch")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Charge Bank A/C No"; "Charge Bank A/C No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         part("EOI Required Document>"; "RFI Required Document")
    //         {
    //             SubPageLink = "Document No" = field(Code);
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         part("Attached Documents"; "Document Attachment Factbox")
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Attachments';
    //             SubPageLink = "Table ID" = const(70084),
    //                           "No." = field(Code);
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
    //         systempart(Control83; Links)
    //         {
    //             ApplicationArea = RecordLinks;
    //             Visible = false;
    //         }
    //         systempart(Control82; Notes)
    //         {
    //             ApplicationArea = Notes;
    //         }
    //         systempart(Control42; Outlook)
    //         {
    //         }
    //         systempart(Control43; Notes)
    //         {
    //         }
    //         systempart(Control44; MyNotes)
    //         {
    //         }
    //         systempart(Control45; Links)
    //         {
    //         }
    //         chartpart("Q5402-01"; "Q5402-01")
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group(EOI)
    //         {
    //             Caption = 'EOI';
    //             Image = "Order";
    //             action(Dimensions)
    //             {
    //                 AccessByPermission = TableData Dimension = R;
    //                 ApplicationArea = Dimensions;
    //                 Caption = 'Dimensions';
    //                 Enabled = "Code" <> '';
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
    //                 RunPageLink = "Document Type" = field("Document Type");
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
    //         group(ActionGroup61)
    //         {
    //             Caption = 'Release';
    //             Image = ReleaseDoc;
    //             action(Release)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Re&lease';
    //                 Enabled = Status = Status::open;
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
    //                     ReleasePurchDoc.ReleaseIFP(Rec);
    //                 end;
    //             }
    //             action(Reopen)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Re&open';
    //                 Enabled = Status <> Status::Open;
    //                 Image = ReOpen;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 PromotedOnly = true;
    //                 ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Approval Document";
    //                 begin
    //                     ReleasePurchDoc.ReopenIFP(Rec);
    //                 end;
    //             }
    //         }
    //         group("F&unctions")
    //         {
    //             Caption = 'F&unctions';
    //             Image = "Action";
    //             action(CopyDocument)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Copy Document';
    //                 Ellipsis = true;
    //                 Enabled = "code" <> '';
    //                 Image = CopyDocument;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

    //                 trigger OnAction()
    //                 begin
    //                     /*CopyPurchDoc.SetPurchHeader(Rec);
    //                     CopyPurchDoc.RUNMODAL;
    //                     CLEAR(CopyPurchDoc);
    //                     IF GET("Document Type","No.") THEN;*/

    //                 end;
    //             }
    //             action("Suggest Procurement Categories")
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Suggest Procurement Categories';
    //                 Ellipsis = true;
    //                 Enabled = "Code" <> '';
    //                 Image = SuggestCapacity;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

    //                 trigger OnAction()
    //                 begin
    //                     /*CopyPurchDoc.SetPurchHeader(Rec);
    //                     CopyPurchDoc.RUNMODAL;
    //                     CLEAR(CopyPurchDoc);
    //                     IF GET("Document Type","No.") THEN;*/
    //                     Procurement.SuggestProcurementCategories(Rec);

    //                 end;
    //             }
    //             action("Suggest Required Documents")
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Suggest Required Documents';
    //                 Ellipsis = true;
    //                 Enabled = "Code" <> '';
    //                 Image = CopyDocument;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

    //                 trigger OnAction()
    //                 begin
    //                     /*CopyPurchDoc.SetPurchHeader(Rec);
    //                     CopyPurchDoc.RUNMODAL;
    //                     CLEAR(CopyPurTchDoc);
    //                     IF GET("Document Type","No.") THEN;*/
    //                     Procurement.SuggestRequiredDocEOI(Rec);

    //                 end;
    //             }
    //             action(Publish)
    //             {
    //                 ApplicationArea = Basic;
    //                 Enabled = Published = false;
    //                 Image = PrintCover;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 Visible = status = status::Released;

    //                 trigger OnAction()
    //                 begin
    //                     Procurement.PublishIFP(Rec);
    //                 end;
    //             }
    //             action("Activate Evaluations")
    //             {
    //                 ApplicationArea = Basic;
    //                 Enabled = Published = true;
    //                 Image = ActivateDiscounts;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 Visible = status = status::Released;

    //                 trigger OnAction()
    //                 begin
    //                     Procurement.ActivateEvaluationsIFP(Rec);
    //                 end;
    //             }
    //             action("Close EOI")
    //             {
    //                 ApplicationArea = Suite;
    //                 Enabled = "code" <> '';
    //                 Image = Close;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 Visible = status = status::Released;

    //                 trigger OnAction()
    //                 begin
    //                     Procurement.CloseIFP(Rec);
    //                 end;
    //             }
    //             action("Cancel EOI")
    //             {
    //                 ApplicationArea = Suite;
    //                 Image = CancelAllLines;
    //                 Promoted = true;
    //                 PromotedCategory = Category5;
    //                 Visible = status = status::Released;

    //                 trigger OnAction()
    //                 begin
    //                     Procurement.CancelIFP(Rec);
    //                 end;
    //             }
    //             action("EOI Response")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = ReturnRelated;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 PromotedIsBig = true;
    //                 RunObject = Page "RFI Response List";
    //                 RunPageLink = "RFI Document No." = field(Code);
    //             }
    //             action("EOI Evaluations")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             action("Filed Documents")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Filed;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 RunObject = Page "RFI Response Filed Document";
    //                 RunPageLink = "Document No" = field(Code);
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
    //                     //  if ApprovalsMgmt.CheckIFPApprovalPossible(Rec) then
    //                     //   ApprovalsMgmt.OnSendIFPForApproval(Rec);

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
    //              /*      // ApprovalsMgmt.OnCancelIFPApprovalRequest(Rec);
    //                     //WorkflowWebhookMgt.FindAndCancel(RecordId);
    //                 end;*/
    //             }
    //             action("Activity Schedules")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = ElectronicRegister;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 PromotedIsBig = true;
    //                 RunObject = Page "RFI Bid Schedule";
    //                 RunPageLink = "Document No" = field(Code);
    //             }
    //             action("RFI Responsibility Centers")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Segment;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 RunObject = Page "RFI Responsibility Center";
    //                 RunPageLink = "Document No" = field(Code);
    //             }
    //             action("Preference & Reservation")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Reserve;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 RunObject = Page "RFI Restricted Vendor Category";
    //                 RunPageLink = "Document No" = field(Code);
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
    //     "Document Type" := "document type"::"EOI Invitation";
    //     "Document Date" := Today;
    // end;

    // var
    //     OpenApprovalEntriesExistCurrUser: Boolean;
    //     OpenApprovalEntriesExist: Boolean;
    //     OpenApprovalEntriesExistForCurrUser: Boolean;
    //     CanCancelApprovalForRecord: Boolean;
    //     CanRequestApprovalForFlow: Boolean;
    //     CanCancelApprovalForFlow: Boolean;
    //     Procurement: Codeunit "Procurement Processing";
    //     ShowWorkflowStatus: Boolean;
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";

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

