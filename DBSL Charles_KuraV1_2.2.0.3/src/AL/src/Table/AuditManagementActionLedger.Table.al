#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95236 "Audit Management Action Ledger"
{
    Caption = 'Audit Management Action Ledger';

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Final Audit Report ID";Code[20])
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
        field(3;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Header"."Engagement ID" where ("Document No."=field("Final Audit Report ID"));
        }
        field(4;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Management Action Ledger";
        }
        field(5;"Finding ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Management Action ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Primary RC ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Primary Responsibility Center ID';
        }
        field(9;"Action Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
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
        field(12;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(13;"Auditee Implementation Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(14;"Auditee % Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Auditor Followup Review Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(19;"Auditor Followup Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Last Posted Impl. Status Repot";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Last Posted Implementation Status Report ID';
        }
        field(21;"Last Posted Fol. Audit Voucher";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Last Posted Followup Audit Voucher ID';
        }
        field(22;"Last Auditor Review Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionHeader: Record "Audit Execution Header";
}

