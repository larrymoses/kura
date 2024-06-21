#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69420 "Inspection Template Line"
{

    fields
    {
        field(1;"Inspection Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","OSH Inspection","Project Supervision";
        }
        field(2;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection Template"."Template ID";
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
        field(5;"Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection Template Category"."Category Code";
        }
        field(6;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Mandatory,Optional;
        }
        field(7;"Response Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection Response Type".Code;
        }
    }

    keys
    {
        key(Key1;"Inspection Type","Template ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
