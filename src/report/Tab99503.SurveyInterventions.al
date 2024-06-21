table 99503 "Survey Interventions"
{
    Caption = 'Survey Interventions';
    DataClassification = ToBeClassified;
    LookupPageId ="Survey Interventions";
    DrillDownPageId ="Survey Interventions";
    fields
    {
        field(1; Intervention; Code[60])
        {
            Caption = 'Intervention';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; Intervention)
        {
            Clustered = true;
        }
    }
}
