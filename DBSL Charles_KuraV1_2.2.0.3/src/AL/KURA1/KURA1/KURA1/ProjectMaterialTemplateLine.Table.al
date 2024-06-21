#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72306 "Project Material Template Line"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Material Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Material ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Material"."Material Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                RoadMaterial.Reset;
                RoadMaterial.SetRange(RoadMaterial."Material Code","Material ID");
                if RoadMaterial.FindSet then
                  begin
                   "Material Name":=RoadMaterial.Description;
                    "Unit Of Measure":=RoadMaterial."Base Unit Of Measure";
                    end;
            end;
        }
        field(5;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31;"Test Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Material ID")
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

