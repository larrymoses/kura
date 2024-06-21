#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95190 "Audit Temp Procedure Comment"
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
        field(4;"Comment Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Audit Objective ID","Audit Procedure ID","Comment Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

