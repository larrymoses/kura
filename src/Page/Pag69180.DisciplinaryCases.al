#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69180 "Disciplinary Cases"
{
    PageType = List;
    SourceTable = "Disciplinary Cases";

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Rating;Rating)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007;Links)
            {
            }
            systempart(Control1000000008;MyNotes)
            {
            }
            systempart(Control1000000009;Notes)
            {
            }
            systempart(Control1000000010;Outlook)
            {
            }
        }
    }

    actions
    {
    }
}

