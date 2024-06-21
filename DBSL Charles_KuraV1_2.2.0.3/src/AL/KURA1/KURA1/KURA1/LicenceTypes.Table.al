#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59023 "Licence Types"
{
    DrillDownPageID = "Licencing Type";
    LookupPageID = "Licencing Type";

    fields
    {
        field(1;"Licence Type Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Licence Type Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Licence Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

