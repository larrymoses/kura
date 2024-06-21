#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72161 "Project Document Type"
{
    DrillDownPageID = "Project Document Types";
    LookupPageID = "Project Document Types";

    fields
    {
        field(1; "Code"; Code[20])
        {

        }
        field(2; Description; Text[250])
        {

        }
        field(3; Blocked; Boolean)
        {

        }
        field(4; "Program of Works"; Boolean)
        {
            trigger OnValidate()
            begin
                if "Program of Works" = true and "Mobilization Document" = true then
                    "Mobilization Document" := false;
            end;
        }
        field(5; "Mobilization Document"; Boolean)
        {
            trigger OnValidate()
            begin
                if "Program of Works" = true and "Mobilization Document" = true then
                    "Program of Works" := false;
            end;
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

