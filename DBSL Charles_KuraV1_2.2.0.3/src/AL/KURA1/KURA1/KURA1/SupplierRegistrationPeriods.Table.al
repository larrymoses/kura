#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70229 "Supplier Registration Periods"
{
    DrillDownPageID = "Supplier Registration Periods";
    LookupPageID = "Supplier Registration Periods";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Financial Year Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where ("Current Year"=const(true));
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

