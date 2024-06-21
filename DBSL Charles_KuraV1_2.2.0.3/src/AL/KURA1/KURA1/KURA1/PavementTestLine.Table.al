#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72353 "Pavement Test Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Layer Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Layer.Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                Layer.Reset;
                Layer.SetRange(Layer.Code,"Layer Code");
                if Layer.FindSet then
                  begin
                    "Layer Description":=Layer.Description;
                    end;
            end;
        }
        field(4;"Layer Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Layer: Record Layer;
}

