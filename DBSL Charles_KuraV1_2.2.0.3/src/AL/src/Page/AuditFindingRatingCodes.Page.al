#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95116 "Audit Finding Rating Codes"
{
    CardPageID = "Audit Finding Rating Code";
    PageType = List;
    SourceTable = "Audit Finding Rating Code";

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
                field("Risk Heat Zone";"Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Findings";"No. of Audit Findings")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

