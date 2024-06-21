#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95191 "Audit Temp Procedure Control"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Control ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Audit Objective ID","Audit Procedure ID","Risk ID","Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

