#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72160 "RICS Study Objectives"
{
    CardPageID = "RICS Study Objective";
    PageType = List;
    SourceTable = "RICS Study Objective";

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
                field("Entry No";"Entry No")
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

