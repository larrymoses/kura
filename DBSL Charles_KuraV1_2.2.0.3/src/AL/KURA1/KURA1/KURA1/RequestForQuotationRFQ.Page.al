#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75121 "Request For Quotation (RFQ)"
{
    // check on format of email and if its attaching the email document

    Caption = 'Request For Quotation (RFQ) Card';
    //for cate   DeleteAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,RFQ,Request Approval,Print/Send,Navigate,E-Mail,Tender,Documents';
    SourceTable = "Standard Purchase Code";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ No.';
                    Importance = Promoted;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reference';
                    Importance = Promoted;
                }
                field("PRN No."; Rec."PRN No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Submission End Date';
                    ShowMandatory = true;

                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Submission End Time';
                    ShowMandatory = true;
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Opening Date';
                    ShowMandatory = true;
                }
                field("Bid Opening Time"; Rec."Bid Opening Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Opening Time';
                    ShowMandatory = true;
                }
                field("Bid Selection Method"; Rec."Bid Selection Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category ID"; Rec."Procurement Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                }
                field("Supplier Type"; Rec."Supplier Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Target Bidder Group"; Rec."Target Bidder Group")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Submission Method"; Rec."Bid Submission Method")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Sealed Bids"; Rec."Sealed Bids")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Duration"; Rec."Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Validity Duration';
                }
                field("Tender Validity Expiry Date"; Rec."Tender Validity Expiry Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Validity Expiry Date';
                }
                field("Enforce Mandatory Pre-bid Visi"; Rec."Enforce Mandatory Pre-bid Visi")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory Pre-bid Visit Date"; Rec."Mandatory Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prebid Meeting Address"; Rec."Prebid Meeting Address")
                {
                    ApplicationArea = Basic;
                }
                field("Sample Delivery Date"; Rec."Sample Delivery Date")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory Special Group Reserv"; Rec."Mandatory Special Group Reserv")
                {
                    ApplicationArea = Basic;
                }
                field("Appointer of Bid Arbitrator"; Rec."Appointer of Bid Arbitrator")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appointer of RFQ Arbitrator';
                    Importance = Additional;
                }
                field("Bid Scoring Template"; Rec."Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Evaluation Criteria';
                    ShowMandatory = true;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Date/Time Published"; Rec."Date/Time Published")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Importance = Additional;
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Cancel Reason Code"; Rec."Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                    enabled = false;
                    visible = false;
                }
                field("Cancellation Date"; Rec."Cancellation Date")
                {
                    ApplicationArea = Basic;
                    enabled = false;
                    visible = false;
                }
                field("Cancellation Secret Code"; Rec."Cancellation Secret Code")
                {
                    ApplicationArea = Basic;
                    enabled = false;
                    visible = false;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("No Of Supliers To Invite"; Rec."No Of Supliers To Invite")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Description of Items & Services Requested"; "IFS Purchase Lines")
            {
                Caption = 'Description of Items & Services Requested';
                SubPageLink = "Standard Purchase Code" = field(Code);
            }
            part(Control31; "IFS Intention To Bid")
            {
                Caption = 'Invited Bidders';
                SubPageLink = Code = field(Code);//, "Procurement Category" = field("Procurement Category ID");//, "Supplier Type" = field("Supplier Type");
            }
            group("Budget Control Checks")
            {
                field("Requesting Region"; Rec."Requesting Region")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Directorate"; Rec."Requesting Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Department"; Rec."Requesting Department")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job No.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job Task No.';
                }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("PP Funding Source ID"; Rec."PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Budget"; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Actual Costs"; Rec."PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Commitments"; Rec."PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Available Budget"; Rec."PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Details")
            {
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control116; "Approval FactBox")
            {
                SubPageLink = "Table ID" = filter(173),
                              "Document No." = field(Code);
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                // Visible = ShowWorkflowStatus;
                VISIBLE = FALSE;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(173),
                              "No." = field(Code);
            }
            systempart(Control113; Links)
            {
                Visible = false;
            }
            systempart(Control112; Notes)
            {
                Visible = true;
            }
            systempart(Control108; Outlook)
            {
            }
            systempart(Control109; Notes)
            {
            }
            systempart(Control110; MyNotes)
            {
            }
            systempart(Control111; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."Code" <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category13;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin

                        DMSManagement.UploadRFQNDocuments(Rec.Code, 'Request for Quotation', Rec.RecordId, Rec."Global Dimension 2 Code");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category13;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
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
            group(ActionGroup135)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Rec.Status = Rec.Status::open;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //    ReleasePurchDoc.ReleaseITT(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //  ReleasePurchDoc.ReopenITT(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy PRN Details';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        PRN.Reset;
                        PRN.SetRange("No.", Rec."PRN No.");
                        if PRN.FindSet then
                            Procurement.CopyPRNDetails(PRN, Rec);

                    end;
                }
                action("Purchase Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Lines';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = PutawayLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Purchase Lines";
                    RunPageLink = "Standard Purchase Code" = field(Code);

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        //Procurement.SuggestProcurementCategories(Rec);

                    end;
                }
                action("Suggest Required Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Category13;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestRequiredDocITT(Rec);

                    end;
                }
                action("Suggest Tender Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestTenderSourceDoc(Rec);

                    end;
                }
                action("Suggest Prequalified Suppliers")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestPrequalifiedSuppliers(Rec);

                    end;
                }
                action("Publish Invitations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = false;
                    Image = PrintCover;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.PublishITT(Rec);
                    end;
                }
                action("Intention To Bid")
                {
                    ApplicationArea = Basic;
                    Image = Interaction;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Intention To Bid";
                    RunPageLink = Code = field(Code);
                }
                action("Activate Evaluations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = true;
                    Image = ActivateDiscounts;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.ActivateEvaluationsIFP(Rec);
                    end;
                }
                action("Cancel Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Visible = Rec."Document Status" = Rec."Document Status"::Published;

                    trigger OnAction()
                    begin
                        Procurement.CancelIFSInvitation(Rec);
                        //Procurement.FnUncommitPRNNOA(Rec);
                    end;
                }
                action("Close Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelLine;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Visible = Rec."Document Status" = Rec."Document Status"::Cancelled;

                    trigger OnAction()
                    begin
                        Procurement.FnNotifyonTenderTermination(Rec);
                        Procurement.FnUncommitPRNNOA(Rec);
                        Rec."Document Status" := Rec."document status"::Closed;
                        Message('Closed Successfully');
                        //Procurement.CancelIFSInvitation(Rec);
                        //Procurement.FnUncommitPRNNOA(Rec);
                    end;
                }
                action("Prequalified Suppliers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalified Suppliers';
                    Image = ReturnRelated;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "IFS Intention To Bid";
                    RunPageLink = "IFS Code" = field(Code);
                    Visible = true;
                }
                action("RFQ Respones")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Responses';
                    Image = ReturnRelated;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Bid Response List";
                    RunPageLink = "Invitation For Supply No" = field(Code),
                                  "Document Type" = const(Quote);
                    Visible = true;
                }
                action("IFP Evaluations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                action("Preview RFQ")
                {
                    ApplicationArea = Basic;
                    Image = PrintVoucher;
                    Promoted = true;
                    PromotedCategory = Report;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        //   rfqreport: Report RFQ;
                        Supplierrec: Record "Standard Vendor Purchase Code";
                    begin
                        // 51511025
                        /*Supplierrec.RESET;
                        Supplierrec.SETRANGE(Supplierrec."IFS Code",Code);
                         IF Supplierrec.FINDSET THEN BEGIN
                           rfqreport.SETTABLEVIEW(Supplierrec);
                           rfqreport.RUN;
                         END;*/
                        StandardVendor.Reset;
                        StandardVendor.SetRange(Code, Rec.Code);
                        Report.Run(70062, true, true, StandardVendor);

                    end;
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Required Document";
                    RunPageLink = "Document No" = field(Code);
                    Visible = true;
                }
                action("Create Addendum Notice")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Addendum Notice';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Procurement.CreateAddendumNoticeITT(Rec);
                    end;
                }
                action("Send RFQ")
                {
                    ApplicationArea = Basic;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category12;
                    Visible = Rec.Status = Rec.Status::Released;
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Released);
                        Procurement.FnSendRFQInvitationReport(Rec, Vendor);
                    end;
                }
                action("Tender Securities")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    Promoted = true;
                    PromotedCategory = Category13;
                    RunObject = Page "IFS Securities";
                    RunPageLink = "IFS Code" = field(Code);
                    Visible = false;
                }
                action("Tender Document Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedCategory = Category13;
                    RunObject = Page "IFS Tender Document Source";
                    RunPageLink = "Tender Source ID" = field(Code);
                    Visible = false;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';



                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        SVPC: Record "Standard Vendor Purchase Code";
                    begin
                        Rec.TestField("Supplier Type");
                        Rec.TestField("Procurement Category");
                        Rec.TestField("Submission End Date");
                        Rec.TestField("Submission End Time");
                        Rec.TestField("Bid Opening Date");
                        Rec.TestField("Bid Opening Time");
                        // Rec.TestField("Bid Opening Venue");
                        Rec.TestField("Purchaser Code");
                        if Rec."Bid Scoring Template" = '' then
                            Error('Please fill in the RFQ Evaluation criteria');
                        SVPC.Reset();
                        SVPC.SetRange(Code, Rec.Code);
                        if SVPC.FindSet() then begin
                            repeat
                                SVPC.TestField("Vendor No.");
                                SVPC.TestField("Supplier No.");
                            until SVPC.Next() = 0;
                        end
                        else
                            Error('Please invite at least one  bidder');
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        //ApprovalsMgmt.OnCancelIFSApprovalRequest(Rec);
                        //WorkflowWebhookMgt.FindAndCancel();
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action("Activity Schedules")
                {
                    ApplicationArea = Basic;
                    Image = ElectronicRegister;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    RunObject = Page "RFI Bid Schedule";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("RFI Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Image = Segment;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "RFI Responsibility Center";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Preference and Reservations")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Restricted Vendor Category";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Addendum Notices")
                {
                    ApplicationArea = Basic;
                    Image = Change;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Tender Addendum Notice";
                    RunPageLink = "Invitation Notice No." = field(Code);
                    Visible = false;
                }
                action("Appointed Committees")
                {
                    ApplicationArea = Basic;
                    Image = Agreement;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Tender Committee";
                    RunPageLink = "IFS Code" = field(Code);
                }
                action("Personnel Specifications")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Key Staff";
                    RunPageLink = "IFS Code" = field(Code);
                    Visible = false;
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = LiFo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Required Equipment";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Major Deliverables")
                {
                    ApplicationArea = Basic;
                    Image = Delivery;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Major Work_Deliverable";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Related Invitation Notices")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Parent Invitation No" = field(Code);
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Procurement Method" := Rec."procurement method"::RFQ;
    end;

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        Vendor: Record Vendor;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        StandardVendor: Record "Standard Vendor Purchase Code";

    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable(false);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

#pragma implicitwith restore

