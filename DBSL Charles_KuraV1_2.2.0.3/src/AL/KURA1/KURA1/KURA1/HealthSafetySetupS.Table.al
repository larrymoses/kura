#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72207 "Health & Safety SetupS"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3;"Organization Name";Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4;"Primary Purpose";Text[2048])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5;"OSH Policy No.";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6;"No. of OSH Management Plans";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. Of Safe Work Permit Apps";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Safe Work Permit Applications';
        }
        field(8;"No. Of Safe Work Compltn Repor";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Safe Work Completion Reports';
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

