#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69787 "Benefit Plan Grade"
{
    PageType = List;
    SourceTable = "Benefit Plan Grade";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Package ID";"Package ID")
                {
                    ApplicationArea = Basic;
                }
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade ID";"Job Grade ID")
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

