#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54031 "Money Market Sale"
{
    PageType = Card;
    SourceTable = Receipts;

    layout
    {
        area(content)
        {
            group("Money Market Redemption")
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Type";"Receipt Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Name";"Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Intitution Name";"Intitution Name")
                {
                    ApplicationArea = Basic;
                }
                field("Investment No";"Investment No")
                {
                    ApplicationArea = Basic;
                }
                field(Broker;Broker)
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No";"Receipt No")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code";"Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code";"Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Investment Transcation Type";"Investment Transcation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Amount";"Interest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field("Revaluation Gain/(Loss)";"Revaluation Gain/(Loss)")
                {
                    ApplicationArea = Basic;
                }
                field("Post Gain/Loss Redeem";"Post Gain/Loss Redeem")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group("Sales Details")
            {
                field("Face Value";"Face Value")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Redeem";"Percentage Redeem")
                {
                    ApplicationArea = Basic;
                }
                field("Broker Fees";"Broker Fees")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Schedule Date";"Schedule Date")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode";"Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code";"Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Currency)
                {
                    ApplicationArea = Basic;
                }
                field("Whtax Amount";"Whtax Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if ("Post Gain/Loss Redeem"=false) then begin
                      InvestPost.FnPostSell(Rec);
                    end;
                    /*
                    IF ("Post Gain/Loss Redeem"=TRUE) THEN BEGIN
                      InvestPost.FnPostReemGainORLoss(Rec);
                    END;*///Commented not in use

                end;
            }
        }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types";
        ExpectedInterest: Record "Expected Interest1";
        InvestmentRec: Record "Investment Asset";
        InvestmentPostingGroup: Record "Investment Posting Group";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
        InvestPost: Codeunit "Investment Management";
}
