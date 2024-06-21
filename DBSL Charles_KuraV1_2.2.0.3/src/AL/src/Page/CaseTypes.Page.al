#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56104 "Case Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Case Types";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Nature";"Case Nature")
                {
                    ApplicationArea = Basic;
                }
                field("Case Type";"Case Type")
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

