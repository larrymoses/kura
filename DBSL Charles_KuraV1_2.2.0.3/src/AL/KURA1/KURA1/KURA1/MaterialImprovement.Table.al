#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72218 "Material Improvement"
{
    DrillDownPageID = "Material Improvements";
    LookupPageID = "Material Improvements";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Material Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Layer Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Improvement Percentage(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Layer Code","Material Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

