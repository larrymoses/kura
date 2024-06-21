#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 51007 "Bridge Transaction Type"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Link;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Account 1";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Account 2";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Tax Account";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Tax Group Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Notes;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;TRCodeID;Code[20])
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

