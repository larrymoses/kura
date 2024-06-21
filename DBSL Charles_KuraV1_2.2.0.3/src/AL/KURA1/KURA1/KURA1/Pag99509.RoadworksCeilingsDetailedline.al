/// <summary>
/// Page Roadworks CeilingsDetailedline (ID 99509).
/// </summary>
page 99509 "Roadworks CeilingsDetailedline"
{
    Caption = 'Roadworks Ceilings Detailed line';
    PageType = List;
    SourceTable = "RoadWorks Ceiling DetailedLine";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field(Town;Rec.Town)
                {
                    ApplicationArea = All;
                }
                field("Town Allocation(KES)"; Rec."Town Allocation(KES)")
                {
                    ApplicationArea = All;
                }
                field("Allocation Percentage(%)"; Rec."Allocation Percentage(%)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocation Percentage(%) field.';
                }

                field("Allocation to Regional Const"; Rec."Allocation to Regional Const")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocation to Regional Const field.';
                }

                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }

            }
        }
    }
}
