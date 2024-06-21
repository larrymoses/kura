#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69512 "Case Types"
{
    DrillDownPageID = "Case Types";
    LookupPageID = "Case Types";

    fields
    {
        field(1;"Case Nature";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Nature of Cases".Code;
        }
        field(2;"Case Type";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Case Nature","Case Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

