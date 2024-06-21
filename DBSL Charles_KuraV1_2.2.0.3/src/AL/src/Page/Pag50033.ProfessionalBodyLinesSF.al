/// <summary>
/// Page Professional Body Lines SF (ID 50033).
/// </summary>
page 50033 "Professional Body Lines SF"
{
    Caption = 'Professional Body Lines SF';
    PageType = ListPart;
    SourceTable = "Professional Body Lines";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Professional Body No."; Rec."Professional Body No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Professional Body No. field.';
                }
                field("Professional Body Name"; Rec."Professional Body Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Professional Body Name field.';
                }
                field("Amount (Fees)"; Rec."Amount (Fees)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount (Fees) field.';
                }
            }
        }
    }
}
