#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95239 "Audit Management Action"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Engagement ID";
        }
        field(4;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Checklist ID";
        }
        field(5;"Finding ID";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Finding ID";

            trigger OnValidate()
            begin
                AuditExecutionFinding.Reset;
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Document Type","Document Type");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Document No.","Document No.");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Engagement ID","Engagement ID");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Checklist ID","Checklist ID");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Finding ID","Finding ID");
                if AuditExecutionFinding.FindSet then begin
                  "Audit Procedure ID":=AuditExecutionFinding."Audit Procedure ID";
                  "Audit Objective ID":=AuditExecutionFinding."Audit Objective ID";
                  "Dimension Set ID":=AuditExecutionFinding."Dimension Set ID";
                  end;
            end;
        }
        field(6;"Management Action ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Primary RC ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false));
        }
        field(9;"Action Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(10;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(12;"Action Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                // IF (("Action Status"="Action Status"::Planned) OR ("Action Status"="Action Status"::Ongoing)) THEN
                //  "% Complete":=0
                // ELSE
                //  IF "Action Status"="Action Status"::Completed THEN
                //  "% Complete":=100;
            end;
        }
        field(13;"% Complete";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                // IF "% Complete" = 100 THEN
                //  "Actual Date Done":=TODAY;
            end;
        }
        field(14;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(15;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where ("Engagement ID"=field("Engagement ID"));
        }
        field(16;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Objective"."Audit Objective ID" where ("Engagement ID"=field("Engagement ID"));
        }
        field(17;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Posted Mgt Action Entry No.";Integer)
        {
            CalcFormula = lookup("Audit Management Action Ledger"."Entry No." where ("Final Audit Report ID"=field("Document No."),
                                                                                     "Engagement ID"=field("Engagement ID"),
                                                                                     "Checklist ID"=field("Checklist ID"),
                                                                                     "Finding ID"=field("Finding ID"),
                                                                                     "Management Action ID"=field("Management Action ID")));
            Description = 'Posted Management Action Entry No.';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Engagement ID","Checklist ID","Finding ID","Management Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionFinding: Record "Audit Execution Finding";
        AuditProjectProcedure: Record "Audit Project Procedure";
}

