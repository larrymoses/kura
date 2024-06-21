#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75117 "BoQ Template Work Category"
{
    PageType = List;
    SourceTable = "BoQ Template Work Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("BoQ Template Code";"BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Works Category Code";"Works Category Code")
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

