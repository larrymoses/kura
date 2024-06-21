#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95001 "Communication Plan Header"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2; "Document No"; Code[20])
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
                    "Commencement Date" := ObjJob."Commencement Date";
                    "Project Start Date" := ObjJob."Starting Date";
                    "Project End Date" := ObjJob."Ending Date";
                end;

                Description := Format("Document Type") + ' ' + "Project Name";

                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Project ID", "Project ID");
                if InternalProjectResource.FindSet then begin
                    repeat
                        CommPlanLineStakeholder.Init;
                        CommPlanLineStakeholder."Document No" := "Document No";
                        CommPlanLineStakeholder."Document Type" := CommPlanLineStakeholder."document type"::Project;
                        CommPlanLineStakeholder.Category := CommPlanLineStakeholder.Category::Meeting;
                        CommPlanLineStakeholder."Stakeholder ID" := InternalProjectResource."Role Code";
                        CommPlanLineStakeholder.Description := InternalProjectResource.Designation;
                        CommPlanLineStakeholder.Name := InternalProjectResource.Name;
                        CommPlanLineStakeholder."Email Address" := InternalProjectResource.Email;
                        CommPlanLineStakeholder.Insert;
                    until InternalProjectResource.Next = 0;
                end;

                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Project ID", "Project ID");
                if WEPContractorTeam.FindSet then begin
                    repeat
                        CommPlanLineStakeholder.Init;
                        CommPlanLineStakeholder."Document No" := "Document No";
                        CommPlanLineStakeholder."Document Type" := CommPlanLineStakeholder."document type"::Project;
                        CommPlanLineStakeholder.Category := CommPlanLineStakeholder.Category::Meeting;
                        CommPlanLineStakeholder."Stakeholder ID" := WEPContractorTeam."Role Code";
                        CommPlanLineStakeholder.Description := WEPContractorTeam.Designation;
                        CommPlanLineStakeholder.Name := WEPContractorTeam.Name;
                        CommPlanLineStakeholder."Email Address" := WEPContractorTeam.Email;
                        CommPlanLineStakeholder.Insert;
                    until WEPContractorTeam.Next = 0;
                end;
            end;
        }
        field(4; "Work Execution Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No.";//where ("Document Type"=filter("Work Execution Programme"));
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Mission"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "No. Of Planned Meetings"; Integer)
        {
            CalcFormula = count("Comm Plan Meeting Schedule" where("Document Type" = field("Document Type"),
                                                                    "Document No" = field("Document No")));
            Description = 'Fred Calcfieds later';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. Of Meetings Held"; Integer)
        {
            CalcFormula = count("Project Meeting Register" where("Project ID" = field("Project ID")));
            Description = 'Fred Calcfieds later';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "No. Of Project Report"; Integer)
        {
            Description = 'Fred Calcfieds later';
            Editable = false;
            FieldClass = Normal;
        }
        field(13; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(15; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Created Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Assigned To"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(19; "Commencement Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No")
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
        "Created Date Time" := CreateDatetime(Today, Time);

        if "Document No" = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Communication Plan Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Communication Plan Nos", xRec."No. Series", Today, "Document No", "No. Series");
        end;
    end;

    var
        ObjJob: Record Job;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        CommPlanLineStakeholder: Record "Comm Plan Line Stakeholder";
        InternalProjectResource: Record "Internal Project Resource";
        WEPContractorTeam: Record "WEP Contractor Team";
}

