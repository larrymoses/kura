#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72361 "Material On Site Setup"
{
    DataCaptionFields = "Material Code","Material Description";
    DrillDownPageID = "Material On Site Setup";
    LookupPageID = "Material On Site Setup";

    fields
    {
        field(1;"Material Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Material Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Unit Of Measure Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Material Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

