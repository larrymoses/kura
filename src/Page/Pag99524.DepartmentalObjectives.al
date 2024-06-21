page 99524 "Departmental Objectives"
{
    Caption = 'Departmental Objectives ';
    PageType = ListPart;
    SourceTable = "Departmental Objectives Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
