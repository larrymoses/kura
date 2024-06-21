#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72076 "Monthly Statement Line"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Contract No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Contract Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Description Of Works";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Prevoius Certificate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"This Certificate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Total;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

