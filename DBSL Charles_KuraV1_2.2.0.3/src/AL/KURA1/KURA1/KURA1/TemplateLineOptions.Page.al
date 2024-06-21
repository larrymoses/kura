#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69720 "Template Line Options"
{
    PageType = List;
    SourceTable = "Template Questn Option";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Option Code";"Option Code")
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
            systempart(Control6;Outlook)
            {
            }
            systempart(Control7;Notes)
            {
            }
            systempart(Control8;MyNotes)
            {
            }
            systempart(Control9;Links)
            {
            }
        }
    }

    actions
    {
    }
}
