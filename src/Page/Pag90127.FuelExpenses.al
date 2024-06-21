page 90127 "Fuel Expenses"
{
    ApplicationArea = All;
    Caption = 'Fuel Card Expenses';
    CardPageId = "Fuel Expenses Card";
    PageType = List;
    SourceTable = "Vehicle Fuel Card Lines";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Reciept No"; Rec."Reciept No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reciept No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Other Expenses"; Rec."Other Expenses")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Expenses field.';
                }
                field("Date of Fueling"; Rec."Date of Fueling")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Fueling field.';
                }
                field("Vehicle RegNo"; Rec."Vehicle RegNo")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle RegNo field.';
                }
                field("vehicle Make"; Rec."vehicle Make")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the vehicle Make field.';
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Names"; Rec."Driver Names")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Names field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(closed; Rec.closed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the closed field.';
                }
            }
        }
    }
}
