#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72070 "Compliance Documents"
{

    fields
    {
        field(1;No;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Document;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Appendix;Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

