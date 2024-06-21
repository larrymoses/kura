#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65149 "InterProjectTransfer Card-post"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Inter_Project Transfer Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Description"; "Posting Description")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Main Funds Bank A/C"; "Main Funds Bank A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Job No"; "Transfer-To Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Task No"; "Transfer-To Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Income G/L A/C"; "Transfer-To Income G/L A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Total Transfer Amount"; "Total Transfer Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Transfer Amount LCY"; "Total Transfer Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Transfe-To Directorate"; "Transfe-To Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Transfe-To Department/Center"; "Transfe-To Department/Center")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control20; "Inter-Project Transfer Lines")
            {
                Editable = false;
                SubPageLink = "Document No" = field(No);
            }
            group("Currency Details")
            {
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if "Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", "Posting Date")
                        else
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
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
                                  "No." = field("No. Series");
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
                        Message('Testing');
                        /*ApprovalEntries.Setfilters(DATABASE::Payments,8,"No.");
                        ApprovalEntries.RUN;*/

                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin

                        Message('Testing');

                        /*IF ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendPaymentsForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin

                        Message('Testing Two');
                        /*ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);*/

                    end;
                }
                separator(Action34)
                {
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
                       // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin


                        Message('Testing Three');
                        /*usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        ReopenPV.PerformManualReopen(Rec);*/

                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                      //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Message('Testing Four');
                        /*usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        TESTFIELD("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);*/

                    end;
                }
                separator(Action28)
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

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to post this Interfund Document?', true) = false then
                            exit;

                        CalcFields("Total Transfer Amount", "Total Transfer Amount LCY");

                        Temp.Get(UserId);
                        JTemplate := Temp."Interfund Journal Template";
                        JBatch := Temp."Interfund Journal Batch";
                        if JTemplate = '' then begin
                            Error('Ensure the Interfund Journal Template is set up in Funds User Setup');
                        end;
                        if JBatch = '' then begin
                            Error('Ensure the Interfund Journal Batch is set up in the Funds User Setup')
                        end;

                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", JTemplate);
                        GenJournalLine.SetRange("Journal Batch Name", JBatch);
                        GenJournalLine.DeleteAll;

                        CashMangement.Get();
                        CashMangement.TestField("Gen. Prod. Posting Group");
                        CashMangement.TestField("VAT. Prod. Posting Group");

                        //Post Transfer To Job
                        LineNumber := 0;
                        LineNumber := LineNumber + 1000;
                        FundsAccounting.FnPostInterfundCredit(JTemplate, JBatch, LineNumber, "Document Date", Genline."document type"::" ", No, "External Document No.", Genline."account type"::"G/L Account", "Transfer-To Income G/L A/C",
                                                       Genline."gen. posting type"::Sale, CashMangement."VAT. Prod. Posting Group", CashMangement."Gen. Prod. Posting Group", "Currency Code",
                                                       "Transfer-To Job No", "Transfer-To Task No", Genline."job line type"::" ", 1, "Posting Description", "Total Transfer Amount" * -1,
                                                       "Total Transfer Amount LCY" * -1, 0, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

                        ////Post Transfer From
                        InterfundLine.Reset;
                        InterfundLine.SetRange("Document No", No);
                        if InterfundLine.FindSet then begin
                            repeat
                                LineNumber := LineNumber + 1000;
                                FundsAccounting.FnPostInterfundCredit(JTemplate, JBatch, LineNumber, "Document Date", Genline."document type"::" ", No, "External Document No.", Genline."account type"::"G/L Account", InterfundLine."Transfer-From Expense G/L A/C",
                                                          Genline."gen. posting type"::Purchase, CashMangement."VAT. Prod. Posting Group", CashMangement."Gen. Prod. Posting Group", "Currency Code",
                                                          InterfundLine."Transfer-From Job No", InterfundLine."Transfer-From Task No", Genline."job line type"::" ", 1, InterfundLine."Expensing Description", InterfundLine."Transfer Line Amount",
                                                          InterfundLine."Transfer Line Amount LCY", 0, InterfundLine."Shortcut Dimension 1 Code", InterfundLine."Shortcut Dimension 2 Code");
                            until InterfundLine.Next = 0;
                        end;

                        //Call Posting Codeunit
                        FundsAccounting.FnPostJournal(JTemplate, JBatch);

                        //update job ledger entry
                        //FundsAccounting.FnChangeEntryToPositive(N "Transfer-To Job No", "Transfer-To Task No", "Total Transfer Amount", ","Total Transfer Amount LCY");

                        //Post Fund Movement Entries.
                        EntryN := FundsAccounting.FnGetlastentryNo();
                        if EntryN = 0 then
                            EntryN := 1
                        else
                            EntryN := FundsAccounting.FnGetlastentryNo() + 1;
                        FundsAccounting.FnPostFundMovementEntries(EntryN, No, "Document Date", "External Document No.", "Posting Description", "Main Funds Bank A/C", "Currency Code", "Transfer-To Job No", "Total Transfer Amount", "Total Transfer Amount LCY", 0, false);

                        InterfundLine.Reset;
                        InterfundLine.SetRange("Document No", No);
                        if InterfundLine.FindSet then begin
                            repeat
                                EntryN := FundsAccounting.FnGetlastentryNo() + 1;
                                FundsAccounting.FnPostFundMovementEntries(EntryN, No, "Document Date", "External Document No.", "Posting Description", "Main Funds Bank A/C", "Currency Code", InterfundLine."Transfer-From Job No", InterfundLine."Transfer Line Amount" * -1,
                                               InterfundLine."Transfer Line Amount LCY" * -1, 0, false);

                            until InterfundLine.Next = 0;
                        end;

                    end;
                }
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        FundsAccounting: Codeunit "Funds  Accounting";
        LineNumber: Integer;
        Temp: Record "Funds User Setup";
        JTemplate: Code[50];
        JBatch: Code[50];
        Genline: Record "Gen. Journal Line";
        Project: Record Job;
        CashMangement: Record "Cash Management Setup";
        GenJournalLine: Record "Gen. Journal Line";
        InterfundLine: Record "Inter-Project Transfer Line";
        EntryN: Integer;
}

