#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69602 "Terms of Service"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Terms of Service";
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
                field("Employment Type";"Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Term Period";"Contract Term Period")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum No. of Terms";"Maximum No. of Terms")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Employment Age (Years)";"Maximum Employment Age (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Linked to Projects";"Linked to Projects")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Benefit";"Pension Benefit")
                {
                    ApplicationArea = Basic;
                }
                field("Service Gratuity Benefit";"Service Gratuity Benefit")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Positions";"No. of Positions")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Active Employees";"No. of Active Employees")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7;Outlook)
            {
            }
            systempart(Control8;Notes)
            {
            }
            systempart(Control9;MyNotes)
            {
            }
            systempart(Control10;Links)
            {
            }
        }
    }

    actions
    {
    }
}

