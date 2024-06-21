#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72300 "Road Facility River"
{
    DrillDownPageID = "Road Facility Rivers";
    LookupPageID = "Road Facility Rivers";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No of Structures";Integer)
        {
            CalcFormula = count("Road Facility Item" where (River=field(Code)));
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
        fieldgroup("Drop-Down";"Code",Name)
        {
        }
        fieldgroup(Brick;"Code",Name)
        {
        }
    }
}

