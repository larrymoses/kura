#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52005 "Risks Summary"
{

    fields
    {
        field(1;"Risk ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Planning Header"."No.";
        }
        field(3;Description;Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

