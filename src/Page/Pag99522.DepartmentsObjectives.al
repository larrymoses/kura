page 99522 "Departments Objectives"
{
    ApplicationArea = All;
    Caption = 'Departmental Objectives';
    PageType = List;
    CardPageId= "Department Objectives";
    SourceTable = "Departmental Objectives";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
            }
        }
    }
}
