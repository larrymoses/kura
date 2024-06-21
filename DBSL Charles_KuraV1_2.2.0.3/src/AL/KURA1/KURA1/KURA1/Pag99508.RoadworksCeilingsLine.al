/// <summary>
/// Page Roadworks Ceilings Line (ID 99508).
/// </summary>
page 99508 "Roadworks Ceilings Line"
{
    Caption = 'Roadworks Ceilings Line';
    PageType = ListPart;
    SourceTable = "RoadWorks Ceilings Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                    Visible = false;
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                
                field("Allocation Percentage(%)"; Rec."Allocation Percentage(%)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocation Percentage(%) field.';
                }
                field("Allocation Amount (KES)"; Rec."Allocation Amount (KES)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocation Amount (KES) field.';
                }
                field("Allocation to Regional Const"; Rec."Allocation to Regional Const")
                {
                    Visible=false;
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
                field("Allocation Remaining Amount"; Rec."Allocation Remaining Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocation Remaining Amount field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Roadworks Budget Ceiling Detailed")
            {
                //VISIBLE=FALSE;
                Promoted = true;
                RunObject = page "Roadworks CeilingsDetailedline";
                RunPageLink = "Document No" = field("Document No"), "Region Code" = field("Region Code");
            }
        }
    }
}
