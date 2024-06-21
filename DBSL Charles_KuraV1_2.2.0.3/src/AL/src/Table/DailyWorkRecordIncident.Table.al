#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72244 "Daily Work Record Incident"
{
    DrillDownPageID = "DWR Incident Impacts";
    LookupPageID = "DWR Incident Impacts";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Incident Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Severity Level";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incident Severity Level".Code;
        }
        field(5;"Occurrence Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(6;"Incident Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Incident Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Incident End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Incident Location Details";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Primary Trigger ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Category Trigger"."Trigger ID" where ("Risk Category ID"=field("Risk Incident Category"));

            trigger OnValidate()
            begin
                 RiskCategoryTrigger.Reset;
                 RiskCategoryTrigger.SetRange(RiskCategoryTrigger."Risk Category ID","Risk Incident Category");
                 RiskCategoryTrigger.SetRange(RiskCategoryTrigger."Trigger ID","Primary Trigger ID");
                 if RiskCategoryTrigger.FindSet then begin
                    "Root Cause Summary":=RiskCategoryTrigger.Description;
                  end;
            end;
        }
        field(11;"Root Cause Summary";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Category of Person Reporting";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(13;"Reported By (Name)";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Incident Class";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Health/Safety/Environment Incident';
            OptionMembers = " ","Health/Safety/Environment Incident";
        }
        field(15;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(16;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=filter(Project),
                                                                        "Project ID"=field("Job No."));
        }
        field(17;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan Line"."Risk ID" where ("Document No"=field("Risk Management Plan ID"));

            trigger OnValidate()
            begin
                 RiskManagementPlanLine.Reset;
                 RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document Type",RiskManagementPlanLine."document type"::Project);
                 RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No","Risk Management Plan ID");
                 RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk ID","Risk ID");
                 if RiskManagementPlanLine.FindSet then begin
                    "Risk Incident Category":=RiskManagementPlanLine."Risk Category";

                  end;
            end;
        }
        field(18;"Risk Incident Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Category".Code where (Blocked=filter(false));
        }
        field(19;"HSE Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID" where ("Plan Type"=filter(Project));

            trigger OnValidate()
            begin
                HSEPlan.Reset;
                HSEPlan.SetRange(HSEPlan."Plan ID","HSE Plan ID");
                if HSEPlan.FindSet then begin
                  "Risk Management Plan ID":=HSEPlan."Risk Management Plan ID";
                  end;
            end;
        }
        field(20;"Hazard ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan Line"."Hazard ID" where ("Plan ID"=field("HSE Plan ID"));
        }
        field(21;"Actual Financial Impact (LCY)";Decimal)
        {
            CalcFormula = sum("DWR Incident Impact".Quantity where ("Document No."=field("Document No."),
                                                                    "Impact Type"=const("Financial Loss"),
                                                                    "Incident Line No."=field("Line No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22;"Actual Delay Disruption (Days)";Decimal)
        {
            CalcFormula = sum("DWR Incident Impact".Quantity where ("Document No."=field("Document No."),
                                                                    "Impact Type"=const("Schedule Delay/Service Disruption(Days)"),
                                                                    "Incident Line No."=field("Line No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23;"Actual No. Injured Persons";Decimal)
        {
            CalcFormula = sum("DWR Incident Impact".Quantity where ("Document No."=field("Document No."),
                                                                    "Impact Type"=const(Injury),
                                                                    "Incident Line No."=field("Line No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(24;"Actual No. of Fatalities";Decimal)
        {
            CalcFormula = sum("DWR Incident Impact".Quantity where ("Document No."=field("Document No."),
                                                                    "Impact Type"=const("Fatality (Death)"),
                                                                    "Incident Line No."=field("Line No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25;"Police Report Reference No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Police Report Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Police Station";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Reporting Officer";Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         DailyWorkRecord.Reset;
         DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
         if DailyWorkRecord.FindSet then
          begin
            "Job No.":=DailyWorkRecord."Project ID";
          end;
    end;

    var
        RiskCategoryTrigger: Record "Risk Category Trigger";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        DailyWorkRecord: Record "Daily Work Record";
        HSEPlan: Record "HSE Plan";
}

