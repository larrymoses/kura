#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72109 "Road Facility Component"
{
    DrillDownPageID = "Road Facility Components";
    LookupPageID = "Road Facility Components";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Facility Type";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Facility Type".Code;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Facility Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

