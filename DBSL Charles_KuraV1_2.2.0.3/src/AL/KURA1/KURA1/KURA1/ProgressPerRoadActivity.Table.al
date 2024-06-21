#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72099 "Progress Per Road Activity"
{

    fields
    {
        field(1;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Bill No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template"."Bill No";
        }
        field(4;"Item Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Line1"."No." where ("BoQ Template ID"=field("Bill No"));

            trigger OnValidate()
            begin
                BoQTemplateLine.Reset;
                BoQTemplateLine.SetRange(BoQTemplateLine."No.","Item Code");
                if BoQTemplateLine.Find('-') then
                  repeat
                  Description:=BoQTemplateLine.Description;
                    until BoQTemplateLine.Next=0;
            end;
        }
        field(5;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(7;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Bid Rate(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Bill Item Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Previous Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Previous Percantage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"This Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"This Quantity Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Done To Date Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Done To Date Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BoQTemplate: Record "BoQ Template";
        BoQTemplateLine: Record "BoQ Template Line";
}

