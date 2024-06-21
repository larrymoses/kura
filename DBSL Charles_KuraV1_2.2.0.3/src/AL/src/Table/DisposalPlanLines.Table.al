#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Table 70044 "Disposal Plan Lines"
{
    DrillDownPageID = "Disposal Plan Lines";
    LookupPageID = "Disposal Plan Lines";

    fields
    {
        field(1; "Disposal header"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Fixed Asset,Item';
            OptionMembers = "Fixed Asset",Item;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Item)) Item
            else
            if (Type = const("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin
                if Type = Type::"Fixed Asset" then begin
                    FixedAssets.Reset;
                    FixedAssets.SetRange("No.", "Item No.");
                    if FixedAssets.FindSet then
                        "Description of Item" := FixedAssets.Description;
                    //FixedAssets.CALCFIELDS()


                end;
                if Type = Type::Item then begin
                    Items.Reset;
                    Items.SetRange("No.", "Item No.");
                    if Items.FindSet then
                        "Description of Item" := Items.Description;
                    //FixedAssets.CALCFIELDS()


                end;
            end;
        }
        field(5; "Description of Item"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Unit of Issue"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(7; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Total Purchase Price" := Quantity * "Purchase Unit Price";
                "Total Estimated current value" := Quantity * "Estimated current value";
            end;
        }
        field(8; "Date Of Purchase"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Purchase Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Total Purchase Price" := Quantity * "Purchase Unit Price";
            end;
        }
        field(10; "Total Purchase Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "General Condition"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Disposal committee Recommend"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Estimated current value"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Total Estimated current value" := Quantity * "Estimated current value";
            end;
        }
        field(14; "Accounting Officer Decision"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Disposal Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disposal Types".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                DisposalTypes.Reset;
                DisposalTypes.SetRange(Code, "Disposal Type");
                if DisposalTypes.FindSet then "Method of Disposal" := DisposalTypes."Method of Disposal";
            end;
        }
        field(16; "Disposal Methods"; Text[50])
        {
            CalcFormula = lookup("Disposal Types".Description where(Code = field("Disposal Type")));
            FieldClass = FlowField;
        }
        field(17; "Market Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Loaded to Consolidated Plan"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Method of Disposal"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = " ","Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
        }
        field(20; "Total Estimated current value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; Disposed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Disposed On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Disposal Catetory"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Functional Disposal,Consolidated Disposal';
            OptionMembers = "Functional Disposal","Consolidated Disposal";
        }
    }

    keys
    {
        key(Key1; "Disposal header", "Line No.", "Disposal Catetory")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Description of Item")
        {
        }
    }

    var
        Items: Record Item;
        FixedAssets: Record "Fixed Asset";
        DisposalTypes: Record "Disposal Types";
}
