#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69123 "Staff Est Plan Lines"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Task No";Integer)
        {

            trigger OnValidate()
            begin
                if StaffEstablishmentTaskLines.Get("Task No") then
                  "Staff Establishment No.":=StaffEstablishmentTaskLines."Staff Establishment Code";
            end;
        }
        field(3;"Staff Establishment No.";Code[30])
        {
            TableRelation = "Staff Establishment Header";
        }
        field(4;"Job ID";Code[30])
        {
            TableRelation = Positions;
        }
        field(5;"Job Title";Text[50])
        {
            CalcFormula = lookup(Positions."Job Title" where ("Position ID"=field("Job ID")));
            FieldClass = FlowField;
        }
        field(6;"Department Code";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(7;"Department Name";Text[50])
        {
            CalcFormula = lookup("Responsibility Center".Name where (Code=field("Department Code")));
            FieldClass = FlowField;
        }
        field(8;"Directorate Code";Code[30])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(9;"Directorate Name";Text[50])
        {
            CalcFormula = lookup("Responsibility Center".Name where (Code=field("Directorate Code")));
            FieldClass = FlowField;
        }
        field(10;"Approved Establishment";Integer)
        {
        }
        field(11;"Actual Active";Integer)
        {
            Editable = true;
        }
        field(12;"Actual Suspended";Integer)
        {
        }
        field(13;"Actual Terminated";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.","Task No","Staff Establishment No.","Job ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StaffEstablishmentTaskLines: Record "Staff Establishment Task Lines";
}

