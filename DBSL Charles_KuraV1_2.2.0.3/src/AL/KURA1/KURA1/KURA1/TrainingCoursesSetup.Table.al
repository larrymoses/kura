#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69171 "Training Courses Setup"
{
    LookupPageId = "Training Courses Setup";
    DrillDownPageId = "Training Courses Setup";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Descritpion; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Domain; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Domains";
        }
        field(5; "No. of Staff Trained"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Budget Spent"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Descritpion)
        {
        }
    }
}

