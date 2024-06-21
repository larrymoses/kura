#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95240 "Audit PlanLine Objective"
{
    DrillDownPageID = "Audit Project Objectives";
    LookupPageID = "Audit Project Objectives";

    fields
    {
        field(1;"Audit Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Engagement Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Audit Objective ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Audit Plan ID","Engagement Line No.","Audit Objective ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

