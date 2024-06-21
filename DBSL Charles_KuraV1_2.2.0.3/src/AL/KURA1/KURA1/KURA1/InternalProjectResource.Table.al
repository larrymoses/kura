#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72151 "Internal Project Resource"
{

    fields
    {
        field(1; "Project ID"; Code[20])
        {

            Description = 'Job.No';
        }
        field(2; "Resource No."; Code[20])
        {

            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(3; Name; Text[250])
        {

        }
        field(4; Email; Text[250])
        {

        }
        field(5; "Resource Type"; Option)
        {

            OptionCaption = ' ,Person,Machine';
            OptionMembers = " ",Person,Machine;
        }
        field(6; "Role Code"; Code[20])
        {

            TableRelation = "Project Staff Appointment Role"."Staff Role Code";
            trigger OnValidate()
            var
                RoleCode: Record "Project Staff Role Code";
            begin
                RoleCode.Reset();
                RoleCode.SetRange("Staff Role Code", Rec."Role Code");
                if RoleCode.findfirst() then begin
                    Rec."Resident Engineer" := RoleCode."Resident Engineer";
                end;
            end;
        }
        field(7; Designation; Code[100])
        {

        }
        field(8; "Staff Category"; Option)
        {

            OptionCaption = '  ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(9; Status; Option)
        {

            OptionCaption = ' ,Active,Inactive,Terminated';
            OptionMembers = " ",Active,Inactive,Terminated;
        }
        field(10; "Appointment Document No."; Code[20])
        {

            TableRelation = "Project Staff Voucher"."Document No." where("Document Type" = filter(Appointment));
        }
        field(11; "Appointment Date"; Date)
        {

        }
        field(12; "Termination Document No."; Code[20])
        {

            TableRelation = "Project Staff Voucher"."Document No." where("Document Type" = filter(Termination));
        }
        field(13; "Termination Category"; Option)
        {

            OptionCaption = ' ,Normal Staff Exit,Contract Expiry,Project Demobilization';
            OptionMembers = " ","Normal Staff Exit","Contract Expiry","Project Demobilization";
        }
        field(14; "Termination Details"; Text[250])
        {

        }
        field(15; "Termination Date"; Date)
        {

        }
        field(16; Telephone; Code[20])
        {

        }
        field(17; "Project Manager"; Boolean)
        {

        }
        field(18; "User ID"; Text[200])
        {
            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin

            end;
        }
        field(19; Active; Boolean)
        {

        }
        field(20; "Resident Engineer"; Boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Project ID", "Resource No.", "Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Project ID", "Resource No.", Name, "Role Code")
        {
        }
        fieldgroup(DrillDown; "Project ID", "Resource No.", Name, "Role Code")
        {
        }
    }
}

