#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 65030 "Funding Year Codes"
{
    DrillDownPageID = "Funding Year Codes";
    LookupPageID = "Funding Year Codes";

    fields
    {
        field(1;"Year Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Code[50])
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
        field(5;"Financial Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;
        }
    }

    keys
    {
        key(Key1;"Year Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup("Drop-Down";"Year Code","Financial Year Code","Start Date","End Date")
        {
        }
        fieldgroup(Brick;"Year Code","Financial Year Code","Start Date","End Date")
        {
        }
    }
}

