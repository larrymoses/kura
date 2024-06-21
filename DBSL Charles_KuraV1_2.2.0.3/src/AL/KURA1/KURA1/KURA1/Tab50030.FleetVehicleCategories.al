/// <summary>
/// Table Fleet Vehicle Categories (ID 50030).
/// </summary>
table 50030 "Fleet Vehicle Categories"
{
    Caption = 'Fleet Vehicle Categories';
    DataClassification = ToBeClassified;
    LookupPageId = "Fleet Vehicle Categories";
    DrillDownPageId = "Fleet Vehicle Categories";
    
    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
