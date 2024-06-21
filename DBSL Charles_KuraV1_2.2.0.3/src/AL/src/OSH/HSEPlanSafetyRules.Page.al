#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69465 "HSE Plan Safety Rules"
{
    CardPageID = "HSE Plan Safety Rule";
    PageType = List;
    SourceTable = 69432;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Category Code";"Category Code")
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
