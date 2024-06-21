#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72178 "Con Road Work Program Activity"
{

    fields
    {
        field(1;"Road Work Program ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Package No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"BoQ Template Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Bill Code"."BoQ Template Code";
        }
        field(4;"Bill Item Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Bill Code"."Bill Item Category Code";
        }
        field(5;"Activity Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Requisition Template Line" WHERE (Type=FILTER(Item))';
            TableRelation = "Requisition Template Line" where (Type=filter(Item));
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Technology Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Technology".Code;

            trigger OnValidate()
            begin
                RoadTechnology.Reset;
                RoadTechnology.SetRange(RoadTechnology.Code,"Technology Type");
                if RoadTechnology.FindSet then
                  "Labour %":=RoadTechnology."Labour Percentage";
            end;
        }
        field(8;"Labour %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Unit of Measure Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '20';
        }
        field(10;"Planned Rate (Unit Cost)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Planned Quantity";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Line Amount Excl. VAT":="Planned Quantity"*"Engineer's Rate (Unit Cost)";
            end;
        }
        field(12;"Contingency %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Engineer's Rate (Unit Cost)";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Planned Quantity");
            end;
        }
        field(14;"Packaged Quantity";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Planned Quantity");
            end;
        }
        field(15;"Line Amount Excl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Gen. Prod. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"VAT Prod. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"VAT %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"VAT Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Line Amount Incl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Shortcut Dimension 1 Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Shortcut Dimension 2 Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Variant Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Default Job Task No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Posted Job No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Posted Job Task No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Posted Job Planning Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Road Work Program ID","Package No.","BoQ Template Code","Bill Item Category Code","Activity Code","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadTechnology: Record "Road Technology";
}
