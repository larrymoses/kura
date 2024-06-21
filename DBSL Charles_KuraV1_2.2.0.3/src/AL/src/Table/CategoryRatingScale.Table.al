#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69180 "Category Rating Scale"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Category Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rating Category Setup";
        }
        field(3;"Category Description";Text[50])
        {
            CalcFormula = lookup("Rating Category Setup".Description where (Code=field("Category Code")));
            FieldClass = FlowField;
        }
        field(4;"Rating Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rating Scale Setup";

            trigger OnValidate()
            begin
                RatingScaleSetup.Reset;
                RatingScaleSetup.SetRange(Code,"Rating Code");
                if RatingScaleSetup.FindSet then begin
                  "Rating Description":=RatingScaleSetup."Rating Scale";
                end
            end;
        }
        field(5;"Rating Description";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.","Rating Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Category Description","Rating Description")
        {
        }
    }

    var
        RatingScaleSetup: Record "Rating Scale Setup";
}

