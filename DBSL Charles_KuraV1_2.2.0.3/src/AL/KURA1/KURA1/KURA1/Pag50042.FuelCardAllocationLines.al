/// <summary>
/// Page Fuel Card Allocation Lines (ID 50042).
/// </summary>
page 50042 "Fuel Card Allocation Lines"
{
    Caption = 'Fuel Card Allocation Lines';
    PageType = ListPart;
    SourceTable = "Fuel Allocation Lines";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Card No."; Rec."Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Card No. field.';
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Card No. field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocated Amount field.';
                }
            }
        }
    }
}
