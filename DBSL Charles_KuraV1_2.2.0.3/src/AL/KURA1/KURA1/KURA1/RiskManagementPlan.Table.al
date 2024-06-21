#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95114 "Risk Management Plan"
{
    DrillDownPageID = "Project Risk Mgt. Plans";
    LookupPageID = "Project Risk Mgt. Plans";

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project ID");
                if ObjJob.FindSet then begin
                    "Work Execution Plan ID" := ObjJob."Work Execution Plan ID";
                    "Contractor No" := ObjJob."Contractor No.";
                    Validate("Contractor No");
                    "Planning Start Date" := ObjJob."Starting Date";
                    "Planning End Date" := ObjJob."Ending Date";
                    "Project Name" := ObjJob.Description;
                end;

                Description := 'Project Risk Management Plan' + ' - ' + "Project ID";
            end;
        }
        field(5; "Work Execution Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No.";// where("Document Type" = filter("Work Execution Programme"));

            trigger OnValidate()
            begin
                /*  ProjectMobilizationHeader.Reset;
                  ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document No.", "Work Execution Plan ID");
                  if ProjectMobilizationHeader.FindSet then begin
                      "Project ID" := ProjectMobilizationHeader."Project ID";
                      Validate("Project ID");
                 end;
   */
            end;
        }
        field(6; "Corporate Strategic Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(7; "Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes"."Year Code";

            trigger OnValidate()
            begin
                if ("Document Type" = "document type"::Corporate) or ("Document Type" = "document type"::"Functional (Department)") or ("Document Type" = "document type"::"Functional (Directorate)")
                 or ("Document Type" = "document type"::"Functional (Region)") then begin
                    ObjFundYearCode.Reset;
                    ObjFundYearCode.SetRange(ObjFundYearCode."Year Code", "Year Code");
                    if ObjFundYearCode.FindSet then begin
                        "Planning Start Date" := ObjFundYearCode."Start Date";
                        "Planning End Date" := ObjFundYearCode."End Date";
                    end;
                end;
            end;
        }
        field(8; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = filter("Functional (Directorate)")) "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                                                                        Blocked = filter(false));
        }
        field(9; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = filter("Functional (Department)")) "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                                                                       Blocked = filter(false));
        }
        field(10; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = filter("Functional (Region)")) "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                                                                   Blocked = filter(false));
        }
        field(11; Description; Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Primary MIssion"; Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Responsible Officer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(14; "Risk Likelihood Rate Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Likelihood RatingScale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Likelihood Rating"),
                                                                         Blocked = filter(false));
        }
        field(15; "Risk Impact Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Impact Rating"),
                                                                         Blocked = filter(false));
        }
        field(16; "Overall Risk Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Overall Risk Rating"),
                                                                         Blocked = filter(false));
        }
        field(17; "Risk Appetite Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Risk Appetite Rating"),
                                                                         Blocked = filter(false));
        }
        field(18; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Planning Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Planning End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(23; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Created Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "No. of Neg. Risks (Threats)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Impact Type" = filter(Negative)));
            Description = 'No. of Negative Risks (Threats)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "No. of Positiv Risks (Opports)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Impact Type" = filter(Positive)));
            Description = 'No. of Positive Risks (Opportunities)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "No. of Risks (Red)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Heat Zone" = filter(Red)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "No. of Risks (Yellow)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Heat Zone" = filter(Yellow)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "No. of Risks (Green)"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Heat Zone" = filter(Green)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "No. of Risk Incidents"; Integer)
        {
            FieldClass = Normal;
        }
        field(31; "Est. Financial Impact (LCY)"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(32; "Estimate Delay Impact (Days)"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(33; "Actual Financial Impact (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Incident Ledger Entry.Actual Financial Impact (LCY)';
        }
        field(34; "Actual Schedule Delay(Days)"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Incident Ledger Entry.Actual Schedule Delay/Service Disruption (Days)';
        }
        field(35; "Actual No. Injured Persons"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Incident Ledger Entry.Actual No. Injured Person';
        }
        field(36; "Actual No. of Fatalities"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Incident Ledger Entry.Actual No. of Fatalities';
        }
        field(37; "No. of New Risk Vouchers"; Integer)
        {
            CalcFormula = count("Risk M&E Header" where("Risk Management Plan ID" = field("Document No"),
                                                         "Document Type" = filter("New Risk Voucher")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "No. of Risk Status Reports"; Integer)
        {
            CalcFormula = count("Risk M&E Header" where("Risk Management Plan ID" = field("Document No"),
                                                         "Document Type" = filter("Risk Status Report")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "CO -  Principal Investigator"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(41; "Portal Status"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Draft;
            OptionCaption = ' ,Draft,Submitted';
            OptionMembers = " ",Draft,Submitted;
        }
        field(42; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                end;
            end;
        }
        field(43; "Contractor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Assigned To:"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
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



        /*"Document Date":=Today;
        "Created By":=UserId;
        "Created Date Time":=CreateDatetime(Today,Time);
        Status:=Status::Open;

        if "Document Type"="document type"::Corporate then begin
        if "Document No"='' then begin
          RiskManagementFramework.Get;
          RiskManagementFramework.TestField("Corporate Risk Mgt Plan Nos.");
          NoSeriesManagement.InitSeries(RiskManagementFramework."Corporate Risk Mgt Plan Nos.",xRec."No. Series",Today,"Document No","No. Series");
          end;
          end;

        if "Document Type"="document type"::"Functional (Department)" then begin
        if "Document No"='' then begin
          RiskManagementFramework.Get;
          RiskManagementFramework.TestField("Departmenta Risk Mgt Plan Nos.");
          NoSeriesManagement.InitSeries(RiskManagementFramework."Departmenta Risk Mgt Plan Nos.",xRec."No. Series",Today,"Document No","No. Series");
          end;
          end;
          if "Document Type"="document type"::"Functional (Directorate)" then begin
        if "Document No"='' then begin
          RiskManagementFramework.Get;
          RiskManagementFramework.TestField("Directorate Risk Mgt Plan Nos.");
          NoSeriesManagement.InitSeries(RiskManagementFramework."Directorate Risk Mgt Plan Nos.",xRec."No. Series",Today,"Document No","No. Series");
          end;
          end;

          if "Document Type"="document type"::"Functional (Region)" then begin
        if "Document No"='' then begin
          RiskManagementFramework.Get;
          RiskManagementFramework.TestField("Regional Risk Mgt Plan Nos.");
          NoSeriesManagement.InitSeries(RiskManagementFramework."Regional Risk Mgt Plan Nos.",xRec."No. Series",Today,"Document No","No. Series");
          end;
          end;


         if "Document Type"="document type"::Project then begin
        if "Document No"='' then begin
          RiskManagementFramework.Get;
          RiskManagementFramework.TestField("Project Risk Mgt Plan Nos.");
          NoSeriesManagement.InitSeries(RiskManagementFramework."Project Risk Mgt Plan Nos.",xRec."No. Series",Today,"Document No","No. Series");
          end;
          end;*/
          Rec."Document Date" := Today;
        if "Document No" = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Communication Plan Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Communication Plan Nos", xRec."No. Series", Today, "Document No", "No. Series");
        end;
    end;


    var
        ObjJob: Record Job;
        RoadManagementSetup: Record "Road Management Setup";
        ObjFundYearCode: Record "Funding Year Codes";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementFramework: Record "Risk Management Framework";
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        Vendor: Record Vendor;
}

