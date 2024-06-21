#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99999 "Road Study Sections"
{
    PageType = List;
    SourceTable = "Road Study Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Study ID";"Study ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section ID";"Section ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Section Distance (Km)";"Section Distance (Km)")
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

