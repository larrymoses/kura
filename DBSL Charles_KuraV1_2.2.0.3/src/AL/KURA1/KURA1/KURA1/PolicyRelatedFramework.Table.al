#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80188 "Policy Related Framework"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Framework Code";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "External Policy Framework".Code where (Blocked=const(false));
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Articles";Integer)
        {
            CalcFormula = count("Policy Framework Article" where ("Policy ID"=field("Policy ID"),
                                                                  "Framework Code"=field("Framework Code"),
                                                                  "Line No"=field("Line No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

