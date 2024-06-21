#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69020 "Earnings List"
{
    Editable = false;
    PageType = List;
    SourceTable = EarningsX;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Type"; "Pay Type")
                {
                    ApplicationArea = Basic;
                }
                field(Taxable; Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Calculation Method"; "Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount"; "Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage; Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Reduces Tax"; "Reduces Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Report"; "Show on Report")
                {
                    ApplicationArea = Basic;
                }
                field("Earning Type"; "Earning Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies to All"; "Applies to All")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Master Roll"; "Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field(Block; Block)
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay Arrears"; "Basic Pay Arrears")
                {
                    ApplicationArea = Basic;
                }
                field("Negative Earning"; "Negative Earning")
                {
                    ApplicationArea = Basic;
                }
                field("Show No.of Days"; "Show No.of Days")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Classification"; "KRA Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Fluctuation Type"; "Fluctuation Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Notes)
            {
            }
            systempart(Control1000000024; MyNotes)
            {
            }
            systempart(Control1000000025; Links)
            {
            }
        }
    }

    actions
    {
    }
}

