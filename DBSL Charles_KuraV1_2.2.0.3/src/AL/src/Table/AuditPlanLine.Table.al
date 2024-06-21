#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95193 "Audit Plan Line"
{

    fields
    {
        field(1; "Audit Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Engagement Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Audit  Work Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Work Type".Code where(Blocked = filter(false));
        }
        field(4; "Engagement Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Engagement Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Audit,Work In Process,Audit Follow-up';
            OptionMembers = " ","New Audit","Work In Process","Audit Follow-up";
        }
        field(6; "Parent Audit Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project"."Engagement ID";
        }
        field(7; "Auditor Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Audit,External Audit';
            OptionMembers = " ","Internal Audit","External Audit";
        }
        field(8; "Lead Auditor ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Lead Auditor ID") then begin
                    // Resource.TestField("E-Mail");
                    //  "Lead Auditor Email":=Resource."E-Mail";
                end;
            end;
        }
        field(9; "Lead Auditor Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Auditee Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre";
        }
        field(13; "Audit Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Template"."Template ID" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                AuditTemplate.Reset;
                AuditTemplate.SetRange("Template ID", "Audit Template ID");
                if AuditTemplate.FindSet then
                    "Audit  Work Type" := AuditTemplate."Audit  WorkType";
            end;
        }
        field(14; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(15; "Primary Auditee ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Auditee Type" = filter(Directorate)) "Responsibility Center".Code where(Blocked = filter(false),
                                                                                                        "Operating Unit Type" = filter(Directorate))
            else
            if ("Auditee Type" = filter(Department)) "Responsibility Center".Code where(Blocked = filter(false),
                                                                                                                                                                                        "Operating Unit Type" = filter("Department/Center"))
            else
            if ("Auditee Type" = filter(Board)) "Responsibility Center".Code where(Blocked = filter(false),
                                                                                                                                                                                                                                                                   "Operating Unit Type" = filter(Branch))
            else
            if ("Auditee Type" = filter(Region)) "Responsibility Center".Code where(Blocked = filter(false),
                                                                                                                                                                                                                                                                                                                                               "Operating Unit Type" = filter(Region))
            else
            if ("Auditee Type" = filter("Company-Level")) "Responsibility Center".Code where(Blocked = filter(false),
                                                                                                                                                                                                                                                                                                                                                                                                                                    "Operating Unit Type" = filter(Board))
            else
            if ("Auditee Type" = filter("Section/Team")) "Responsibility Center".Code where(Blocked = filter(false),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "Operating Unit Type" = filter("Division/Section"))
            else
            if ("Auditee Type" = filter("Branch/Centre")) "Responsibility Center".Code where(Blocked = filter(false),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             "Operating Unit Type" = filter(Constituency));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Primary Auditee ID") then begin
                    "Auditee Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(16; "Auditee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Lead Auditee Representative ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Blocked = filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Lead Auditee Representative ID") then begin
                    //   Resource.TestField("E-Mail");
                    //  "Lead Auditee Email":=Resource."E-Mail";
                end;
            end;
        }
        field(18; "Lead Auditee Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code where("Funding Agency" = filter('No'));
        }
        field(20; "Budget Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Budget Control Job No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(22; "Budget Control Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Budget Control Job No"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange(JobTask."Job No.", "Budget Control Job No");
                JobTask.SetRange(JobTask."Job Task No.", "Budget Control Job Task No.");
                if JobTask.FindSet then begin
                    JobTask.CalcFields("Schedule (Total Cost)", "Contract (Total Cost)");
                    "Budget Cost (LCY)" := JobTask."Schedule (Total Cost)";
                end;
            end;
        }
        field(23; "Global Dimension Dim 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Global Dimension  Dim 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Internal Audit Charter ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Internal Audit Charter".Code;
        }
        field(27; "Chief Audit Executive ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(28; "Audit Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Audit Plan,Project Audit Plan';
            OptionMembers = " ","Internal Audit Plan","Project Audit Plan";
        }
    }

    keys
    {
        key(Key1; "Audit Plan ID", "Engagement Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        AuditPlan.Reset;
        AuditPlan.SetRange(AuditPlan."Audit Plan ID", "Audit Plan ID");
        if AuditPlan.FindSet then begin
            "Planned Start Date" := AuditPlan."Planning Start Date";
            "Planned End Date" := AuditPlan."Planning End Date";
            "Project ID" := AuditPlan."Project ID";
            "Audit Plan Type" := AuditPlan."Audit Plan Type";
            "Internal Audit Charter ID" := AuditPlan."Internal Audit Charter ID";
            "Chief Audit Executive ID" := AuditPlan."Chief Audit Executive ID";
        end;
    end;

    var
        AuditPlan: Record "Audit Plan";
        Resource: Record Resource;
        ResponsibilityCenter: Record "Responsibility Center";
        JobTask: Record "Job Task";
        AuditTemplate: Record "Audit Template";
}

