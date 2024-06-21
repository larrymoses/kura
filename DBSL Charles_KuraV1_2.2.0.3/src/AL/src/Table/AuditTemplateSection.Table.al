#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95184 "Audit Template Section"
{
    DrillDownPageID = "Audit Template Sections";
    LookupPageID = "Audit Template Sections";

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Overview,Scope,Scope Exclusion,Comment';
            OptionMembers = " ",Overview,Scope,"Scope Exclusion",Comment;
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
    }

    keys
    {
        key(Key1;"Template ID","Section Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

