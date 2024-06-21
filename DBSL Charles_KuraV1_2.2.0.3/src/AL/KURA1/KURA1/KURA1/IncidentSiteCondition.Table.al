#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72065 "Incident Site Condition"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Assets;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Damage Condition";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Photo no";Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Incident No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Project;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No",Project,"Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

