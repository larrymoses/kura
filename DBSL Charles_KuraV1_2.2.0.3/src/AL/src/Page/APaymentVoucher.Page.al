#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// Page A-Payment Voucher (ID 57094).
/// </summary>
Page 57094 "A-Payment Voucher"
{
    Editable = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(false));

    layout
    {
        //     area(content)
        //     {
        //         group(General)
        //         {
        //             field("No.";"No.")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //                 Enabled = false;
        //             }
        //             field(Project;Project)
        //             {
        //                 ApplicationArea = Basic;
        //                 Caption = 'Job No.';
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Project Description";"Project Description")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Job Task No.";"Job Task No.")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Job Task Name";"Job Task Name")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field(Date;Date)
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = true;
        //             }
        //             field("Pay Mode";"Pay Mode")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Cheque No";"Cheque No")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Cheque Date";"Cheque Date")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Paying Bank Account";"Paying Bank Account")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Bank Name";"Bank Name")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field(Payee;Payee)
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("On behalf of";"On behalf of")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Payment Narration";"Payment Narration")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Department Name";"Department Name")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Project Name";"Project Name")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Shortcut Dimension 3 Code";"Shortcut Dimension 3 Code")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Unit  Name";"Unit  Name")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field(Currency;Currency)
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = not OpenApprovalEntriesExist;
        //             }
        //             field("Total Amount";"Total Amount")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Total VAT Amount";"Total VAT Amount")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Total Witholding Tax Amount";"Total Witholding Tax Amount")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("VAT Wthheld six %";"VAT Wthheld six %")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Total Retention Amount";"Total Retention Amount")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Total Net Amount";"Total Net Amount")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Advance Recovery";"Advance Recovery")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = false;
        //             }
        //             field("Total Net Pay";"Total Net Pay")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = false;
        //             }
        //             field(Status;Status)
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
        //             }
        //             field("Posted By";"Posted By")
        //             {
        //                 ApplicationArea = Basic;
        //             }
        //             field("Posted Date";"Posted Date")
        //             {
        //                 ApplicationArea = Basic;
        //                 Editable = false;
        //             }
        //         }
        //         part(Control1000000021;"PV Lines")
        //         {
        //             Editable = not OpenApprovalEntriesExist;
        //             SubPageLink = No=field("No.");
        //         }
        //     }
        //     area(factboxes)
        //     {
        //         systempart(Control1000000019;Notes)
        //         {
        //         }
        //         systempart(Control1000000020;Links)
        //         {
        //         }
        //     }
        // }

        // actions
        // {
        //     area(navigation)
        //     {
        //         group("Payment Voucher")
        //         {
        //             Caption = 'Payment Voucher';
        //             Image = "Order";
        //             action("Co&mments")
        //             {
        //                 ApplicationArea = Basic;
        //                 Caption = 'Co&mments';
        //                 Image = ViewComments;
        //                 RunObject = Page "Comment Sheet";
        //                 RunPageLink = "Table Name"=const(56000),
        //                               "No."=field("No.");
        //             }
        //             action(Dimensions)
        //             {
        //                 ApplicationArea = Basic;
        //                 Caption = 'Dimensions';
        //                 Image = Dimensions;
        //                 ShortCutKey = 'Shift+Ctrl+D';

        //                 trigger OnAction()
        //                 begin
        //                     ShowDocDim;
        //                     CurrPage.SaveRecord;
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

        //                 trigger OnAction()
        //                 var
        //                     ApprovalEntries: Page "Approval Entries";
        //                 begin

        //                     ApprovalEntries.Setfilters(Database::payments,7,"No.");
        //                     ApprovalEntries.Run;
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
        //                 Enabled = not OpenApprovalEntriesExist;
        //                 Image = SendApprovalRequest;
        //                 Promoted = true;
        //                 PromotedCategory = New;

        //                 trigger OnAction()
        //                 begin
        //                   //  if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
        //                    //   ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
        //                 end;
        //             }
        //             action(CancelApprovalRequest)
        //             {
        //                 ApplicationArea = Basic;
        //                 Caption = 'Cancel Approval Re&quest';
        //                 Enabled = OpenApprovalEntriesExist;
        //                 Image = Cancel;
        //                 Promoted = true;
        //                 PromotedCategory = New;

        //                 trigger OnAction()
        //                 begin
        //                     //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
        //                 end;
        //             }
        //             separator(Action1000000043)
        //             {
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


        //                     SetRange("No.","No.");
        //                     Report.Run(57000,true,true,Rec)
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
        //                   //  ReleasePurchDoc: Codeunit "Release Purchase Document";
        //                 begin
        //                     //ReleasePurchDoc.PerformManualRelease(Rec);
        //                 end;
        //             }
        //             action("Re&open")
        //             {
        //                 ApplicationArea = Basic;
        //                 Caption = 'Re&open';
        //                 Image = ReOpen;

        //                 trigger OnAction()
        //                 var
        //                //    ReleasePurchDoc: Codeunit "Release Purchase Document";
        //                 begin
        //                     //ReleasePurchDoc.PerformManualReopen(Rec);
        //                       //ReleasePurchDoc.ReopenPV(Rec);
        //                 end;
        //             }
        //             separator(Action1000000036)
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

        //                 trigger OnAction()
        //                 begin
        //                     //Post(CODEUNIT::"Sales-Post (Yes/No)");

        //                     //PVPost."Post Payment Voucher"(Rec);
        //                     PaymentsPost."Post Payment Voucher"(Rec);
        //                 end;
        //             }
        //             action(Approve)
        //             {
        //                 ApplicationArea = Basic;
        //                 Image = Approve;
        //                 Promoted = true;
        //                 PromotedCategory = New;
        //             }
        //             action(Reject)
        //             {
        //                 ApplicationArea = Basic;
        //                 Image = Reject;
        //             }
        //             action(Delegate)
        //             {
        //                 ApplicationArea = Basic;
        //                 Image = Delegate;
        //             }
        //         }
        //     }
        // }

        // trigger OnAfterGetRecord()
        // begin
        //     SetControlAppearance;
        // end;

        // trigger OnNewRecord(BelowxRec: Boolean)
        // begin
        //     "Payment Type":="payment type"::"Payment Voucher";
        // end;

        // trigger OnOpenPage()
        // begin
        //     SetControlAppearance;
        // end;

        // var
        //     // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //     // OpenApprovalEntriesExist: Boolean;
        //     // PaymentsPost: Codeunit "Payments-Post";

        // local procedure SetControlAppearance()
        // var
        //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // begin
        //     OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // end;
    }
}
