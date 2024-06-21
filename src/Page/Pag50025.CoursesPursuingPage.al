/// <summary>
/// Page CoursesPursuingPage (ID 50025).
/// </summary>
page 50025 CoursesPursuingPage
{
    Caption = 'CoursesPursuingPage';
    PageType = ListPart;
    SourceTable = CoursesCurrentlyPursuing;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
