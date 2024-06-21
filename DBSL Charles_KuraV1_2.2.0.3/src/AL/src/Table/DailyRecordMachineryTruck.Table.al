#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72054 "Daily Record Machinery & Truck"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Plate No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Photo No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Category;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Number;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Project;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Heder No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No",Project,"Heder No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

