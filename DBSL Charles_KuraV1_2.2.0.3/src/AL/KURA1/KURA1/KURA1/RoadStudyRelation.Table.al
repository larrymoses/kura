#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72015 "Road Study Relation"
{

    fields
    {
        field(1;"Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Related Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Related Study Description";Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Study Relation Summary";Text[1000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Study ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

