table 50001 "Staff Clearance Setup"
{
    Caption = 'Staff Clearance Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Exit Code"; Code[50])
        {
            Caption = 'Exit Code';
            NotBlank = true;
        }
        field(2; "Position ID"; Code[20])
        {
            Caption = 'Position ID';
            TableRelation = Positions;

            trigger OnValidate()
            var 
                Positions: Record Positions;
            begin
                if "Position ID" <> '' then begin
                    Positions.Get("Position ID");
                    "Job Title":= Positions."Job Title";
                end else begin
                    "Job Title":= '';
                end;
            end;
        }
        field(3; "Job Title"; Text[250])
        {
            Caption = 'Job Title';
            Editable = false;
        }
        field(4; "Item Code"; Code[30])
        {
            Caption = 'Item Code';
        }
        field(5; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
        }
        field(6; "Last Modified Date Time"; DateTime)
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
