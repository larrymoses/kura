#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80105 "Improvement Plan Line"
{
    PageType = ListPart;
    SourceTable = "Improvement Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PIP ID";"PIP ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Expectation to be met";"Expectation to be met")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Deficiency ID";"Performance Deficiency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Achievement Due Date";"Achievement Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator";"Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Achievement Qty";"Achievement Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Final Performance Rating";"Final Performance Rating")
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

