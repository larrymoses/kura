#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72217 "Layer Material"
{
    DrillDownPageID = "Layer Materials";
    LookupPageID = "Layer Materials";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Material"."Material Code" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                RoadMaterial.Reset;
                RoadMaterial.SetRange(RoadMaterial."Material Code", Code);
                if RoadMaterial.FindSet then
                    Description := RoadMaterial.Description;
            end;
        }
        field(2; "Layer Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Layer.Code;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Material Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Road Inventory"."Road Code" whe(Blocked = d=filter(false));
        }
    }

    keys
    {
        key(Key1; "Code", "Layer Code", "Material Code", "Road Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadMaterial: Record "Road Material";
}

