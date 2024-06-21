#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72410 "Way Leave Fee Structure"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Amount Excl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"VAT Rate";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Amount Inc. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Requires Reinstatement Bond";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Reinstatement Amount";Decimal)
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

