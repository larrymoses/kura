#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72351 "Layer Test Setup"
{

    fields
    {
        field(1;"Layer Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Layer.Code where (Blocked=filter(false));
        }
        field(2;"Test Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Test Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Layer Code","Test Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

