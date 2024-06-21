#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72219 "Layer Specification"
{
    DrillDownPageID = "Layer Specifications";
    LookupPageID = "Layer Specifications";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Layer.Code;

            trigger OnValidate()
            begin
                Layer.Reset;
                Layer.SetRange(Layer.Code, Code);
                if Layer.FindSet then
                    Description := Layer.Description;
            end;
        }
        field(2; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
         //   TableRelation = "Road Inventory"."Road Code" whe(Blocked = d=filter(false));
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Thickness(MM)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Material ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Material"."Material Code";

            trigger OnValidate()
            begin
                RoadMaterial.Reset;
                RoadMaterial.SetRange(RoadMaterial."Material Code", "Material ID");
                if RoadMaterial.FindSet then
                    "Material Description" := RoadMaterial.Description;
            end;
        }
        field(6; "Material Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Layer: Record Layer;
        RoadMaterial: Record "Road Material";
}

