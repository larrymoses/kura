page 99523 "Department Objectives"
{
    Caption = 'Department Objectives';
    PageType = Card;
    SourceTable = "Departmental Objectives";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
             part(Objectives; "Departmental Objectives")
                {
                    SubPageLink = "Department Code" = field("Shortcut Dimension 3 Code"), "Appraisal Period" = field("Appraisal Period");
                    UpdatePropagation = Both;
                }
        }
    }
}
