#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72052 "Daily Work Records"
{

    fields
    {
        field(1; "Road Authority"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Authority"."Road Authority Code";
        }
        field(2; Contractor; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vendor.Get(Contractor) then begin
                    "Contractor Name" := Vendor.Name;
                end;
            end;
        }
        field(3; Project; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if Job.Get(Project) then begin
                    "Project Name" := Job.Description;
                end;
            end;
        }
        field(4; "Road Name/Chainage"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID";
        }
        field(6; "Inspected By"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(7; "Standard Service Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,High,Low,Standard,Medium';
            OptionMembers = " ",High,Low,Standard,Medium;
        }
        field(8; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                if RoadInventory.FindSet then
                    "Link Name" := RoadInventory."Link Name";
            end;
        }
        field(9; "Daily Work No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Road Authority Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Creation Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Link Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Daily Work No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Daily Work No" = '' then begin
            RMSSetup.Get();
            RMSSetup.TestField("Daily Work Record Nos");
            NoSeriesMgt.InitSeries(RMSSetup."Daily Work Record Nos", xRec."No. Series", Today, "Daily Work No", "No. Series");
        end;

        // if "Daily Work No" = '' then begin
        //     RoadManagementSetup.Get();
        //     RoadManagementSetup.TestField("Communication Plan Nos");
        //     NoSeriesManagement.InitSeries(RoadManagementSetup."Communication Plan Nos", xRec."No. Series", Today, "Daily Work No", "No. Series");
        // end;

        RoadAuthority.Reset;
        RoadAuthority.SetRange("Current Road Agency", true);
        if RoadAuthority.FindSet then begin
            "Road Authority" := RoadAuthority."Road Authority Code";
            "Road Authority Name" := RoadAuthority.Name;
        end;

        "Inspected By" := UserId;
        "Creation Date Time" := CreateDatetime(Today, Time);
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        RoadAsset: Record "Fixed Asset";
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RoadAuthority: Record "Road Authority";
        Vendor: Record Vendor;
        Job: Record Job;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadInventory: Record "Road Inventory";
}

