#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80041 "Stakeholder Implication"
{

    fields
    {
        field(1;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2;"Stakeholder Matrix No";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Power & Interests"."Entry No";
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Strategic Implication";Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Stakeholder Matrix No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

