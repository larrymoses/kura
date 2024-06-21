#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80209 "Policy Core Value Revisions"
{
    PageType = List;
    SourceTable = "BR Option Text Response Type";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Score (%)";"Score (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type";"Rating Type")
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

