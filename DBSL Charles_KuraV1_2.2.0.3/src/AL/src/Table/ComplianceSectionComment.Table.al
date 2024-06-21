#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95176 "Compliance Section Comment"
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
            OptionCaption = ' ,Overview,Implication,Guiding Principle';
            OptionMembers = " ",Overview,Implication,"Guiding Principle";
        }
        field(3;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Comment No.";Integer)
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
        key(Key1;"Framework ID","Section Type","Line No.","Comment No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

