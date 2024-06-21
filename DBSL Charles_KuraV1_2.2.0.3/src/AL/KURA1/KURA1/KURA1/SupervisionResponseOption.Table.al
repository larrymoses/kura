#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72289 "Supervision Response Option"
{
    DrillDownPageID = "Supervision Response Options";
    LookupPageID = "Supervision Response Options";

    fields
    {
        field(1;"Response Type ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supervision Response Type".Code where (Blocked=filter(false));
        }
        field(2;"Option Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Minimum % Score";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5;"Maximum % Score";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(6;"Corrective Order is Applicable";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Response Type ID","Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

