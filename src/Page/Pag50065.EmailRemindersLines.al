/// <summary>
/// Page Email Reminders Lines (ID 50065).
/// </summary>
page 50065 "Email Reminders Lines"
{
    Caption = 'Email Reminders Lines';
    PageType = ListPart;
    SourceTable = "Email Reminder Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Level field.', Comment = '%';
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duration Type field.', Comment = '%';
                }
            }
        }
    }
}
