#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72117 "Work Schedule"
{
    PageType = List;
    SourceTable = "Work Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Q1(LCY)"; Rec."Q1(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Q2(LCY)"; Rec."Q2(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Q3(LCY)"; Rec."Q3(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Q4(LCY)"; Rec."Q4(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total(LCY)"; Rec."Total(LCY)")
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

#pragma implicitwith restore

