#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95228 "Filed Audit Working Paper"
{

    fields
    {
        field(1;"Working Paper ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project"."Engagement ID";

            trigger OnValidate()
            begin
                AuditProject.Reset;
                AuditProject.SetRange(AuditProject."Engagement ID","Engagement ID");
                if AuditProject.FindSet then begin
                  "Preparer Auditor ID":=AuditProject."Lead Auditor ID";
                  //Fields not in AuditProject table
                  "Reviewer Auditor ID":='';
                  "Lead Auditee Representative ID":=AuditProject."Lead Auditee Representative ID";
                  "Dimension Set ID":=AuditProject."Dimension Set ID";
                end;
            end;
        }
        field(3;"Prel. Required Document ID";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Preliminary Required Document ID';
            TableRelation = "Audit Proj Required Document"."Document No." where ("Engagement ID"=field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjRequiredDocument.Reset;
                AuditProjRequiredDocument.SetRange(AuditProjRequiredDocument."Engagement ID","Engagement ID");
                AuditProjRequiredDocument.SetRange(AuditProjRequiredDocument."Document No.","Prel. Required Document ID");
                if AuditProjRequiredDocument.FindSet then begin
                  "Date Requested":=AuditProjRequiredDocument."Date Requested";
                  "Date Received":=Today;
                  "Preparer Auditor ID":=AuditProjRequiredDocument."Lead Auditor ID";
                  "Reviewer Auditor ID":=AuditProjRequiredDocument."Lead Auditor ID";
                  "Lead Auditee Representative ID":=AuditProjRequiredDocument."Lead Auditee Representative ID";
                  "Submission Deadline":=AuditProjRequiredDocument."Submission Deadline";
                  Description:=AuditProjRequiredDocument.Description;
                  end;
            end;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Date Received";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"External Document No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Fieldwork Audit Finding ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Finding ID" where ("Engagement ID"=field("Engagement ID"),
                                                                          "Document Type"=filter("Audit Fieldwork Voucher"));

            trigger OnValidate()
            begin
                AuditExecutionFinding.Reset;
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Engagement ID","Engagement ID");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Document Type",AuditExecutionFinding."document type"::"Audit Fieldwork Voucher");
                if AuditExecutionFinding.FindSet then begin
                  "Audit Checklist ID":=AuditExecutionFinding."Checklist ID";
                  "Audit Objective ID":=AuditExecutionFinding."Audit Objective ID";
                  "Audit Procedure ID":=AuditExecutionFinding."Audit Procedure ID";
                  end;
            end;
        }
        field(8;"Audit Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Audit Testing Summary";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Preparer Auditor ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where ("Audit Team Type"=filter("Auditor Team"),
                                                                       "Engagement ID"=field("Engagement ID"));
        }
        field(13;"Reviewer Auditor ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where ("Audit Team Type"=filter("Auditor Team"),
                                                                       "Engagement ID"=field("Engagement ID"));
        }
        field(14;"Lead Auditee Representative ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where ("Audit Team Type"=filter("Auditee Team"),
                                                                       "Engagement ID"=field("Engagement ID"));
        }
        field(15;"Parent Audit Working Paper ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Filed Audit Working Paper"."Working Paper ID" where (Blocked=filter(false));
        }
        field(16;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(17;"Date Requested";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Submission Deadline";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(21;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Working Paper ID","Engagement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Date Requested":=Today;
        "Created DateTime":=CreateDatetime(Today,Time);
        "Created By":=UserId;
        Status:=Status::Open;

        if "Working Paper ID"='' then begin
           AuditAssuranceSetup.Get;
           AuditAssuranceSetup.TestField("Working Paper Nos");
           NoSeriesManagement.InitSeries(AuditAssuranceSetup."Working Paper Nos",xRec."No. Series",Today,"Working Paper ID","No. Series");
          end;
    end;

    var
        AuditProject: Record "Audit Project";
        AuditProjRequiredDocument: Record "Audit Proj Required Document";
        AuditExecutionFinding: Record "Audit Execution Finding";
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

