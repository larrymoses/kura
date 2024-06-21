#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75463 "Post Qual Bid Evaluation Card"
{
    Caption = 'Post Qualification Analysis';
    PageType = Card;
    SourceTable = "Bid Evaluation Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Date"; "Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; "Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; "Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Venue"; "Evaluation Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document No."; "Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Register No."; "Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; "Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Deadline"; "Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Commi"; "Appointed Bid Evaluation Commi")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Committe';
                }
                field("Primary Region"; "Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type"; "Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                }
                field("Evaluation Lead"; "Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name"; "Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("No of Requirements"; "No of Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("No of Passed Requirements"; "No of Passed Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("No of Failed Requirements"; "No of Failed Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12; "Bid Evaluation Score Entry")
            {
                SubPageLink = Code = field(Code);
            }
            group("Evaluation Result")
            {
                Caption = 'Evaluation Result';
                field("Post Qu Evaluation  Decision"; "Post Qu Evaluation  Decision")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Post Quali Comm Remarks"; "Post Quali Comm Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Conclusion';
                    MultiLine = true;
                }
                field("Post Qualification Reccommenda"; "Post Qualification Reccommenda")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recommendations';
                    MultiLine = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control33; Outlook)
            {
            }
            systempart(Control34; Notes)
            {
            }
            systempart(Control35; MyNotes)
            {
            }
            systempart(Control36; Links)
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
                    Enabled = "code" <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
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
                        // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.GetTable(Rec);
                    //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     DocumentAttachmentDetails.RunModal;
                    // end;
                }
                action("Criteria Groups")
                {
                    ApplicationArea = Basic;
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bid evaluation Criteria Group";
                    RunPageLink = "Template ID" = field("Bid Scoring Document No."),
                                  "Document No" = field(Code);
                }
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = "IFS Code" = field("IFS Code");
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        // Reset;
                        // SetRange(Code,Code);
                        // Report.Run(70125,true,true,Rec);
                        //  FileDirectoryX:='C:\SCM\Tender\'+"IFS Code"+'\';
                        // // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        //  FileNameX:="IFS Code"+'_6_PostQualification.pdf';
                        //   if FILE.Exists(FileDirectoryX+FileNameX) then
                        //   FILE.Erase(FileDirectoryX+FileNameX);//51217
                        // //MERGE PDF
                        // FileDirectory:='C:\SCM\Tender\'+"IFS Code"+'\';
                        // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        // FileName:="IFS Code"+'_6_PostQualification.pdf';
                        // Report.SaveAsPdf(70125,FileDirectory+FileName,Rec);
                    end;
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup46)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
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
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenVendDebarment(Rec);
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                Visible = false;
                action("Bid Evaluation Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Filed Response Documents")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Filed Document";
                    RunPageLink = "No." = field("Bid No."),
                                  "Vendor No" = field("Vendor No.");
                }
                action("Personnel Specifications")
                {
                    ApplicationArea = Basic;
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Category10;
                    RunObject = Page "Bid Key Staff";
                    RunPageLink = "Vendor No." = field("Vendor No."),
                                  "No." = field("Bid No.");
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = true;
                    PromotedCategory = Category10;
                    RunObject = Page "Bid Equipment Specification";
                    RunPageLink = "No." = field("Bid No.");
                }
                action("Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = Relationship;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Past Experience";
                    RunPageLink = "Vendor No." = field("Vendor No."),
                                  "No." = field("Bid No.");
                }
                action("Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Audited Balance Sheet";
                    RunPageLink = "Vendor No." = field("Vendor No."),
                                  "No." = field("Bid No.");
                }
                action("Audited Income Statement")
                {
                    ApplicationArea = Basic;
                    Image = GLAccountBalance;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Audited Income Statement";
                    RunPageLink = "Vendor No." = field("Vendor No."),
                                  "No." = field("Bid No.");
                }
                action("Bid Responses")
                {
                    ApplicationArea = Basic;
                    Image = ResourceLedger;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Finance Evaluation Line";
                    RunPageLink = "Document ID" = field(Code);
                }
                action("Post Evaluation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Post Evaluation';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        //Finance Evaluation Line
                        Procurement.FnPostQualification(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // if ApprovalsMgmt.CheckBidEvaluationApprovalPossible(Rec) then
                        //   ApprovalsMgmt.OnSendBidEvaluationForApproval(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //  WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //  ApprovalsMgmt.OnCancelBidEvaluationApprovalRequest(Rec);
                        //   WorkflowWebhookMgt.FindAndCancel(RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        BidEvaluationScoreEntry.Reset;
        BidEvaluationScoreEntry.SetRange(Code, Code);
        BidEvaluationScoreEntry.SetRange("Evaluation Results", BidEvaluationScoreEntry."evaluation results"::Fail);
        if BidEvaluationScoreEntry.FindFirst then begin
            "Post Qu Evaluation  Decision" := "post qu evaluation  decision"::Fail;
        end else begin


            "Post Qu Evaluation  Decision" := "post qu evaluation  decision"::Pass;

        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Evaluation Type" := "evaluation type"::"Post Qualification";
        "Evaluator Category" := "evaluator category"::"Evaluation Committee";
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        BidEvaluationReg: Record "Bid Evaluation Register";
        PurchaseHeader: Record "Purchase Header";
        BidEvaluationScoreEntry: Record "Bid Evaluation Score Entry";
        BidEvaluationScoreEntry1: Record "Bid Evaluation Score Entry";
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName: Text;
        FileDirectory: Text;
}

