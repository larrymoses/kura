#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72237 "Project Photo Record"
{
    DrillDownPageID = "Project Photo Records";
    LookupPageID = "Project Photo Records";

    fields
    {
        field(1; "Photo ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Project ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(Status = filter(<> Planning | Completed));

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project ID");
                if ObjJob.FindSet then begin
                    "Contractor No" := ObjJob."Contractor No.";
                    Description := 'Photo Record' + ' ' + "Project ID" + ("Photo ID");
                end;
            end;
        }
        field(3; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "External Reference No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Date Filed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Additional Comments/Notes"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Photo ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Photo ID", "Project ID", Description, "External Reference No.")
        {
        }
        fieldgroup(Brick; "Photo ID", "Project ID", Description, "External Reference No.")
        {
        }
    }

    trigger OnInsert()
    begin
        "Date Filed" := Today;
        if "Photo ID" = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Project Photo Record Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Project Photo Record Nos", xRec."No. Series", Today, "Photo ID", "No. Series");
        end;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        ObjJob: Record Job;
}

