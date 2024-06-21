#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72276 "QM Plan Header"
{

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project ID");
                if ObjJob.FindSet then begin
                    "Project Name" := ObjJob.Description;
                    "Purchase Contract ID" := ObjJob."Purchase Contract ID";
                    Validate("Purchase Contract ID");
                    "Contractor No" := ObjJob."Contractor No.";
                    Validate("Contractor No");
                    "Works Start Chainage" := ObjJob."Section Start Chainage(Km)";
                    "Works End Chainage" := ObjJob."Section End Chainage(KM)";
                    "Project Manager/Engineer" := ObjJob."Project Manager";
                    "Region ID" := ObjJob."Global Dimension 1 Code";
                    "Directorate ID" := ObjJob."Directorate Code";
                    "Department ID" := ObjJob."Department ID";
                    "Planning Start Date" := ObjJob."Starting Date";
                    "Planning End Date" := ObjJob."Ending Date";
                end;


                Description := 'Quality Management Plan' + ' - ' + "Project ID";
            end;
        }
        field(4; "Purchase Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then
                    "DLP Period" := PurchaseHeader."Defects Liability Period";
            end;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Mission"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                ObjVendor.Reset;
                ObjVendor.SetRange(ObjVendor."No.", "Contractor No");
                if ObjVendor.FindSet then
                    "Contractor Name" := ObjVendor.Name;
            end;
        }
        field(8; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Planning Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Planning End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Blocked; Boolean)
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
        field(13; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "DLP Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "DLP Period"; DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "DLP Start Date" <> 0D then
                    "DLP End Date" := CalcDate("DLP Period", "DLP Start Date");
            end;
        }
        field(17; "DLP End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Works Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(19; "Works End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(20; "No. of Self -Inspections"; Integer)
        {
            CalcFormula = count("QM Plan Line" where("Plan ID" = field("Plan ID"),
                                                      "Inspection Type" = filter("Self Inspection")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "No. of Adhoc Inspections"; Integer)
        {
            CalcFormula = count("QM Plan Line" where("Plan ID" = field("Plan ID"),
                                                      "Inspection Type" = filter("Adhoc Inspection")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "No. of Formal Inspections"; Integer)
        {
            CalcFormula = count("QM Plan Line" where("Plan ID" = field("Plan ID"),
                                                      "Inspection Type" = filter("Formal Inspection")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "No. of TakeOver Inspections"; Integer)
        {
            CalcFormula = count("QM Plan Line" where("Plan ID" = field("Plan ID"),
                                                      "Inspection Type" = filter("Take Over Inspection")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "No. of Post DLP Inspections"; Integer)
        {
            CalcFormula = count("QM Plan Line" where("Plan ID" = field("Plan ID"),
                                                      "Inspection Type" = filter("Post DLP Inspection")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "No. of Open Corr Orders Issued"; Integer)
        {
            CalcFormula = count("Corrective Orders Header" where("Order No" = field("Plan ID"),
                                                                  Status = filter(Open)));
            Description = 'No. of Open Corr Orders Issued';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "No. of Closed Correctiv Orders"; Integer)
        {
            CalcFormula = count("Corrective Orders Header" where("Order No" = field("Plan ID"),
                                                                  Status = filter(Released)));
            Description = 'No. of Closed Corr Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Project Manager/Engineer"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region),
                                                                Blocked = filter(false));
        }
        field(30; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                Blocked = filter(false));
        }
        field(31; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                Blocked = filter(false));
        }
        field(32; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency),
                                                                Blocked = filter(false));
        }
        field(33; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Road Inventory"."Road Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                // RoadInventory.Reset;
                // RoadInventory.SetRange(RoadInventory."Road Code","Road Code");
                // if RoadInventory.FindSet then
                //   "Link Name":=RoadInventory."Link Name";
            end;
        }
        field(34; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"),
            //                                                          Blocked=filter(false));

            trigger OnValidate()
            begin
                // RoadSection.Reset;
                // RoadSection.SetRange(RoadSection."Road Code","Road Code");
                // RoadSection.SetRange(RoadSection."Road Section No.","Road Section No.");
                // if RoadSection.FindSet then
                //   "Section Name":=RoadSection."Section Name";
            end;
        }
        field(35; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(36; "Link Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(37; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Quality Mgt. Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Checklist  Template"."Template ID" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                ProjectChecklisTemplateLine.Reset;
                ProjectChecklisTemplateLine.SetRange(ProjectChecklisTemplateLine."Template ID", "Quality Mgt. Template ID");
                if ProjectChecklisTemplateLine.FindSet then begin
                    repeat
                        QualityMgtPlanChecklist.Init;
                        QualityMgtPlanChecklist."Document No" := "Plan ID";
                        QualityMgtPlanChecklist."Line No" := QualityMgtPlanChecklist.Count + 10;
                        QualityMgtPlanChecklist."Project ID" := "Project ID";
                        QualityMgtPlanChecklist.No := ProjectChecklisTemplateLine."Requirement ID";
                        QualityMgtPlanChecklist.Description := ProjectChecklisTemplateLine.Description;
                        if not QualityMgtPlanChecklist.Insert(true) then
                            QualityMgtPlanChecklist.Modify(true);
                    until ProjectChecklisTemplateLine.Next = 0;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Plan ID" = '' then begin
            RoadManagementSetup.Get;
            RoadManagementSetup.TestField("Quality Management Plan Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Quality Management Plan Nos", xRec."No Series", Today, "Plan ID", "No Series");
        end;
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
    end;

    var
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        // RoadInventory: Record "Road Inventory";
        // RoadSection: Record "Road Section";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        PurchaseHeader: Record "Purchase Header";
        ProjectChecklistTemplate: Record "Project Checklist  Template";
        ProjectChecklisTemplateLine: Record "Project Checklis Template Line";
        QualityMgtPlanChecklist: Record "Quality Mgt.  Plan Checklist";
}

