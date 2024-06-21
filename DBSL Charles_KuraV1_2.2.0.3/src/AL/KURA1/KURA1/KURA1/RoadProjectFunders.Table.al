#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52026 "Road Project Funders"
{
    Caption = 'Road Project Funders';
    DrillDownPageID = "Road Project Funders";
    LookupPageID = "Road Project Funders";

    fields
    {
        field(1; "Road Project"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Roads Projects"."Project  No";
        }
        field(2; Section; Code[45])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Job."No." where ("Document Type"=const(Project),
            //                                 "Road Project No"=field("Road Project"));

            trigger OnValidate()
            begin
                if Researcher.Get(Section) then begin
                    "Funding Source" := Researcher.Name;
                end;
            end;
        }
        field(3; "Funding Source"; Code[100])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Funding Source".Code;
        }
        field(4; "Funding Source Name"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Project Team Roles";
        }
        field(9; "Funded Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Funded Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Road Project", "Funding Source")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Researcher: Record Resource;
        RTMRoles: Record "Road Project Team Roles";
    //  GrantsSetup: Record "Grants Setup";
}

