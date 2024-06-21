#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95025 "Risk Response Strategies"
{
    CardPageID = "Risk Response Strategy";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Response Strategy";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategy ID";"Strategy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Type";"Risk Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
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

