#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95169 "Audit Finding Rating Criteria"
{
    DrillDownPageID = "Audit Finding Rating Criteria";
    LookupPageID = "Audit Finding Rating Criteria";

    fields
    {
        field(1;"Rating Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Rating Code","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

