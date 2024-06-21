#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69765 "Offer Compensation"
{
    PageType = ListPart;
    SourceTable = "Employment Offer Compensation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Offer ID";"Offer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Earnings Code";"Earnings Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Frequency";"Pay Frequency")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount";"Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount(LCY)";"Line Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Start Period";"Payroll Start Period")
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

