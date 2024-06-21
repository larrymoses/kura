page 99526 "Employee History"
{
    ApplicationArea = All;
    Caption = 'Employee History';
    PageType = List;
    SourceTable = "Employment History";
    UsageCategory = History;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employment Terms"; Rec."Employment Terms")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employment Terms field.';
                }
                field("Job Position";Rec."Job Position")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                  ApplicationArea = All;  
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
    }
}
