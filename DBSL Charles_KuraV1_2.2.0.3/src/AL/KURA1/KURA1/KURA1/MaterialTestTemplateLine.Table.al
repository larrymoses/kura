#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72235 "Material Test Template Line"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Test Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Chainage Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Test Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

