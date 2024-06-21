#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72148 "Project Staff Voucher"
{
    LookupPageID = "Project Staff Appointment list";

    fields
    {
        field(1; "Document No."; Code[20])
        {
           

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin

                    RoadsManagementSetup.TestField("Staff Appointment Voucher Nos");
                    NoSeriesManagement.TestManual(RoadsManagementSetup."Staff Appointment Voucher Nos");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
           
            OptionCaption = ' ,Appointment,Termination';
            OptionMembers = " ",Appointment,Termination;
        }
        field(3; "Document Date"; Date)
        {
           
        }
        field(4; "Project Staff Template ID"; Code[20])
        {
           
            TableRelation = "Project Key Staff Template".Code where(Blocked = filter(false));

            trigger OnValidate()
            begin
                AppointmentStaffRole.Reset;
                AppointmentStaffRole.SetRange("Document No.", "Document No.");
                if AppointmentStaffRole.FindSet then begin
                    AppointmentStaffRole.DeleteAll;
                end;
                StaffAppointmentFunction.Reset;
                StaffAppointmentFunction.SetRange("Document No.", "Document No.");
                if StaffAppointmentFunction.FindSet then begin
                    StaffAppointmentFunction.DeleteAll;
                end;


                ProjectStaffTRole.Reset;
                ProjectStaffTRole.SetRange("Key Staff Template ID", "Project Staff Template ID");
                ProjectStaffTRole.SetRange(ProjectStaffTRole."Team Type", ProjectStaffTRole."team type"::"Internal Project Team");
                if ProjectStaffTRole.FindSet then begin
                    repeat
                        AppointmentStaffRole.Init;
                        AppointmentStaffRole."Document No." := "Document No.";
                        AppointmentStaffRole."Staff Role Code" := ProjectStaffTRole."Staff Role Code";
                        AppointmentStaffRole.Designation := ProjectStaffTRole.Designation;
                        AppointmentStaffRole."Staff Category" := ProjectStaffTRole."Staff Category";
                        AppointmentStaffRole."Min  No. of Recommended Staff" := ProjectStaffTRole."Min No. of Recommended Staff";
                        AppointmentStaffRole.Insert(true);

                        //  StaffAppointmentFunction.RESET;
                        //  StaffAppointmentFunction.SETRANGE("Document No.",ProjectStaffTRole."Key Staff Template ID");
                        //  IF StaffAppointmentFunction.FINDSET THEN BEGIN
                        //    REPEAT
                        //      //MESSAGE('%1',ProjectStaffFunction."Staff Role Code");
                        //    StaffAppointmentFunction.INIT;
                        //    StaffAppointmentFunction."Document No.":="Document No.";
                        //    StaffAppointmentFunction."Staff Role Code":=ProjectStaffTRole."Staff Role Code";
                        //    //StaffAppointmentFunction."Entry No":=ProjectStaffFunction."Document Date";
                        //    StaffAppointmentFunction.Description:=ProjectStaffTRole.Designation;
                        //    StaffAppointmentFunction.INSERT(TRUE);
                        //    UNTIL ProjectStaffFunction.NEXT=0;
                        //    END;

                        ProjectStaffTRole.Reset;
                        ProjectStaffTRole.SetRange(ProjectStaffTRole."Key Staff Template ID", "Project Staff Template ID");
                        ProjectStaffTRole.SetRange(ProjectStaffTRole."Team Type", ProjectStaffTRole."team type"::"Internal Project Team");
                        if ProjectStaffTRole.FindSet then begin
                            repeat
                                ProjectStaffAppointmentLine.Init;
                                ProjectStaffAppointmentLine."Document No." := "Document No.";
                                ProjectStaffAppointmentLine."Role Code" := ProjectStaffTRole."Staff Role Code";
                                ProjectStaffAppointmentLine.Designation := ProjectStaffTRole.Designation;
                                ProjectStaffAppointmentLine."Staff Category" := ProjectStaffTRole."Staff Category";
                                ProjectStaffAppointmentLine.Insert(true);
                            until ProjectStaffTRole.Next = 0;
                        end;
                    until ProjectStaffTRole.Next = 0;

                end;
            end;
        }
        field(5; "Project ID"; Code[20])
        {
           
            Description = 'Job.No. WHERE (Status=FILTER(Planning|Open))';
            TableRelation = Job."No." where(Status = filter(<> ongoing));

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::Appointment then
                    Description := 'Project Staff Appointment-' + "Project ID"
                else
                    Description := 'Project Staff Termination-' + "Project ID";
                Jobs.Reset;
                Jobs.SetRange("No.", "Project ID");
                if Jobs.FindSet then begin
                    "Contractor No." := Jobs."Contractor No.";
                    "Contractor Name" := Jobs."Contractor Name";
                    "Project Name" := Jobs.Description;
                    "Road Code" := Jobs."Road Code";
                    "Road Section No." := JobTask."Job Task No.";
                    Jobs.TestField("Directorate Code");
                    "Directorate ID" := Jobs."Directorate Code";
                    Validate("Directorate ID");
                    Jobs.TestField("Global Dimension 1 Code");
                    "Region ID" := Jobs."Global Dimension 1 Code";
                    Validate("Region ID");
                    Jobs.TestField("Department ID");
                    "Department ID" := Jobs."Department ID";
                    Validate("Department ID");
                    "Project Start Date" := Jobs."Starting Date";
                    "Project End Date" := Jobs."Ending Date";
                    "Section Name" := Jobs."Section Name";
                end;
                RoadInventory.Reset;
                RoadInventory.SetRange("Road Code", "Road Code");
                if RoadInventory.FindSet then begin
                    "Road Name" := RoadInventory."Link Name";
                end;
            end;
        }
        field(6; Description; Text[250])
        {
           
        }
        field(7; "Appointing Authority"; Code[100])
        {
           TableRelation ="Company Positions";
        }
        field(8; "Project Name"; Text[250])
        {
           
        }
        field(9; "Road Code"; Code[20])
        {
           
            TableRelation = "Road Inventory"."Road Code";
        }
        field(10; "Road Section No."; Code[20])
        {
           
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project ID"));
        }
        field(11; "Section Name"; Text[250])
        {
           
        }
        field(12; "Project Start Date"; Date)
        {
           
        }
        field(13; "Project End Date"; Date)
        {
           
        }
        field(14; "Region ID"; Code[20])
        {
           Editable = false;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(15; "Directorate ID"; Code[20])
        {
           Editable = false;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Directorate))';
        }
        field(16; "Department ID"; Code[20])
        {
           Editable = false;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Department/Center))';
        }
        field(17; "Created By"; Code[50])
        {
           
            Editable = false;
        }
        field(18; "Created DateTime"; DateTime)
        {
           
            Editable = false;
        }
        field(19; Status; Option)
        {
           
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(20; Posted; Boolean)
        {
           
        }
        field(21; "No. Series"; Code[20])
        {
           
        }
        field(22; "Road Name"; Text[250])
        {
           
        }
        field(23; "Staff Appointment Voucher No."; Code[20])
        {
           
            TableRelation = "Project Staff Voucher"."Document No." where("Project ID" = field("Project ID"));
        }
        field(24; "From Document No."; Code[20])
        {
           
        }
        field(25; "From Document Type"; Option)
        {
           
            OptionCaption = ' ,Appointment,Termination';
            OptionMembers = " ",Appointment,Termination;
        }
        field(26; Suggested; Boolean)
        {
           
        }
        field(27; "Assigned To"; Code[100])
        {
           
            TableRelation = "User Setup"."User ID";
        }
        field(32; "Rejection Remarks"; Text[2048])
        {
           
        }
        field(33; "Rejected By"; Code[100])
        {
           
        }
        field(34; Rejected; Boolean)
        {
           
        }
        field(35; "Contractor No."; Code[20])
        {
            TableRelation = Job."Contractor No." where("No." = field("Project ID"));
        }
        field(36; "Contractor Name"; Text[100])
        {
            
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Document No." = '' then begin
            RoadsManagementSetup.Get;
            RoadsManagementSetup.TestField("Staff Appointment Voucher Nos");
            NoSeriesManagement.InitSeries(RoadsManagementSetup."Staff Appointment Voucher Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;
        "Document Date" := Today;
        CompInfo.Get;
        "Appointing Authority" := CompInfo."Headed By";
        if UserSetup.Get(UserId) then begin
            Emp.Reset;
            Emp.SetRange("User ID", UserId);
            if Emp.FindSet then begin
                "Directorate ID" := Emp."Directorate Code";
                "Department ID" := Emp."Department Code";
            end;
            "Region ID" := UserSetup."Region Code";

        end;
    end;

    var
        RoadsManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoMgt: Codeunit NoSeriesManagement;
        CompInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        ProjectStaffTRole: Record "Project Staff Template Lines";
        AppointmentStaffRole: Record "Project Staff Appointment Role";
        ProjectStaffFunction: Record "Project Mobilization Header";
        StaffAppointmentFunction: Record "Staff Appointment Function";
        Jobs: Record Job;
        JobTask: Record "Job Task";
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        RoadInventory: Record "Road Inventory";
}

