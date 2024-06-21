#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75372 "Archived IFP Award Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";

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
                field("Professional Opinion ID"; "Professional Opinion ID")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Report ID"; "Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Award Acceptance Response"; "Award Acceptance Response")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("IFP Code"; "IFP Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Raised By"; "Raised By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead';
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead Name';
                }
                field("Procurement Officer License No"; "Procurement Officer License No")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title"; "Designation/Title")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Tender Committee Role"; "Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; "Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm"; "Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com"; "Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control5; "IFP Response Line")
            {
                SubPageLink = "RFI Document No." = field("IFP Code");
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
                        //     ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("Print Regret Letter")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70045, true, true, Rec);
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
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70044, true, true, Rec);
                    end;
                }
                action("Send Results")
                {
                    //     ApplicationArea = Basic;
                    //     Image = SendEmailPDF;
                    //     Promoted = true;
                    //     PromotedCategory = Process;
                    //     Visible = false;

                    //     trigger OnAction()
                    //     begin
                    //         //MESSAGE('Sending');
                    //         RFIResponse.Reset;
                    //         RFIResponse.SetRange("RFI Document No.","IFP Code");
                    //         if RFIResponse.FindSet then begin
                    //             repeat
                    //          Vendors.Reset;
                    //          Vendors.SetRange("No.",RFIResponse."Vendor No.");
                    //          if Vendors.FindSet then begin
                    //          Vendors.TestField("E-Mail");

                    //         IFPResponseLine1.Reset;
                    //         IFPResponseLine1.SetRange("Document No.",RFIResponse."Document No.");
                    //         // IFPResponseLine.SETFILTER("Document No.",'<>%1',' ');
                    //         // IFPResponseLine.SETFILTER("Vendor No.",'<>%1',' ');
                    //         if IFPResponseLine1.FindSet then
                    //          // MESSAGE('Vendor %1',Vendors."E-Mail");
                    //          // MESSAGE('%1',IFPResponseLine."RFI Document No.");
                    //          // MESSAGE('Email %1',Vendors.Name);
                    //           CompInfo.Get;
                    //           ProcurementSetup.Get;
                    //           RequesterEmail:=ProcurementSetup."Default Proc Email Contact";
                    //           RequesterName:=ProcurementSetup."Default Proc Email Contact";
                    //           Window.Open('Sending...');
                    //           WindowisOpen := true;
                    //           //Create message
                    //         if ProcurementSetup."Default Proc Email Contact"='' then
                    //          Error('Please Contact the IT Admin to specify the E-mail address under Procurement Setup page!!');
                    //         SenderAddress:=ProcurementSetup."Default Proc Email Contact";
                    //         CustEmail:=Vendors."E-Mail";
                    //         CompanyDetails:='Dear Sir/Madam,<br>';
                    //         SenderMessage:='<BR>Thank you for Participating in the Prequalification Exercise<br/> Attached are the'
                    //         +' results for your Prequalification Application<br/><br/>';
                    //         SupplierDetails:='';
                    //         //SupplierDetails:='<table style="border:2px;"><tr><th><b>CATEGORY</B></th><th>&nbsp;&nbsp;</th><th><b>RESULT</b></th></tr><tr><td>'+IFPResponseLine1."Category Description"
                    //         //+'</td><td>&nbsp;&nbsp;'+IFPResponseLine1."Vendor No."+'</td><td>'+FORMAT(IFPResponseLine1."Evaluation Decision")+'</td></tr></table><br/><br/>';
                    //         LoginDetails:='If you require any assistance, please contact the Supply Chain Management Department<br/>';
                    //         ProcNote:='<BR> Regards';
                    //           RFIResponse2.Reset;
                    //           RFIResponse2.SetRange("Document No.",RFIResponse."Document No.");
                    //           if RFIResponse2.FindSet then
                    //           FileDirectory :=  'C:\DOCS\';
                    //           FileName := 'Prequalification_'+RFIResponse2."Document No."+'.pdf';
                    //         //   Report.SaveAsPdf(70110,FileDirectory+FileName,RFIResponse2);
                    //         if CustEmail='' then
                    //         exit;
                    //           //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                    //         emailhdr:=CompInfo.Name +' PREQUALIFICATION OUTCOME';
                    //         cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
                    //         CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails, true);
                    //         cu400.AddCC(RequesterEmail);
                    //         cu400.AddBodyline(ProcNote);
                    //         cu400.AddAttachment(FileDirectory+FileName,FileName);
                    //         cu400.Send;
                    //         SendingDate:=Today;
                    //         SendingTime:=Time;
                    //           Sleep(1000);
                    //           Window.Close;
                    //           //  UNTIL InsuranceReg.NEXT=0;
                    //           // END;
                    //           //MESSAGE('Notified on %1',Vendors."E-Mail");

                    //           end;
                    //         until RFIResponse.Next=0;
                    //         end;
                    //         //MESSAGE('Notified on this  %1',Vendors."E-Mail");
                    //         Message('Notified Successfully');
                    //         //MESSAGE('Done');
                    //     end;
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
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //      ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ///   ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //      ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    PromotedCategory = Category4;
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
                    PromotedCategory = Process;
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
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Procurement.FnNotifyTenderRegrets(Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Suite;
                    Caption = 'Notify';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.FnNotifySuppliers(Rec);

                        /*Purch.RESET;70181
                        Purch.SETRANGE("Document Type",Purch."Document Type"::"Blanket Order");
                        Purch.SETRANGE("Buy-from Vendor No.","Awarded Bidder No.");
                        IF purch.FINDSET THEN BEGIN
                        CopyPurchDoc.SetPurchHeader(Purch);
                            CopyPurchDoc.RUNMODAL;
                            CLEAR(CopyPurchDoc);
                        END;*/

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
                        //   if ApprovalsMgmt.CheckBidTabulationApprovalPossible(Rec) then
                        //    ApprovalsMgmt.OnSendBidTabulationForApproval(Rec);

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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //  ApprovalsMgmt.OnCancelBidTabulationApprovalRequest(Rec);
                        //  WorkflowWebhookMgt.FindAndCancel(RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        "Document Type" := "document type"::"Notice of Award";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Notice of Award";
        "Process Type" := "process type"::IFP;
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
        RFIResponse2: Record "RFI Response";
        RFIResponse: Record "RFI Response";
        IFPResponseLine1: Record "IFP Response Line";
        "Code": Code[10];
        ProcurementSetup: Record "Procurement Setup";
        Vendors: Record Vendor;
        InsCoverageLedgerEntry: Record "Ins. Coverage Ledger Entry";
        InsuranceReg: Record Insurance;
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit Mail;
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
}

