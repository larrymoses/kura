#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72104 "Legislation Amendment"
{

    fields
    {
        field(1;"Legislation ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Amendment ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Gazette Supplement No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"National Assembly Bill No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Legislation ID","Amendment ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

