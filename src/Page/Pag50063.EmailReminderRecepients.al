/// <summary>
/// Page Email Reminder Recepients (ID 50063).
/// </summary>
page 50063 "Email Reminder Recepients"
{
    Caption = 'Email Reminder Recepients';
    PageType = ListPart;
    SourceTable = "Email Reminder Recepients";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.', Comment = '%';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
                field("Employee Email"; Rec."Employee Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Email field.', Comment = '%';
                }
                field("Recepient Type"; Rec."Recepient Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recepient Type field.', Comment = '%';
                }
            }
        }
    }
}
