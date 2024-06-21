#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72105 "Legislation Part"
{

    fields
    {
        field(1;"Legislation ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Part ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Part Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Section/Clause,Schedule';
            OptionMembers = " ","Section/Clause",Schedule;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Subsections";Integer)
        {
            CalcFormula = count("Legislation Subsection" where ("Legislation ID"=field("Legislation ID"),
                                                                "Part ID"=field("Part ID")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Legislation ID","Part ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

