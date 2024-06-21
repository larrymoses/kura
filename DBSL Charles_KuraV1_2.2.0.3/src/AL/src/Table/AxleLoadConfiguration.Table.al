#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72415 "Axle Load Configuration"
{

    fields
    {
        field(1;Type;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No of Axles";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No of Wheels per Axle";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Maximum Gross Vehicle Weight";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Vehicle Model";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

