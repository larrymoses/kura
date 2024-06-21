#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72106 "Legislation Subsection"
{

    fields
    {
        field(1;"Legislation ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Part ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Legislation Part"."Part ID";
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Legislation ID","Part ID","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

