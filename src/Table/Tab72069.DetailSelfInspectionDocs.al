#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72069 "Detail Self Inspection Docs"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Document Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

