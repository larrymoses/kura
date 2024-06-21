#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57211 "Cash Request"
{
    // PageType = Card;
    // SourceTable = "Cash Request Header";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Document No";"Document No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Reference No";"Reference No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Document Date";"Document Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Financial Year Code";"Financial Year Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Financial Budget";"Financial Budget")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Funding Agency ID";"Funding Agency ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Funding Agency ID';
    //             }
    //             field("Funding Agency Name";"Funding Agency Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Requested Amount";"Total Requested Amount")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Income Account";"Income Account")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Income G/L Account';
    //             }
    //             field(Status;Status)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Cashier;Cashier)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Posting Date";"Posting Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Posted;Posted)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Posted Date";"Posted Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Posted Time";"Posted Time")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Posted By";"Posted By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //         }
    //         part(Control14;"Cash Request Lines")
    //         {
    //             SubPageLink = "Document No"=field("Document No");
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         systempart(Control8;Outlook)
    //         {
    //         }
    //         systempart(Control9;Notes)
    //         {
    //         }
    //         systempart(Control10;MyNotes)
    //         {
    //         }
    //         systempart(Control11;Links)
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    //     area(creation)
    //     {
    //         action(Print)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = '&Print';
    //             Image = Print;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 Reset;
    //                 SetRange("Document No","Document No");
    //                 if FindSet then
    //                   Report.Run(Report::"Cash Request Form",true,true,Rec);
    //             end;
    //         }
    //         action(Post)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Post;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = false;

    //             trigger OnAction()
    //             begin
    //                 TestField(Status,Status::Released);
    //                 TestField(Posted,false);
    //                 PaymentsPost.PostPaymentVoucherTaxKeRRA(Rec);
    //                 Message('Cash Request %1 has been Posted Successfully',"Document No");
    //                 CurrPage.Close();
    //             end;
    //         }
    //         action(SendApprovalRequest)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Send A&pproval Request';
    //             Image = SendApprovalRequest;
    //             Promoted = true;
    //             PromotedCategory = Category9;

    //             trigger OnAction()
    //             begin
    //                  if not Confirm('Are you sure you want to send this cash request for approval?') then
    //                   exit
    //                  else
    //                 if ApprovalsMgmt.CheckCashReqApprovalPossible(Rec) then
    //                   ApprovalsMgmt.OnSendCashReqForApproval(Rec);
    //             end;
    //         }
    //         action(AttachDocuments)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Attach Document';
    //             Image = Attach;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             Visible = true;

    //             trigger OnAction()
    //             begin
    //                 DMSManagement.UploadPaymentsDocuments("Document No",'Treasury Cash Request',RecordId,"Shortcut Dimension 1 Code");
    //             end;
    //         }
    //         action(CancelApprovalRequest)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Cancel Approval Re&quest';
    //             Image = Cancel;
    //             Promoted = true;
    //             PromotedCategory = Category9;

    //             trigger OnAction()
    //             begin
    //                  if not Confirm('Are you sure you want to cancel this cash request approval?') then
    //                   exit
    //                  else
    //                 ApprovalsMgmt.OnCancelCashReqApprovalRequest(Rec);
    //             end;
    //         }
    //         action(Dimensions)
    //         {
    //             AccessByPermission = TableData Dimension=R;
    //             ApplicationArea = Dimensions;
    //             Caption = 'Dimensions';
    //             Enabled = "Document No" <> '';
    //             Image = Dimensions;
    //             Promoted = true;
    //             PromotedCategory = Category8;
    //             PromotedIsBig = true;
    //             ShortCutKey = 'Shift+Ctrl+D';
    //             ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

    //             trigger OnAction()
    //             begin
    //                 ShowDocDim;
    //                 CurrPage.SaveRecord;
    //             end;
    //         }
    //         action("Suggest Lines")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Suggest;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 RMSManagement.FnSuggestCashRequestLinesFromVLedgerEntry(Rec,CashRequestLines);
    //                 //MESSAGE('Lines Suggested Successfully');
    //             end;
    //         }
    //         action(Approvals)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Approvals;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
    //             end;
    //         }
    //         action(Approve)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Approve;
    //             Promoted = true;
    //             PromotedCategory = Category4;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
    //             end;
    //         }
    //         action(Reject)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Reject;
    //             Promoted = true;
    //             PromotedCategory = Category4;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
    //             end;
    //         }
    //         action(Delegate)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Delegate;
    //             Promoted = true;
    //             PromotedCategory = Category4;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
    //             end;
    //         }
    //     }
    // }

    // var
    //     DMSManagement: Codeunit "DMS Management";
    //     RMSManagement: Codeunit "RMS Management";
    //     Payments: Codeunit Payments;
    //     PaymentsPost: Codeunit "Payments-Post";
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     CashRequestHeader: Record "Cash Request Header";
    //     CashRequestLines: Record "Cash Request Lines";
    //     VendorLedgerEntry: Record "Vendor Ledger Entry";
}

