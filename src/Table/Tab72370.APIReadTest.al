#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72370 "API Read Test"
{

    fields
    {
        field(1;"Enrty No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Base Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Exchange Rate";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Current Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Date;Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Enrty No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

