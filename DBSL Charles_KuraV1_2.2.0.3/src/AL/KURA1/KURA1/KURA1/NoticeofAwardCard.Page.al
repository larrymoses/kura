
Page 75281 "Notice of Award Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Release/Reopen,Release,Navigate,Notice of Award,Appeal,Notify,Post,Security';
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Professional Opinion ID"; Rec."Professional Opinion ID")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Final Evaluation Report ID"; Rec."Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Editable=false;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                group("Awarded Winner")
                {
                    Caption = 'Awarded Winner';
                    field("Awarded Bid No"; Rec."Awarded Bid No")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                    }
                    field("Awarded Bidder No."; Rec."Awarded Bidder No.")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                    }
                    field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                    }
                    field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                    }
                    field("Award Acceptance Response"; Rec."Award Acceptance Response")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                        ShowMandatory = true;
                    }
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                group("Holding Period Details")
                {
                    Caption = 'Holding Period Details';
                    field("Min. Contract Holding"; Rec."Min. Contract Holding")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Earliest Contract Issuance Dt"; Rec."Earliest Contract Issuance Dt")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                       // Editable = false;
                    }
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Notice of Award Lines")
            {
                Editable =false;
                Caption = 'All Bids';
                SubPageLink = "Tabulation ID" = field(Code);
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
                        //    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                action("IFS Appeal Entries")
                {
                    ApplicationArea = Basic;
                    Image = ViewWorksheet;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "IFS Appeal Entries";
                    RunPageLink = "IFS Code" = field(Code);
                }
                action(Securities)
                {
                    ApplicationArea = Basic;
                    Image = ViewRegisteredOrder;
                    Promoted = true;
                    PromotedCategory = Category12;
                    PromotedIsBig = true;
                    RunObject = Page "Bid_Contract Security Register";
                    RunPageLink = "IFS No" = field("IFS Code"),
                                  "Vendor No." = field("Awarded Bidder No."),
                                  "No." = field("Awarded Bid No");
                }
                action("Print Intention to Award Letter")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70114, true, false, Rec);
                    end;
                }
                action("Print Award Letter")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70044, true, false, Rec);
                    end;
                }
                action("Print Regret Letter")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";
                    trigger OnAction()
                    var
                    BidTabulationLine: Record "Bid Tabulation Line";
                    begin
                        BidTabulationLine.Reset;
                        BidTabulationLine.SetRange("Tabulation ID", Rec.Code);
                        Report.Run(Report::"IFS Regret Letter", true, false, BidTabulationLine);
                    end;
                }
            }
        }
        area(processing)
        {
            
            group(ActionGroup30)
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
                action("Document Appeals")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Send E-Award Letter")
                {
                    ApplicationArea = Suite;
                    Caption = 'Send E-Award Letter';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Category10;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.FnNotifyTenderAwarded(Rec);
                    end;
                }
                action("Send E-Regret Letter")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Category10;

                    trigger OnAction()
                    begin
                        Procurement.FnNotifyTenderRegrets(Rec);
                    end;
                }
                action("Create Purchase Contract")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create LPO/LSO/Contract';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Category11;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status",Rec."Approval Status"::Released);
                        Rec.TestField("Award Acceptance Deadline");
                        Rec.TestField(Description);
                        Rec.TestField("IFS Code");
                        Rec.TestField("Awarded Bidder No.");
                        Rec.TestField("Awarded Bid No");
                        Procurement.PostNoticeOfAWard(Rec);


                    end;
                }
            }
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
                        BidTabulationLine: Record "Bid Tabulation Line";
                    begin
                        Rec.Testfield("Award Acceptance Deadline");
                        Rec.TestField(Description);
                        Rec.TestField("Professional Opinion ID");
                        Rec.TestField("Final Evaluation Report ID");
                        Rec.TestField("Tender Name");
                        Rec.TestField("Awarded Bid No");
                        Rec.TestField("Award Tender Sum Inc Taxes");
                        Rec.TestField("Awarded Bidder No.");
                        BidTabulationLine.Reset();
                        BidTabulationLine.SetRange("Tabulation ID", Rec.Code);
                        if BidTabulationLine.FindSet() then begin
                            repeat
                                BidTabulationLine.TestField("Bidder No");
                                BidTabulationLine.TestField("Bidder Name");
                            until BidTabulationLine.next() = 0;
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Notice of Award";
        Rec."Process Type" := Rec."process type"::IFS;
    end;

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
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        Purch: Record "Purchase Header";
        CopyPurchDoc: Report "Copy Purchase Document";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

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



