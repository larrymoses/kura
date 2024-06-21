#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69169 "Training Goals Setup"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Training Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Plan Header";
        }
        field(3;"Goal ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Goal Hub";
        }
        field(4;Description;Text[100])
        {
            CalcFormula = lookup("Training Goal Hub".Description where (Code=field("Goal ID")));
            FieldClass = FlowField;
        }
        field(5;"No. of training objectives";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Training Plan ID","Goal ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

