#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95164 "Internal Audit Charter"
{
    DrillDownPageID = "Internal Audit Charters";
    LookupPageID = "Internal Audit Charters";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "External Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Overview; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "CAE ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // Description = 'Chief Audit Executive (CAE) ID\'
            //               "''";
            // TableRelation = "ManPower Planning Lines"."Entry No";

            // trigger OnValidate()
            // begin
            //     CompanyJobs.Reset;
            //     CompanyJobs.SetRange("Entry N o","CAE ID");
            //     if CompanyJobs.FindSet then
            //      "CAE Job Title" := ":=CompanyJobs."Task No";
            // end;
        }
        field(7; "CAE Job Title"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "CAE Directly Reports-To"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(9; "CAE Indirectly Reports-To"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(10; "Approved By"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where(Blocked = filter(false));
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
    }

    var
        CompanyJobs: Record "ManPower Planning Lines";
}

