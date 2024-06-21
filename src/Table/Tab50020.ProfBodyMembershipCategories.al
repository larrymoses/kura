/// <summary>
/// Table ProfBodyMembershipCategories (ID 50020).
/// </summary>
table 50020 ProfBodyMembershipCategories
{
    Caption = 'Prof. Body Membership Categories';
    DataClassification = ToBeClassified;
    LookupPageId = "Prof.BodyMembeshipCategories";
    DrillDownPageId = "Prof.BodyMembeshipCategories";
    
    fields
    {
        field(1; Name; Code[100])
        {
            Caption = 'Name';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
}
