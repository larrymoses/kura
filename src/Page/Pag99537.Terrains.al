page 99537 Terrains
{
    ApplicationArea = All;
    Caption = 'Terrains';
    PageType = List;
    SourceTable = Terrains;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Terrain Code"; Rec."Terrain Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Terrain Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
