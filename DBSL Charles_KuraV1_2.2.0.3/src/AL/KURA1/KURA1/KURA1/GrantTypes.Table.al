#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 65017 "Grant Types"
{
    DrillDownPageID = "Grant Types List";
    LookupPageID = "Grant Types List";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

