#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95195 "Audit Plan Line Team"
{

    fields
    {
        field(1; "Audit Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Engagement Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Resource No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Audit Team Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Auditor Team,Auditee Team';
            OptionMembers = " ","Auditor Team","Auditee Team";
        }
        field(6; "Engagement Role"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Default Audit Location ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Job Title"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Phone No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Email; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Blocekd; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Audit Plan ID", "Engagement Line No.", "Resource No.")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }
}

