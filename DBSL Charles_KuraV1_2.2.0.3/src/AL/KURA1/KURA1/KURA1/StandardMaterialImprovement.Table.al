#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72297 "Standard Material Improvement"
{
    DrillDownPageID = "Standard Material Improvements";
    LookupPageID = "Standard Material Improvements";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Material Improv. Setu".Code;

            trigger OnValidate()
            begin
                StandardMaterialImprovSetu.Reset;
                StandardMaterialImprovSetu.SetRange(StandardMaterialImprovSetu.Code,Code);
                if StandardMaterialImprovSetu.FindSet then
                  Description:=StandardMaterialImprovSetu.Description;
            end;
        }
        field(2;"Material Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Layer Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Improvement Percentage(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Road  Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Material Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StandardMaterialImprovSetu: Record "Standard Material Improv. Setu";
}

