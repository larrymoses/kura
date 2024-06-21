#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72372 "Variation Of Price SetUp"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Item Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Symbol;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Contract Weight";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Index Source";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Base Index";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Current Index";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Adjustment Factor";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

