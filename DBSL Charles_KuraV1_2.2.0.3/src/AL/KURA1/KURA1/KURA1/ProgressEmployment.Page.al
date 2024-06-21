#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72130 "Progress Employment"
{
    PageType = ListPart;
    SourceTable = "Progress Employment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No";"Header No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Male Count";"Male Count")
                {
                    ApplicationArea = Basic;
                }
                field("Female Count";"Female Count")
                {
                    ApplicationArea = Basic;
                }
                field("Male Person Days";"Male Person Days")
                {
                    ApplicationArea = Basic;
                }
                field("Female Person Days";"Female Person Days")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Target Person Days";"Remaining Target Person Days")
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

