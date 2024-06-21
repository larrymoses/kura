#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95233 "Audit Template Test Method"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Template Checklist"."Checklist ID";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                AuditTemplateChecklist.Reset;
                AuditTemplateChecklist.SetRange(AuditTemplateChecklist."Checklist ID","Checklist ID");
                if AuditTemplateChecklist.FindSet then
                  begin
                    "Audit Objective ID":=AuditTemplateChecklist."Audit Objective ID";
                    "Audit Procedure ID":=AuditTemplateChecklist."Audit Procedure ID";
                  end;
            end;
        }
        field(4;"Audit Testing Method";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Testing Method".Code where (Blocked=filter(false));
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Checklist"."Audit Procedure ID";
        }
        field(7;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Checklist"."Audit Objective ID";
        }
    }

    keys
    {
        key(Key1;"Template ID","Checklist ID","Line No.","Audit Testing Method")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditTemplateChecklist: Record "Audit Template Checklist";
}

