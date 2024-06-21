#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95187 "Audit Template Default Control"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Control ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Procedure Description";Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Template Procedure";
        }
    }

    keys
    {
        key(Key1;"Template ID","Risk ID","Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

