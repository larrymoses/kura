#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95108 "Risk Response Strategy"
{
    DrillDownPageID = "Risk Response Strategies";
    LookupPageID = "Risk Response Strategies";

    fields
    {
        field(1;"Strategy ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Response Strategy';
        }
        field(2;"Risk Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Additional Comments";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Risks Handled";Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where ("Gen. Risk Response Strategy"=field("Strategy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Strategy ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

