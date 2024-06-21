#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56098 "Case Register Card"
{
    // PageType = Card;
    // SourceTable = "Case Register";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("No.";"No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Reference Number";"Reference Number")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Case Number";"Case Number")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Employee No";"Employee No")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 Enabled = true;
    //                 Visible = false;
    //             }
    //             field("Employee Name";"Employee Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 Visible = false;
    //             }
    //             field("Name of Parties";"Name of Parties")
    //             {
    //                 ApplicationArea = Basic;
    //                 MultiLine = true;
    //                 Visible = false;
    //             }
    //             field("Nature of Case";"Nature of Case")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Case Types";"Case Types")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Status;Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Nature of Claim";"Nature of Claim")
    //             {
    //                 ApplicationArea = Basic;
    //                 MultiLine = true;
    //                 Style = Favorable;
    //                 StyleExpr = true;
    //             }
    //             field("Last Hearing Date";"Last Hearing Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Progress;Progress)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 MultiLine = true;
    //             }
    //             field("Next Hearing Date";"Next Hearing Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Advocate on Record";"Advocate on Record")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Verdict;Verdict)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Verdict Status';
    //                 Editable = false;
    //                 Visible = false;
    //             }
    //             field("Plaintiff Advocate";"Plaintiff Advocate")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         part(Control35;"Case Hearings")
    //         {
    //             SubPageLink = "Case Entry"=field("No.");
    //         }
    //         group("Verdict Details")
    //         {
    //             Caption = 'Verdict Details';
    //             field("Verdict Date";"Verdict Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Overall Decision Date';
    //             }
    //             field("Verdict Summary";"Verdict Summary")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Final Decision Summary';
    //                 MultiLine = true;
    //             }
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         systempart(Control9;Outlook)
    //         {
    //         }
    //         systempart(Control10;Notes)
    //         {
    //         }
    //         systempart(Control11;MyNotes)
    //         {
    //         }
    //         systempart(Control12;Links)
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group("Feasibility Study")
    //         {
    //             Caption = 'Feasibility Study';
    //             Image = "Order";
    //             action(Dimensions)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Dimensions';
    //                 Image = Dimensions;
    //                 ShortCutKey = 'Shift+Ctrl+D';

    //                 trigger OnAction()
    //                 begin
    //                     /*
    //                     ShowDocDim;
    //                     CurrPage.SAVERECORD;
    //                     */

    //                 end;
    //             }
    //             action(Approvals)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Approvals';
    //                 Image = Approvals;
    //                 Promoted = true;
    //                 PromotedCategory = New;
    //                 PromotedIsBig = false;
    //                 Visible = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalEntries: Page "Approval Entries";
    //                 begin
    //                     /*
    //                     ApprovalEntries.Setfilters(DATABASE::Payments,8,"No.");
    //                     ApprovalEntries.RUN;
    //                     */

    //                 end;
    //             }
    //         }
    //     }
    //     area(processing)
    //     {
    //         group("F&unctions")
    //         {
    //             Caption = 'F&unctions';
    //             Image = "Action";
    //             action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send A&pproval Request';
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = New;
    //                 Visible = false;

    //                 trigger OnAction()
    //                 begin
    //                     /*
    //                     //TESTFIELD("Funding Source");
    //                     TESTFIELD(Status,Status::Open);//status must be open.
    //                     TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
    //                     TESTFIELD(Job);
    //                     TESTFIELD("Job Task No");
    //                     IF ("Advance Recovery"<>0) AND ("Account No."='')THEN
    //                     BEGIN
    //                       ERROR(text0001);
    //                     END;
    //                     TESTFIELD("Payment Narration");
    //                     TESTFIELD(Payee);
    //                     TESTFIELD(Date);
    //                     pvheader.RESET;
    //                     pvheader.SETRANGE(pvheader."No.","No.");
    //                     IF pvheader.FIND('-') THEN
    //                       BEGIN
    //                         pvLines.RESET;
    //                         pvLines.SETRANGE(pvLines.No,pvheader."No.");
    //                         IF pvLines.FIND('-') THEN

    //                           BEGIN
    //                             REPEAT
    //                               pvLines.TESTFIELD(pvLines."Applies to Doc. No");
    //                               UNTIL pvLines.NEXT=0;
    //                             END;

    //                         END;


    //                     IF ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
    //                       ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
    //                       */

    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = New;
    //                 Visible = false;

    //                 trigger OnAction()
    //                 begin
    //                     /*
    //                     TESTFIELD(Status,Status::"Pending Approval");//status must be open.
    //                     TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
    //                     ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
    //                     */

    //                 end;
    //             }
    //             separator(Action28)
    //             {
    //             }
    //             action(Plaintiffs)
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Vendor;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 RunObject = Page "Case Plantiffs";
    //                 RunPageLink = "Case No"=field("No.");
    //                 RunPageView = where(Type=filter(Plaintiff));
    //             }
    //             action(Defendants)
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Account;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 RunObject = Page "Case Defendants New";
    //                 RunPageLink = "Case No"=field("No.");
    //                 RunPageView = where(Type=filter(Defendant));
    //             }
    //         }
    //         group(Print)
    //         {
    //             Caption = 'Print';
    //             Image = Print;
    //             action("&Print")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Print';
    //                 Ellipsis = true;
    //                 Image = Print;
    //                 Promoted = true;
    //                 PromotedCategory = Process;

    //                 trigger OnAction()
    //                 begin
    //                     //DocPrint.PrintPurchHeader(Rec);

    //                     Reset;
    //                     SetRange("No.","No.");
    //                     Report.Run(99098,true,true,Rec)
    //                 end;
    //             }
    //         }
    //         group(Release)
    //         {
    //             Caption = 'Release';
    //             Image = ReleaseDoc;
    //             action("Re&lease")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Re&lease';
    //                 Image = ReleaseDoc;
    //                 ShortCutKey = 'Ctrl+F9';

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Purchase Document";
    //                 begin
    //                     /*
    //                     usersetup.GET(USERID);
    //                     usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
    //                     ReopenPV.PerformManualReopen(Rec);
    //                     */

    //                 end;
    //             }
    //             action("Re&open")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Re&open';
    //                 Image = ReOpen;

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Purchase Document";
    //                 begin
    //                     /*
    //                     usersetup.GET(USERID);
    //                     usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
    //                     TESTFIELD("Reasons to Reopen");
    //                     ReopenPV.PerformManualReopen(Rec);
    //                     */

    //                 end;
    //             }
    //             separator(Action22)
    //             {
    //             }
    //         }
    //         group("P&osting")
    //         {
    //             Caption = 'P&osting';
    //             Image = Post;
    //             action(Post)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'P&ost';
    //                 Image = PostOrder;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 ShortCutKey = 'F9';
    //                 Visible = false;

    //                 trigger OnAction()
    //                 begin
    //                     //Post(CODEUNIT::"Sales-Post (Yes/No)");

    //                     //PVPost."Post Payment Voucher"(Rec);
    //                     //PaymentsPost."Post Payment Voucher"(Rec);
    //                 end;
    //             }
    //         }
    //         group(Approval)
    //         {
    //             Caption = 'Approval';
    //             action(MoveToOngoing)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Move To Ongoing';
    //                 Image = Migration;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 PromotedIsBig = true;
    //                 PromotedOnly = true;
    //                 ToolTip = 'Approve the requested changes.';

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     //ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
    //                     if Dialog.Confirm('Are you sure you want to move case to ongoing?',true) then begin
    //                     Status := Status::Ongoing;
    //                     Modify;
    //                     CurrPage.Close;
    //                     end;
    //                 end;
    //             }
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
    //                 Visible = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     //ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
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
    //                 Visible = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     //ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
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
    //                 Visible = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     //ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
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
    //                 Visible = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     //ApprovalsMgmt.GetApprovalComment(Rec);
    //                 end;
    //             }
    //             action(DocAttach0)
    //             {
    //                 ApplicationArea = All;
    //                 Caption = 'HR Documents';
    //                 Image = Attach;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 RunObject = Page "Document Attachment Details";
    //                 RunPageLink = "No."=field("From Document Number"),
    //                               "Document Type"=filter("HR Case");
    //                 RunPageView = where("Document Type"=filter("HR Case"));
    //                 ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

    //                 trigger OnAction()
    //                 var
    //                     DocumentAttachmentDetails: Page "Document Attachment Details";
    //                     RecRef: RecordRef;
    //                 begin
    //                     // RecRef.GETTABLE(Rec);
    //                     // DocumentAttachmentDetails.OpenForRecRef(RecRef);
    //                     // DocumentAttachmentDetails.RUNMODAL;
    //                 end;
    //             }
    //             action(DocAttach1)
    //             {
    //                 ApplicationArea = All;
    //                 Caption = 'Court Documents';
    //                 Image = Attach;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 RunObject = Page "Document Attachment Details";
    //                 RunPageLink = "No."=field("No."),
    //                               "Document Type"=filter("Court Hearings");
    //                 RunPageView = where("Document Type"=filter("Court Hearings"));
    //                 ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

    //                 trigger OnAction()
    //                 var
    //                     DocumentAttachmentDetails: Page "Document Attachment Details";
    //                     RecRef: RecordRef;
    //                 begin
    //                     // RecRef.GETTABLE(Rec);
    //                     // DocumentAttachmentDetails.OpenForRecRef(RecRef);
    //                     // DocumentAttachmentDetails.RUNMODAL;
    //                 end;
    //             }
    //             action(DocAttach2)
    //             {
    //                 ApplicationArea = All;
    //                 Caption = 'Plaintiff Documents';
    //                 Image = Attach;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 RunObject = Page "Document Attachment Details";
    //                 RunPageLink = "No."=field("No."),
    //                               "Document Type"=filter(Plaintiffs);
    //                 RunPageView = where("Document Type"=filter(Plaintiffs));
    //                 ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

    //                 trigger OnAction()
    //                 var
    //                     DocumentAttachmentDetails: Page "Document Attachment Details";
    //                     RecRef: RecordRef;
    //                 begin
    //                     // RecRef.GETTABLE(Rec);
    //                     // DocumentAttachmentDetails.OpenForRecRef(RecRef);
    //                     // DocumentAttachmentDetails.RUNMODAL;
    //                 end;
    //             }
    //             action(DocAttach3)
    //             {
    //                 ApplicationArea = All;
    //                 Caption = 'Defendants Documents';
    //                 Image = Attach;
    //                 Promoted = true;
    //                 PromotedCategory = Category8;
    //                 RunObject = Page "Document Attachment Details";
    //                 RunPageLink = "No."=field("No."),
    //                               "Document Type"=filter(Defendants);
    //                 RunPageView = where("Document Type"=filter(Defendants));
    //                 ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

    //                 trigger OnAction()
    //                 var
    //                     DocumentAttachmentDetails: Page "Document Attachment Details";
    //                     RecRef: RecordRef;
    //                 begin
    //                     // RecRef.GETTABLE(Rec);
    //                     // DocumentAttachmentDetails.OpenForRecRef(RecRef);
    //                     // DocumentAttachmentDetails.RUNMODAL;
    //                 end;
    //             }
    //             separator(Action45)
    //             {
    //             }
    //             action(Close)
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Close;
    //                 Promoted = true;
    //                 PromotedCategory = Process;

    //                 trigger OnAction()
    //                 begin
    //                     Status:=Status::Closed;
    //                     Modify;
    //                     Message('Case Closed Successfully');
    //                 end;
    //             }
    //         }
    //     }
    // }

    // var
    //     ConfirmVerdict: Page "Confirm Verdict";
}

