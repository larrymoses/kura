#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72167 "Project Meeting Register"
{

    fields
    {
        field(1; "Meeting ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Meeting Type".Code;
        }
        field(3; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet() then begin
                    "Project Name" := Job.Description;
                    Description := Job.Description;
                    "Region ID" := Job."Region ID";

                end;
            end;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "All Day Event"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Duration; Duration)
        {
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // begin
            //     if (("Start Date"<>0D) and (Duration<>0)) then begin
            //       "End Date":=CalcDate(Duration,"Start Date");
            //       "End Time":="Start Time"+Duration;
            //       end;
            // end;
        }
        field(9; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Venue/Location"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Project Manager"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(16; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Project Name"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Meeting Organizer ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Meeting Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Completed,Cancelled';
            OptionMembers = " ",Completed,Cancelled;
        }
        field(20; "Next Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Notification Date" := CalcDate('-14D', "Next Meeting Date");
                "Notification Date" := CalcDate('-3D', "Next Meeting Date");
            end;
        }
        field(21; "Notification Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Planning Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Adhoc';
            OptionMembers = " ",Planned,Adhoc;
        }
        field(23; "Meeting Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "2nd Notification Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
        }
        field(26; "Assigned To"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
    }

    keys
    {
        key(Key1; "Meeting ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Meeting ID" = '' then begin
            RoadManagementSetup.Get;
            RoadManagementSetup.TestField("Meeting Register Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Meeting Register Nos", xRec."No Series", Today, "Meeting ID", "No Series");
        end;
    end;

    var
        Job: Record Job;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

