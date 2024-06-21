table 99468 "Road Conditions"
{
    Caption = 'Road Conditions';
    DataClassification = ToBeClassified;
    LookupPageId ="Road Conditions";
    DrillDownPageId="Road Conditions";
    fields
    {
        field(1; "Condition Code"; Code[30])
        {
            Caption = 'Condition Code';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; "RICS Type"; Enum "RICS Type")
        {
            Caption = 'RICS Type';
        }
        field(4; "Minimum Percentage"; Decimal)
        {
            Caption = 'Minimum Percentage';
            MinValue = 0;
            MaxValue = 100;
        }
        field(5; "Maximum Percentage"; Decimal)
        {
            Caption = 'Maximum Percentage';
            MinValue = 0;
            MaxValue = 100;
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
    }
    keys
    {
        key(PK; "Condition Code","RICS Type")
        {
            Clustered = true;
        }
    }
}
