#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80217 "Business Research Survey"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Business Research Category"="business research category"::"Employee Experience" then begin
                  if "Document No." <> xRec."Document No." then begin
                         BRInnovationSetup.Get;
                          NoSeriesMgt.TestManual(BRInnovationSetup."Employee Survey No. Series");
                         "No. Series" := '';
                      end;
                end;

                if "Business Research Category"="business research category"::"Customer Experience" then begin
                  if "Document No." <> xRec."Document No." then begin
                         BRInnovationSetup.Get;
                          NoSeriesMgt.TestManual(BRInnovationSetup."Customer Survey No. Series");
                         "No. Series" := '';
                      end;
                end;

                if "Business Research Category"="business research category"::"Post-Project Survey" then begin
                  if "Document No." <> xRec."Document No." then begin
                         BRInnovationSetup.Get;
                          NoSeriesMgt.TestManual(BRInnovationSetup."Post-Project Survey No. Series");
                         "No. Series" := '';
                      end;
                end;

                if "Business Research Category"="business research category"::"Custom Survey" then begin
                  if "Document No." <> xRec."Document No." then begin
                         BRInnovationSetup.Get;
                          NoSeriesMgt.TestManual(BRInnovationSetup."Custom Surveys No. Series");
                         "No. Series" := '';
                      end;
                end;
            end;
        }
        field(2;"Business Research Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee Experience,Customer Experience,Post-Project Survey,Custom Survey';
            OptionMembers = "Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Survey Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Survey Type".Code;

            trigger OnValidate()
            begin
                if ResearchSurveyType.Get("Survey Type") then begin
                   "Business Research Category":=ResearchSurveyType."Business Research Category";
                    Description:=ResearchSurveyType.Description;
                    "Target Respondent Type":=ResearchSurveyType."Target Respondent Type";
                    "Primary Department ID":=ResearchSurveyType."Primary Department";
                    "Primary Directorate ID":=ResearchSurveyType."Primary Directorate";
                end;
            end;
        }
        field(5;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Business Research Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Business Research Template"."Template ID" where (Blocked=const(false));

            trigger OnValidate()
            begin
                if BusinessResearchTemplate.Get("Business Research Template ID") then begin
                  "Target Respondent Type":=BusinessResearchTemplate."Target Respondent Type";

                end;
            end;
        }
        field(7;"Target Respondent Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employees,Customers,Contacts,Vendors';
            OptionMembers = Employees,Customers,Contacts,Vendors;
        }
        field(8;"Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(9;"Primary Department ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           Blocked=const(false));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Find('-') then begin
                   "Primary Directorate ID":=ResponsibilityCenter."Direct Reports To";
                end;
            end;
        }
        field(10;"Primary Directorate ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate),
                                                           Blocked=const(false));
        }
        field(11;Published;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Date Published";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Response Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Creation Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Creation Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(18;"No. of Responses";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
            if "Business Research Category"="business research category"::"Employee Experience" then begin
               if "Document No."= '' then begin
                  BRInnovationSetup.Get;
                  BRInnovationSetup.TestField("Employee Survey No. Series");
                  NoSeriesMgt.InitSeries(BRInnovationSetup."Employee Survey No. Series",xRec."No. Series",0D,"Document No.","No. Series");
               end;
            end;

              if "Business Research Category"="business research category"::"Customer Experience" then begin
               if "Document No."= '' then begin
                  BRInnovationSetup.Get;
                  BRInnovationSetup.TestField("Customer Survey No. Series");
                  NoSeriesMgt.InitSeries(BRInnovationSetup."Customer Survey No. Series",xRec."No. Series",0D,"Document No.","No. Series");
               end;
            end;

             if "Business Research Category"="business research category"::"Post-Project Survey" then begin
               if "Document No."= '' then begin
                  BRInnovationSetup.Get;
                  BRInnovationSetup.TestField("Post-Project Survey No. Series");
                  NoSeriesMgt.InitSeries(BRInnovationSetup."Post-Project Survey No. Series",xRec."No. Series",0D,"Document No.","No. Series");
               end;
            end;

            if "Business Research Category"="business research category"::"Custom Survey" then begin
               if "Document No."= '' then begin
                  BRInnovationSetup.Get;
                  BRInnovationSetup.TestField("Custom Surveys No. Series");
                  NoSeriesMgt.InitSeries(BRInnovationSetup."Custom Surveys No. Series",xRec."No. Series",0D,"Document No.","No. Series");
               end;
            end;

        "Document Date":=Today;
        "Created By":=UserId;
        "Creation Date":=Today;
        "Creation Time":=Time;


    end;

    var
        BRInnovationSetup: Record "e-BR & Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        ResearchSurveyType: Record "Research Survey Type";
        BusinessResearchTemplate: Record "Business Research Template";
        ResponsibilityCenter: Record "Responsibility Center";
}

