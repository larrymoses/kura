#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57006 "Posted Payment Voucherss"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(true),
                            Status = const(Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Name"; "Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Pay Mode"; "Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Cheque No"; "Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Cheque Date"; "Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Paying Bank Account"; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Source Bank Acc No."; "Source Bank Acc No.")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("On behalf of"; "On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Payment Narration"; "Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                // field(Job;Job)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Budget/Exchequer Account';
                // }
                field("Job Task No"; "Job Task No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Line';
                }
                field("Unit  Name"; "Unit  Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total VAT Amount"; "Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; "Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Wthheld six %"; "VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                }
                field("Total Retention Amount"; "Total Retention Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Recovery"; "Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Total Net Amount"; "Total Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; "Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                part("Attached Documents1"; "Document Attachment Factbox1")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                    // SystemCreatedBy = field(SystemCreatedBy);
                    //Editable = false;
                }
            }
            part(Control1000000021; "Posted PV Lines")
            {
                Editable = false;
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalEntries.Setfilters(Database::payments, 7, "No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                       trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        ResponsibilityCenter: Record "Responsibility Center";
                        PV: Record payments;
                    begin
                        if UserSetup.Get(UserId) then begin
                            if ResponsibilityCenter.Get(UserSetup."Responsibility Center") then begin
                                if ResponsibilityCenter.HQ then begin
                                     PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Payment Voucher", true, true, PV)
                                end else begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                                end;
                            end;
                        end else begin
                            if ResponsibilityCenter.Get(Rec."Responsibility Center") then begin
                                if ResponsibilityCenter.HQ then begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Payment Voucher", true, true, PV)
                                end else begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                                end;
                            end;
                        end;
                    end;
                //    trigger OnAction()
                //     begin
                //         //DocPrint.PrintPurchHeader(Rec);
                //         // if rec.posted <> true then begin
                //         //     error('PV Must Be Posted Before Printing!');
                //         //    end else
                //         if Rec."Responsibility Center" = 'R11' then begin
                //             Rec.Reset;
                //             Rec.SetRange("No.", Rec."No.");
                //             if Rec.FindSet then
                //                 Report.Run(57000, true, true, Rec)
                //         end else
                //             if Rec."Responsibility Center" <> 'R11' then begin
                //                 Rec.Reset;
                //                 Rec.SetRange("No.", Rec."No.");
                //                 if Rec.FindSet then
                //                     Report.Run(57021, true, true, Rec);
                //             end;

                //     end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //     ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                    //      ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        //       PaymentsPost."Post Payment Voucher"(Rec);
                    end;
                }
            }
            action("&Navigate")
            {
                ApplicationArea = Basic;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Scope = Repeater;

                trigger OnAction()
                var
                    Navigate: Page Navigate;
                    UserSetup: Record "User Setup";
                    GL: Record "G/L Entry";
                begin
                    Navigate.SetDoc(Date, "No.");
                    Navigate.Run;
                end;
            }
            action("General Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerBook;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "General Ledger Entries";
                RunPageLink = "Document No." = field("No."),
                              "Posting Date" = field("Cheque Date");
            }
            action(ReverseTransaction)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reverse Transaction';
                Ellipsis = true;
                Image = ReverseRegister;
                Scope = Repeater;
                ToolTip = 'Reverse a posted general ledger entry.';

                trigger OnAction()
                var
                    ReversalEntry: Record "Reversal Entry";
                    GL: Record "G/L Entry";
                begin
                    //check if receipt is allocated


                    Clear(ReversalEntry);
                    CalcFields(Reversed);
                    GL.Reset;
                    GL.SetRange("Document No.", "No.");
                    if GL.FindSet then begin
                        if Reversed then
                            ReversalEntry.AlreadyReversedEntry(TableCaption, GL."Entry No.");
                        /*IF GL."Journal Batch Name" = '' THEN
                          ReversalEntry.TestFieldError;*/
                        GL.TestField("Transaction No.");
                        ReversalEntry.ReverseTransaction(GL."Transaction No.")
                    end;

                end;
            }
            action("Create Reversal Document")
            {
                ApplicationArea = Basic;
                Image = Reconcile;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("No.", "No.");
                    Report.Run(57017, true, false, Rec)
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Payment Type" := "payment type"::"Payment Voucher";
        "Account Type" := "account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        // PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be Empty.';
    // ReversePV: Report "Copy payment Voucher";

    local procedure SetControlAppearance()
    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

