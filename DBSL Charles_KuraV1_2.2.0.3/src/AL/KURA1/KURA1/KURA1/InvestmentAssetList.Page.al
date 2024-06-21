#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54050 "Investment Asset List"
{
    PageType = List;
    SourceTable = "Investment Asset";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("FA Posting Group";"FA Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Mortgage Type";"Mortgage Type")
                {
                    ApplicationArea = Basic;
                }
                field("Mortgage Term";"Mortgage Term")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Repayment";"Expected Repayment")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type";"Investment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Frequency Period";"Interest Frequency Period")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date";"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Date";"Investment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Period";"Maturity Period")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Interest Periods";"No. Of Interest Periods")
                {
                    ApplicationArea = Basic;
                }
                field("Bonus Frequency Period";"Bonus Frequency Period")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type Name";"Investment Type Name")
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Units";"No.Of Units")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Type";"Asset Type")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Rate Type";"Interest Rate Type")
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

