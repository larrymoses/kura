table 99610 "Casuals Earning Bracket Table"
{
    Caption = 'Casuals Earning Bracket Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Table Code"; Code[10])
        {
            Caption = 'Table Code';
        }
        field(2; Description;Text[100] )
        {
            Caption = 'Description';
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(4; "End Date"; Date)
        {
            Caption = 'End Date';
        }
    }
    keys
    {
        key(PK; "Table Code")
        {
            Clustered = true;
        }
    }
}
