#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95177 "Compliance Framework Principle"
{

    fields
    {
        field(1;"Framework ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Guiding Principle ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Guiding Principle Stmts";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Guiding Principle Stmts';
        }
        field(5;"No. of Rationale Statements";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Key Benefits";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. of Compliance Requirements";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Compliance Requirements';
        }
        field(8;"No. of Comments";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Framework ID","Guiding Principle ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

