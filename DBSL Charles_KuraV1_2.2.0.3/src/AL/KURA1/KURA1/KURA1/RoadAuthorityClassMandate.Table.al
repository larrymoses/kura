#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72107 "Road Authority Class Mandate"
{
    DrillDownPageID = "Road Authority Class Mandate";
    LookupPageID = "Road Authority Class Mandate";

    fields
    {
        field(1;"Road Authority Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Road Class ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID" where (Blocked=filter(false));
        }
    }

    keys
    {
        key(Key1;"Road Authority Code","Road Class ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

