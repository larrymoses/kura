#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72160 "Work Execution Plan"
{
    LookupPageID = "Work Execution Plan";

    fields
    {
        field(1; "Document No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Commencement Order ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Commencement Order"."Notice No.";
        }
        field(4; "Purchase Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"),
                                                           "Contract Status" = filter(" "));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Contractor No." := PurchaseHeader."Buy-from Vendor No.";
                    Validate("Contractor No.");
                    "Project ID" := PurchaseHeader.Job;
                    Validate("Project ID");
                end;
            end;
        }
        field(5; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    "Road Code" := Job."Road Code";
                    "Road Section No." := Job."Road Section No";
                    Validate("Road Section No.");
                    "Project Start Date" := Job."Starting Date";
                    "Project End Date" := Job."Ending Date";
                    "Constituency ID" := Job."Constituency ID";
                    "Region ID" := Job."Region ID";
                    "Department ID" := Job."Global Dimension 2 Code";
                    "Directorate ID" := Job."Directorate Code";
                end;

                Description := 'Works Execution Plan for' + ' ' + "Project ID" + ' ' + ("Purchase Contract ID");
            end;
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Contractor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No.");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                end;
            end;
        }
        field(8; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";
        }
        field(11; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"));

            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No.");
                if RoadSection.FindSet then begin
                    "Section Name" := RoadSection."Section Name";
                end;
            end;
        }
        field(12; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency));
        }
        field(16; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(17; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(18; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(19; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(20; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Document Type")
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
            RoadManagementSetup.Get;
            RoadManagementSetup.TestField("Work Execution Plan  Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Work Execution Plan  Nos", xRec."No. Series", Today, "Document No.", "No. Series");
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;
    end;

    var
        RoadSection: Record "Road Section";
        Job: Record Job;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        Vendor: Record Vendor;
}

