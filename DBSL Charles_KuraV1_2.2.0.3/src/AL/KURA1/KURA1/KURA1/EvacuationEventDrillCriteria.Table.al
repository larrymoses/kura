#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72222 "EvacuationEvent Drill Criteria"
{

    fields
    {
        field(1;"Event ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation EventS".Code where (Blocked=filter(false));
        }
        field(2;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Evacuat Event Drill Criteria';
        }
    }

    keys
    {
        key(Key1;"Event ID","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

