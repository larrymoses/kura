#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75275 "Final Evaluation Report Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";
    SourceTableView = where("Notify Chairman" = filter(false));
    PromotedActionCategories = 'New,Process,Report,Committees,Release/ReOpen,Attachment,Post,Evaluation Report,Request Approval,Suggest E-Bids,Submit,Approvals';
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
                field("Financial Evaluation ID"; Rec."Financial Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Program Title"; Rec."Program Title")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Officer License No"; Rec."Procurement Officer License No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("<General Procurement Remarks>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Committee Remarks';
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
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
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
                    Editable = true;
                }
                group("New Evaluation Details")
                {
                    Caption = 'Re-Evaluation Details';
                    field("New Venue"; Rec."New Venue")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Re-Evaluation Venue';
                    }
                    field("New Evaluation Date"; Rec."New Evaluation Date")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Re-Evaluation Date';
                    }
                    field("New Evaluation Time"; Rec."New Evaluation Time")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Re-Evaluation Time';
                    }
                    field("Last Evaluation Version No."; Rec."Last Evaluation Version No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Evaluation No';
                    }
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
                    field("No of Responsive(Preliminary)"; Rec."No of Responsive(Preliminary)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of non- Responsive(Prelim)"; Rec."No of non- Responsive(Prelim)")
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
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Final Evaluation Report Line")
            {
                SubPageLink = "Tabulation ID" = field(Code);
            }
            group("Evaluation Report Details")
            {
                Caption = 'Evaluation Report Details';
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Location of Project"; Rec."Location of Project")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Extent of Contract"; Rec."Extent of Contract")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Invitation to Tender"; Rec."Invitation to Tender")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Prebid Site Visit & Meeting"; Rec."Prebid Site Visit & Meeting")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Bid Notices"; Rec."Bid Notices")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
            group(Control78)
            {
                field("Chairmans Comments"; Rec."Chairmans Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Chairperson''s Comments';
                }
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
                        //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                action("Attach Executive Summary")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        // DMSManagement.UploadEvalReportsAppendix1(DMSDocuments."document type"::IFS,Code,'Final Evaluation Report',RecordId,"Primary Region","IFS Code");
                    end;
                }
                action("Attach Appendix")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        //    DMSManagement.UploadEvalReportsAppendix2(DMSDocuments."document type"::IFS,Code,'Final Evaluation Report',RecordId,"Primary Region","IFS Code");
                    end;
                }
                action(AttachDocument)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        //   DMSManagement.UploadEvalReportsrDocuments(DMSDocuments."document type"::IFS,Code,'Final Evaluation Report',RecordId,"Primary Region");
                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //   DMSManagement.UploadEvalreportDocuments(Code,'Record',RecordId,"Primary Region");
                        //UploadEvalReportsrDocuments
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    trigger OnAction()
                    var
                    //DocumentAttachmentDetails: Page "Document Attachment Details";
                    // RecRef: RecordRef;
                    begin
                        //RecRef.GetTable(Rec);
                        //DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        //DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("Print Final Evaluation Report")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";
                    trigger OnAction()
                    var
                        FileName: Text;
                        FileDirectory: Text;
                    begin
                        REC.RESET;
                        REC.SETRANGE(Code, Rec.Code);
                        Report.Run(70043, true, true, Rec);
                        //   Report.Run(70123, true, true, Rec);
                        FileDirectoryX := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileNameX := rec."IFS Code" + '_6_Final.pdf';

                        // MERGE PDF
                        FileDirectory := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        // D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName := rec."IFS Code" + '_6_Final.pdf';
                        Report.SaveAsPdf(70043, FileDirectory + FileName, Rec);

                    end;

                }
                action("Print Executive Summary")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    var
                        FileName: Text;
                        FileDirectory: Text;
                    begin
                        REC.RESET;
                        REC.SETRANGE(Code, Rec.Code);
                        REPORT.RUN(70123, TRUE, TRUE, Rec);
                        //   Report.Run(70123, true, true, Rec);
                        FileDirectoryX := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileNameX := rec."IFS Code" + '_1_Executive.pdf';

                        // MERGE PDF
                        FileDirectory := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        // D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName := rec."IFS Code" + '_1_Executive.pdf';
                        Report.SaveAsPdf(70123, FileDirectory + FileName, Rec);
                    end;
                }
                action("Generate Evaluation Report")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    var
                        FileName: Text[250];
                        FileDirectory: Text;
                    begin
                        if Confirm('Are you sure to generate the evaluation Report ?', true) then begin
                            //GeneratePostQualifcation();
                            IFSPurchaseCode.Reset;
                            IFSPurchaseCode.SetRange(Code, rec."IFS Code");
                            if IFSPurchaseCode.FindSet then
                                Versn := (IFSPurchaseCode."Last Evaluation Version No." - 2);
                            if Versn > 0 then begin
                                //Delete prevevious
                                FileDirectoryX := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                                FileNameX := rec."IFS Code" + '_F' + Format(Versn) + '_FinalEvaluationRprt.pdf';
                                if FILE.Exists(FileDirectoryX + FileNameX) then
                                    FILE.Erase(FileDirectoryX + FileNameX);
                            end;
                            //End of deleting previous
                            // GenerateFinalReport();
                            Version := Format(IFSPurchaseCode."Last Evaluation Version No.");
                            FileDirectoryX1 := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                            FileNameX1 := rec."IFS Code" + '_F' + Format(Version) + '_FinalEvaluationRprt.pdf';
                            if FILE.Exists(FileDirectoryX1 + FileNameX1) then
                                FILE.Erase(FileDirectoryX1 + FileNameX1);

                            FileName := rec."IFS Code" + '_F' + Version + '_FinalEvaluationRprt.pdf';

                            //  Statuses := MergePDF.fnMergePdfs(rec."IFS Code", rec."IFS Code");

                            if Statuses = 'true' then begin

                                Message('Evaluation report merged Successfully');
                                ////////////////////////////////////////////////////////////////////////////////////////  
                                //EXIT(status);
                                DMSManagement.CreateEvaluationReportLink(rec.Code, xRec.RecordId, rec."IFS Code", Version);
                            end else begin
                                Message('Documents not merged');
                            end;


                        end;
                        //CreateEvaluationReportLink
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
                action(Submit)
                {
                    ApplicationArea = Suite;
                    Caption = 'Submit To HOD';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Category11;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin

                        if Rec."Document Status" = Rec."document status"::Submitted then begin
                            Message('The report has already been Submitted');
                        end;
                        if Rec."Document Status" <> Rec."document status"::Submitted then begin
                            Rec.TestField("General Procurement Remarks");
                            Rec."Document Status" := Rec."document status"::Submitted;
                            Rec.Modify(true);

                            Message('Submitted Successfully');
                        end;

                        Procurement.FnSendEvaluationNotification(Rec);
                        // END;
                        //IF code
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
                    end;
                }
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
                action("Opening Committee Members")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),
                                  Type = const("Bid Opening");
                }
                action("Evaluation Committee Members")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),
                                  Type = const(Evaluation);
                }
                action("Suggest E-bids")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest E-bids';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Category10;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestFinalEvalReport(Rec);
                    end;
                }
                action("Import Manual Bids")
                {
                    ApplicationArea = Basic;
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = XMLport "Import Manual Bids";
                }
                action("Proceed To Proffesional Opinion")
                {
                    ApplicationArea = Suite;
                    Caption = 'Proceed To Proffesional Opinion';
                    Ellipsis = true;
                    Image = PostDocument;
                    Enabled  = Rec."Approval Status" =Rec."Approval Status"::Released;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status",Rec."Approval Status"::Released);
                        // TESTFIELD("Procurement Officer License No");
                        Procurement.PostFinalEvaluationReport(Rec);
                    end;
                }
                action("Notify Committee Members")
                {
                    ApplicationArea = Suite;
                    Caption = 'Notify Committee Members';
                    Ellipsis = true;
                    Image = Notes;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("New Evaluation Date");
                        Rec.TestField("New Evaluation Time");
                        Rec.TestField("New Venue");
                        Procurement.FnSendBidRe_EvaluationNotificationFromRejectedProfessionalOpinionAll(Rec);

                        //Set Document Status To Rejected in the FInal Evaluation Report
                    end;
                }
                action("Submit To Chairperson")
                {
                    ApplicationArea = Suite;
                    Caption = 'Submit To Chairperson';
                    Ellipsis = true;
                    Image = Notes;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = true;

                    trigger OnAction()
                    begin
                        // TESTFIELD("New Evaluation Date");
                        // TESTFIELD("New Evaluation Time");
                        // TESTFIELD("New Venue");
                        Procurement.FnSendBidRe_EvaluationNotificationFromRejectedProfessionalOpinionChairperson(Rec);
                        Rec."Notify Chairman" := true;
                        //Set Document Status To Rejected in the FInal Evaluation Report
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
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        BidTabulationLine: Record "Bid Tabulation Line";
                    begin
                        Rec.TestField("IFS Code");
                        Rec.TestField("Program Title");
                        Rec.TestField("General Procurement Remarks");
                     BidTabulationLine.Reset();
                     BidTabulationLine.SetRange("Tabulation ID",Rec.Code);
                     if BidTabulationLine.FindSet() then begin
                        repeat
                        if BidTabulationLine."Evaluation Committee Recomm" = BidTabulationLine."Evaluation Committee Recomm"::" " then
                        error('Please select the committee recommendation for bidder %1',BidTabulationLine."Bidder Name");
                        until BidTabulationLine.Next()=0;
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
                    PromotedCategory = Category9;
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
                      PromotedCategory = Category9;

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
                    PromotedCategory = Category9;
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
                    PromotedCategory = Category9;
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
                    PromotedCategory = Category9;
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
                    PromotedCategory = Category9;
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
        licenseno := false;
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            licenseno := true;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        licenseno := false;
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            licenseno := true;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Evaluation Report";
        Rec."Process Type" := Rec."process type"::IFS;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        licenseno := false;
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            licenseno := true;
        end;
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
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        MergePDF: Codeunit MergeCurriculum;
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName1: Text;
        FileName2: Text;
        FileName3: Text;
        FileName4: Text;
        FileName5: Text;
        FileName6: Text;
        FileName7: Text;
        FileName8: Text;
        FileName61: Text;
        FileName71: Text;
        FileName62: Text;
        FileDirectoryX1: Text;
        FileNameX1: Text;
        FileDirectory1: Text;
        FileName31: Text;
        FileName41: Text;
        FileName51: Text;
        FileName66: Text;
        FileName76: Text;
        FileDirectory: Text;
        TestFile: File;
        Statuses: Text[250];
        IFSPurchaseCode: Record "Standard Purchase Code";
        Version: Text[30];
        Versn: Integer;
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

    local procedure GeneratePostQualifcation()
    begin
        // if TestFile.Create('C:\TestFolder\TestFile.txt') then begin
        //      Message('%1 is created', TestFile.Name)
        //  end
        //  else
        //     Error('The file could not be created');
        //  //First Combine
        // FileDirectoryX1:='C:\SCM\Tender\';
        // FileNameX1:="IFS Code"+'PostQualification2.pdf';
        //  IF FILE.EXISTS(FileDirectoryX1+FileNameX1) THEN
        //  FILE.ERASE(FileDirectoryX1+FileNameX1);//51217
        // FileDirectory1:='C:\SCM\Tender\';
        // FileName61:="IFS Code"+'PostQualification.pdf';
        // FileName71:="IFS Code"+'Appendix.pdf';
        // FileName62:="IFS Code"+'PostQualification2.pdf';
        // FileName31:='Preliminary2.pdf';
        // FileName41:='Technical2.pdf';
        // FileName51:='Financial2.pdf';
        // FileName66:='PostQualificatio.pdf';
        // FileName76:='Appendix2.pdf';
        // MergePDF.MergeFiles(FileDirectory1+FileName61,FileDirectory1+FileName71,FileDirectory1+FileName31,FileDirectory1+FileName41,FileDirectory1+FileName51,FileDirectory1+FileName66,
        // FileDirectory1+FileName76,FileDirectory1+FileName62);
        //  //end First Combine
    end;

    local procedure GenerateFinalReport()
    begin


        // FileDirectoryX := 'C:\SCM\Tender\';
        // // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
        // FileNameX := "IFS Code" + 'FinalEvaluationRprt.pdf';
        // if FILE.Exists(FileDirectoryX + FileNameX) then
        //     FILE.Erase(FileDirectoryX + FileNameX);//51217

        // FileDirectory := 'C:\SCM\Tender\';
        // FileName1 := "IFS Code" + 'Executive.pdf';
        // FileName2 := "IFS Code" + 'Opening.pdf';
        // FileName3 := "IFS Code" + 'Preliminary.pdf';
        // FileName4 := "IFS Code" + 'Technical.pdf';
        // FileName5 := "IFS Code" + 'Financial.pdf';
        // FileName6 := "IFS Code" + 'PostQualification.pdf';
        // FileName7 := "IFS Code" + 'Appendix.pdf';
        // FileName8 := "IFS Code" + 'FinalEvaluationRprt.pdf';
        // MergePDF.MergeFiles(FileDirectory + FileName1, FileDirectory + FileName2, FileDirectory + FileName3, FileDirectory + FileName4, FileDirectory + FileName5, FileDirectory + FileName6,
        // FileDirectory + FileName7, FileDirectory + FileName8);
        // Message('Final evaluation report Generated Successfully');
    end;
}

#pragma implicitwith restore

