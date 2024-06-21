/// <summary>
/// Page EmpTrainingAttendedCard (ID 50027).
/// </summary>
page 50027 EmpTrainingAttendedCard
{
    Caption = 'EmpTrainingAttendedCard';
    PageType = ListPart;
    SourceTable = EmpTrainingAttended;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Name field.';
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Duration field.';
                }
                field("With Support"; Rec."With Support")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the With KURA Support field.';
                }
            }
        }
    }
}
