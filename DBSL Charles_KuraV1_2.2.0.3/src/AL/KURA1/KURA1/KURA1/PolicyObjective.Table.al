#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80112 "Policy Objective"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Policy Strategies";Integer)
        {
            CalcFormula = count("Policy Objective Strategy" where ("Policy ID"=field("Policy ID"),
                                                                   Code=field(Code)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
