#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 99453 "Intervention Type Setup"
{
    DrillDownPageID = 99454;
    LookupPageID = 99454;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Intervention Description"; Text[500])
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
Table 99454 "Respondent Category Setup"
{
    DrillDownPageID = 99457;
    LookupPageID = 99457;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Respondent Category"; Text[500])
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
Table 99459 "ExtentOfAgreementMeasureSetup"
{
    DrillDownPageID = 99458;
    LookupPageID = 99458;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "ExtentOfAgreementMeasureSetup"; Text[500])
        {
            DataClassification = ToBeClassified;
            Caption = 'Extent Of Agreement Measure Setup';
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
Table 99460 "ExtentOfAgreementOnImpactSetup"
{
    DrillDownPageID = 99459;
    LookupPageID = 99459;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "ExtentOfAgreeMeasureSetupOI"; Text[500])
        {
            DataClassification = ToBeClassified;
            Caption = 'Extent Of Agreement Measure On Impact Setup';
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

