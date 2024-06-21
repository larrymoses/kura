#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72149 "Project Staff Appointment Line"
{
    DrillDownPageID = "Project Staff Appoint. List";
    LookupPageID = "Project Staff Appoint. List";

    fields
    {
        field(1; "Document No."; Code[20])
        {

            TableRelation = "Project Staff Voucher"."Document No." where("Document Type" = filter(Appointment));
        }
        field(2; "Resource No."; Code[20])
        {

            Description = 'Resource.No. WHERE (Type=FILTER(Person),Blocked=FILTER(No))';
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                Name := Resource.Name;


                Resource.Reset;
                Resource.SetRange("No.", "Resource No.");
                if Resource.FindSet then begin
                    Name := Resource.Name;
                    Employee.Reset;
                    Resource.CalcFields("Employee No");
                    Employee.SetRange(Employee."No.", Resource."Employee No");
                    if Employee.FindSet then begin
                        Email := Employee."Company E-Mail";

                        //Designation:=Employee."Job Title"
                    end;
                    Validate("Role Code");
                    //Designation:=Resource."Job Title";
                end;
            end;
        }
        field(3; "Role Code"; Code[20])
        {

            TableRelation = "Project Staff Role Code"."Staff Role Code";
            trigger OnValidate()
            var
                RoleCodes: Record "Project Staff Role Code";
            begin
                RoleCodes.Reset();
                RoleCodes.SetRange("Staff Role Code", Rec."Role Code");
                if RoleCodes.FindFirst() then begin
                    Designation := RoleCodes.Designation;
                    "Staff Category" := RoleCodes."Staff Category";
                  //  if RoleCodes."Resident Engineer" then
                        Validate("Resident Engineer", RoleCodes."Resident Engineer");
                    //if RoleCodes."Project Engineer" then
                        Validate("Project Manager", RoleCodes."Project Engineer");
                end;

            end;
        }
        field(4; Name; Text[250])
        {

        }
        field(5; Email; Text[250])
        {

        }
        field(6; Designation; Text[100])
        {

        }
        field(7; "Staff Category"; Option)
        {

            OptionCaption = '  ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(8; "Effective Date"; Date)
        {

        }
        field(9; "Expiry Date"; Date)
        {

        }
        field(14; "Notified on Email"; Boolean)
        {

        }
        field(15; "Date/Time Notified"; DateTime)
        {

        }
        field(16; "Project Manager"; Boolean)
        {
            Editable = false;

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Resource No.");
                if Resource.FindSet then begin
                    Resource.CalcFields("User ID");
                    "User ID" := Resource."User ID";
                end;
            end;
        }
        field(17; "User ID"; Text[100])
        {

        }
        field(18; Telephone; Code[20])
        {

        }
        field(19; Select; Boolean)
        {


            trigger OnValidate()
            begin
                if Select = true then begin
                    "Selected By" := UserId;
                end;
            end;
        }
        field(20; "Selected By Voucher No."; Code[20])
        {

        }
        field(21; "Selected By"; Code[100])
        {

        }
        field(22; Suggested; Boolean)
        {

        }
        field(23; "Staffing Template ID"; Code[20])
        {

        }
        field(24; "Resident Engineer"; Boolean)
        {
            Editable = false;
            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Resource No.");
                if Resource.FindSet then begin
                    Resource.CalcFields("User ID");
                    "User ID" := Resource."User ID";
                end;
            end;
        }
        field(25; "Reference No."; Code[50])
        {

        }
    }

    keys
    {
        key(Key1; "Document No.", "Resource No.", "Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ProjectStaffVoucher.Reset;
        ProjectStaffVoucher.SetRange(ProjectStaffVoucher."Document No.", "Document No.");
        if ProjectStaffVoucher.FindSet then
            "Staffing Template ID" := ProjectStaffVoucher."Project Staff Template ID";
    end;

    var
        Resource: Record Resource;
        Employee: Record Employee;
        ProjectStaffAppointment: Record "Project Staff Appointment";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
}

