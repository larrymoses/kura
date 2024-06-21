/// <summary>
/// Page Fuel Allocations (ID 50040).
/// </summary>
page 50040 "Fuel Allocations"
{
    // ApplicationArea = All;
    Caption = 'Fuel Allocations';
    PageType = List;
    SourceTable = "Fuel Allocations";
    CardPageId = "Fuel Allocation Card";
    // UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Financial Code"; Rec."Financial Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                    Visible = false;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last DateTime Modified field.';
                }
            }
        }
    }

    actions
    {

    }
}
