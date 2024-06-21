#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69424 "HSE Plan Section"
{

    fields
    {
        field(1;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2;"Section Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Overview,Objective,Guiding Principle,Revision/Version';
            OptionMembers = " ",Overview,Objective,"Guiding Principle","Revision/Version";
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
        field(5;"Revision Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Comments";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. of Initiatives";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No. of Guiding Principle Stmts";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Plan ID","Section Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
