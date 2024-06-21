#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95178 "Complaince FRM Principl Detail"
{

    fields
    {
        field(1;"Framework ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Guiding Principle ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Line Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Statement,Rationale,Benefit,To-do,Comment';
            OptionMembers = " ",Statement,Rationale,Benefit,"To-do",Comment;
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Framework ID","Guiding Principle ID","Line Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

