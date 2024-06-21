#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65054 "Grant Budget Summary List"
{
    PageType = List;
    SourceTable = "Grant Budget Summary";

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
                field("Budget Currency";"Budget Currency")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Amount";"Budget Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Amount(LCY)";"Budget Amount(LCY)")
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

