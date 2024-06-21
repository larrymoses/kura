#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69423 "HSE Plan"
{
    DrillDownPageID = "HSE Plans";
    LookupPageID = "HSE Plans";

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Risk Management Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Plan Type" = filter(Project)) "Risk Management Plan"."Document No" where("Document Type" = filter(Project));

            trigger OnValidate()
            begin
                // RiskManagementPlan.Reset;
                // RiskManagementPlan.SetRange(RiskManagementPlan."Document No", "Risk Management Plan ID");
                // RiskManagementPlan.SetRange(RiskManagementPlan."Document Type", RiskManagementPlan."document type"::Project);
                // if RiskManagementPlan.FindSet then begin
                //     Description := 'Project Health, Safety & Environment Management Plan(PHSEP)' + ' - ' + RiskManagementPlan."Project ID";
                //     "Project ID" := RiskManagementPlan."Project ID";
                //     Job.Reset;
                //     Job.SetRange(Job."No.", RiskManagementPlan."Project ID");
                //     if Job.FindSet then begin
                //         "Planning Start Date" := Job."Starting Date";
                //         "Planning End Date" := Job."Ending Date";
                //     end;
               // end;
            end;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Safety Rules&Regulations Temp"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Table69413.Field1 where (Field4=const(No));

            // trigger OnValidate()
            // begin
            //     OSHRuleTemplateLine.Reset;
            //     OSHRuleTemplateLine.SetRange(OSHRuleTemplateLine."Template ID", "Safety Rules&Regulations Temp");
            //     if OSHRuleTemplateLine.FindSet then begin
            //         HSEPlanSafetyRule.Reset;
            //         HSEPlanSafetyRule.SetRange(HSEPlanSafetyRule."Plan ID", "Plan ID");
            //         if HSEPlanSafetyRule.FindSet then
            //             HSEPlanSafetyRule.DeleteAll();
            //         repeat
            //             HSEPlanSafetyRule.Init;
            //             HSEPlanSafetyRule."Plan ID" := "Plan ID";
            //             HSEPlanSafetyRule."Line No." := HSEPlanSafetyRule.Count + 1;
            //             HSEPlanSafetyRule.Description := OSHRuleTemplateLine.Description;
            //             HSEPlanSafetyRule."Category Code" := OSHRuleTemplateLine."Category Code";
            //             if not HSEPlanSafetyRule.Insert(true) then
            //                 HSEPlanSafetyRule.Modify(true);
            //         until OSHRuleTemplateLine.Next = 0;
            //     end;



            //     OSHRuleTemplateCategory.Reset;
            //     OSHRuleTemplateCategory.SetRange(OSHRuleTemplateCategory."Template ID", "Safety Rules&Regulations Temp");
            //     if OSHRuleTemplateCategory.FindSet then begin
            //         HSEPlanSafetyRuleCategory.Reset;
            //         HSEPlanSafetyRuleCategory.SetRange(HSEPlanSafetyRuleCategory."Plan ID", "Plan ID");
            //         if HSEPlanSafetyRuleCategory.FindSet then
            //             HSEPlanSafetyRuleCategory.DeleteAll();
            //         repeat
            //             HSEPlanSafetyRuleCategory.Init;
            //             HSEPlanSafetyRuleCategory."Plan ID" := "Plan ID";
            //             HSEPlanSafetyRuleCategory."Category Code" := OSHRuleTemplateCategory."Category Code";
            //             HSEPlanSafetyRuleCategory.Description := OSHRuleTemplateCategory.Description;
            //             if not HSEPlanSafetyRuleCategory.Insert(true) then
            //                 HSEPlanSafetyRuleCategory.Modify(true);
            //         until OSHRuleTemplateCategory.Next = 0;
            //     end;
            // end;
        }
        field(7; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(8; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(9; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));
        }
        field(10; "Primary Mission"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Overall Safety Manager"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(12; "Planning Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Planning End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(17; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "No. of OSH Management Plans"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "No. of Safe Work Permit App"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "No.of Safe Work Completion rep"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. of Emergency Drill Reports"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "No. of Risk Incident Logs"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "No. of OSH Trainings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "No. of OSH Meetings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "No. of OSH Inspection Reports"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "No. of OSH Imp Status Reports"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "No. of Risk Incidents"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Actual Financial Impact (LCY)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Actual Delay/Disruption (Days)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Actual No. Injured Persons"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Actual No. of Fatalities"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(34; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(35; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Assigned To:"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
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
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);

        if "Plan ID" = '' then begin
            // HealthSafetySetup.Get;
            // //HealthSafetySetup.TestField("OSH Management Plan Nos.");
            // NoSeriesManagement.InitSeries(HealthSafetySetup."OSH Management Plan Nos.", xRec."No. Series", 0D, "Plan ID", Rec."No. Series");
        end;
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        HSEPlanLine: Record "HSE Plan Line";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
    // HealthSafetySetup: Record UnknownRecord69400;
    // NoSeriesManagement: Codeunit NoSeriesManagement;
    // RiskManagementPlan: Record "Risk Management Plan";
    // Job: Record Job;
    // OSHRuleTemplate: Record UnknownRecord69413;
    // OSHRuleTemplateLine: Record UnknownRecord69415;
    // OSHRuleTemplateCategory: Record UnknownRecord69414;
    // HSEPlanSafetyRuleCategory: Record UnknownRecord69431;
    // HSEPlanSafetyRule: Record UnknownRecord69432;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', "Plan Type", "Plan ID"),
        //     "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

        // if OldDimSetID <> "Dimension Set ID" then begin
        //     Modify;
        //     if PlanLinesExist then
        //         UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        // end;
    end;

    procedure PlanLinesExist(): Boolean
    begin
        HSEPlanLine.Reset;
        HSEPlanLine.SetRange(HSEPlanLine."Plan ID", "Plan ID");
        exit(not HSEPlanLine.IsEmpty);
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ConfirmManagement: Codeunit "Confirm Management";
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        // if not ConfirmManagement.ConfirmProcess(Text051,true) then
        //   exit;

        HSEPlanLine.Reset;
        HSEPlanLine.SetRange(HSEPlanLine."Plan ID", "Plan ID");
        HSEPlanLine.LockTable;
        if HSEPlanLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(HSEPlanLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if HSEPlanLine."Dimension Set ID" <> NewDimSetID then begin
                    HSEPlanLine."Dimension Set ID" := NewDimSetID;

                    DimMgt.UpdateGlobalDimFromDimSetID(
                  HSEPlanLine."Dimension Set ID", HSEPlanLine."Shortcut Dimension 1 Code", HSEPlanLine."Shortcut Dimension 2 Code");
                    HSEPlanLine.Modify;
                end;
            until HSEPlanLine.Next = 0;
    end;
}

