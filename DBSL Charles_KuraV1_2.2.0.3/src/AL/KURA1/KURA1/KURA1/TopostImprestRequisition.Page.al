#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57136 "To post  Imprest Requisition"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released),
                            "Send for Posting" = const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                //             field(Date;Date)
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Account Type";"Account Type")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Account No.";"Account No.")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Account Name";"Account Name")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Pay Mode";"Pay Mode")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Paying Bank Account";"Paying Bank Account")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Bank Name";"Bank Name")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Cheque No";"Cheque No")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Cheque Date";"Cheque Date")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Posting Date";"Posting Date")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = true;
                //             }
                //             field(Payee;Payee)
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Reference No.";"Reference No.")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Payment Narration";"Payment Narration")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Created By";"Created By")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Travel Date";"Travel Date")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Reasons to Reopen";"Reasons to Reopen")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Reason to Reopen.';
                //             }
                //             field(Status;Status)
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field(Project;Project)
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //                 Visible = false;
                //             }
                //             field("Project Description";"Project Description")
                //             {
                //                 ApplicationArea = Basic;
                //                 Visible = false;
                //             }
                //             field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Department Name";"Department Name")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             // field(Job;Job)
                //             // {
                //             //     ApplicationArea = Basic;
                //             //     Editable = false;
                //             }
                //             field("Job Name";"Job Name")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Job Task No";"Job Task No")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Job Task Name";"Job Task Name")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Project Name";"Project Name")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Imprest Amount";"Imprest Amount")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Imprest Deadline";"Imprest Deadline")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //         }
                //         part(Control1000000017;"Imprest Lines")
                //         {
                //             SubPageLink = No=field("No.");
                //         }
                //     }
                //     area(factboxes)
                //     {
                //         systempart(Control1000000015;Notes)
                //         {
                //         }
                //         systempart(Control1000000016;Links)
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
                //                 // RunObject = Page "Comment Sheet";
                //                 // RunPageLink = "Table Name"=const(56000),
                //                 //               "No."=field("No.");
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
                //                 Enabled = false;
                //                 Image = SendApprovalRequest;
                //                 Promoted = true;
                //                 PromotedCategory = New;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                //                       ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
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
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                //                 end;
                //             }
                //             separator(Action1000000033)
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
                //                     Report.Run(57004,true,true,Rec)
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
                //                     ReleasePurchDoc: Codeunit "Release Purchase Document";
                //                 begin
                //                     Usersets.Get(UserId);
                //                     Usersets.TestField(Usersets."Reopen Document",Usersets."Reopen Document"=true);
                //                     TestField("Reasons to Reopen");
                //                       ReOpenPayment.PerformManualReopen(Rec);
                //                 end;
                //             }
                //             separator(Action1000000020)
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
                //                     //Control the posting of the imprest requisitions David
                //                     usersetup.Get(UserId);
                //                     if usersetup."Post Requisition"=false then
                //                     Error(Text001);
                //                     PaymentPost."Post Imprest"(Rec);
                //                 end;
                //             }
                //         }
                //         action("Attach from Imprest Memo")
                //         {
                //             ApplicationArea = Basic;
                //             Enabled = ShowAttach;
                //             Image = Import;
                //             Promoted = true;
                //             PromotedCategory = Process;
                //             PromotedIsBig = true;
                //             Visible = false;

                //             trigger OnAction()
                //             begin
                //                 AttachLines(Rec);
                //             end;
                //         }
                //     }
                // }

                // trigger OnAfterGetRecord()
                // begin
                //     ShowAttach:=OpenEntries(Rec);
                // end;

                // trigger OnNewRecord(BelowxRec: Boolean)
                // begin
                //     "Payment Type":="payment type"::Imprest;
                //     "Account Type":="account type"::Customer;
                //     "Imprest Type":="imprest type"::"Project Imprest";
                //     "Created By":=UserId;
                // end;

                // trigger OnOpenPage()
                // begin
                //     ShowAttach:=OpenEntries(Rec);
                //     SetControlAppearance;
                // end;

                // var
                //     PaymentPost: Codeunit "Payments-Post";
                //     [InDataSet]
                //     ShowAttach: Boolean;
                //     Committment: Codeunit Committment;
                //     OpenApprovalEntriesExist: Boolean;
                //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //     usersetup: Record "User Setup";
                //     Text001: label 'You do not have sufficient rights to Post An Imprest Requisition! Please! contact System Administrator for Assistance.';
                //     ReOpenPayment: Codeunit Payments;
                //     Usersets: Record "User Setup";
                //     Text002: label 'You have not granted permisions to reopen documents, Seek assistance from Accounts';

                // local procedure SetControlAppearance()
                // var
                //    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                // begin
                //    // OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
                // end;
            }

        }
    }
}