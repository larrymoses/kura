#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72278 "Temporary Supervision Requirem"
{
    Caption = 'Temporary Supervision Requirements';

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Vehicle,RE''s Office,Survey Equipment,Lab Equipment';
            OptionMembers = " ",Vehicle,"RE's Office","Survey Equipment","Lab Equipment";
        }
        field(3; "Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));
        }
        field(4; "Project No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if Job.Get("Project No") then begin
                    "Contract ID" := Job."Purchase Contract ID";
                    "Project Name" := Job.Description;
                    "Contractor No" := Job."Contractor No.";
                    "Contractor Name" := Job."Contractor Name";
                    "Work Execution Plan" := Job."Work Execution Plan ID";
                end;
            end;
        }
        field(5; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(6; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Work Execution Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Work Execution Programme"));
        }
        field(9; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(13; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Rejection Remarks"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Rejected By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Rejected DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Assigned To:"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            //IF "Document Type"="Document Type"::Vehicle THEN BEGIN
            RoadManagementSetup.Get;
            RoadManagementSetup.TestField("Vehicle Temp SuperV Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Vehicle Temp SuperV Nos", xRec."No Series", Today, "Document No", "No Series");
        end;
        //END;
        // IF "Document No"='' THEN BEGIN
        //   IF "Document Type"="Document Type"::"Lab Equipment" THEN BEGIN
        //  RoadManagementSetup.GET;
        //  RoadManagementSetup.TESTFIELD("Lab Equip Temp SuperV Nos");
        //  NoSeriesManagement.InitSeries(RoadManagementSetup."Lab Equip Temp SuperV Nos",xRec."No Series",TODAY,"Document No","No Series");
        //  END;
        //  END;
        //   IF "Document No"='' THEN BEGIN
        //   IF "Document Type"="Document Type"::"RE's Office"THEN BEGIN
        //  RoadManagementSetup.GET;
        //  RoadManagementSetup.TESTFIELD("REs Office Temp SuperV Nos");
        //  NoSeriesManagement.InitSeries(RoadManagementSetup."REs Office Temp SuperV Nos",xRec."No Series",TODAY,"Document No","No Series");
        //  END;
        //  END;
        //   IF "Document No"='' THEN BEGIN
        //   IF "Document Type"="Document Type"::"Survey Equipment" THEN BEGIN
        //  RoadManagementSetup.GET;
        //  RoadManagementSetup.TESTFIELD("Survey Equip Temp SuperV Nos");
        //  NoSeriesManagement.InitSeries(RoadManagementSetup."Survey Equip Temp SuperV Nos",xRec."No Series",TODAY,"Document No","No Series");
        //  END;
        //  END;
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        Job: Record Job;
}

