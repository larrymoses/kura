#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72336 "Survey Quality Check Header"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //     TableRelation = Job."No." where (Status=filter("Completed/Under DLP"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Purchase Contract ID" := Job."Purchase Contract ID";
                    Validate("Purchase Contract ID");
                    "Contractor No" := Job."Contractor No.";
                    Validate("Contractor No");
                    "Project Name" := Job.Description;
                    "Region ID" := Job."Region ID";
                    "Directorate ID" := Job."Directorate Code";
                    "Department ID" := Job."Department ID";
                end;

                Description := 'Survey Quality Check' + ' ' + "Project ID";
            end;
        }
        field(4; "Purchase Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                // PurchaseHeader.RESET;
                // PurchaseHeader.SETRANGE(PurchaseHeader."No.","Purchase Contract ID");
                // IF PurchaseHeader.FINDSET THEN BEGIN

            end;
        }
        field(5; "Project Name"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No");
                if Vendor.FindSet then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(7; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Description; Text[2040])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Testing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
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
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Survey Quality Checks Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Survey Quality Checks Nos", xRec."No. Series", Today, "Document No", "No. Series");
        end;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
        "Testing Date" := Today;
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        Job: Record Job;
        Vendor: Record Vendor;
}

