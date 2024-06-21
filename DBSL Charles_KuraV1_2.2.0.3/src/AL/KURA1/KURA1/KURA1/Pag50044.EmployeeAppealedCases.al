/// <summary>
/// Page Employee Appealed Cases (ID 50044).
/// </summary>
page 50044 "Employee Appealed Cases"
{
    Caption = 'Employee Appealed Cases';
    PageType = List;
    SourceTable = "HR Appealed Disc. Cases";
    InsertAllowed = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Number field.', Comment = '%';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.', Comment = '%';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
                field("Appeal Type";Rec."Appeal Type")
                {
                    ApplicationArea = All;
                }
                field("Appeal Date"; Rec."Appeal Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appeal Date field.', Comment = '%';
                }
                field("Action Taken Date"; Rec."Action Taken Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Action Taken Date field.', Comment = '%';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Action Taken field.', Comment = '%';
                }
            }
        }
    }
}
