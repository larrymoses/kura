#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80044 "Risk Mitigation"
{

    fields
    {
        field(1;"Risk Register ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Register"."Entry No";
        }
        field(2;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Mitigation Measure";Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Risk Register ID","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

