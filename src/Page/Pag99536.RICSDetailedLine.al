page 99536 "RICS Detailed Line"
{
    ApplicationArea = Basic;
    Caption = 'RICS Detailed Line';
    PageType = List;
    SourceTable = "RICS Detailed Line";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Start Chainage(Km)";Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(Km)";Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                 field("Surface Type";Rec."Surface Type")
                {
                    ApplicationArea = Basic;
                }
                 field("Width (M)";Rec."Width (M)")
                {
                    ApplicationArea = Basic;
                }
                field(Terrain;Rec.Terrain)
                {
                    ApplicationArea = Basic;
                }
                 field("Road Condition";Rec."Road Condition")
                {
                    ApplicationArea = Basic;
                }
                 field("Road Condition %";Rec."Road Condition %")
                {
                    ApplicationArea = Basic;
                }
                 field("Existing Culverts(Lines)";Rec."Existing Culverts(Lines)")
                {
                    ApplicationArea = Basic;
                }
                 field("Proposed Culverts(Lines)";Rec."Proposed Culverts(Lines)")
                {
                    ApplicationArea = Basic;
                }
                 field("Cut to spoil mtr (M³)";Rec."Cut to spoil mtr (M³)")
                {
                    ApplicationArea = Basic;
                }
                 field("Drain Cleaning (M)";Rec."Drain Cleaning (M)")
                {
                    ApplicationArea = Basic;
                }
                 field("Bush Clearing (M²)";Rec."Bush Clearing (M²)")
                {
                    ApplicationArea = Basic;
                }
                 field("Side Slabs (M²)";Rec."Side Slabs (M²)")
                {
                    ApplicationArea = Basic;
                }
                 field("Kerbs Installation";Rec."Kerbs Installation")
                {
                    ApplicationArea = Basic;
                }
                 field("Patching Required M³";Rec."Patching Required M³")
                {
                    ApplicationArea = Basic;
                }
                 field("Overlay Required M³";Rec."Overlay Required M³")
                {
                    ApplicationArea = Basic;
                }
                 field("Gravel Required M³";Rec."Gravel Required M³")
                {
                    ApplicationArea = Basic;
                }
                 field("Other Structures";Rec."Other Structures")
                {
                    ApplicationArea = Basic;
                }
                 field("Proposed Intervention";Rec."Proposed Intervention")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
