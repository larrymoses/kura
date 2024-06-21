#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80190 "Policy Framework Article"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Framework Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Policy Framework Implication"."Framework Code";
        }
        field(3;"Implication ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Policy Framework Implication"."Line No.";
        }
        field(4;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"External Document No.";Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Framework Code","Implication ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

