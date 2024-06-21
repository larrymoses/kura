#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72043 "Interval Of Inspection"
{

    fields
    {
        field(1;"Inspection Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection Type".Code where (Blocked=filter(false));
        }
        field(2;"Inspection Interval";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Remark;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inspection Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

