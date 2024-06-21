#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69261 "Applicant Hobbies"
{
    DrillDownPageID = "Applicant Hobbies";
    LookupPageID = "Applicant Hobbies";

    fields
    {
        field(1;"Applicant ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Applicant Profile"."No.";
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Applicant ID","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

