#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 92287 "Project Creation Appendices"
{
    Caption = 'Project Creation Appendices';

    fields
    {
        field(1; "Appendix Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Appendix A,Appendix B,Appendix C,Appendix D';
            OptionMembers = " ","Appendix A","Appendix B","Appendix C","Appendix D";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Item No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Appendix Category Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Corrective Order Line"."Category ID";// where("Appendix Type" = field("Appendix Type"));

            trigger OnValidate()
            begin
                AppendixCategorySetup.Reset;
                AppendixCategorySetup.SetRange(AppendixCategorySetup."Category ID", "Appendix Category Code");
                if AppendixCategorySetup.FindSet then
                    "Category Name" := AppendixCategorySetup."Category ID";
            end;
        }
        field(5; "Item Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Additional Specifications"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Linked Bill No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Item Category".Code;//cc where("Bill Item Group" = const(No),
                                                 //  Blocked = const(No));

            trigger OnValidate()
            begin
                ItemCategory.Reset;
                ItemCategory.SetRange(ItemCategory.Code, "Linked Bill No");
                if ItemCategory.FindSet then
                    "Linked Bill Name" := ItemCategory.Description;
            end;
        }
        field(8; "Linked Bill Name"; Text[1000])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Category Name"; Text[1000])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "BoQ Template No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Unit of Measure"; Code[40])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Unit of Measure".Code;
        }
        field(12; "Linked Bill Item No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Item."No." where(Blocked = filter(false),
                                              "Item Category Code" = field("Linked Bill No"));

            trigger OnValidate()
            begin
                Item.Reset;
                Item.SetRange(Item."No.", "Linked Bill Item No");
                if Item.FindSet then
                    "Linked Bill Item Description" := Item.Description;
            end;
        }
        field(13; "Linked Bill Item Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Rate (KES)");
            end;
        }
        field(15; "BoQ Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            InitValue = Standard;
            OptionCaption = ' ,Standard,Project,PBRM';
            OptionMembers = " ",Standard,Project,PBRM;
        }
        field(16; "Rate (KES)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Amount (KES)" := Quantity * "Rate (KES)";
            end;
        }
        field(17; "Amount (KES)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Project No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Road Work Program ID"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Appendix Type", "Item No", "Project No", "Road Work Program ID")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Appendix Type", "Item No", "Item Description")
        {
        }
        fieldgroup(Brick; "Appendix Type", "Item No", "Item Description")
        {
        }
    }

    var
        RoadManagementSetup: Record 72102;
        ItemCategory: Record "Item Category";
        AppendixCategorySetup: Record 72285;
        Item: Record Item;
        PurchaseRequisitionTemplate: Record 70139;
}

