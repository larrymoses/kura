#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72087 "Road Material"
{
    DrillDownPageID = "Road Materials";
    LookupPageID = "Road Materials";

    fields
    {
        field(1; "Material Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Base Unit Of Measure"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(4; "Default Material Test Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Material Test Template"."Template ID" where (Blocked=filter(false),
            //                                         "Material ID"=field("Material Code"));
        }
        field(5; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No." where(Blocked = filter(false),
                                              "Item Category Code" = field("Item Category Code"));
        }
        field(6; "Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Item Category".Code where (Blocked=filter(false));
        }
        field(7; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Inventory"."Road Code" where (Blocked=filter(false));
        }
    }

    keys
    {
        key(Key1; "Material Code", "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

