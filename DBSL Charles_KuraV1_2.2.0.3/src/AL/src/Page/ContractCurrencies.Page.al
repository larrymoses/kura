#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72399 "Contract Currencies"
{
    PageType = ListPart;
    SourceTable = "Contract Currency";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage of Total Payment(%)";"Percentage of Total Payment(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Exchange Rate";"Exchange Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Amount(LCY)";"Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount FCY';
                }
            }
        }
    }

    actions
    {
    }
}

