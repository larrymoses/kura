#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59060 "Themes"
{
    DrillDownPageID = "Theme List";
    LookupPageID = "Theme List";

    fields
    {
        field(1;"Theme No";Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Theme Name";Code[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Theme No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

