#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75303 "IAC Committee Card"
{
    //     // PageType = Card;
    //     // SourceTable = "IFS Tender Committee";

    //     // layout
    //     // {
    //     //     area(content)
    //     //     {
    //     //         group(General)
    //     //         {
    //     //             field("Document No .";"Document No.")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Committee Typ e";"Committee Type")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Project I D";"Project ID")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Project Nam e";"Project Name")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field(Descripti on;Description)
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Document Dat e";"Document Date")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Appointment Effective Dat e";"Appointment Effective Date")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Appointing Authorit y";"Appointing Authority")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Inspection Dat e";"Inspection Date")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Inspection Venu e";"Inspection Venue")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field(Durati on;Duration)
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //                 Caption = 'Committe Duration(Days)';
    //     //             }
    //     //             field("Shortcut Dimension 1 Cod e";"Shortcut Dimension 1 Code")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Shortcut Dimension 2 Cod e";"Shortcut Dimension 2 Code")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Raised B y";"Raised By")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field(Na me;Name)
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Staff I d";"Staff Id")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field(Designati on;Designation)
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Primary Regio n";"Primary Region")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Primary Directorat e";"Primary Directorate")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Primary Departmen t";"Primary Department")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Min Required No. of Member s";"Min Required No. of Members")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Actual No. of Committee Mem b";"Actual No. of Committee Memb")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Approval Statu s";"Approval Status")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Created B y";"Created By")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Created Dat e";"Created Date")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //             field("Created Tim e";"Created Time")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //             }
    //     //         }
    //     //         part(Control 23;"IAC Committee Member")
    //     //         {
    //     //             Caption = 'Committee Members';
    //     //             SubPageLink = "Document N = ."=field("Document No."),
    //     //                           "Committee Ty = e"=field("Committee Type");
    //     //         }
    //     //     }
    //     //     area(factboxes)
    //     //     {
    //     //         systempart(Control 19;Outlook)
    //     //         {
    //     //         }
    //     //         systempart(Control 20;Notes)
    //     //         {
    //     //         }
    //     //         systempart(Control 21;MyNotes)
    //     //         {
    //     //         }
    //     //         systempart(Control 22;Links)
    //     //         {
    //     //         }
    //     //     }
    //     // }

    //     // actions
    //     // {
    //     //     area(navigation)
    //     //     {
    //     //         group(IFP)
    //     //         {
    //     //             Caption = 'IFP';
    //     //             Image = "Order";
    //     //             action(Dimensions)
    //     //             {
    //     //                 AccessByPermission = TableData Dimens = on=R;
    //     //                 ApplicationArea = Dimensions;
    //     //                 Caption = 'Dimensions';
    //     //                 Image = Dimensions;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category8;
    //     //                 PromotedIsBig = true;
    //     //                 ShortCutKey = 'Shift+Ctrl+D';
    //     //                 ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

    //     //                 trigger OnAction()
    //     //                 begin
    //     //                     ShowDocDim;
    //     //                     CurrPage.SaveRecord;
    //     //                 end;
    //     //             }
    //     //             action(Approvals)
    //     //             {
    //     //                 AccessByPermission = TableData "Approval Ent = y"=R;
    //     //                 ApplicationArea = Suite;
    //     //                 Caption = 'Approvals';
    //     //                 Image = Approvals;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category8;
    //     //                 ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
    //     //                 begin
    //     //                     ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
    //     //                 end;
    //     //             }
    //     //             action("Co&mments")
    //     //             {
    //     //                 ApplicationArea = Comments;
    //     //                 Caption = 'Co&mments';
    //     //                 Image = ViewComments;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category8;
    //     //                 RunObject = Page "Purch. Comment Sheet";
    //     //                 RunPageLink = "N = ."=field("Document No.");
    //     //                 ToolTip = 'View or add comments for the record.';
    //     //             }
    //     //             action(DocAttach)
    //     //             {
    //     //                 ApplicationArea = All;
    //     //                 Caption = 'Attachments';
    //     //                 Image = Attach;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category8;
    //     //                 ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
    //     //                 Visible = false;

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     DocumentAttachmentDetails: Page "Document Attachment Details";
    //     //                     RecRef: RecordRef;
    //     //                 begin
    //     //                     RecRef.GetTable(Rec);
    //     //                     DocumentAttachmentDetails.OpenForRecRef(RecRef);
    //     //                     DocumentAttachmentDetails.RunModal;
    //     //                 end;
    //     //             }
    //     //             action("Appointment Letter")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //                 Image = Print;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = "Report";
    //     //             }
    //     //         }
    //     //         action("Attach Documents")
    //     //         {
    //     //             ApplicationArea = Basic;
    //     //             Caption = 'Attach Documents';
    //     //             Image = Attach;
    //     //             Promoted = true;
    //     //             PromotedCategory = Process;
    //     //             PromotedIsBig = true;
    //     //             PromotedOnly = true;

    //     //             trigger OnAction()
    //     //             begin
    //     //                 //DMSManagement.UploadIFSCommitteeDocuments("Document No.",'Committee',RECORDID,"Primary Region");
    //     //                 if "Primary Regi = '' then
    //                         "Primary Region" := ":='R48';
    //     //                 //DMSManagement.UploadStaffClaimDocuments(DMSDocuments."Document Type"::IFS,"Document No.",'Committee Appointment',RECORDID,"Primary Region");
    //     //                 TestField("Shortcut Dimension 1 Code");
    //     //                 DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Staff Clai "Document No.", 'Staff Claim', RecordId, Id,"Shortcut Dimension 1 Code");
    //     //             end;
    //     //         }
    //     //     }
    //     //     area(processing)
    //     //     {
    //     //         group(Approval)
    //     //         {
    //     //             Caption = 'Approval';
    //     //             action(Approve)
    //     //             {
    //     //                 ApplicationArea = Suite;
    //     //                 Caption = 'Approve';
    //     //                 Image = Approve;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category4;
    //     //                 PromotedIsBig = true;
    //     //                 PromotedOnly = true;
    //     //                 ToolTip = 'Approve the requested changes.';
    //     //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     //                 begin
    //     //                     ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
    //     //                 end;
    //     //             }
    //     //             action(Reject)
    //     //             {
    //     //                 ApplicationArea = Suite;
    //     //                 Caption = 'Reject';
    //     //                 Image = Reject;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category4;
    //     //                 PromotedIsBig = true;
    //     //                 PromotedOnly = true;
    //     //                 ToolTip = 'Reject the requested changes.';
    //     //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     //                 begin
    //     //                     ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
    //     //                 end;
    //     //             }
    //     //             action(Delegate)
    //     //             {
    //     //                 ApplicationArea = Suite;
    //     //                 Caption = 'Delegate';
    //     //                 Image = Delegate;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category4;
    //     //                 PromotedOnly = true;
    //     //                 ToolTip = 'Delegate the requested changes to the substitute approver.';
    //     //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     //                 begin
    //     //                     ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
    //     //                 end;
    //     //             }
    //     //             action(Comment)
    //     //             {
    //     //                 ApplicationArea = Suite;
    //     //                 Caption = 'Comments';
    //     //                 Image = ViewComments;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category4;
    //     //                 PromotedOnly = true;
    //     //                 ToolTip = 'View or add comments for the record.';
    //     //                 Visible = OpenApprovalEntriesExistForCurrUser;

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     //                 begin
    //     //                     ApprovalsMgmt.GetApprovalComment(Rec);
    //     //                 end;
    //     //             }
    //     //         }
    //     //         group(ActionGroup33)
    //     //         {
    //     //             Caption = 'Release';
    //     //             Image = ReleaseDoc;
    //     //             action(Release)
    //     //             {
    //     //                 ApplicationArea = Suite;
    //     //                 Caption = 'Re&lease';
    //     //                 Enabled = "Approval Status" = "Approval Status"::open;
    //     //                 Image = ReleaseDoc;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category5;
    //     //                 PromotedIsBig = true;
    //     //                 PromotedOnly = true;
    //     //                 ShortCutKey = 'Ctrl+F9';
    //     //                 ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ReleasePurchDoc: Codeunit "Release Approval Document";
    //     //                 begin
    //     //                     ReleasePurchDoc.ReleaseTenderCommitte(Rec);
    //     //                 end;
    //     //             }
    //     //             action(Reopen)
    //     //             {
    //     //                 ApplicationArea = Suite;
    //     //                 Caption = 'Re&open';
    //     //                 Enabled = "Approval Status" <> "Approval Status"::Open;
    //     //                 Image = ReOpen;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category5;
    //     //                 PromotedOnly = true;
    //     //                 ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ReleasePurchDoc: Codeunit "Release Approval Document";
    //     //                 begin
    //     //                     ReleasePurchDoc.ReopenTenderCommitte(Rec);
    //     //                 end;
    //     //             }
    //     //         }
    //     //         group("F&unctions")
    //     //         {
    //     //             Caption = 'F&unctions';
    //     //             Image = "Action";
    //     //             action("Appoint & Notify Appointees")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //                 Enabled = "Approval Status" = "Approval Status"::released;
    //     //                 Image = SendMail;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category4;

    //     //                 trigger OnAction()
    //     //                 begin
    //     //                     NoOfMemb := s:=0;
    //     //                     ProcCommType.Reset;
    //     //                     ProcCommType.SetRange("Committee Typ e","Committee Type");
    //     //                     if ProcCommType.FindSet then begin
    //     //                      /*IfsCommitteMembers.RESET;
    //                             IfsCommitteMembers.SETRANGE("Committee Type","Committee Type");
    //                             IfsCommitteMembers.SETRANGE("Document No.","Document No.");
    //                             IF IfsCommitteMembers.FINDSET THEN BEGIN
    //                               REPEAT
    //                               NoOfMembers+=1;
    //                              UNTIL IfsCommitteMembers.NEXT=0;
    //                             END;*/
    //       //                       ProcCommType.CalcFields(ProcCommType."Min. No. of Members");
    //     //                         CalcFields("Actual No. of Committee Memb");
    //     //                         Message('% 1',"Actual No. of Committee Memb");
    //     //                         if "Actual No. of Committee Memb" < ProcCommType."Min. No. of Members" then
    //     //                             Error('The appointed members should be more than the allowed minimum no of members % 1',ProcCommType."Min. No. of Members");
    //     //                  end;

    //     //                     Procurement.FnSendTenderCommitteNotification(Rec);

    //     //                 end;
    //     //             }
    //     //             action("Committee Functions")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //                 Image = WorkCenterLoad;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category4;
    //     //                 RunObject = Page "Procurement Committee Function";
    //     //                 RunPageLink = "Committee Ty = e"=field("Committee Type");

    //     //                 trigger OnAction()
    //     //                 begin
    //     //                     //Procurement.FnSendTenderCommitteNotification(Rec);
    //     //                 end;
    //     //             }
    //     //             action("Create Imprest Memo")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //                 Image = Invoice;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Process;
    //     //                 PromotedIsBig = true;

    //     //                 trigger OnAction()
    //     //                 begin
    //     //                     //Rec.TESTFIELD("Imprest Created",FALSE);
    //     //                     CreateMemo(Rec);
    //     //                 end;
    //     //             }
    //     //             action("Document Sources")
    //     //             {
    //     //                 ApplicationArea = Basic;
    //     //                 Image = Document;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category4;
    //     //                 RunObject = Page "IFS Tender Document Source";
    //     //                 RunPageLink = "Document N = ."=field("IFS Code");
    //     //             }
    //     //         }
    //     //         group("Request Approval")
    //     //         {
    //     //             Caption = 'Request Approval';
    //     //             action(SendApprovalRequest)
    //     //             {
    //     //                 ApplicationArea = Bas ic,Suite;
    //     //                 Caption = 'Send A&pproval Request';
    //     //                 Image = SendApprovalRequest;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category9;
    //     //                 PromotedIsBig = true;
    //     //                 ToolTip = 'Request approval of the document.';

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     //                 begin
    //     //                     if ApprovalsMgmt.CheckTenderCommitteApprovalPossible(Rec) then
    //     //                         ApprovalsMgmt.OnSendTenderCommitteForApproval(Rec);

    //     //                 end;
    //     //             }
    //     //             action(CancelApprovalRequest)
    //     //             {
    //     //                 ApplicationArea = Bas ic,Suite;
    //     //                 Caption = 'Cancel Approval Re&quest';
    //     //                 Image = CancelApprovalRequest;
    //     //                 Promoted = true;
    //     //                 PromotedCategory = Category9;
    //     //                 ToolTip = 'Cancel the approval request.';

    //     //                 trigger OnAction()
    //     //                 var
    //     //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     //                     WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    //     //                 begin
    //     //                     ApprovalsMgmt.OnCancelTenderCommitteApprovalRequest(Rec);
    //     //                     WorkflowWebhookMgt.FindAndCancel(RecordId);
    //     //                 end;
    //     //             }
    //     //         }
    //     //         action(Print)
    //     //         {
    //     //             ApplicationArea = Suite;
    //     //             Caption = 'Print Appointment Letter';
    //     //             Ellipsis = true;
    //     //             Image = Print;
    //     //             Promoted = true;
    //     //             PromotedCategory = Category6;
    //     //             ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

    //     //             trigger OnAction()
    //     //             begin
    //     //                 Reset;
    //     //                 SetRange("Document No .","Document No.
    //                     ;
    //                     Report.Run(72085, true, true, ue,Rec);
    //     //             end;
    //     //         }
    //     //         action("Non Association Form")
    //     //         {
    //     //             ApplicationArea = Suite;
    //     //             Caption = 'Non Association Form';
    //     //             Ellipsis = true;
    //     //             Image = Print;
    //     //             Promoted = true;
    //     //             PromotedCategory = Category6;
    //     //             ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

    //     //             trigger OnAction()
    //     //             begin
    //     //                 Reset;
    //     //                 SetRange("Document No .","Document No.
    //                     ;
    //                     Report.Run(70049, true, true, ue,Rec);
    //     //             end;
    //     //         }
    //     //     }
    //     // }

    //     // trigger OnNewRecord(BelowxRec: Boolean)
    //     // begin
    //     //     Inspect := n:=true;
    //     //     "Application Ar := ":="application area"::Inspection;
    //     // end;

    //     // var
    //     //     OpenApprovalEntriesExistCurrUser: Boolean;
    //     //     OpenApprovalEntriesExist: Boolean;
    //     //     OpenApprovalEntriesExistForCurrUser: Boolean;
    //     //     CanCancelApprovalForRecord: Boolean;
    //     //     CanRequestApprovalForFlow: Boolean;
    //     //     CanCancelApprovalForFlow: Boolean;
    //     //     Procurement: Codeunit "Procurement Processing";
    //     //     ShowWorkflowStatus: Boolean;
    //     //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     //     PRN: Record "Purchase Header";
    //     //     ProcCommType: Record "Procurement Committee Types";
    //     //     IfsCommitteMembers: Record "IFS Tender Committee Member";
    //     //     NoOfMembers: Integer;
    //     //     DMSDocuments: Record "DMS Documents";
    //     //     DMSManagement: Codeunit "DMS Management";
    //     //     RecordLink: Record "Record Link";
    //     //     ObjRecordLink: Record "Record Link";
    //     //     LinkIDNo: Integer;

    //     // local procedure CreateMemo(IFSCommitte: Record "IFS Tender Committee")
    //     // var
    //     //     ImprestReq: Record "Imprest Memo";
    //     //     ImprestLines: Record "Imprest Lines";
    //     //     IFSCommitteMembers: Record "IFS Tender Committee Member";
    //     //     Text001: label 'The Imprest  Memo %1 has  been created succesfully';
    //     //     Text002: label 'There are no participants who qualify for imprest';
    //     //     UserSetup: Record "User Setup";
    //     //     Email: Text;
    //     //     Body: Text;
    //     //     SMTP: Codeunit Mail;
    //     //     Email2: Text[250];
    //     //     CompInfo: Record "Company Information";
    //     //     EmailHOD: Text;
    //     //     ImprestOther: Decimal;
    //     //     CashMgt: Record "Cash Management Setup";
    //     //     SMTPT: Record "Email Account";
    //     //     ProjectMembers: Record "Project Members";
    //     //     ImpNo: Code[30];
    //     //     NoSeriesManagement: Codeunit NoSeriesManagement;
    //     //     PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    //     // begin
    //     //  ImpNo := '';
    //         //create memo
    //            ImprestReq.Init;
    //     //     CashMgt.Get;
    //     //     CashMgt.TestField("Imprest Memo Nos");
    //     //     NoSeriesManagement.InitSeries(CashMgt."Imprest Memo No s",CashMgt."Imprest Memo No 0D, ImpNo, No,CashMgt."Imprest Memo Nos");
    //     //     ImprestReq."N := ImpNo;
    //            ImprestReq."Document Ty := ":=ImprestReq."document type"::"Imprest Memo";
    //     //     ImprestReq."Imprest N := ":=ImprestReq."No.";
    //     //     ImprestReq."User  := UserId;
    //            UserSetup.Reset;
    //     //     UserSetup.SetRange("User I D",UserId);
    //     //     if UserSetup.FindSet then begin
    //     //         ImprestReq.Reques := r:=UserSetup."Employee No.";
    //     //  end;
    //            ImprestReq.Validate(Requestor);
    //     //     ImprestReq.D := Today;
    //            ImprestReq."Start Da := ":=IFSCommitte."Appointment Effective Date";
    //     //     ImprestReq."No. of da := ":=IFSCommitte.Duration;
    //     //     ImprestReq."Imprest Narati := ":=IFSCommitte.Location;
    //     //     ImprestReq."Global Dimension 1 Co := ":=IFSCommitte."Primary Region";
    //     //     ImprestReq."Global Dimension 2 Co := ":=IFSCommitte."Primary Department";
    //     //     ImprestReq."Dimension Set  := ":=IFSCommitte."Dimension Set ID";
    //     //     ImprestReq.Validate("Dimension Set ID");
    //     //     ImprestReq.Subj := t:=IFSCommitte.Description;
    //     //     ImprestReq.Sta := s:=ImprestReq.Status::Released;
    //     //     ImprestReq."Responsibility Cent := ":=IFSCommitte."Primary Region";
    //     //     ImprestReq.Insert;

    //         //Team Members
    //            IFSCommitteMembers.Reset;
    //     //     IFSCommitteMembers.SetRange("Document No .",IFSCommitte."Document No.");
    //     //     IFSCommitteMembers.SetFilter("Total Amoun '>%1', 1',0);
    //     //     if IFSCommitteMembers.FindSet then begin
    //     //      repeat
    //                    ProjectMembers.Init;
    //     //             ProjectMembers."Imprest Memo N := ":=ImprestReq."No.";
    //     //             ProjectMembers."Work Ty := ":=IFSCommitteMembers.Destination;
    //     //             ProjectMembers."Type of Expen := ":=IFSCommitteMembers.Type;
    //     //             ProjectMembers."N := ":=IFSCommitteMembers."Member No.";
    //     //             ProjectMembers.N := e:=IFSCommitteMembers."Member Name";
    //     //             ProjectMembers. := b:=IFSCommitte."Project ID";

    //                    ProjectMembers."Time Peri := ":=IFSCommitteMembers."No. of Days";
    //     //             ProjectMembers.Validate("Work Type");
    //     //             ProjectMembers.Validate("Time Period");
    //     //             ProjectMembers.Insert;
    //     //      //notify every employee
    //             /*
    //                     UserSetup.RESET;
    //                     UserSetup.SETRANGE("Employee No.",TrainingPart."Employee Code");
    //                     IF UserSetup.FINDSET THEN BEGIN
    //                         Email:=UserSetup."E-Mail";
    //                         //send notification email
    //                         SMTPT.GET;
    //                         Email2:=SMTPT."Email Sender Address";
    //                         Body:='IMPREST MEMO FOR'+TrainingRequest.Description;
    //                         SMTP.CreateMessage('IMPREST MEMO',Email2,
    //                         Email,'Training  '+'No: '+TrainingRequest.Code,
    //                         'Dear '+UserSetup."Employee Name"+',<BR><BR>'+'This is to bring to your attention regarding the creation of an imprest memo relating to the training'+
    //                         ' '+TrainingRequest.Description+' '+'</b> kindly login to'
    //                         ,TRUE);

    //                         SMTP.AddBCC(Email2);
    //                         SMTP.AddBodyline('<BR><BR>Kind Regards,'+'<BR><BR>'+USERID+'<BR>'+'<BR>');
    //                         SMTP.Send();
    //                       END;
    //                       */
    //                until IFSCommitteMembers.N = 0;
    //                Message(Text0 01,ImprestReq."No.");
    //     //         Page.Run(570 33,ImprestReq);

    //             //Fred Append the links to the newly created memo so that the user doesnt have to attach again

    //   //           RecordLink.Reset;
    //     //         RecordLink.SetCurrentkey("Document No");
    //     //         RecordLink.SetRange(RecordLink."Document N o","Document No.");
    //     //         if RecordLink.FindSet then begin
    //     //          repeat
    //                     LinkIDNo := 0;
    //         //             RecordLink.Reset;
    //     //                 if RecordLink.FindLast then
    //     //                  LinkIDNo := o:=RecordLink."Link  + 1
    //                     else
    //                         LinkIDNo := 1;
    //           //           ObjRecordLink.Init;
    //     //                 ObjRecordLink."Link  := ":=ObjRecordLink.Co + 1;
    //           //           ObjRecordLink."Record  := ":=ImprestReq.RecordId;
    //     //                 ObjRecordLink.U := 1:=RecordLink.URL1;
    //     //                 ObjRecordLink.U := 2:=RecordLink.URL2;
    //     //                 ObjRecordLink.U := 3:=RecordLink.URL3;
    //     //                 ObjRecordLink.U := 4:=RecordLink.URL4;
    //     //                 ObjRecordLink.Descript := n:=RecordLink.Description;
    //     //                 ObjRecordLink.T := e:=RecordLink.Type;
    //     //                 ObjRecordLink.N := e:=RecordLink.Note;
    //     //                 ObjRecordLink.Crea := CurrentDatetime;
    //           //           ObjRecordLink."User  := UserId;
    //           //           ObjRecordLink.Comp := COMPANYNAME;
    //           //           ObjRecordLink.Not := y:=RecordLink.Notify;
    //     //                 ObjRecordLink."To User  := ":=RecordLink."To User ID";
    //     //                 ObjRecordLink."Base U := ":=RecordLink."Base URL";
    //     //                 ObjRecordLink."Document  := ":=ImprestReq."No.";
    //     //                 ObjRecordLink."Fetch To Sharepoi := ":=RecordLink."Fetch To Sharepoint";
    //     //                 ObjRecordLink."Uploaded To SharePoi := ":=RecordLink."Uploaded To SharePoint";
    //     //                 ObjRecordLink."SP URL Return := ":=RecordLink."SP URL Returned";
    //     //                 ObjRecordLink.Pol := d:=RecordLink.Polled;
    //     //                 ObjRecordLink."Failure reas := ":=RecordLink."Failure reason";
    //     //                 ObjRecordLink.Local := l:=RecordLink.LocalUrl;
    //     //                 ObjRecordLink.Insert;
    //     //             until RecordLink.N = 0;
    //             end;
    //             //End Fred Append the links to the newly created memo so that the user doesnt have to attach again

    //             IFSCommitte."Imprest Created" := true;
    //             IFSCommitte."Memo No." := ImprestReq."No.";
    //             IFSCommitte.Modify(true);

    // //         end else
    //     //         Message(Text002);

    //     // end;
}

