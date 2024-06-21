#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80196 "Policy Statement Revision"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Area";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Policy Statement";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Revision No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Area","Line No","Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

