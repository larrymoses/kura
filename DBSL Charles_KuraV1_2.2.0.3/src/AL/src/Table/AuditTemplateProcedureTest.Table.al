#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95189 "Audit Template Procedure Test"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Audit Testing Method";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Testing Method".Code;

            trigger OnValidate()
            begin
                AuditTestingMethod.Reset;
                AuditTestingMethod.SetRange(Code,"Audit Testing Method");
                if AuditTestingMethod.FindSet then begin
                  Description:=AuditTestingMethod.Description;
                  end;
            end;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Audit Objective ID","Audit Procedure ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditTestingMethod: Record "Audit Testing Method";
}

