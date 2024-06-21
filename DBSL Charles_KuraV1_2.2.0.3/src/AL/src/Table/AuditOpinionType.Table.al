#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95170 "Audit Opinion Type"
{
    DrillDownPageID = "Audit Opinion Types";
    LookupPageID = "Audit Opinion Types";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Additional Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Draft Audit Reports";Integer)
        {
            CalcFormula = count("Audit Execution Header" where ("Document Type"=filter("Draft Audit Report")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"No. of Final Audit Reports";Integer)
        {
            CalcFormula = count("Audit Execution Header" where ("Document Type"=filter("Final Audit Report")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

