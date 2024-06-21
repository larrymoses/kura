#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69604 "Position Requirement"
{
    DrillDownPageID = "Position Substitutes";
    LookupPageID = "Position Substitutes";

    fields
    {
        field(1; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(2; "Requirement ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(4; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Added Advantage,Affirmative Action,PWD';
            OptionMembers = Mandatory,"Added Advantage","Affirmative Action",PWD;
        }
        field(6; "Substitute Qualification"; Boolean)
        {
            CalcFormula = exist("Position Req Substitute" where("Position ID" = field("Position ID"),
                                                                 "Requirement ID" = field("Requirement ID")));
            FieldClass = FlowField;
        }
        field(7; "Qualification Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;//where("Qualification Category" = field("Qualification Category"));

            trigger OnValidate()
            begin
                //  IF Qualification.GET("Qualification Code") THEN
                //   Description := Qualification.Description;
            end;
        }
    }

    keys
    {
        key(Key1; "Position ID", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Qualification: Record Qualification;
}

