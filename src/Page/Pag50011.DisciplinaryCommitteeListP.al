/// <summary>
/// Page Disciplinary Committee ListP (ID 50011).
/// </summary>
page 50011 "Disciplinary Committee ListP"
{
    Caption = 'Disciplinary Committee ListP';
    PageType = ListPart;
    SourceTable = "Board Disciplinary Committee";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code;Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }
}
