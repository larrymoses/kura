#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69107 "Skills and Requirements"
{
    PageType = ListPart;
    SourceTable = "Staff Establishment Task Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID";"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
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

