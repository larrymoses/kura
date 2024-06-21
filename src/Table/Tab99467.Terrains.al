table 99467 Terrains
{
    Caption = 'Terrains';
    DataClassification = ToBeClassified;
    LookupPageId =Terrains;
    DrillDownPageId=Terrains;
    fields
    {
        field(1; "Terrain Code"; Code[20])
        {
            Caption = 'Terrain Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Terrain Code")
        {
            Clustered = true;
        }
    }
}
