table 50010 "Microsoft Graphs"
{
    Caption = 'Microsoft Graphs';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Type"; Enum "Graph API types")
        {
            Caption = 'Type';
        }
        field(3; "Client ID"; Text[500])
        {
            Caption = 'Client ID';
        }
        field(4; "Client Secret"; Text[400])
        {
            Caption = 'Client Secret';
        }
        field(5; Scope; Text[100])
        {
            Caption = 'Scope';
        }
        field(6; URL; Text[150])
        {
            Caption = 'URL';
        }
        field(7; "Tenant ID"; Text[200])
        {
          
        }
        field(8; Host; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK;"Type","Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type,Rec.Type);
        if Graph.findlast() then
        Rec."Entry No." := Graph."Entry No."+1;
    end;
}
