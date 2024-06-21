#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72354 "Detailed Pavemet Test Line"
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
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Layer Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Layer.Code WHERE (Blocked=FILTER(No))';
            Editable = false;

            trigger OnValidate()
            begin
                ObjLayer.Reset;
                ObjLayer.SetRange(ObjLayer.Code,"Layer Code");
                if ObjLayer.FindSet then begin
                  "Layer Description":=ObjLayer.Description;
                  end;
            end;
        }
        field(5;"Layer Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Layer Test Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Layer Test Setup"."Test Code" where ("Layer Code"=field("Layer Code"));

            trigger OnValidate()
            begin
                LayerTestSetup.Reset;
                LayerTestSetup.SetRange(LayerTestSetup."Test Code","Layer Test Code");
                // LayerTestSetup.SETRANGE(LayerTestSetup."Layer Code","Layer Code");
                if LayerTestSetup.FindSet then
                  begin
                    "Layer Test Description":=LayerTestSetup."Test Description";
                end;
            end;
        }
        field(7;"Layer Test Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Layer Tolerance";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Test Result";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Level Deviation";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Test Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Survey Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.","Layer Code","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ObjLayer.Reset;
        ObjLayer.SetRange(ObjLayer.Code,"Layer Code");
        if ObjLayer.FindSet then begin
          "Layer Description":=ObjLayer.Description;
          end;
    end;

    var
        ObjLayer: Record Layer;
        LayerTestSetup: Record "Layer Test Setup";
}

