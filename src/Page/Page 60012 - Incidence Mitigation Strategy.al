
/// <summary>
/// Page Incidence Mitigation Strategy (ID 60012).
/// </summary>
page 60012 "Incidence Mitigation Strategy"
{
    PageType = ListPart;
    SourceTable = "Incidence Mitigation Strategy";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Mitigation Strategy"; Rec."Mitigation Strategy")
                {
                    ApplicationArea = BasicHr;
                }
                field("Mitigation Strategy Descriptio"; Rec."Mitigation Strategy Descriptio")
                {
                    ApplicationArea = BasicHr;
                }
                field("Noted By"; Rec."Noted By")
                {
                    ApplicationArea = BasicHr;
                }
                field("Noted At"; Rec."Noted At")
                {
                    ApplicationArea = BasicHr;
                }
            }
        }
    }

    actions
    {
    }
}


