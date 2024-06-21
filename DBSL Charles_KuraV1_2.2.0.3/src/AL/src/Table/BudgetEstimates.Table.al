#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52018 "Budget Estimates"
{

    fields
    {
        field(1;"Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Planning Header";
        }
        field(2;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Budget Template".Code;
        }
        field(3;"Budget Estimates";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

