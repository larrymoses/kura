#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72307 "Final Account"
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
        }
        field(3; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(Status = filter("Completed/Under DLP"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Contract ID" := Job."Purchase Contract ID";
                    Validate("Contract ID");
                    "Project End Date" := Job."Ending Date";
                    "Project Start Date" := Job."Starting Date";
                    "Project Name" := Job.Description;
                    "Contractor No" := Job."Contractor No.";
                    Validate("Contractor No");
                    "Payments to Date" := Job."Actual Project Costs";
                    "Workplanned Length" := Job."Total Road Section Length (KM)";
                end;
            end;
        }
        field(4; "Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Defects Liability Period" := PurchaseHeader."Defects Liability Period";
                    "Contract Sum" := PurchaseHeader."Award Tender Sum Inc Taxes";
                end;
            end;
        }
        field(5; "Project Name"; Text[500])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Checklist  Template"."Template ID" where("Project Stage" = filter("Final Account"));

            trigger OnValidate()
            begin
                ProjectChecklisTemplateLine.Reset;
                ProjectChecklisTemplateLine.SetRange(ProjectChecklisTemplateLine."Template ID", "Template ID");
                if ProjectChecklisTemplateLine.FindSet then begin
                    repeat
                        FinalAccountLine.Init;
                        FinalAccountLine."Document No" := "Document No";
                        FinalAccountLine."Project ID" := "Project ID";
                        FinalAccountLine."Line No" := FinalAccountLine.Count + 1;
                        FinalAccountLine.No := ProjectChecklisTemplateLine."Requirement ID";
                        FinalAccountLine.Description := ProjectChecklisTemplateLine.Description;
                        if not FinalAccountLine.Insert(true) then
                            FinalAccountLine.Modify(true);
                    until ProjectChecklisTemplateLine.Next = 0;
                end;
            end;
        }
        field(9; "Defects Liability Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "DLP Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "DLP End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Contract Sum"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Payments to Date"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Created By"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(17; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                end;
            end;
        }
        field(19; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Workplanned Length"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Pending Issues"; Integer)
        {
            CalcFormula = count("Final Account Line" where("Response Type" = filter(Pending),
                                                            "Document No" = field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Completed Issues"; Integer)
        {
            CalcFormula = count("Final Account Line" where("Document No" = field("Document No"),
                                                            "Response Type" = filter(Completed)));
            Editable = false;
            FieldClass = FlowField;
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
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);

        if "Document No" = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Final Account Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Final Account Nos", xRec."No Series", Today, "Document No", "No Series");
        end;
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        Job: Record Job;
        PurchaseHeader: Record "Purchase Header";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Vendor: Record Vendor;
        ProjectChecklistTemplate: Record "Project Checklist  Template";
        ProjectChecklisTemplateLine: Record "Project Checklis Template Line";
        FinalAccountLine: Record "Final Account Line";
}

