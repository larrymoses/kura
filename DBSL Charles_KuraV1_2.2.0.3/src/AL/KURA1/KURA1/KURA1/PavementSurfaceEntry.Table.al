#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72113 "Pavement Surface Entry"
{
    DrillDownPageID = "Pavement Surface Entries";
    LookupPageID = "Pavement Surface Entries";

    fields
    {
        field(1; "Enrty No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Road Inventory"."Road Code";
        }
        field(5; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"));
        }
        field(6; "Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code;
        }
        field(7; "Pavement Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Paved,Unpaved';
            OptionMembers = " ",Paved,Unpaved;
        }
        field(8; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(9; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(10; "Road Length (Kms)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(11; "Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID";
        }
        field(12; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(13; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(14; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(15; "Road Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(16; Reversed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Reversal Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Enrty No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

