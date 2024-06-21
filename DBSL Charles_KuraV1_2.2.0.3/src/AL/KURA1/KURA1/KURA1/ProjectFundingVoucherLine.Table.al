#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72039 "Project Funding Voucher Line"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Works Category"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Region; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(5; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(6; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(7; "Funding Source"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes"."Year Code";
        }
        field(9; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Constituency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code where("Region Code" = field(Region));
        }
        field(12; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where("Record Type" = filter("Road Asset"));

            trigger OnValidate()
            begin
                if RoadAsset.Get("Road Code") then begin
                    "Road Link Name" := RoadAsset.Description;
                    //"Section Name":=RoadAsset.Description;
                end;
            end;
        }
        field(13; "Road Link Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(15; "Total Estimated Cost"; Decimal)
        {
            CalcFormula = sum("Details Of Road Activities"."Bill Item Amount(LCY)" where("WorkPlan No" = field("Document No")));
            Editable = true;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                if "Currency Code" = '' then
                    "Total Estimated Cost(LCY)" := "Total Estimated Cost";
            end;
        }
        field(16; "Total Estimated Cost(LCY)"; Decimal)
        {
            FieldClass = Normal;
        }
        field(17; "Revision Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Original,Revision1,Revision2,Revision3,Revision4,Revision5';
            OptionMembers = " ",Original,Revision1,Revision2,Revision3,Revision4,Revision5;
        }
        field(18; "Start Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "End Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Surface Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Table50003.Field2;
        }
        field(21; "Work Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Works Category".Code;
        }
        field(22; "Fund Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fund Type".Code;
        }
        field(23; "Execution Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Execution Method".Code;
        }
        field(24; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Section Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project No"));

            trigger OnValidate()
            begin

                JobTask.Reset;
                JobTask.SetRange(JobTask."Job Task No.", "Section Code");
                if JobTask.Find('-') then begin
                    "Section Name" := JobTask.Description;
                    "End Chainage(Km)" := JobTask."End Point(Km)";
                    "Start Chainage(Km)" := JobTask."Start Point(Km)";
                    "Surface Type" := JobTask."Surface Types";
                    "Fund Type" := JobTask."Fund Type";
                    "Execution Method" := JobTask."Execution Method";
                    "Work Category" := JobTask."Roads Category";
                    RoadActivities.Reset;
                    RoadActivities.SetRange(RoadActivities."WorkPlan No", "Document No");
                    RoadActivities.SetRange(RoadActivities."Project No", "Project No");
                    RoadActivities.DeleteAll;
                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange(JobPlanningLine."Job No.", "Section Code");
                    JobPlanningLine.SetRange(JobPlanningLine."Job No.", "Project No");
                    if JobPlanningLine.Find('-') then begin
                        repeat
                            RoadActivities.Init;
                            RoadActivities."Section Line No" := JobPlanningLine."Line No.";
                            RoadActivities."WorkPlan No" := "Document No";
                            RoadActivities."Section Code" := "Section Code";
                            RoadActivities."Bill No" := JobPlanningLine."Road Activity Categories";
                            RoadActivities."Item Code" := JobPlanningLine."Bill Item No";
                            RoadActivities."Unit Of Measure" := JobPlanningLine."Unit of Measure";
                            RoadActivities.Technology := JobPlanningLine."Road Technology";
                            RoadActivities."Labour(%)" := JobPlanningLine."Labour (%)";
                            RoadActivities."Rate(LCY)" := JobPlanningLine."Unit Cost";
                            RoadActivities."Bill Item Amount(LCY)" := RoadActivities.Quantity * RoadActivities."Rate(LCY)";
                            RoadActivities."Section Name" := "Section Name";
                            RoadActivities."Road Code" := "Road Code";
                            RoadActivities.Validate("Road Code");
                            RoadActivities."Project No" := "Project No";
                            RoadActivities.Description := JobPlanningLine.Description;
                            RoadActivities."End Chainage(Km)" := JobTask."End Point(Km)";
                            RoadActivities."Start Chainage(Km)" := JobTask."Start Point(Km)";
                            RoadActivities.Insert(true);// THEN;
                                                        //RoadActivities.MODIFY;
                        until JobPlanningLine.Next = 0;
                    end;
                end;
                /*
                IF Jobs.GET("Project No") THEN BEGIN
                  "Currency Code" := Jobs."Currency Code";
                  "Road Code" := Jobs."Road Code";
                  VALIDATE("Road Code");
                  JobPlanningLine.RESET;
                  JobPlanningLine.SETRANGE(JobPlanningLine."Job No.",Jobs."No.");
                  IF JobPlanningLine.FIND('-') THEN
                   BEGIN
                    REPEAT
                     // MESSAGE('%1',JobPlanningLine."Job Task No.");
                      //"Section Code":=JobPlanningLin
                      RoadActivities.INIT;
                      RoadActivities."WorkPlan No":="Document No";
                      RoadActivities."Section Code":=JobPlanningLine."Job Task No.";
                      RoadActivities.VALIDATE("Section Code");
                      RoadActivities."Project No":="Project No";
                      RoadActivities.Description:=JobPlanningLine.Description;
                
                      IF JobTask.GET(JobPlanningLine."Job No.",JobPlanningLine."Job Task No.") THEN BEGIN
                        RoadActivities."End Chainage(Km)":=JobTask."End Point(Km)";
                        RoadActivities."Start Chainage(Km)":=JobTask."Start Point(Km)";
                      END;
                      RoadSection.INSERT(TRUE);// THEN;
                        //RoadActivities.MODIFY;
                    UNTIL JobPlanningLine.NEXT =0;
                   END;
                END;
                */

            end;
        }
        field(26; "Project No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if Jobs.Get("Project No") then begin
                    "Currency Code" := Jobs."Currency Code";
                    "Road Code" := Jobs."Road Code";
                    Validate("Road Code");
                end;
            end;
        }
        field(27; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        PFVHeader.Reset;
        PFVHeader.SetRange(PFVHeader."Document No", "Document No");
        PFVHeader.SetRange(PFVHeader."Document Type", PFVHeader."document type"::PFV);
        if PFVHeader.FindSet then begin
            Region := PFVHeader.Region;
            Directorate := PFVHeader.Directorate;
            Department := PFVHeader.Department;
            "Works Category" := PFVHeader."Default Works Category";
            "Funding Source" := PFVHeader."Default Funding Source";
            "Year Code" := PFVHeader."Year Code";
            "Start Date" := PFVHeader."Start Date";
            "End Date" := PFVHeader."End Date";
            "Currency Code" := PFVHeader."Currency Code";

        end;
    end;

    var
        RoadAsset: Record "Fixed Asset";
        PFVHeader: Record "Project Funding Request Vouche";
        RoadSection: Record "Road Section";
        JobPlanningLine: Record "Job Planning Line";
        ActivitiesCue: Record "Activities Cue";
        Jobs: Record Job;
        RoadActivities: Record "Details Of Road Activities";
        JobTask: Record "Job Task";
}

