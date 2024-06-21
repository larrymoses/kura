#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72158 "RICS Counties"
{
    CardPageID = "RICS County";
    PageType = List;
    SourceTable = "RICS County";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RICS No.";"RICS No.")
                {
                    ApplicationArea = Basic;
                }
                field("County Code";"County Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code";"Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Existing Roads";"No. of Existing Roads")
                {
                    ApplicationArea = Basic;
                }
                field("No. of New Roads";"No. of New Roads")
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

