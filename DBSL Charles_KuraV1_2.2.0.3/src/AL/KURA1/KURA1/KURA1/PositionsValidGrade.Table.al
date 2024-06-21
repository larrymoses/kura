#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69602 "Positions Valid Grade"
{
    DrillDownPageID = "Terms of Service";
    LookupPageID = "Terms of Service";

    fields
    {
        field(1;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(2;"Grade ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(3;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

