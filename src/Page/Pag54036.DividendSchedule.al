#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54036 "Dividend Schedule"
{
    PageType = ListPart;
    SourceTable = "Institutional Actions";
    SourceTableView = where(Type=const(Dividend));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institution Code";"Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Books Closure Date";"Books Closure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Date";"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Per Share";"Amount Per Share")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Payment posted";"Payment posted")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type:=Type::Dividend
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type:=Type::Dividend
    end;

    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        LineNo: Integer;
        DivSchedule: Record "Dividend Payment";
        BankAcc: Record "Bank Account";
        Custodian: Record "Custodian Code";
        InvestPost: Codeunit "Investment Management";
}

