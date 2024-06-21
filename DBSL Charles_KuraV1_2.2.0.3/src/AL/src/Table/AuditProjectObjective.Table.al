#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95200 "Audit Project Objective"
{
    DrillDownPageID = "Audit Project Objectives";
    LookupPageID = "Audit Project Objectives";

    fields
    {
        field(1;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Audit Objective ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Engagement ID","Audit Objective ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

