page 99539 "Link RICS"
{
    Caption = 'Link RICS';
    PageType = List;
    SourceTable = "RICS Lines";
    UsageCategory = None;
    Editable = false;
    DeleteAllowed=false;
    InsertAllowed =false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Financial Year";Rec."Financial Year")
                {
                   ApplicationArea = All; 
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Category"; Rec."Road Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Road Category field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Link Name field.';
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Chainage(Km) field.';
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Chainage(Km) field.';
                }
                field("Existing Culverts(Lines)"; Rec."Existing Culverts(Lines)")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Culverts(Lines)"; Rec."Proposed Culverts(Lines)")
                {
                    ApplicationArea = Basic;
                }
                field("Cut to spoil mtr (M³)"; Rec."Cut to spoil mtr (M³)")
                {
                    ApplicationArea = Basic;
                }
                field("Drain Cleaning (M)"; Rec."Drain Cleaning (M)")
                {
                    ApplicationArea = Basic;
                }
                field("Bush Clearing (M²)"; Rec."Bush Clearing (M²)")
                {
                    ApplicationArea = Basic;
                }
                field("Side Slabs (M²)"; Rec."Side Slabs (M²)")
                {
                    ApplicationArea = Basic;
                }
                field("Kerbs Installation"; Rec."Kerbs Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Patching Required M³"; Rec."Patching Required M³")
                {
                    ApplicationArea = Basic;
                }
                field("Overlay Required M³"; Rec."Overlay Required M³")
                {
                    ApplicationArea = Basic;
                }
                field("Gravel Required M³"; Rec."Gravel Required M³")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Lines)
            {
                action(Survey)
                {
                    ApplicationArea = Basic;
                    Scope = Repeater;
                    RunObject = Page "RICS Detailed Line";
                    RunPageLink = "Document No." = field("Document No."), "Road Code" = field("Road Code");
                    trigger OnAction()
                    var
                        RICSDetailedLine: Record "RICS Detailed Line";
                        RICSDetailedLines: Page "RICS Detailed Line";
                    begin
                        Rec.TestField("Document No.");
                        Rec.TestField("Road Code");
                        RICSDetailedLine.FilterGroup(2);
                        RICSDetailedLine.SetRange("Document No.", Rec."Document No.");
                        RICSDetailedLine.SetRange("Road Code", Rec."Road Code");
                        RICSDetailedLine.FilterGroup(0);
                        RICSDetailedLines.SetTableView(RICSDetailedLine);
                        RICSDetailedLines.Editable := true;
                        RICSDetailedLines.Run();
                    end;
                }
            }
        }
    }
}
