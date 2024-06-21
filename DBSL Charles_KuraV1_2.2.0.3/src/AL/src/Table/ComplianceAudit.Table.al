#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80201 "Compliance Audit"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if ("Document No." <> xRec."Document No.") then begin
                       SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Policy Compliance Audit Nos");
                       "No. Series" := '';
                    end;
            end;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Policy Compliance,Risk Audit,Operational Audit';
            OptionMembers = "Policy Compliance","Risk Audit","Operational Audit";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Policy No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;

            trigger OnValidate()
            begin
                if Policy.Get("Policy No") then begin
                   "Policy Name":=Policy."Policy Name";
                  // "Policy Dev Institution ID":=Policy."Policy Dev Institution ID";
                   //Summary:=Policy.Summary;
                   "Policy Goal":=Policy."Policy Goal";
                 //  "Applies-To":=Policy."Applies-To";
                   //"Responsibility Center":=Policy."Responsibility Center";
                   //"Responsible Person":=Policy."Responsible Person";
                    "Policy Name":=Policy.Name;
                    //Title:=Policy.Title
                   "Policy Overview":=Policy."Policy Overview";
                   "Policy Purpose":=Policy."Policy Purpose";
                   "Policy Rationale":=Policy."Policy Rationale";
                   "Policy Scope":=Policy."Policy Scope";
                   "Primary Directorate":=Policy."Primary Directorate";
                   "Primary Department":=Policy."Primary Department";
                end;
            end;
        }
        field(5;"Policy Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Policy Overview";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Policy Goal";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Policy Purpose";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Policy Rationale";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Policy Scope";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(23;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        }
        field(24;"Policy Drafting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Policy Approval Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Policy Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Audit Criteria Template ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Reviewer User ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Reviewer Name";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Review Scope";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(32;"No. Series";Code[10])
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
         SPMSetup.Get;
          SPMSetup.TestField("Policy Compliance Audit Nos");
          NoSeriesMgt.InitSeries(SPMSetup."Policy Compliance Audit Nos",xRec."No. Series",0D,"Document No.","No. Series");
    end;

    var
        Policy: Record Policy;
        SPMSetup: Record "Policy Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

