/// <summary>
/// Table Staff Exit Setup (ID 50003).
/// </summary>
table 50003 "Staff Exit Setup"
{
    Caption = 'Staff Exit Setup';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Staff Exit Setup";
    LookupPageId = "Staff Exit Setup";
    
    fields
    {
        field(1; "Exit Code"; Code[50])
        {
            Caption = 'Exit Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Exit Type"; Enum "Staff Exit Types")
        {
            Caption = 'Exit Type';
        }
        field(4; "Requires Exit Interview"; Boolean)
        {
            Caption = 'Requires Exit Interview';
        }
        field(5; "Requires Clearance"; Boolean)
        {
            Caption = 'Requires Clearance';
        }
        field(6; "Requires Notice"; Boolean)
        {
            Caption = 'Requires Notice ';
        }
        field(7; "Has Terminal Benefits"; Boolean)
        {
            Caption = 'Has Terminal Benefits';
        }
        field(8; "Has Termination Grounds"; Boolean)
        {
            Caption = 'Has Grounds of Termination';
        }
        field(9; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Exit Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        SetLastModifiedDateTime();
    end;

    trigger OnModify()
    begin
        SetLastModifiedDateTime();
    end;

    trigger OnRename()
    begin
        SetLastModifiedDateTime();
    end;

    local procedure SetLastModifiedDateTime()
    begin
        "Last Modified Date Time" := CurrentDateTime;
    end;
}
