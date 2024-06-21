#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95175 "Compliance Framework Section"
{

    fields
    {
        field(1;"Framework ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Overview,Implication';
            OptionMembers = " ",Overview,Implication;
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Comments";Integer)
        {
            CalcFormula = count("Compliance Section Comment" where ("Framework ID"=field("Framework ID"),
                                                                    "Section Type"=field("Section Type")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Framework ID","Section Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

