
Page 75278 "Proffesion Opinion Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release,Navigate,Profession Opinion,Notify,Notice of Award,Committee';
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
                    Editable = true;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead';
                    Editable = true;// TO BE 
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead Name';
                    Editable = true;//CC TO BE EDITED
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Procurement Officer License No"; Rec."Procurement Officer License No")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    ShowMandatory =true;
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ShowMandatory =true;
                }
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Final Evaluation Report ID"; Rec."Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ShowMandatory =true;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                group("Awarded Winner")
                {
                    Caption = 'Awarded Winner';
                    field("Awarded Bid No"; Rec."Awarded Bid No")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                        ShowMandatory =true;
                    }
                    field("Awarded Bidder No."; Rec."Awarded Bidder No.")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Award Acceptance Response"; Rec."Award Acceptance Response")
                    {
                        ApplicationArea = Basic;
                        Visible=false;
                    }
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    visible = false;
                }
                group("Key Statistics")
                {
                    Caption = 'Key Statistics';
                    field("No of submitted bids"; Rec."No of submitted bids")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Opened Bids(Tech)"; Rec."No of Opened Bids(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Opened Bids(Finance)"; Rec."No of Opened Bids(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Responsive(Tech)"; Rec."No of Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of non- Responsive(Tech)"; Rec."No of non- Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Responsive(Finance)"; Rec."No of Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of non- Responsive(Finance)"; Rec."No of non- Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("<General Procurement Remarks>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Proffessional Opinion Remarks';
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("General Procurement Remarks");
                        "General Procurement Remarks".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("General Procurement Remarks");
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         "General Procurement Remarks".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                         //MODIFY;
                        END;*/

                    end;
                }
                field("General Procurement Remarks"; Rec."General Procurement Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proffessional Opinion Remarks';
                    Editable = noa;
                    MultiLine = true;
                    ShowMandatory =true;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("General Procurement Remarks");
                        "General Procurement Remarks".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("General Procurement Remarks");
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         "General Procurement Remarks".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                         //MODIFY;
                        END;*/

                    end;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    Editable = NOA1;
                    MultiLine = true;
                }
                field("Reason for Tender Termination"; Rec."Reason for Tender Termination")
                {
                    ApplicationArea = Basic;
                    Editable = NOA1;
                    MultiLine = true;
                }
                field("Head Of Procurement Remarks"; Rec."Head Of Procurement Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory =true;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
            part(Control20; "Proffesion Opinion Lines")
            {
                Editable = noa;
                SubPageLink = "Tabulation ID" = field(Code);
            }
            group("Procurement Plan Details")
            {
                Caption = 'Procurement Plan Details';
                Editable = false;
                field("Annual Procurement Plan ID"; Rec."Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Date"; Rec."Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Sourcing History")
            {
                Caption = 'Sourcing History';
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date"; Rec."Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm"; Rec."Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com"; Rec."Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control76; Notes)
            {
            }
            systempart(Control77; Links)
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ///////////////////         // ApprovalsMgmt.OpenApprovalEntriesPage(RecordID);
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
                action(AttachDocument)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        DMSManagement.UploadOpinionDocuments(DMSDocuments."document type"::IFS, Rec.Code, 'Professional Opinion', Rec.RecordId, Rec."Primary Region");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    trigger OnAction()
                    var
                        //  DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        //   RecRef.GetTable(Rec);
                        //   DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        //  DocumentAttachmentDetails.RunModal;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    Var
                    BidTabulationHeader: Record "Bid Tabulation Header";
                    begin
                        BidTabulationHeader.Reset();
                        BidTabulationHeader.SetRange(Code, Rec.Code);
                        if BidTabulationHeader.FindFirst() then
                        Report.Run(Report::"Professional Opinion Report", true, true,BidTabulationHeader);
                    end;
                }
                action("Print Opinion")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70099, true, true, Rec);
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
                    PromotedCategory = Category6;
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
                    PromotedCategory = Category6;
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
                action("Suggest Final Evaluation Reports")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Final Evaluation Reports';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Report;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestProffesionOpinion(Rec);
                    end;
                }
                action("Proceed To Notice Of Award")
                {
                    ApplicationArea = Suite;
                    Caption = 'Proceed To Notice Of Award';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Category10;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = corec;

                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status",Rec."Approval Status"::Released);
                        Procurement.PostProffesionOpinion(Rec);
                    end;
                }
                    action(OpeningCommittee)
                {
                    ApplicationArea = Suite;
                    Caption = 'Opening Committee';
                    Ellipsis = true;
                    Image = ResourceGroup;
                    Promoted = true;
                    PromotedCategory = Category11;
                     RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),Type=const("Bid Opening");
                }
                action(Committee)
                {
                    ApplicationArea = Suite;
                    Caption = 'Evaluation Committee';
                    Ellipsis = true;
                    Image = ResourceGroup;
                    Promoted = true;
                    PromotedCategory = Category11;
                     RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),Type=const(Evaluation);
                }
                action("Create LPO/LSO")
                {
                    ApplicationArea = Basic;
                    //  Enabled = Rec.Published = false;
                    Image = PrintCover;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = Rec."Approval Status" = Rec."Approval Status"::Released;

                    trigger OnAction()
                    begin
                        Rec.TestField(rec."Awarded Bid No");
                        Rec.TestField(rec."Awarded Bidder Name");
                        Procurement.FnGenerateLPODirect1(Rec);
                    end;
                }
                action("Submit Opinion")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = noa;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure to submit the Opinion ?') = true then begin
                            Rec.TestField("Document Status", Rec."document status"::Active);
                            Rec."Document Status" := Rec."document status"::Submitted;
                        end;
                    end;
                }
                action("Approve Opinion")
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = NOA1;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure to Approve ?') = true then begin
                            Rec.TestField("Document Status", Rec."document status"::Submitted);
                            Rec."Document Status" := Rec."document status"::Approved;
                            Message('Opinion Approved');
                        end;
                    end;
                }
                action("Reject Opinion")
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = NOA1;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure to Reject ?') = true then begin
                            Rec.TestField("Document Status", Rec."document status"::Submitted);
                            Rec.TestField("Reason for Rejection");
                            Rec."Document Status" := Rec."document status"::Rejected;
                            Message('Opinion Rejected');
                        end;
                    end;
                }
                action("Terminate Tender")
                {
                    ApplicationArea = Basic;
                    Image = TerminationDescription;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = NOA1;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure to Terminate the Tender Process ?') = true then begin
                            Rec.TestField("Document Status", Rec."document status"::Submitted);
                            Rec.TestField("Reason for Tender Termination");
                            Rec."Document Status" := Rec."document status"::Terminated;
                            Message('Tender Terminated');
                        end;
                    end;
                }
                action("View Evaluation Report")
                {
                    ApplicationArea = Basic;
                    Image = ViewOrder;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Final Evaluation Report Card";
                    RunPageLink = Code = field("Final Evaluation Report ID");
                }
                action("Notify The Secretary/Chairperson")
                {
                    ApplicationArea = Basic;
                    Image = Evaluate;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Document Status", Rec."document status"::Rejected);
                        Rec.TestField("Head Of Procurement Remarks");
                        //Modify The Last Evaluation Verion No. in IFS(173);
                        ObjProcProcess.FnModifyIFSFromRejectedProfessionalOpinion(Rec);
                        //Notify Evaluation Comm to start Reevaluation
                        ObjProcProcess.FnSendBidRe_EvaluationNotificationFromRejectedProfessionalOpinionSecChair(Rec);


                        BidEvaluationRegister.Reset;
                        BidEvaluationRegister.SetRange(BidEvaluationRegister.Code, Rec."Final Evaluation Report ID");
                        if BidEvaluationRegister.FindSet then begin
                            BidEvaluationRegister."Re_Evaluate?" := true;
                            BidEvaluationRegister.Modify(true);
                        end;
                    end;
                }
                action("Proceed To Notice of Awards")
                {
                    ApplicationArea = Suite;
                    Caption = 'Proceed To Notice Of Award';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Category10;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status",Rec."Approval Status"::Released);
                        Procurement.PostProffesionOpinion(Rec);
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
                        Rec.TestField("Designation/Title");
                        Rec.TestField("Procurement Officer License No");
                        Rec.TestField("General Procurement Remarks");
                        Rec.TestField("Head Of Procurement Remarks");
                        BidTabulationLine.Reset();
                        BidTabulationLine.SetRange("Tabulation ID",Rec.Code);
                        if BidTabulationLine.FindSet() then begin
                            repeat
                            BidTabulationLine.TestField("Procurement Head Comments");
                            until BidTabulationLine.Next() =0;
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

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
        noa := false;
        if Rec."Document Status" = Rec."document status"::Active then begin
            noa := true
        end;
        NOA1 := false;
        if Rec."Document Status" = Rec."document status"::Submitted then begin
            NOA1 := true
        end;
        corec := false;
        if Rec."Document Status" = Rec."document status"::Approved then begin
            corec := true
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        noa := false;
        if Rec."Document Status" = Rec."document status"::Active then begin
            noa := true
        end;
        NOA1 := false;
        if Rec."Document Status" = Rec."document status"::Submitted then begin
            NOA1 := true
        end;
        corec := false;
        if Rec."Document Status" = Rec."document status"::Approved then begin
            corec := true
        end;
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Professional Opinion";
        Rec."Process Type" := Rec."process type"::IFS;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        noa := false;
        if Rec."Document Status" = Rec."document status"::Active then begin
            noa := true
        end;
        NOA1 := false;
        if Rec."Document Status" = Rec."document status"::Submitted then begin
            NOA1 := true
        end;
        corec := false;
        if Rec."Document Status" = Rec."document status"::Approved then begin
            corec := true
        end;
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
        noa: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        corec: Boolean;
        NOA1: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        ObjProcProcess: Codeunit "Procurement Processing";
        BidEvaluationRegister: Record "Bid Evaluation Register";
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



