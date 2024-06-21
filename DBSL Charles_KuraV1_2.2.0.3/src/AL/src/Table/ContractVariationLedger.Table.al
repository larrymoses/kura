#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72264 "Contract Variation Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Source Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Extension of Time Request,Contractor Variation Request,Project Variation Order,Budget Reallocation Voucher';
            OptionMembers = " ","Extension of Time Request","Contractor Variation Request","Project Variation Order","Budget Reallocation Voucher";
        }
        field(3;"Source Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Variation Header"."Document No." where ("Document Type"=field("Source Document Type"));
        }
        field(4;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(5;"Job Task No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Job No."),
                                                             "Job Task Type"=filter(Posting));
        }
        field(6;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job No."=field("Job No."),
                                                                  "Job Task No."=field("Job Task No."));
        }
        field(7;Type;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Item;
            OptionCaption = 'Resource,Item,G/L Account,Text';
            OptionMembers = Resource,Item,"G/L Account",Text;
        }
        field(8;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=const(Resource)) Resource
                            else if (Type=const(Item)) Item where (Blocked=const(false))
                            else if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Text)) "Standard Text";
        }
        field(9;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Original Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Unit Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Original Total Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Unit of Measure Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"New Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"New Total Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Net Change (Quantity)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Net Change (Total Cost LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Gen. Prod. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group".Code;
        }
        field(19;"Bill Item Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code where (Blocked=filter(false));
        }
        field(20;"Purchase Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));
        }
        field(21;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

