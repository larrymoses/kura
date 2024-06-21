/// <summary>
/// Page DuttyPerformanceChallengesSF (ID 50026).
/// </summary>
page 50026 DuttyPerformanceChallengesSF
{
    Caption = 'DuttyPerformanceChallengesSF';
    PageType = ListPart;
    SourceTable = DutyPerformanceChallenges;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Challenge; Rec.Challenge)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Challenge field.';
                }
                field("Training Suggested"; Rec."Training Suggested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Suggested field.';
                }
            }
        }
    }
}
