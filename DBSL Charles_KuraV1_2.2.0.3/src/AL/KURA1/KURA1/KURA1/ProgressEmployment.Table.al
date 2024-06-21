#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72098 "Progress Employment"
{

    fields
    {
        field(1;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Male Count";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Female Count";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Male Person Days";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Female Person Days";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Remaining Target Person Days";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

