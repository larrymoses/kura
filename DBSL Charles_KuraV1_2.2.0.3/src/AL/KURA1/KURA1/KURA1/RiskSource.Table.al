#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95102 "Risk Source"
{
    DrillDownPageID = "Risk Sources";
    LookupPageID = "Risk Sources";

    fields
    {
        field(1;"Source ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. Of Risk Categories";Integer)
        {
            CalcFormula = count("Risk Category" where ("Risk Source ID"=field("Source ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;"No. Of Risks";Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where ("Risk Source ID"=field("Source ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Source ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

