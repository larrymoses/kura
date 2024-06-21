#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95124 "Risk M&E Header"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(5;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=field("Risk Register Type"));

            trigger OnValidate()
            begin
                RiskManagementPlan.Reset;
                RiskManagementPlan.SetRange(RiskManagementPlan."Document No","Risk Management Plan ID");
                if RiskManagementPlan.FindSet then begin
                  "Project ID":=RiskManagementPlan."Project ID";
                  "Directorate ID":=RiskManagementPlan."Directorate ID";
                  "Department ID":=RiskManagementPlan."Department ID";
                  "Responsible Officer No.":=RiskManagementPlan."Responsible Officer No.";
                   "Risk Likelihood Rate Scale ID":=RiskManagementPlan."Risk Likelihood Rate Scale ID";
                   "Risk Impact Rating Scale ID":=RiskManagementPlan."Risk Impact Rating Scale ID";
                   "Overall Risk Rating Scale ID":=RiskManagementPlan."Overall Risk Rating Scale ID";
                   "Risk Appetite Rating Scale ID":=RiskManagementPlan."Risk Appetite Rating Scale ID";
                  end;

                Description:=Format("Document Type")+'-'+'Risk Register ID'+' '+"Risk Management Plan ID";
            end;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Risk Register Type"=filter(Project)) Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.","Project ID");
                if Job.FindSet then begin
                   "Report Start Date":=Job."Starting Date";
                   "Report End Date":=Job."Ending Date";
                  end;
            end;
        }
        field(8;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate));
        }
        field(9;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(10;"Responsible Officer No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(11;"Risk Likelihood Rate Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Likelihood Rate Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where (Blocked=filter(false));
        }
        field(12;"Risk Impact Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where (Blocked=filter(false));
        }
        field(13;"Overall Risk Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where (Blocked=filter(false));
        }
        field(14;"Risk Appetite Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where (Blocked=filter(false));
        }
        field(15;"Report Start Date";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                RiskManagementPlan.Reset;
                RiskManagementPlan.SetRange("Document No","Risk Management Plan ID");
                if RiskManagementPlan.FindSet then begin
                  if (("Report Start Date"<RiskManagementPlan."Planning Start Date") or ("Report End Date" > RiskManagementPlan."Planning End Date")) then begin
                     Error('Report starting date %1 should be between %2 and %3',"Report Start Date",RiskManagementPlan."Planning Start Date",RiskManagementPlan."Planning End Date");
                    end;
                 end;
            end;
        }
        field(16;"Report End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(18;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(19;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22;"Work Execution Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Corporate Strategic Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Risk Register Type"=filter(<>Project)) "Corporate Strategic Plans".Code;
        }
        field(24;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(25;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Document Date":=Today;
        "Created By":=UserId;
        Status:=Status::Open;
        "Risk Register Type":="risk register type"::Project;
        "Created DateTime":=CreateDatetime(Today,Time);

        if "Document No" ='' then begin
          if "Document Type"="document type"::"New Risk Voucher" then begin
            RiskManagementFramework.Get;
            RiskManagementFramework.TestField("New Risk Voucher Nos");
            NoSeriesManagement.InitSeries(RiskManagementFramework."New Risk Voucher Nos",xRec."No. Series",Today,"Document No","No. Series");
            end;
            end;

        if "Document No" ='' then begin
          if "Document Type"="document type"::"Risk Status Report" then begin
            RiskManagementFramework.Get;
            RiskManagementFramework.TestField("Status Report Nos");
            NoSeriesManagement.InitSeries(RiskManagementFramework."Status Report Nos",xRec."No. Series",Today,"Document No","No. Series");
            end;
            end;
    end;

    var
        RiskManagementPlan: Record "Risk Management Plan";
        Job: Record Job;
        RiskManagementFramework: Record "Risk Management Framework";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

