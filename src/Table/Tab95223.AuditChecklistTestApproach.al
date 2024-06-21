#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95223 "Audit Checklist Test Approach"
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
            TableRelation = "Audit Execution Header"."Engagement ID";
        }
        field(4;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Checklist"."Checklist ID";

            trigger OnValidate()
            begin
                AuditExecutionChecklist.Reset;
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Engagement ID","Engagement ID");
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Checklist ID","Checklist ID");
                if AuditExecutionChecklist.FindSet then begin
                  "Audit Objective ID":=AuditExecutionChecklist."Audit Objective ID";
                  "Audit Procedure ID":=AuditExecutionChecklist."Audit Procedure ID";
                  end;
            end;
        }
        field(5;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Audit Testing Method";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Testing Method".Code where (Blocked=filter(false));
        }
        field(7;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where ("Engagement ID"=field("Engagement ID"));
        }
        field(9;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Objective"."Audit Objective ID" where ("Engagement ID"=field("Engagement ID"));
        }
        field(10;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Engagement ID","Checklist ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionChecklist: Record "Audit Execution Checklist";
        AuditProjectProcedure: Record "Audit Project Procedure";
}

