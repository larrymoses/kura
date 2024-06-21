#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80073 "Objectives Evaluation Template"
{

    fields
    {
        field(1;"Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"General Instructions";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Global?";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Primary Responsibility Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(6;"Performance Rating Scale";Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Total Score Model";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

