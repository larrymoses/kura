#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95173 "Compliance Framework Category"
{
    DrillDownPageID = "Compliance Framework Categorie";
    LookupPageID = "Compliance Framework Categorie";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. of Compliance Frameworks"; Integer)
        {
            CalcFormula = count("Compliance Framework" where("Framework Category" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

