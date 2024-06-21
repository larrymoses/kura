#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 65040 "Financial Year Code"
{
    DrillDownPageID = "Financial Year Code";
    LookupPageID = "Financial Year Code";

    fields
    {
        field(1;"Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Starting Date";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accounting Period"."Starting Date" where (Closed=filter(false));

            trigger OnValidate()
            begin
                "Ending Date":=CalcDate('<1Y>-1D',"Starting Date");
            end;
        }
        field(3;"Ending Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"G/L Budget";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
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

