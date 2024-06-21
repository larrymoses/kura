page 99543 "Dep Objectives"
{
    ApplicationArea = All;
    Caption = 'Departmental Objectives';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = AppraisalDeptObjectives;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                   field("Document No.";Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Target field.';
                }
            }
        }
    }
}
