#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95238 "Followup Audit Voucher Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Implementation Status Report,Followup Audit Voucher';
            OptionMembers = " ","Implementation Status Report","Followup Audit Voucher";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Management Action Ledger"."Entry No." where ("Auditor Followup Review Status"=filter(Open),
                                                                                "Auditee Implementation Status"=filter(Completed),
                                                                                "Primary RC ID"=field("Primary RC ID"));

            trigger OnValidate()
            begin
                AuditManagementActionLedger.Reset;
                AuditManagementActionLedger.SetRange(AuditManagementActionLedger."Entry No.","Entry No.");
                if AuditManagementActionLedger.FindSet then begin
                  "Final Audit Report ID":=AuditManagementActionLedger."Final Audit Report ID";
                  "Engagement ID":=AuditManagementActionLedger."Engagement ID";
                  "Checklist ID":=AuditManagementActionLedger."Checklist ID";
                  "Finding ID":=AuditManagementActionLedger."Finding ID";
                  "Management Action ID":=AuditManagementActionLedger."Management Action ID";
                  "Primary RC ID":=AuditManagementActionLedger."Primary RC ID";
                  "Action Owner ID":=AuditManagementActionLedger."Action Owner ID";
                  "Due Date":=AuditManagementActionLedger."Due Date";
                  "Action Type":=AuditManagementActionLedger."Action Type";
                  "Task Priority":=AuditManagementActionLedger."Task Priority";
                 // "Audit Procedure ID":=AuditManagementActionLedger.;
                  "Audit Objective ID":=AuditManagementActionLedger."Audit Objective ID";
                  "Dimension Set ID":=AuditManagementActionLedger."Dimension Set ID";
                  end;
            end;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Auditor Followup Review Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(6;"Auditor Followup Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Auditee Implementation Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                if (("Auditee Implementation Status"= "auditee implementation status"::Ongoing) or
                  ("Auditee Implementation Status"= "auditee implementation status"::Planned))
                  then "Auditee % Complete":=0
                  else if "Auditee Implementation Status"= "auditee implementation status"::Completed then
                  "Auditee % Complete":=100;
                  Validate("Auditee % Complete");
                if "Auditee Implementation Status"="auditee implementation status"::Completed then
                  "Actual Date Done":=Today;

            end;
        }
        field(8;"Auditee % Complete";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Auditee % Complete"=100 then
                  "Actual Date Done":=Today;
            end;
        }
        field(9;"Auditee Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Last Posted Impl. Status Repor";Code[20])
        {
            CalcFormula = max("Audit Followup Header"."Document No." where ("Document Type"=filter("Implementation Status Report"),
                                                                            "Primary RC ID"=field("Primary RC ID"),
                                                                            Posted=filter(true)));
            Description = 'Last Posted Implementation Status Report ID';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;"Final Audit Report ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Header"."Document No." where ("Document Type"=filter("Final Audit Report"));

            trigger OnValidate()
            begin
                AuditExecutionHeader.Reset;
                AuditExecutionHeader.SetRange(AuditExecutionHeader."Document No.","Final Audit Report ID");
                if AuditExecutionHeader.FindSet then begin
                  "Engagement ID":=AuditExecutionHeader."Engagement ID";
                  end;
            end;
        }
        field(13;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Header"."Engagement ID" where ("Document Type"=filter("Final Audit Report"),
                                                                            "Document No."=field("Final Audit Report ID"));
        }
        field(14;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Management Action"."Checklist ID" where ("Document Type"=filter("Final Audit Report"),
                                                                            "Document No."=field("Final Audit Report ID"),
                                                                            "Engagement ID"=field("Engagement ID"));
        }
        field(15;"Finding ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Management Action"."Checklist ID" where ("Document Type"=filter("Final Audit Report"),
                                                                            "Document No."=field("Final Audit Report ID"),
                                                                            "Engagement ID"=field("Engagement ID"),
                                                                            "Checklist ID"=field("Checklist ID"));
        }
        field(16;"Management Action ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Management Action"."Checklist ID" where ("Document Type"=filter("Final Audit Report"),
                                                                            "Document No."=field("Final Audit Report ID"),
                                                                            "Engagement ID"=field("Engagement ID"),
                                                                            "Checklist ID"=field("Checklist ID"),
                                                                            "Finding ID"=field("Finding ID"));
        }
        field(17;"Primary RC ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Primary Responsibility Center ID';
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false));
        }
        field(18;"Action Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(19;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(21;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(22;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where ("Engagement ID"=field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectProcedure.Reset;
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Engagement ID","Engagement ID");
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Audit Procedure ID","Audit Procedure ID");
                if AuditProjectProcedure.FindSet then begin
                  "Audit Objective ID":=AuditProjectProcedure."Audit Objective ID";
                  end;
            end;
        }
        field(23;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Objective"."Audit Objective ID" where ("Engagement ID"=field("Engagement ID"));
        }
        field(24;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditManagementActionLedger: Record "Audit Management Action Ledger";
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditProjectProcedure: Record "Audit Project Procedure";
}

