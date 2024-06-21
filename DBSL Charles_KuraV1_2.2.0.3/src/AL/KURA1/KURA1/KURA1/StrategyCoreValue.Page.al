#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80026 "Strategy Core Value"
{
    PageType = List;
    SourceTable = "Strategy Core Value";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID";"Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Core Value";"Core Value")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

