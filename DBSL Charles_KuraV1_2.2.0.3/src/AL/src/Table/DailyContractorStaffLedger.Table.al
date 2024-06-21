#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72255 "Daily Contractor Staff Ledger"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Daily Work Record ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document No.";
        }
        field(3; "Job No."; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(4; "Contractor Staff No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Team"."Contractor Staff No." where("Document No" = field("Work Execution Programme ID"),
                                                                                "Document Type" = filter("Contractor Personnel Appointment"));

            trigger OnValidate()
            begin
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor Staff No.", "Contractor Staff No.");
                if WEPContractorTeam.FindSet then begin
                    Name := WEPContractorTeam.Name;
                    "Role Code" := WEPContractorTeam."Role Code";
                    "Staff Category" := WEPContractorTeam."Staff Category";
                    Designation := WEPContractorTeam.Designation;
                end;
            end;
        }
        field(5; Name; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Role Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = filter(Contractor),
                                                                               Blocked = filter(false));

            trigger OnValidate()
            begin
                ProjectStaffRoleCode.Reset;
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Staff Role Code", "Role Code");
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Team Type", ProjectStaffRoleCode."team type"::Contractor);
                if ProjectStaffRoleCode.FindSet then begin
                    Designation := ProjectStaffRoleCode.Designation;
                    "Staff Category" := ProjectStaffRoleCode."Staff Category";
                end;
            end;
        }
        field(7; Designation; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Staff Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '  ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(9; "Estimate ManHours Worked"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document Date";
        }
        field(11; "Work Execution Programme ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Work Execution Programme"),
                                                                                "Project ID" = field("Job No."));
        }
        field(12; "Overtime Hours Worked"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        WEPContractorTeam: Record "WEP Contractor Team";
        ProjectStaffRoleCode: Record "Project Staff Role Code";
}

