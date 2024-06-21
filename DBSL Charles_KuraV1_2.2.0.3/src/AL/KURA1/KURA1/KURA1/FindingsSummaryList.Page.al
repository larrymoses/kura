#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52016 "Findings Summary List"
{
    PageType = List;
    SourceTable = "Findings Summary";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Finding ID";"Finding ID")
                {
                    ApplicationArea = Basic;
                }
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8;Outlook)
            {
            }
            systempart(Control9;Notes)
            {
            }
            systempart(Control10;MyNotes)
            {
            }
            systempart(Control11;Links)
            {
            }
        }
    }

    actions
    {
    }
}

