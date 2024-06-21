#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70053 "General Item Categories"
{
    DrillDownPageID = "Direct Procurement Approved Li";
    LookupPageID = "Direct Procurement Approved Li";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Item No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
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

