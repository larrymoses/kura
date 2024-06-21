#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80123 "Policy Objective Strategy"
{

    fields
    {
        field(1;"Policy ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Policy Objective".Code where ("Policy ID"=field("Policy ID"));
        }
        field(3;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Code","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

