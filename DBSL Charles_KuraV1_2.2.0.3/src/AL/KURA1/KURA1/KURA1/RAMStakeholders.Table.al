#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72407 "RAM Stakeholders"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Contact Person No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Contact Person Name";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contact Person Email";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Contact Person Phone No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No of Interactions Recorded";Decimal)
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

