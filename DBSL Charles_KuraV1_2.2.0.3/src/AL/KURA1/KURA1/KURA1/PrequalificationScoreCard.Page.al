#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75187 "Prequalification Score Card"
{
    PageType = Card;
    SourceTable = "Prequalification Score Header";

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
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("IFP No."; "IFP No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Prequalification Response No."; "Prequalification Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Evaluation Te"; "Prequalification Evaluation Te")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Committee"; "Evaluation Committee")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead"; "Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name"; "Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category"; "Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Name"; "Category Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center"; "Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control28; "Prequalification Score Line")
            {
                Caption = 'Score Sheet';
                SubPageLink = "Evaluation Voucher ID" = field(Code);
            }
            group("Evaluation Results")
            {
                Caption = 'Evaluation Results';
                field("Final Evaluation Decision"; "Final Evaluation Decision")
                {
                    ApplicationArea = Basic;
                }
                field("System Evaluation Score %"; "System Evaluation Score %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Evaluation Committee Remarks"; "Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
            }
            systempart(Control25; Notes)
            {
            }
            systempart(Control26; MyNotes)
            {
            }
            systempart(Control27; Links)
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
                action("Evaluation Committee Members")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Tender Committee Member";
                    RunPageLink = "Document No." = field("Evaluation Committee");
                }
                action("Criteria Groups")
                {
                    ApplicationArea = Basic;
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bid evaluation Criteria Group";
                    RunPageLink = "Template ID" = field("Prequalification Evaluation Te");
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //    ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup36)
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
                action("Suggest Evaluation Criteria")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Evaluation Criteria';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestEvaluationCriteria(Rec);
                    end;
                }
                action("RFI Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document Type" = const("IFP Response"),
                                  "Document No" = field("Prequalification Response No."),
                                  "Vendor No" = field("Vendor No.");
                }
                action("Locations Applied")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No." = field("Prequalification Response No."),
                                  "Procurement Category" = field("Procurement Category"),
                                  "Vendor No" = field("Vendor No.");
                }
                action("Post Evaluation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Post Prequalification Evaluation';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.PostEvaluation(Rec);
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
                    Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*IF ApprovalsMgmt.CheckVendDebarmentApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendVendDebarmentForApproval(Rec);*/


                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        /*ApprovalsMgmt.OnCancelVendDebarmentApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

                    end;
                }
            }
            group("Vendor Details")
            {
                Caption = 'Vendor Details';
                Image = "Order";
                action("Vendor Special Group Entry")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    RunObject = Page "Vendor Special Group Entry";
                    RunPageLink = "Vendor No" = field("Vendor No.");
                }
                action("Vendor Bank Account List")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    //  RunObject = Page "Vendor Bank Account List";
                    //  RunPageLink = "Vendor No."=field("Vendor No.");
                }
                action("Vendor Business Owner")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Business Owner";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Litigation History";
                    //  RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Professional Staff";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Professional Staff")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Past Experience";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Audited Income Statemen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Audited Income Statement';
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Income Statemen";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Balance Sheet";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Single;
    end;

    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        IFPResponseLine: Record "IFP Response Line";
}

