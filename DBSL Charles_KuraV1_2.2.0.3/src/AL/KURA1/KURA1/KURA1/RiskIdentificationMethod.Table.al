#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95106 "Risk Identification Method"
{
    DrillDownPageID = "Risk Identification Methods";
    LookupPageID = "Risk Identification Methods";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. Held";Integer)
        {
            CalcFormula = count("RMP Risk Identification Method" where ("Risk Identification Method"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

