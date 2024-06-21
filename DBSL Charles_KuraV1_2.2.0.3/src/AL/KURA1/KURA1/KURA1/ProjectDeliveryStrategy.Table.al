#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72212 "Project Delivery Strategy"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Delivery Approach";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Projects";Integer)
        {
            CalcFormula = count(Job where ("Project Delivery Strategy"=field(Code)));
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
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

