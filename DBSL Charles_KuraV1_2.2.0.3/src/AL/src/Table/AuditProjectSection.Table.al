#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95199 "Audit Project Section"
{
    DrillDownPageID = "Audit Project Sections";
    LookupPageID = "Audit Project Sections";

    fields
    {
        field(1;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Section Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Overview,Scope,Scope Exclusion,Comment';
            OptionMembers = " ",Overview,Scope,"Scope Exclusion",Comment;
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Engagement ID","Section Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

