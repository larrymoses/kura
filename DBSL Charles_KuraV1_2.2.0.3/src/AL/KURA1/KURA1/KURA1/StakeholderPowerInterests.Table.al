#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80040 "Stakeholder Power & Interests"
{

    fields
    {
        field(1;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2;"Stakeholder Analysis No";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Analysis Matrix"."Entry No";
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Power/Influence,Interests/Expectation';
            OptionMembers = "Power/Influence","Interests/Expectation";
        }
        field(5;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Level;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
    }

    keys
    {
        key(Key1;"Document No","Stakeholder Analysis No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

