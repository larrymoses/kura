#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59014 "Limit Types"
{
    LookupPageId = 59033;
    DrillDownPageId = 59033;
    fields
    {
        field(1; "Upper Limit"; Decimal)
        {
        }
        field(2; "Lower Limit"; Decimal)
        {
        }
        field(3; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Request Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Effective Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Effective End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

