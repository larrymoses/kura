#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72294 "Material Test Record Line"
{
    DrillDownPageID = "Material Test Records";
    LookupPageID = "Material Test Records";

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
            //TableRelation = Job."No." whe(Status = s=filter("Completed/Under DLP"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    //Description:=Job.Description;
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
                    Description := RoadMaterial.Description;
                    "Base Unit of Measure" := RoadMaterial."Base Unit Of Measure";
                end;

                //Description:='Material Test Record'+' - '+"Project ID"+' - '+"Material ID";
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

            trigger OnValidate()
            begin
                //Insert Test Categories
                MaterialTestTemplateLine.Reset;
                MaterialTestTemplateLine.SetRange(MaterialTestTemplateLine."Template ID", "Material Test Template ID");
                if MaterialTestTemplateLine.FindSet then begin
                    repeat
                        MaterialTestRecordCategory.Init;
                        MaterialTestRecordCategory.Code := Code;
                        MaterialTestRecordCategory."Line No" := "Line No.";
                        MaterialTestRecordCategory."Project ID" := "Project ID";
                        MaterialTestRecordCategory."Test Type" := MaterialTestTemplateLine."Test Type";
                        MaterialTestRecordCategory.Description := MaterialTestTemplateLine.Description;
                        if not MaterialTestRecordCategory.Insert(true) then
                            MaterialTestRecordCategory.Modify(true);
                    until MaterialTestTemplateLine.Next = 0;
                end;

                MaterialTestTemplatePass.Reset;
                MaterialTestTemplatePass.SetRange(MaterialTestTemplatePass."Template ID", "Material Test Template ID");
                if MaterialTestTemplatePass.FindSet then begin
                    repeat
                        MaterialTestPass.Init;
                        MaterialTestPass.Code := Code;
                        MaterialTestPass."Test Type" := MaterialTestTemplatePass."Test Type";
                        MaterialTestPass."Project ID" := "Project ID";
                        MaterialTestPass."Checklist No." := MaterialTestTemplatePass."Checklist ID";
                        MaterialTestPass."Line No." := "Line No.";
                        MaterialTestPass.Description := MaterialTestTemplatePass.Description;
                        if not MaterialTestPass.Insert(true) then
                            MaterialTestPass.Modify(true);
                    until MaterialTestTemplatePass.Next = 0;
                end;
            end;
        }
        field(7; "Base Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(8; "Test Lead No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Technologist Type" = const(Internal)) "Internal Project Resource"."Resource No." where("Project ID" = field("Project ID"));

            trigger OnValidate()
            begin
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.", "Test Lead No.");
                if InternalProjectResource.FindSet then
                    "Test Lead Name" := InternalProjectResource.Name;
            end;
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
            //TableRelation = "Road Inventory"."Road Code" whe(Blocked = d=filter(false));
        }
        field(16; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Road Section"."Road Section No." whe("Road Code" = "=field("Road Code"),
                       //                                              Block = d=filter(false));
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
            OptionCaption = ' Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
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
        }
        field(24; Quantity; Decimal)
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
        field(30; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(31; "Test Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Test Lead Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Technologist Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(36; Manufacturer; Text[500])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", "Test Type", "Project ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
        "Material Delivery Date" := Today;
        "Testing Date" := Today;

        //External Technologist No. Series
        case "Technologist Type" of
            "technologist type"::External:
                begin
                    RoadManagementSetup.Get;
                    RoadManagementSetup.TestField("Ext. Technologist/Surveyor Nos");
                    NoSeriesManagement.InitSeries(RoadManagementSetup."Ext. Technologist/Surveyor Nos", xRec."No. Series", Today, "Test Lead No.", "No. Series");
                end
        end;
    end;

    var
        Job: Record Job;
        RoadMaterial: Record "Road Material";
        PurchaseHeader: Record "Purchase Header";
        Vendor: Record Vendor;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MaterialTestTemplateLine: Record "Material Test Template Line";
        MaterialTestTemplatePass: Record "Material Test Template Pass";
        MaterialTestPass: Record "Material Test Pass";
        MaterialTestRecordCategory: Record "Material Test Record Category";
        Resource: Record Resource;
        InternalProjectResource: Record "Internal Project Resource";
}

