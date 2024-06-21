#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72138 "Existing Road WP Activity"
{

    fields
    {
        field(1;"Road Work Program ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Work Program".Code;
        }
        field(2;"Job No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '//Table 167(Job)';
        }
        field(3;"Job Task No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Planning Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Resource,Item,G/L Account,Text';
            OptionMembers = Resource,Item,"G/L Account",Text;
        }
        field(8;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Item.No.';
        }
        field(9;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Direct Unit Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Unit Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Total Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Unit of Measure Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Unit of Measure".Code';
        }
        field(15;"Gen. Prod. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Technology Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Technology".Code;
        }
        field(18;"Bill Item Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Item Category".Code';
        }
    }

    keys
    {
        key(Key1;"Road Work Program ID","Job No.","Job Task No.","Line No.")
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

