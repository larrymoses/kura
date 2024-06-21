#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80218 "BR Survey Section"
{

    fields
    {
        field(1;"Survey ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Business Research Survey"."Document No.";
        }
        field(2;"Section Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Template Section"."Section Code";
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Section Completion Instruction";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Questions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Total Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Survey ID","Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

