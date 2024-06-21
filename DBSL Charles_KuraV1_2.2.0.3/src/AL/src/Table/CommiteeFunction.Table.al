#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69636 "Commitee Function"
{

    fields
    {
        field(1;"Committee Type ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Committee Type";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Committee Type ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

