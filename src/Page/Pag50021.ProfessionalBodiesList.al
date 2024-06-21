/// <summary>
/// Page Professional Bodies (ID 50021).
/// </summary>
page 50021 "Professional Bodies List"
{
    ApplicationArea = BasicHR;
    Caption = 'Professional Bodies';
    PageType = List;
    SourceTable = "Professional Bodies";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Professional Body";
    
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
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
                field("No. of Members"; Rec."No. of Members")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Members field.';
                }
                field("Total Fees Payable"; Rec."Total Fees Payable")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Last Date Modified";Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.CalcFields("No. of Members", "Total Fees Payable", "Total CPD Points Required");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("No. of Members", "Total Fees Payable", "Total CPD Points Required");
    end;
}
