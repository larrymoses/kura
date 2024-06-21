#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69001 "Tax Table"
{
    PageType = List;
    SourceTable = BracketsX;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table Code";"Table Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Tax Band";"Tax Band")
                {
                    ApplicationArea = Basic;
                }
                field("Lower Limit";"Lower Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Upper Limit";"Upper Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Taxable Amount";"Taxable Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("From Date";"From Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("End Date";"End Date")
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
}

