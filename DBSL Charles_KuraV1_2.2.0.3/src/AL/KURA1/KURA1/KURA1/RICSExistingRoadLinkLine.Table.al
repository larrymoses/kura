#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72128 "RICS Existing Road Link Line"
{
    //  DrillDownPageID = "Road Condition Survey(Existing";
    // LookupPageID = "Road Condition Survey(Existing";

    fields
    {
        field(1; "RICS No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                if RoadInventory.FindSet then begin
                    "Link Name" := RoadInventory."Link Name";
                    "Start Chainage(KM)" := RoadInventory."Start Chainage(KM)";
                    "End  Chainage(KM)" := RoadInventory."End Chainage(KM)";
                    "Primary Region ID" := RoadInventory."Primary Region ID";
                    "Primary County ID" := RoadInventory."Primary County ID";
                    "Road Class ID" := RoadInventory."Road Class ID";
                    "General Road Surface Condition" := RoadInventory."General Road Surface Condition";
                    "Total Road Length (KMs)" := RoadInventory."Gazetted Road Length (KMs)";
                end;
            end;
        }
        field(3; "Link Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID";
        }
        field(5; "New Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID";
        }
        field(6; "General Road Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(7; "New Gen. Road Surf. Condition"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'New Gen. Road Surf. Condition';
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(8; "Primary County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'County.Code';
        }
        field(9; "Primary Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(10; "Start Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(11; "End  Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(12; "Total Road Length (KMs)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(13; "No. of Road Sections"; Integer)
        {
            CalcFormula = count("Road Section" where("Road Code" = field("Road Code")));
            FieldClass = FlowField;
        }
        field(14; "Paved Road Length (Km)"; Decimal)
        {
            CalcFormula = sum("Pavement Surface Entry"."Road Length (Kms)" where("Road Code" = field("Road Code"),
                                                                                  "Pavement Category" = filter(Paved)));
            DecimalPlaces = 10 : 10;
            FieldClass = FlowField;
        }
        field(15; "Paved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(16; "Unpaved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(17; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(19; "Road Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Table50003.Field1;
        }
        field(20; "New Road Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Table50003.Field1;
        }
    }

    keys
    {
        key(Key1; "RICS No.", "Road Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadInventory: Record "Road Inventory";
}

