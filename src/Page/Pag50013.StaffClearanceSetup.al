page 50013 "Staff Clearance Setup"
{
    ApplicationArea = All;
    Caption = 'Staff Clearance Setup';
    PageType = List;
    SourceTable = "Staff Clearance Setup";
    UsageCategory = Lists;
    
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
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Code field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Last Modified Date Time"; Rec."Last Modified Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Modified Date Time field.';
                }
            }
        }
    }
}
