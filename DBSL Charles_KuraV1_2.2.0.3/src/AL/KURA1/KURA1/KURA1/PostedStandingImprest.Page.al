#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57155 "Posted Standing Imprest"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const("Standing Imprest"),
                            Posted=const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date;Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayMode;Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(StandingImprestType;Rec."Standing Imprest Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeDate;Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeNo;Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayingBankAccount;Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BankName;Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PaymentNarration;Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ShortcutDimension1Code;Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentName;Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ShortcutDimension2Code;Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProjectName;Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Job;Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(JobTaskNo;Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(JobName;Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ShortcutDimension3Code;Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UnitName;Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalAmount;Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TotalNetAmountLCY;Rec."Total Payment Amount LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Net Amount LCY';
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PostingDate;Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy;Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PostedDate;Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            part(Control1000000021;"Standing Imprest Lines")
            {
                Editable = false;
                SubPageLink = No=field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019;Notes)
            {
            }
            systempart(Control1000000020;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(PaymentVoucher)
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=const(56000),
                                  "No."=field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
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

                        ApprovalEntries.Setfilters(Database::Payments,7,Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
        area(processing)
        {
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action(Action1000000040)
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


                        Rec.SetRange(Rec."No.",Rec."No.");
                        Report.Run(59098,true,true,Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Action1000000038)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                          //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type":=Rec."payment type"::"Standing Imprest";
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
