#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72108 "Road Facility Variant"
{
    DrillDownPageID = "Road Facility Variants";
    LookupPageID = "Road Facility Variants";

    fields
    {
        field(1;"Sub Type Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Facility Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Facility Type".Code;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Additional Notes";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Inventory;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Sub Type Code","Facility Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

