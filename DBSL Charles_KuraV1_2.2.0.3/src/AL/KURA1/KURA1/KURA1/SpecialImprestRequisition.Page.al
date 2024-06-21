#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57046 "Special  Imprest Requisition"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Open | "Pending Approval"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    //                 }
                    //                 field("Account No."; "Account No.")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field("Account Name"; "Account Name")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field("Reference No."; "Reference No.")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                 }
                    //                 field("Pay Mode"; "Pay Mode")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                     Visible = false;
                    //                 }
                    //                 field("Cheque No"; "Cheque No")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                     Visible = false;
                    //                 }
                    //                 field("Paying Bank Account"; "Paying Bank Account")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                     Visible = false;
                    //                 }
                    //                 field("Bank Name"; "Bank Name")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Visible = false;
                    //                 }
                    //                 field("Travel Date"; "Travel Date")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                 }
                    //                 field("Payment Narration"; "Payment Narration")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                 }
                    //                 field("Posting Date"; "Posting Date")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                     Visible = false;
                    //                 }
                    //                 field("Created By"; "Created By")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field(Status; Status)
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field("Imprest Memo No"; "Imprest Memo No")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = not OpenApprovalEntriesExist;
                    //                 }
                    //                 field(Project; Project)
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                     Visible = false;
                    //                 }
                    //                 field("Project Description"; "Project Description")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Program Description';
                    //                     Visible = false;
                    //                 }
                    //                 field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field("Department Name"; "Department Name")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                 }
                    //                 field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field("Project Name"; "Project Name")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Program Name';
                    //                 }
                    //                 field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field("Unit  Name"; "Unit  Name")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Section Name';
                    //                 }
                    //                 field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Editable = false;
                    //                 }
                    //                 field("Division Name"; "Division Name")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Location Name:';
                    //                 }
                    //                 field("Imprest Amount"; "Imprest Amount")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                 }
                    //                 field("Imprest Deadline"; "Imprest Deadline")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                 }
                    //             }
                    //             part(Control1000000017; "Imprest Lines")
                    //             {
                    //                 SubPageLink = No = field("No.");
                    //             }
                    //         }
                    //         area(factboxes)
                    //         {
                    //             systempart(Control1000000015; Notes)
                    //             {
                    //             }
                    //             systempart(Control1000000016; Links)
                    //             {
                    //             }
                    //         }
                    //     }

                    //     actions
                    //     {
                    //         area(navigation)
                    //         {
                    //             group("Payment Voucher")
                    //             {
                    //                 Caption = 'Payment Voucher';
                    //                 Image = "Order";
                    //                 action("Co&mments")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Co&mments';
                    //                     Image = ViewComments;
                    //                     RunObject = Page "Comment Sheet";
                    //                     RunPageLink = "Table Name" = const(56000),
                    //                                   "No." = field("No.");
                    //                 }
                    //                 action(Dimensions)
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Dimensions';
                    //                     Image = Dimensions;
                    //                     ShortCutKey = 'Shift+Ctrl+D';

                    //                     trigger OnAction()
                    //                     begin
                    //                         ShowDocDim;
                    //                         CurrPage.SaveRecord;
                    //                     end;
                    //                 }
                    //                 action(Approvals)
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Approvals';
                    //                     Image = Approvals;
                    //                     Promoted = true;
                    //                     PromotedCategory = New;
                    //                     PromotedIsBig = false;

                    //                     trigger OnAction()
                    //                     var
                    //                         ApprovalEntries: Page "Approval Entries";
                    //                     begin

                    //                         ApprovalEntries.Setfilters(Database::payments, 7, "No.");
                    //                         ApprovalEntries.Run;
                    //                     end;
                    //                 }
                    //             }
                    //         }
                    //         area(processing)
                    //         {
                    //             action("Attach from Imprest Memo")
                    //             {
                    //                 ApplicationArea = Basic;
                    //                 Enabled = ShowAttach;
                    //                 Image = Import;
                    //                 Promoted = true;
                    //                 PromotedCategory = Process;
                    //                 PromotedIsBig = true;
                    //                 Visible = false;

                    //                 trigger OnAction()
                    //                 begin
                    //                     AttachLines(Rec);
                    //                 end;
                    //             }
                    //             group("F&unctions")
                    //             {
                    //                 Caption = 'F&unctions';
                    //                 Image = "Action";
                    //                 action(SendApprovalRequest)
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Send A&pproval Request';
                    //                     Enabled = not OpenApprovalEntriesExist;
                    //                     Image = SendApprovalRequest;
                    //                     Promoted = true;
                    //                     PromotedCategory = New;

                    //                     trigger OnAction()
                    //                     begin
                    //                         TestField(Status, Status::Open);//status must be open.
                    //                         //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    //                         TestField("Imprest Memo No");
                    //                         TestField("Payment Narration");
                    //                         if "Imprest Amount" = 0 then
                    //                             Error(Text001, "No.");
                    //                         // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                    //                         //   ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    //                     end;
                    //                 }
                    //                 action(CancelApprovalRequest)
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Cancel Approval Re&quest';
                    //                     Enabled = true;
                    //                     Image = Cancel;
                    //                     Promoted = true;
                    //                     PromotedCategory = New;

                    //                     trigger OnAction()
                    //                     begin
                    //                         TestField(Status, Status::"Pending Approval");//status must be open.
                    //                         TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                    //                                                          // ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    //                     end;
                    //                 }
                    //                 separator(Action1000000037)
                    //                 {
                    //                 }
                    //             }
                    //             group(Print)
                    //             {
                    //                 Caption = 'Print';
                    //                 Image = Print;
                    //                 action("&Print")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = '&Print';
                    //                     Ellipsis = true;
                    //                     Image = Print;
                    //                     Promoted = true;
                    //                     PromotedCategory = Process;

                    //                     trigger OnAction()
                    //                     begin
                    //                         //DocPrint.PrintPurchHeader(Rec);

                    //                         // IF Status<>Status::Released THEN
                    //                         // ERROR(Txt0001);
                    //                         // IF Status=Status::Released THEN BEGIN
                    //                         SetRange("No.", "No.");
                    //                         Report.Run(57004, true, true, Rec)
                    //                     end;
                    //                 }
                    //             }
                    //             group(Release)
                    //             {
                    //                 Caption = 'Release';
                    //                 Image = ReleaseDoc;
                    //                 action("Re&lease")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Re&lease';
                    //                     Image = ReleaseDoc;
                    //                     ShortCutKey = 'Ctrl+F9';

                    //                     trigger OnAction()
                    //                     var
                    //                     //      ReleasePurchDoc: Codeunit "Release Purchase Document";
                    //                     begin
                    //                         //ReleasePurchDoc.PerformManualRelease(Rec);
                    //                     end;
                    //                 }
                    //                 action("Re&open")
                    //                 {
                    //                     ApplicationArea = Basic;
                    //                     Caption = 'Re&open';
                    //                     Image = ReOpen;

                    //                     trigger OnAction()
                    //                     var
                    //                     //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    //                     begin
                    //                         //ReleasePurchDoc.PerformManualReopen(Rec);
                    //                         //ReleasePurchDoc.ReopenPV(Rec);
                    //                     end;
                    //                 }
                    //                 separator(Action1000000031)
                    //                 {
                    //                 }
                    //             }
                    //             group("P&osting")
                    //             {
                    //                 Caption = 'P&osting';
                    //                 Image = Post;
                    //             }
                    //         }
                    //     }

                    //     trigger OnAfterGetRecord()
                    //     begin
                    //         ShowAttach := OpenEntries(Rec);
                    //     end;

                    //     trigger OnNewRecord(BelowxRec: Boolean)
                    //     begin
                    //         "Payment Type" := "payment type"::Imprest;
                    //         "Account Type" := "account type"::Customer;
                    //         "Imprest Type" := "imprest type"::"Project Imprest";
                    //         "Document Type" := "document type"::Imprest;
                    //         "Created By" := UserId;
                    //     end;

                    //     trigger OnOpenPage()
                    //     begin
                    //         ShowAttach := OpenEntries(Rec);
                    //     end;

                    //     var
                    //         //  PaymentPost: Codeunit "Payments-Post";
                    //         [InDataSet]
                    //         ShowAttach: Boolean;
                    //         Committment: Codeunit Committment;
                    //         OpenApprovalEntriesExist: Boolean;
                    //         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //         Txt0001: label 'You Can only Print Fully Approved Imprest Requisition';
                    //         users: Record "User Setup";
                    //         Text001: label 'Imprest Amount for document number %1 cannot be 0. Kindly check the lines. Attach memo.';
                    //         UserSetup: Record "User Setup";
                    //         Text0001: label 'You cannot Cancel document No. %1. Documents can only be cancelled by initiators ';

                    //     local procedure SetControlAppearance()
                    //     var
                    //         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //     begin
                    //         OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
                    //     end;
                    // }
                }
            }
        }
    }
}

