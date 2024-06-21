#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95232 "Audit Template Checklist"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Checklist ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // AuditProjectChecklist.RESET;
                // AuditProjectChecklist.SETRANGE(AuditProjectChecklist."Checklist ID","Checklist ID");
                // IF AuditProjectChecklist.FINDSET(FALSE,FALSE) THEN
                //   BEGIN
                //      "Audit Procedure ID":=AuditProjectChecklist."Audit Procedure ID";
                //      "Audit Objective ID":=AuditProjectChecklist."Audit Objective ID";
                //      Description:=AuditProjectChecklist.Description;
                //
                //   END;
            end;
        }
        field(3;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Template Procedure"."Audit Procedure ID";

            trigger OnValidate()
            begin
                AuditTemplateProcedure.Reset;
                AuditTemplateProcedure.SetRange(AuditTemplateProcedure."Audit Procedure ID","Audit Procedure ID");
                if AuditTemplateProcedure.FindSet then
                  "Audit Objective ID":=AuditTemplateProcedure."Audit Objective ID";
            end;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Audit Testing Methods";Integer)
        {
            CalcFormula = count("Audit Template Test Method" where ("Template ID"=field("Template ID"),
                                                                    "Checklist ID"=field("Checklist ID")));
            Description = 'No. of Audit Testing Methods';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Template Objective"."Audit Objective ID";
        }
    }

    keys
    {
        key(Key1;"Template ID","Checklist ID","Audit Procedure ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectChecklist: Record "Audit Project Checklist";
        AuditTemplateProcedure: Record "Audit Template Procedure";
}

