page 99680 "Survey Interventions"
{
    ApplicationArea = All;
    Caption = 'Survey Interventions';
    PageType = List;
    SourceTable = "Survey Interventions";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Intervention; Rec.Intervention)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Intervention field.';
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
