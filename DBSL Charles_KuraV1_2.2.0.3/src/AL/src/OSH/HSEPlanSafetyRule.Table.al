#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69432 "HSE Plan Safety Rule"
{

    fields
    {
        field(1;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan Safety Rule Category"."Category Code";
        }
    }

    keys
    {
        key(Key1;"Plan ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
