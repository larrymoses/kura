#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80189 "Policy Framework Implication"
{

    fields
    {
        field(1;"Framework Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "External Policy Framework".Code;
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Supporting Articles";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Framework Code","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

