#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95139 "Risk Incident Log Party"
{

    fields
    {
        field(1;"Incident ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Incident Party Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Telephone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Additional Details";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Incident ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

