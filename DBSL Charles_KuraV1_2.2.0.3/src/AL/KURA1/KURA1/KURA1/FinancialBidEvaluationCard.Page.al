
Page 75268 "Financial Bid Evaluation Card"
{
    PageType = Card;
    SourceTable = "Bid Evaluation Register";
    PromotedActionCategories = 'New,Process,Report,Evaluation,Release/ReOpen,Post,Print,Approvals,Request Approval';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Evaluation Date"; Rec."Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Evaluation Venue"; Rec."Evaluation Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Evaluation Type"; Rec."Previous Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Type';
                }
                field("Finance Opening Register No."; Rec."Finance Opening Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Finance Opening Date"; Rec."Finance Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document No."; Rec."Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Commi"; Rec."Appointed Bid Evaluation Commi")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Committe';
                    ShowMandatory = true;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                    ShowMandatory = true;
                }
                field("Evaluation Lead"; Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Evaluation Lead Name"; Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Has Post Qualification"; Rec."Has Post Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control23; "Finance Evaluation Line")
            {
                Caption = 'Bid Responses';
                SubPageLink = "Document ID" = field(Code);
            }
            group("Financial Evaluation Remarks")
            {
                Caption = 'Financial Evaluation Remarks';
                field("Sensitivity Analysis Remarks"; Rec."Sensitivity Analysis Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    Caption = 'Market Analysis Remarks';
                }
                field("Preference/Reservation Remarks"; Rec."Preference/Reservation Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Tender Evaluation Comm Remarks"; Rec."Tender Evaluation Comm Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(70178);
            }
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
                    Enabled = Rec."code" <> '';
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
                        //  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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

                    trigger OnAction()
                    var
                    //DocumentAttachmentDetails: Page "Document Attachment Details";
                    //RecRef: RecordRef;
                    begin
                        // RecRef.GetTable(Rec);
                        //DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        //DocumentAttachmentDetails.RunModal;
                    end;
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
                action("Bid Evaluation Criteria")
                {
                    ApplicationArea = Basic;
                    Image = AnalysisView;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Evaluation Score Entry";
                    RunPageLink = Code = field(Code);
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        REC.Reset;
                        REC.SetRange(Code, REC.Code);
                        Report.Run(70124, true, true, Rec);
                        FileDirectoryX := 'C:\SCM\Tender\' + REC."IFS Code" + '\';
                        //     // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileNameX := REC."IFS Code" + '_5_Financial.pdf';
                        if FILE.Exists(FileDirectoryX + FileNameX) then
                            FILE.Erase(FileDirectoryX + FileNameX);//51217
                                                                   //     //MERGE PDF
                        FileDirectory := 'C:\SCM\Tender\' + REC."IFS Code" + '\';
                        //     //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName := REC."IFS Code" + '_5_Financial.pdf';
                        Report.SaveAsPdf(70124, FileDirectory + FileName, Rec);
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
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                        // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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
                action("Suggest Technical Passed Bids")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Technical Passed Bids';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Procurement.SuggestFinanceEvaluationCriteria(Rec);
                        Message('Bids Suggested Successfully');
                    end;
                }
                action("Suggest RFQ Bids")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest RFQ Bids';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Procurement.FnSuggestRFQBids(Rec, PurchaseHeader);
                        Message('Bids Suggested Successfully');
                    end;
                }
                action("Escalated Bills")
                {
                    ApplicationArea = Basic;
                    Image = Bins;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Escalation Percentage";
                    RunPageLink = "Bid Register No" = field(Code),
                                  "IFS Code" = field("IFS Code");
                }
                action("Calculate Escalated Tender Sum ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate Escalated Tender Sum ';
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        ItemCategory: Record "Item Category";
                        BidEvaluationRegister: Record "Bid Evaluation Register";
                        EscalationPercentage: Record "Escalation Percentage";
                        PurchaseLine: Record "Purchase Line";
                        FinanceEvaluationLine: Record "Finance Evaluation Line";
                    begin
                    end;
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
                    var
                        FinanceEvaluationLine: Record "Finance Evaluation Line";
                    begin
                        // Rec.TestField(Posted,false);
                        FinanceEvaluationLine.Reset();
                        FinanceEvaluationLine.SetRange("Document ID", Rec.Code);
                        if FinanceEvaluationLine.FindSet() then begin
                            repeat
                                if FinanceEvaluationLine."Evaluation Committee Recomm" = FinanceEvaluationLine."Evaluation Committee Recomm"::" " then
                                    error('Please select the committee recommendation for bidder %1', FinanceEvaluationLine."Bidder Name");
                            until FinanceEvaluationLine.next() = 0;
                        end;
                        Rec.TestField("IFS Code");
                        Rec.TestField(Description);
                        Rec.TestField("Evaluation Date");
                        Rec.TestField("Appointed Bid Evaluation Commi");
                        Rec.TestField("Evaluation Lead");
                        if Rec."Purchaser Code" = '' then
                            error('Please choose the lead procurement officer');
                        Rec.TestField("Tender Evaluation Comm Remarks");
                        ///////// TESTFIELD(Posted, FALSE);
                        if Rec."Has Post Qualification" = Rec."has post qualification"::Yes then begin
                            Procurement.FnCreatePostQualification(Rec);
                        end;
                        if Rec."Has Post Qualification" = Rec."has post qualification"::No then begin
                            Procurement.FnPostFinanceEvaluation(Rec);
                        end;
                        if Rec."Has Post Qualification" = Rec."has post qualification"::" " then begin
                            Error('ERROR!!, Kindly specify if Post Qualification Evaluation is required for this tender');

                        end;
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  if ApprovalsMgmt.CheckBidEvaluationApprovalPossible(Rec) then
                        //    ApprovalsMgmt.OnSendBidEvaluationForApproval(Rec);

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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //  ApprovalsMgmt.OnCancelBidEvaluationApprovalRequest(Rec);
                        //  WorkflowWebhookMgt.FindAndCancel(RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Evaluation Type" := Rec."evaluation type"::"Financial Evaluation";
        Rec."Evaluator Category" := Rec."evaluator category"::"Evaluation Committee";
    end;

    var
        ///  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName: Text;
        FileDirectory: Text;
        percentage: Decimal;
        ItemCategory: Record "Item Category";
        BidEvaluationRegister: Record "Bid Evaluation Register";
        EscalationPercentage: Record "Escalation Percentage";
        PurchaseLine: Record "Purchase Line";
        FinanceEvaluationLine: Record "Finance Evaluation Line";
        PCT: Decimal;
}



