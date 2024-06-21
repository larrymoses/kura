#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72142 "Project Staff Template Lines"
{

    fields
    {
        field(1; "Key Staff Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Staff Role Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where("Team Type" = field("Team Type"));

            trigger OnValidate()
            begin
                ProjectStaffRoleCode.Reset;
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Staff Role Code", "Staff Role Code");
                if ProjectStaffRoleCode.FindSet then begin
                    "Team Type" := ProjectStaffRoleCode."Team Type";
                    Designation := ProjectStaffRoleCode.Designation;
                    "Staff Category" := ProjectStaffRoleCode."Staff Category";
                end;

                ProjectRoleFunction.Reset;
                ProjectRoleFunction.SetRange(ProjectRoleFunction."Staff Role Code", "Staff Role Code");
                if ProjectRoleFunction.FindSet then begin
                    repeat
                        StaffAppointmentFunction."Document No." := "Key Staff Template ID";
                        StaffAppointmentFunction."Staff Role Code" := "Staff Role Code";
                        StaffAppointmentFunction."Entry No" := ProjectRoleFunction."Entry No";
                        StaffAppointmentFunction.Description := ProjectRoleFunction.Description;
                        StaffAppointmentFunction.Insert;
                    until ProjectRoleFunction.Next = 0;
                end;
            end;
        }
        field(3; "Team Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Contractor,Sub-Contractor,Internal Project Team';
            OptionMembers = " ",Contractor,"Sub-Contractor","Internal Project Team";
        }
        field(4; Designation; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Staff Category"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Min No. of Recommended Staff';
            OptionCaption = ' ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = " ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(6; "Min No. of Recommended Staff"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Key Staff Template ID", "Staff Role Code", "Team Type")
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

    var
        ProjectStaffRoleCode: Record "Project Staff Role Code";
        ProjectRoleFunction: Record "Project Role Function";
        ProjectStaffAppointmentRole: Record "Project Staff Appointment Role";
        StaffAppointmentFunction: Record "Staff Appointment Function";
}

