#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72037 "Axle Load Control And Monitor"
{

    fields
    {
        field(1;"Axle Load No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Location;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Axle Load No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

