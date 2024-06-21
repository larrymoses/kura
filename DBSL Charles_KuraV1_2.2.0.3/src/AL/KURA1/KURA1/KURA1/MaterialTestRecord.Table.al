#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72250 "Material Test Record"
{
    DrillDownPageID = "Material Test Cert Submissions";
    LookupPageID = "Material Test Cert Submissions";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Material Delivery Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(3; "Project ID"; Code[40])
        {
            DataClassification = ToBeClassified;
           // TableRelation = Job."No." whe(Status = s=filter(Ongoi | g|"Under PBRM"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    Description := Job.Description;
                    "Purchase Contract ID" := Job."Purchase Contract ID";
                    "Road Code" := Job."Road Code";
                    "Road Section No." := Job."Road Section No";
                    "Contractor No." := Job."Contractor No.";
                    "Contractor Name" := Job."Contractor Name";
                    "Region ID" := Job."Region ID";
                    "Directorate ID" := Job."Directorate Code";


                end;
            end;
        }
        field(4; "Material ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Material"."Material Code" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                RoadMaterial.Reset;
                RoadMaterial.SetRange(RoadMaterial."Material Code", "Material ID");
                if RoadMaterial.FindSet then begin
                    "Material Test Template ID" := RoadMaterial."Default Material Test Template";
                    "Base Unit of Measure" := RoadMaterial."Base Unit Of Measure";
                end;

                Description := 'Material Test Record' + ' - ' + "Project ID" + ' - ' + "Material ID";
            end;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Material Test Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Material Test Template"."Template ID" where("Material ID" = field("Material ID"));
        }
        field(7; "Base Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(8; "Test Lead No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Blocked = filter(false),
                                                  Type = filter(Person));
        }
        field(9; "Site Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Final Test Result"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(12; "Purchase Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"),
                                                           "Project No" = field("Project ID"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."Document Type", PurchaseHeader."document type"::"Blanket Order");
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Contractor No." := PurchaseHeader."Buy-from Vendor No.";
                    "Contractor Name" := PurchaseHeader."Buy-from Vendor Name";
                end;
            end;
        }
        field(13; "Contractor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Contractor No.") then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(14; "Contractor Name"; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Road Inventory"."Road Code" whe(Blocked = d=filter(false));
        }
        field(16; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Road Section"."Road Section No." whe("Road Code" = "=field("Road Code"),
                          //                                           Block = d=filter(false));
        }
        field(17; "Region ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region),
                                                                Blocked = filter(false));
        }
        field(18; "Directorate ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                Blocked = filter(false));
        }
        field(19; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                Blocked = filter(false));
        }
        field(20; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(21; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Testing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Driver Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Vehicle No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Material Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Material Template Head"."Template ID" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                ProjectMaterialTemplateLine.Reset;
                ProjectMaterialTemplateLine.SetRange(ProjectMaterialTemplateLine."Template ID", "Material Template ID");
                if ProjectMaterialTemplateLine.FindSet then begin
                    repeat
                        MaterialTestRecordLine.Init;
                        MaterialTestRecordLine.Code := Code;
                        MaterialTestRecordLine."Test Type" := ProjectMaterialTemplateLine."Test Type";
                        MaterialTestRecordLine."Project ID" := "Project ID";
                        MaterialTestRecordLine."Line No." := MaterialTestRecordLine.Count + 1;
                        MaterialTestRecordLine."Material ID" := ProjectMaterialTemplateLine."Material ID";
                        MaterialTestRecordLine.Validate("Material ID");
                        if not MaterialTestRecordLine.Insert(true) then
                            MaterialTestRecordLine.Modify(true);
                    until ProjectMaterialTemplateLine.Next = 0;
                end;
            end;
        }
        field(31; "Test Lead Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Manufacturer Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Material Certificate No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Material Test Record".Code where("Document Type" = filter("Material Test Certificate"),
                                                               "Project ID" = field("Project ID"));
        }
        field(34; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Material Test Record,Material Test Certificate';
            OptionMembers = " ","Material Test Record","Material Test Certificate";
        }
        field(35; "Portal Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Draft,Submitted,Approved';
            OptionMembers = ,Draft,Submitted,Approved;

            trigger OnValidate()
            begin
                //IF "Portal Status"="Portal Status"::Submitted THEN BEGIN
                // "Submission Date":=TODAY;
                //
                //
                //  END;
            end;
        }
    }

    keys
    {
        key(Key1; "Code", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Document Type")
        {
        }
        fieldgroup(Brick; "Code", "Document Type")
        {
        }
    }

    trigger OnInsert()
    begin
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
        "Material Delivery Date" := Today;
        "Testing Date" := Today;

        //No. Series
        // IF Code='' THEN BEGIN
        // RoadManagementSetup.GET();
        // RoadManagementSetup.TESTFIELD("Material Test Record Nos");
        // NoSeriesManagement.InitSeries(RoadManagementSetup."Material Test Record Nos",xRec."No. Series",TODAY,Code,"No. Series");
        // END;

        if Code = '' then begin
            RoadManagementSetup.Get();
            case "Document Type" of
                "document type"::"Material Test Record":
                    begin
                        RoadManagementSetup.TestField("Material Test Record Nos");
                        NoSeriesManagement.InitSeries(RoadManagementSetup."Material Test Record Nos", xRec."No. Series", Today, Code, "No. Series");
                    end;

                "document type"::"Material Test Certificate":
                    begin
                        RoadManagementSetup.TestField("Material Test Certificate Nos");
                        NoSeriesManagement.InitSeries(RoadManagementSetup."Material Test Certificate Nos", xRec."No. Series", Today, Code, "No. Series");
                    end;
            end;
        end;
    end;

    var
        Job: Record Job;
        RoadMaterial: Record "Road Material";
        PurchaseHeader: Record "Purchase Header";
        Vendor: Record Vendor;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ProjectMaterialTemplateLine: Record "Project Material Template Line";
        MaterialTestRecordLine: Record "Material Test Record Line";


    procedure FnGetProjectName(): Text
    var
        ObjJob: Record Job;
    begin
        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.", "Project ID");
        if ObjJob.FindSet then
            exit(ObjJob.Description);
    end;
}

