#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 50000 "Works Progress Header"
{

    fields
    {
        field(1;"Progress No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Progress Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Financial Year Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Funding Source";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Road Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Progress No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

