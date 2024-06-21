#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80087 "Goal Template Lines"
{
    PageType = List;
    SourceTable = "Goal Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Goal ID";"Goal ID")
                {
                    ApplicationArea = Basic;
                }
                field("Goal Template ID";"Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Goal Category";"Goal Category")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID";"Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategic Objective ID";"Strategic Objective ID")
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

