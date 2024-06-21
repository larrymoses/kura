#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95197 "Audit Project"
{
    DrillDownPageID = "Audit Projects";
    LookupPageID = "Audit Projects";

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Audit Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Plan"."Audit Plan ID" where(Blocked = filter(false));
        }
        field(3; "Audit Plan Assignment No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Plan Line"."Engagement Line No." where("Audit Plan ID" = field("Audit Plan ID"));
        }
        field(4; "Audit  Work Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Work Type".Code where(Blocked = filter(false));
        }
        field(5; "Engagement Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Engagement Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Audit,Work In Process,Audit Follow-up';
            OptionMembers = " ","New Audit","Work In Process","Audit Follow-up";
        }
        field(7; "Parent Audit Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project"."Engagement ID";
        }
        field(8; "Auditor Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Audit,External Audit ';
            OptionMembers = " ","Internal Audit","External Audit ";
        }
        field(9; "Lead Auditor ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Lead Auditor ID") then begin
                    //   Resource.TestField("E-Mail");
                    //   "Lead Auditor Email":=Resource."E-Mail";
                end;
            end;
        }
        field(10; "Lead Auditor Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Auditee Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre";
        }
        field(14; "Audit Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Template"."Template ID" where(Blocked = filter(false));
        }
        field(15; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                // IF Job.GET("Project ID") THEN BEGIN
                //
                //  END;
            end;
        }
        field(16; "Primary Auditee ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Auditee Type" = filter("Company-Level")) "Responsibility Center".Code where("Operating Unit Type" = filter(Board),
                                                                                                            Blocked = filter(false))
            else
            if ("Auditee Type" = filter(Board)) "Responsibility Center".Code where("Operating Unit Type" = filter(Branch),
                                                                                                                                                                                       Blocked = filter(false))
            else
            if ("Auditee Type" = filter(Directorate)) "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                                                                                                                                                                                                                        Blocked = filter(false))
            else
            if ("Auditee Type" = filter(Department)) "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                                                                                                                                                                                                                                                                                                        Blocked = filter(false))
            else
            if ("Auditee Type" = filter("Section/Team")) "Responsibility Center".Code where("Operating Unit Type" = filter("Division/Section"),
                                                                                                                                                                                                                                                                                                                                                                                                                                            Blocked = filter(false))
            else
            if ("Auditee Type" = filter(Region)) "Responsibility Center".Code where("Operating Unit Type" = filter(Region),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Blocked = filter(false))
            else
            if ("Auditee Type" = filter("Branch/Centre")) "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Blocked = filter(false));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Primary Auditee ID") then begin
                    "Auditee Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(17; "Auditee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Lead Auditee Representative ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Lead Auditee Representative ID") then begin
                    // Resource.TestField("E-Mail");
                    //  "Lead Auditee Email":=Resource."E-Mail";
                    "Auditee Name" := Resource.Name;
                end;

                //Check if record exists in Audit Project Team
                AuditProjectTeam.Reset;
                AuditProjectTeam.SetRange(AuditProjectTeam."Engagement ID", "Engagement ID");
                AuditProjectTeam.SetRange(AuditProjectTeam."Resource No.", "Lead Auditee Representative ID");
                if not AuditProjectTeam.FindSet then begin
                    AuditProjectTeam.Init;
                    AuditProjectTeam."Engagement ID" := "Engagement ID";
                    AuditProjectTeam."Resource No." := "Lead Auditee Representative ID";
                    AuditProjectTeam.Validate("Resource No.");
                    AuditProjectTeam.Name := "Auditee Name";
                    AuditProjectTeam."Audit Team Type" := AuditProjectTeam."audit team type"::"Auditee Team";
                    AuditProjectTeam."Engagement Role" := '';
                    AuditProjectTeam."Job Title" := '';
                    if not AuditProjectTeam.Insert(true) then
                        AuditProjectTeam.Modify;
                end;
            end;
        }
        field(19; "Lead Auditee Email"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(21; "Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code where("Funding Agency" = filter('No'));
        }
        field(22; "Budget Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Budget Control Job No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(24; "Budget Control Job Task No."; Code[20])
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
                    if ((JobTask."Schedule (Total Cost)" <> 0) or (JobTask."Contract (Total Cost)" <> 0)) then
                        "Budget Cost (LCY)" := JobTask."Schedule (Total Cost)"
                end;
            end;
        }
        field(25; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(26; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(27; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Internal Audit Charter ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Internal Audit Charter".Code;
        }
        field(29; "Chief Audit Executive ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Blocked = filter(false));
        }
        field(30; "Risk Likelihood Rate Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Likelihood Rate Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Likelihood Rating"));
        }
        field(31; "Risk Impact Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Impact Rating Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Impact Rating"));
        }
        field(32; "Overall Risk Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Overall Risk Rating"));
        }
        field(33; "Risk Appetite Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Risk Appetite Rating"));
        }
        field(34; "No. of Audit Objectives"; Integer)
        {
            CalcFormula = count("Audit Project Objective" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(35; "Audit Procedure ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "No. fo Audit Checklists"; Integer)
        {
            CalcFormula = count("Audit Project Checklist" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "No. Of Recomm Audit Test Metho"; Integer)
        {
            CalcFormula = count("Audit Checklist Test Method" where("Engagement ID" = field("Engagement ID")));
            Description = 'No. of Recommended Audit Testing Methods/Guidelines';
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "No. of Business Risks"; Integer)
        {
            CalcFormula = count("Audit Project Procedure Risk" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "No. of Controls"; Integer)
        {
            FieldClass = Normal;
        }
        field(40; "No. Of Audit Commence Notices"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Audit Commencement Notices';
        }
        field(41; "No. Of Auditee Notice Response"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Auditee Notice Responses';
        }
        field(42; "No. of Audit Entrace Meetings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "No. Of PreAudit Suvy Inivitati"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Pre-Audit Survey Invitations';
        }
        field(44; "No. Of PreAudit Suvy Responses"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Engagement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Engagement ID", "Engagement Name")
        {
        }
        fieldgroup(Brick; "Engagement ID", "Engagement Name")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Engagement ID" = '' then begin
            AuditAssuranceSetup.Get;
            AuditAssuranceSetup.TestField("Audit Project Nos");
            NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Project Nos", xRec."No. Series", Today, "Engagement ID", "No. Series");
        end;
    end;

    var
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Resource: Record Resource;
        Job: Record Job;
        ResponsibilityCenter: Record "Responsibility Center";
        AuditProjectTeam: Record "Audit Project Team";
        JobTask: Record "Job Task";
}

