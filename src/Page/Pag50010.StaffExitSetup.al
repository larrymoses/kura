/// <summary>
/// Page Staff Exit Setup (ID 50010).
/// </summary>
page 50010 "Staff Exit Setup"
{
    ApplicationArea = All;
    Caption = 'Staff Exit Setup';
    PageType = List;
    SourceTable = "Staff Exit Setup";
    UsageCategory = Lists;
    Editable = true;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Exit Code"; Rec."Exit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Exit Type"; Rec."Exit Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Type field.';
                }
                field("Has Terminal Benefits"; Rec."Has Terminal Benefits")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Has Terminal Benefits field.';
                }
                field("Requires Clearance"; Rec."Requires Clearance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requires Clearance field.';
                }
                field("Requires Exit Interview"; Rec."Requires Exit Interview")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requires Exit Interview field.';
                }
                field("Requires Notice "; Rec."Requires Notice")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requires Notice field.';
                }
                field("Has Termination Grounds"; Rec."Has Termination Grounds")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Has Termination Grounds field.';
                }
            }
        }
    }
}
