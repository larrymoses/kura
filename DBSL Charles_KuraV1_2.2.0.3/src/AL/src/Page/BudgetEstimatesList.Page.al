#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52019 "Budget Estimates List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Budget Estimates";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Estimates";"Budget Estimates")
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

