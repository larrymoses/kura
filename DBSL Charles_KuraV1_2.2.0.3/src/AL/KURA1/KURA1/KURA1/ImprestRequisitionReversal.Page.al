#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57102 "Imprest Requisition Reversal"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released));

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
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date"; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field("Travel Date"; "Travel Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit  Name"; "Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; "Imprest Deadline")
                {
                    ApplicationArea = Basic;
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
                }
                field(Job; JobNo)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No"; "Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; "Job Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000017; "Imprest Lines")
            {
                Editable = false;
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
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
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                separator(Action1000000033)
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

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        SetRange("No.", "No.");
                        Report.Run(57004, true, true, Rec)
                    end;
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
                    // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000020)
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
                        //PaymentsPost.PostPettyCash(Rec);
                        //Committment.ImprestCommittment(Rec);
                        PaymentPost."Post Imprest"(Rec);
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
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowAttach := OpenEntries(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Payment Type" := "payment type"::Imprest;
        "Account Type" := "account type"::Customer;
        "Imprest Type" := "imprest type"::"Project Imprest";
        "Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := OpenEntries(Rec);
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Text0001: label 'Are you sure you want to generate a surender for imprest No. %1?';
        imprestLines: Record "Imprest Lines";
        imprestHeader: Record payments;
        surrenderLines: Record "Imprest Lines";
        SurrenderHeader: Record payments;
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

