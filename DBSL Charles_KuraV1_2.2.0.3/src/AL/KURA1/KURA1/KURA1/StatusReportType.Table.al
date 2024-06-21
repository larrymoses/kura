#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72347 "Status Report Type"
{
    LookupPageId = "Status Report Type Line";
    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Default Reporting Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No of Project Reports"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Submission Period"; DateFormula)
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
        fieldgroup(DropDown; "Code", Description, "Default Reporting Period")
        {
        }
        fieldgroup(Brick; Description, "Submission Period")
        {
        }
    }
}

