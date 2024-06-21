#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72168 "Project Meeting Attendance"
{

    fields
    {
        field(1; "Meeting ID"; Code[20])
        {

        }
        field(2; "Attendee Type"; Enum "Attendee Type")
        {

            // OptionCaption = ' ,Contractor Team,Internal Team,In attendance';
            // OptionMembers = " ","Contractor Team","Internal Team","In attendance";

            trigger OnValidate()
            begin
                case "Attendee Type" of
                    "attendee type"::"In attendance":
                        begin
                            RoadManagementSetup.Get;
                            RoadManagementSetup.TestField("Meeting In Attendance Nos");
                            NoSeriesManagement.InitSeries(RoadManagementSetup."Meeting In Attendance Nos", xRec."In Attendance Nos.", Today, "No.", "In Attendance Nos.");
                        end
                end;
            end;
        }
        field(3; "No."; Code[20])
        {

            // TableRelation = if ("Attendee Type" = const("Contractor Team")) "WEP Contractor Team"."Contractor Staff No." where("Contractor No." = field("Contractor No"));
            //,
            //                                                                                                                   "Project ID"=field("Project No"))
            //                                                                                                                   else if ("Attendee Type"=const("Internal Team")) "Internal Project Resource"."Resource No." where (Status=filter(Active),
            //                                                                                                                                                                                                                      "Project ID"=field("Project No"));

            trigger OnValidate()
            begin
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor Staff No.", "No.");
                if WEPContractorTeam.FindSet then begin
                    "Representative Name" := WEPContractorTeam.Name;
                    "Representative Email" := WEPContractorTeam.Email;
                    "Representative Tel No" := WEPContractorTeam.Telephone;
                    Designation := WEPContractorTeam.Designation;
                end;
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.", "No.");
                if InternalProjectResource.FindSet then begin
                    "Representative Name" := InternalProjectResource.Name;
                    "Representative Email" := InternalProjectResource.Email;
                    Designation := InternalProjectResource.Designation;
                end;
            end;
        }
        field(4; "Representative Name"; Text[250])
        {

        }
        field(5; Designation; Code[100])
        {

        }
        field(6; "Representative Email"; Text[250])
        {

        }
        field(7; "Representative Tel No"; Code[50])
        {

        }
        field(8; "Notified on Email"; Boolean)
        {

        }
        field(9; "DateTime Notified"; DateTime)
        {

        }
        field(10; "Contractor No"; Code[20])
        {

        }
        field(11; "Project No"; Code[20])
        {

        }
        field(12; "In Attendance Nos."; Code[20])
        {

        }
        field(13; Organization; Code[50])
        {

        }
    }

    keys
    {
        key(Key1; "Meeting ID", "Attendee Type", "No.")
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
        ProjectMeetingRegister.SetRange(ProjectMeetingRegister."Meeting ID", "Meeting ID");
        if ProjectMeetingRegister.FindSet then begin
            "Project No" := ProjectMeetingRegister."Project ID";
            Job.Reset;
            Job.SetRange(Job."No.", ProjectMeetingRegister."Project ID");
            if Job.FindSet then begin
                Job.TestField("Contractor No.");
                "Contractor No" := Job."Contractor No.";
            end;
        end;
    end;

    var
        ProjectMeetingRegister: Record "Project Meeting Register";
        Job: Record Job;
        VendorProfessionalStaff: Record "Vendor Professional Staff";
        InternalProjectResource: Record "Internal Project Resource";
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        WEPContractorTeam: Record "WEP Contractor Team";
}

