page 50012 "Exit Termination Grounds CardP"
{
    Caption = 'Exit Termination Grounds Card Part';
    PageType = CardPart;
    SourceTable = "Exit Termination Grounds";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                
                field("Grounds for termination"; Rec."Grounds for termination")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grounds for termination field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }
}
