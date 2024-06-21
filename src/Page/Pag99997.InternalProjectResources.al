/// <summary>
/// Page Internal Project Resources (ID 99997).
/// </summary>
page 99997 "Internal Project Resources"
{
    ApplicationArea = All;
    Caption = 'Internal Project Resources';
    PageType = List;
    SourceTable = "Internal Project Resource";
    UsageCategory = Lists;
    
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Resource Type"; Rec."Resource Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Resource Type field.';
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Role Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("Appointment Document No."; Rec."Appointment Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appointment Document No. field.';
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appointment Date field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }
}
