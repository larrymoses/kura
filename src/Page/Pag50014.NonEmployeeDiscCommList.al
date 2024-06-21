/// <summary>
/// Page NonEmployeeDiscCommList (ID 50014).
/// </summary>
page 50014 NonEmployeeDiscCommList
{
    ApplicationArea = All;
    Caption = 'Non-Employee Disciplinary Committee';
    PageType = List;
    SourceTable = "Non-Employee Disciplinary Com.";
    UsageCategory = Lists;
    Editable = true;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Names field.';
                }
            }
        }
    }
}
