#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72053 "Daily Work Record Line"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Chainage From";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Chainage To";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Activity Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Photo No.";Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Project;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Header No";Code[10])
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

