#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72170 "Project Meeting Summary"
{

    fields
    {
        field(1;"Meeting ID";Code[20])
        {
            
            TableRelation = "Project Meeting Register"."Meeting ID";
        }
        field(2;"Agenda Code";Code[20])
        {
            
            TableRelation = "Project Meeting Agenda"."Agenda Code";
        }
        field(3;"Agenda Item No.";Code[20])
        {
            
            TableRelation = "Meeting Agenda Item Template"."Item Code";
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            
        }
        field(5;"Item Discussed";Text[250])
        {
            
        }
        field(6;"Summary Notes";Text[250])
        {
            
        }
        field(7;"Task Description";Text[250])
        {
            Caption = 'Action';
        }
        field(8;"Responsibility Category"; Enum "Attendee Type")
        {
            
            // OptionCaption = ' ,Internal Team,Contractor Team,In Attendance';
            // OptionMembers = " ","Internal Team","Contractor Team","In Attendance";
        }
        field(9;"Task Owner ID";Code[20])
        {
            
            // TableRelation = if ("Responsibility Category"=const("Contractor Team")) "Vendor Professional Staff"."Staff Number" where (Blocked=filter(false),
            //                                                                                                                           "Vendor No."=field("Contractor No"))
            //                                                                                                                           else if ("Responsibility Category"=const("Internal Team")) "Internal Project Resource"."Resource No." where (Status=const(Active),
            //                                                                                                                                                                                                                                        "Project ID"=field("Project No"));

            trigger OnValidate()
            begin
                //FnGetResourceName();
                VendorProfessionalStaff.Reset;
                VendorProfessionalStaff.SetRange(VendorProfessionalStaff."Staff Number","Task Owner ID");
                if VendorProfessionalStaff.FindSet then begin
                  Name:=VendorProfessionalStaff."Staff Name";
                  end;
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.","Task Owner ID");
                if InternalProjectResource.FindSet then begin
                  Name:=InternalProjectResource.Name;

                  end;
            end;
        }
        field(10;Name;Text[250])
        {
            
        }
        field(11;"Due Date";Date)
        {
            
        }
        field(12;"Contractor No";Code[20])
        {
            
        }
        field(13;"Project No";Code[20])
        {
            
        }
        field(14;"Contributor No";Code[20])
        {
            
            TableRelation = "Project Meeting Attendance"."No." where ("Meeting ID"=field("Meeting ID"));

            trigger OnValidate()
            begin
                ProjectMeetingAttendance.Reset;
                ProjectMeetingAttendance.SetRange(ProjectMeetingAttendance."No.","Contractor No");
                if ProjectMeetingAttendance.FindSet then
                  "Contributor Name":=ProjectMeetingAttendance."Representative Name";
            end;
        }
        field(15;"Contributor Name";Text[250])
        {
            
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Meeting ID","Agenda Code","Agenda Item No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ProjectMeetingRegister.Reset;
        ProjectMeetingRegister.SetRange(ProjectMeetingRegister."Meeting ID","Meeting ID");
        if ProjectMeetingRegister.FindSet then begin
         "Project No":=ProjectMeetingRegister."Project ID";
          Job.Reset;
          Job.SetRange(Job."No.",ProjectMeetingRegister."Project ID");
          if Job.FindSet then begin
            Job.TestField("Contractor No.");
            "Contractor No":=Job."Contractor No.";
            end;
          end;
    end;

    var
        VendorProfessionalStaff: Record "Vendor Professional Staff";
        InternalProjectResource: Record "Internal Project Resource";
        Job: Record Job;
        ProjectMeetingRegister: Record "Project Meeting Register";
        ProjectMeetingAttendance: Record "Project Meeting Attendance";
}

