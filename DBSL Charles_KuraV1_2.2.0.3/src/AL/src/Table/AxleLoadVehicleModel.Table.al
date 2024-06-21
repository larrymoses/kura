#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72414 "Axle Load Vehicle Model"
{

    fields
    {
        field(1;Make;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Axle Load Configuration";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Make)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

