#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69792 "Application Declarations"
{
    PageType = List;
    SourceTable = "Application Declaration";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Declaration Statement";"Declaration Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate Accepted";"Candidate Accepted")
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
