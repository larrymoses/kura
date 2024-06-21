#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95134 "Risk Incident Log"
{
    DrillDownPageID = "Risk Incident Logs";
    LookupPageID = "Risk Incident Logs";

    fields
    {
        field(1;"Incident ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(3;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=field("Risk Register Type"));

            trigger OnValidate()
            begin
                RiskManagementPlan.Reset;
                RiskManagementPlan.SetRange (RiskManagementPlan."Document No","Risk Management Plan ID");
                if RiskManagementPlan.FindSet then begin
                  "Project ID":=RiskManagementPlan."Project ID";
                  Validate("Project ID");
                  end;
            end;
        }
        field(4;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan Line"."Risk ID" where ("Document No"=field("Risk Management Plan ID"));

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk ID","Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                  "Risk Incident Category":=RiskManagementPlanLine."Risk Category";
                  "Incident Description":=RiskManagementPlanLine."Risk Title";
                  end;
            end;
        }
        field(5;"Risk Incident Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan Line"."Risk Category" where ("Document Type"=field("Risk Register Type"));
        }
        field(6;"Incident Description";Text[2048])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan Line"."Risk ID" where ("Document No"=field("Risk Management Plan ID"));
        }
        field(7;"Severity Level";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incident Severity Level".Code;
        }
        field(8;"Occurrence Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(9;"Incident Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Incident Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Incident End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Incident Location Details";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Primary Trigger ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Category Trigger"."Trigger ID" where ("Risk Category ID"=field("Risk Incident Category"));

            trigger OnValidate()
            begin
                RiskCategoryTrigger.Reset;
                RiskCategoryTrigger.SetRange(RiskCategoryTrigger."Trigger ID","Primary Trigger ID");
                if RiskCategoryTrigger.FindSet then
                  "Root Cause Summary":=RiskCategoryTrigger.Description;
            end;
        }
        field(14;"Root Cause Summary";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Category of Person Reporting";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(16;"Reported By (Name)";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Incident Class";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(18;"HSE Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Hazard ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Actual Financial Impact (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Actual Schedule Delay(Days)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Actual Schedule Delay/Service Disruption (Days)';
        }
        field(22;"Actual No. Injured Persons";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Actual No. of Fatalities";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"No. of Parties Involved";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"No. of Corrective Actions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"No. of Preventive Actions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Police Report Reference No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Police Report Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Police Station";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Reporting Officer";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.","Project ID");
                if Job.FindSet then begin
                  "Directorate ID":=Job."Directorate Code";
                  "Department ID":=Job."Department ID";
                  "Region ID":=Job."Region ID";
                  end;
            end;
        }
        field(32;"Work Execution Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Not Applicate at KEMRI';
        }
        field(33;"Corporate Strategic Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(34;"Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;
        }
        field(35;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false),
                                                                "Operating Unit Type"=filter(Directorate));
        }
        field(36;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false),
                                                                "Operating Unit Type"=filter("Department/Center"));
        }
        field(37;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false),
                                                                "Operating Unit Type"=filter(Region));
        }
        field(38;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            InitValue = Open;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(40;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(41;"Created Date Time";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(42;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(43;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(44;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Incident ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Incident Date":=Today;
        "Created By":=UserId;
        Status:=Status::Open;
        "Created Date Time":=CreateDatetime(Today,Time);

        if "Incident ID"='' then begin
          RiskManagementFramework.Get;
          RiskManagementFramework.TestField("Risk Incident Nos.");
          NoSeriesManagement.InitSeries(RiskManagementFramework."Risk Incident Nos.",xRec."No. Series",Today,"Incident ID","No. Series");
          end;
    end;

    var
        RiskManagementFramework: Record "Risk Management Framework";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementPlan: Record "Risk Management Plan";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskCategoryTrigger: Record "Risk Category Trigger";
        Job: Record Job;
}

