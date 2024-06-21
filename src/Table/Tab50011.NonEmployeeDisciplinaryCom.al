/// <summary>
/// Table Non-Employee Disciplinary Com. (ID 50011).
/// </summary>
table 50011 "Non-Employee Disciplinary Com."
{
    Caption = 'Non-Employee Disciplinary Com.';
    DataClassification = ToBeClassified;
    LookupPageId = NonEmployeeDiscCommList;
    DrillDownPageId = NonEmployeeDiscCommList;
    
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; Names; Text[100])
        {
            Caption = 'Names';
            NotBlank = true;
        }
        field(3; Role; Option)
        {
            Caption = 'Role';
            OptionCaption = ' ,Chairmain,Secretary,Member';
            OptionMembers = " ",Chairmain,Secretary,Member;
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK; "Code","Line No.")
        {
            Clustered = true;
        }
    }
}
