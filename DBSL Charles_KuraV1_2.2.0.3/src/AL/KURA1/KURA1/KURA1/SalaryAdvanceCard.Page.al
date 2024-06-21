#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57184 "Salary Advance Card"
{
    PageType = Card;
    SourceTable = payments;

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
                //             field(Date;Date)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Created By";"Created By")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Account Type";"Account Type")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Account No.";"Account No.")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Account Name";"Account Name")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Date of Joining";"Date of Joining")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Department Name";"Department Name")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Project Name";"Project Name")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Unit Name';
                //             }
                //             field("Salary Last Drawn";"Salary Last Drawn")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Salary Advance";"Salary Advance")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("No of months deducted";"No of months deducted")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Monthly Installment";"Monthly Installment")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Purpose;Purpose)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Amount Pending";"Amount Pending")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Recovery Start Month";"Recovery Start Month")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Status;Status)
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //         }
                //     }
                // }

                // actions
                // {
                //     area(creation)
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

                //                      ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                //                     TestField(Status,Status::Open);//status must be open.
                //                     TestField("Created By",UserId); //control so that only the initiator of the document can send for approval

                //                     TestField("Salary Advance");
                //                     TestField(Purpose);
                //                     TestField("No of months deducted");
                //                     TestField("Recovery Start Month");

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

                //                 trigger OnAction()
                //                 begin
                //                     TestField(Status,Status::"Pending Approval");//status must be open.
                //                     TestField("Created By",UserId); //control so that only the initiator of the document can send for approval
                //                     ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                //                 end;
                //             }
                //             separator(Action30)
                //             {
                //             }
                //         }
                //         group(ActionGroup29)
                //         {
                //             Caption = 'Print';
                //             Image = Print;
                //             action(Print)
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = PrintForm;
                //                 Promoted = true;
                //                 PromotedCategory = Process;

                //                 trigger OnAction()
                //                 begin
                //                     SetRange("No.","No.");
                //                     Report.Run(57015,true,true,Rec)
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
                //                     Usersetup.Get(UserId);
                //                     Usersetup.TestField(Usersetup."Reopen Document",Usersetup."Reopen Document"=true);
                //                     ReopenPV.PerformManualReopen(Rec);
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
                //                     Usersetup.Get(UserId);
                //                     Usersetup.TestField(Usersetup."Reopen Document",Usersetup."Reopen Document"=true);
                //                     TestField("Reasons to Reopen");
                //                     ReopenPV.PerformManualReopen(Rec);
                //                 end;
                //             }
                //             separator(Action24)
                //             {
                //             }
                //         }
                //     }
                // }

                // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
                // begin
                //     "Payment Type" := "payment type"::"Salary Advance";
                //     "Document Type":="document type"::"Salary Advance";

                //     Date := Today;
                //     "Created By" := UserId;
                //     "Account Type" := "account type"::Employee;

                //     Usersetup.Reset;
                //     Usersetup.SetRange("User ID","Created By");
                //     if Usersetup.FindSet then
                //     begin

                //       "Account No."  := Usersetup."Employee No.";
                //       "Account Name" := Usersetup."Employee Name";
                //     end;

                //     Employee.Reset;
                //     Employee.SetRange("No.","Account No.");
                //     if Employee.FindSet then
                //     begin
                //      // Employee.CALCFIELDS("Job Title");
                //     //  Designation := Employee."Job Title";
                //       "Date of Joining" := Employee."Employment Date";
                //       "Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                //       "Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
                //     end;
                // end;

                // var
                //     Usersetup: Record "User Setup";
                //     Employee: Record Employee;
                //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //     OpenApprovalEntriesExist: Boolean;
                //     ApprovalEntry: Record "Approval Entry";
                //     pvLines: Record "PV Lines";
                //     pvheader: Record payments;
                //     ReopenPV: Codeunit Payments;
            }
        }
    }

}