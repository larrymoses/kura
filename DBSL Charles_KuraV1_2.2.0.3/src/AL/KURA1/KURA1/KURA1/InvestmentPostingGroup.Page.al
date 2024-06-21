#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54044 "Investment Posting Group"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Investment Posting Group";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Investment Cost Account";"Investment Cost Account")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Revaluation Account";"Investment Revaluation Account")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Receivable Account";"Interest Receivable Account")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Income Account";"Investment Income Account")
                {
                    ApplicationArea = Basic;
                }
                field("Dividend Receivable AC";"Dividend Receivable AC")
                {
                    ApplicationArea = Basic;
                }
                field("Dividend Income AC";"Dividend Income AC")
                {
                    ApplicationArea = Basic;
                }
                field("Revaluation Gain/Loss";"Revaluation Gain/Loss")
                {
                    ApplicationArea = Basic;
                }
                field("Gain/Loss on Disposal Account";"Gain/Loss on Disposal Account")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Account";"Withholding Tax Account")
                {
                    ApplicationArea = Basic;
                }
                field("Capital Reserve Account";"Capital Reserve Account")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

