#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72348 "Project Correspondence Type"
{
    LookupPageId = "Project Correspondences Lines";
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
        field(3; "Default Initiator Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Correspondence Initiator Code';
            TableRelation = "Project Staff Role Code"."Staff Role Code";

            trigger OnValidate()
            begin
                ProjectStaffRoleCode.Reset;
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Staff Role Code", "Default Initiator Code");
                if ProjectStaffRoleCode.FindSet then
                    "Initiator Designation" := ProjectStaffRoleCode.Designation;
            end;
        }
        field(4; "No of Project Correspondences"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Initiator Designation"; Text[2000])
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
    }

    var
        ProjectStaffRoleCode: Record "Project Staff Role Code";
}

