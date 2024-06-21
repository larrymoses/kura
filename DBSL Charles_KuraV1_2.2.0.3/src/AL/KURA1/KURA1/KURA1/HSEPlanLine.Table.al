#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69433 "HSE Plan Line"
{

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "Hazard ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Hazard Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Table69401.Field1;

            // trigger OnValidate()
            // begin
            //     HazardType.Reset;
            //     HazardType.SetRange(HazardType.Co de,"Hazard Type");
            //     if HazardType.FindSet t begin
            //Description := n:=HazardType.Description;

            //      "Hazard Category" := ":=HazardType."Hazard Category";

            //     end;

            //Auto populate to HSE Plan Line Hazard Control Measures
            // HazardControlMeasure.Reset;
            // HazardControlMeasure.SetRange(HazardControlMeasure."Hazard Typ e","Hazard Type");
            // if HazardControlMeasure.FindSet t begin
            //  repeat
            //       HSEPlanLineHazardControl.Init;
            //         HSEPlanLineHazardControl."Plan  := "Plan ID";
            //       HSEPlanLineHazardControl."Hazard  := "Hazard ID";
            //       HSEPlanLineHazardControl."Hazard Ty := "Hazard Type";
            //       HSEPlanLineHazardControl."Control  := ":=HSEPlanLineHazardControl.Co + 1;
            //       HSEPlanLineHazardControl.Descript := n:=HazardControlMeasure."Recommended Preventive Action";
            //         if not HSEPlanLineHazardControl.Insert(true) then
            //             HSEPlanLineHazardControl.Modify(true);
            //     until HazardControlMeasure.N = 0;

            //     end;
            //  end;
        }
        field(4; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Hazard Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Physical,Chemical,Biological,Psychosocial,"General Environment";
        }
        field(6; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Planned Hazard Controls"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "No. of Risk Incidences"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Risk Management Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan"."Document No" where("Document Type" = filter(Project));
        }
        field(10; "Risk ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan Line"."Risk ID" where("Document Type" = filter(Project),
                                                                         "Document No" = field("Risk Management Plan ID"));

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document Type", RiskManagementPlanLine."document type"::Project);
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No", "Risk Management Plan ID");
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                    "Risk Likelihood Code" := RiskManagementPlanLine."Risk Likelihood Code";
                    "Risk Impact Code" := RiskManagementPlanLine."Risk Impact Code";
                    "Risk Impact Type" := RiskManagementPlanLine."Risk Impact Type";
                    "Risk Likelihood Rating ScaleID" := RiskManagementPlanLine."Risk Likelihood Rate Scale ID";
                    "Risk Impact Rating Scale ID" := RiskManagementPlanLine."Risk Impact Rating Scale ID";
                    "Risk Appetite Rating Scale ID" := RiskManagementPlanLine."Risk Appetite Rating Scale ID";
                    "Overall Risk Rating Scale ID" := RiskManagementPlanLine."Overall Risk Rating Scale ID";
                    "Risk Likelihood Rating" := RiskManagementPlanLine."Risk Likelihood Rating";
                    "Risk Impact Rating" := RiskManagementPlanLine."Risk Impact Rating";
                    "Overall Risk Rating" := RiskManagementPlanLine."Overal Risk Rating";
                    "Overall Risk Level Code" := RiskManagementPlanLine."Overall Risk Level Code";
                end;
            end;
        }
        field(11; "Risk Likelihood Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Risk Impact Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Risk Impact Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Negative,Positive;
        }
        field(14; "Risk Likelihood Rating ScaleID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Risk Impact Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Overall Risk Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Risk Appetite Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Risk Likelihood Rating"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Risk Impact Rating"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Overall Risk Rating"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Overall Risk Level Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(23; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Hazard ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HSEPlan.Reset;
        HSEPlan.SetRange(HSEPlan."Plan ID", "Plan ID");
        if HSEPlan.FindSet then begin
            "Risk Management Plan ID" := HSEPlan."Risk Management Plan ID";
        end;
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        // HazardType: Record UnknownRecord69401;
        HSEPlan: Record "HSE Plan";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
    // HSEPlanLineHazardControl: Record UnknownRecord69434;
    // HazardControlMeasure: Record UnknownRecord69402;

    procedure ShowDimensions() IsChanged: Boolean
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2 %3', "Hazard Type", "Plan ID", "Hazard ID"));

        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IsChanged := OldDimSetID <> "Dimension Set ID";
    end;
}

