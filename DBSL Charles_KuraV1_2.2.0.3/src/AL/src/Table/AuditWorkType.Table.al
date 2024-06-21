#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95179 "Audit Work Type"
{
    DrillDownPageID = "Audit Work Types";
    LookupPageID = "Audit Work Types";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Primary Objective";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Planned Audits";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Ongoing Audits";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Completed Audit";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
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

