#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72013 "Road Study Section"
{

    fields
    {
        field(1;"Study ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Section Distance (Km)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10:10;
        }
    }

    keys
    {
        key(Key1;"Study ID","Section ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

