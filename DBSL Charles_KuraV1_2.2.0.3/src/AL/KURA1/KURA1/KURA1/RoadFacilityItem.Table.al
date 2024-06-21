#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72112 "Road Facility Item"
{

    fields
    {
        field(1; "Facility  No."; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Road Inventory"."Road Code";
        }
        field(3; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"));

            trigger OnValidate()
            VAR
                ROADSECTION: Record "Road Section";
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Code", "Road Code");
                RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No.");
                if RoadSection.FindSet then begin
                    "Road Facility Category" := RoadSection."Road Category";
                    "County ID" := RoadSection."Primary County ID";
                    "Constituency ID" := RoadSection."Primary Constituency ID";
                    "Region ID" := RoadSection."Primary Region ID";
                end;
            end;
        }
        field(4; "Road Facility Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Structure,Furniture';
            OptionMembers = " ",Structure,Furniture;
        }
        field(5; "Road Facility Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Facility Type".Code where("Facility Type" = field("Road Facility Category"));
        }
        field(6; "Road Facility SubType"; Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Facility Label"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Facility Location"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Material Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(31; "Town ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Towns.Code;
        }
        field(12; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(13; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(14; "Last Road Condition Survey ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Last Road Cond. Survey Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Last Road Cond. Survey Date';
        }
        field(16; "General Facility Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(17; "Construction Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Construction Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Project RICS ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Last Maintenance Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Road Side"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Righ Hand Side,Left Hand Side';
            OptionMembers = " ","Righ Hand Side","Left Hand Side";
        }
        field(23; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; River; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Facility River".Code;

            trigger OnValidate()
            begin
                RoadFacilityRiver.Reset;
                RoadFacilityRiver.SetRange(RoadFacilityRiver.Code, River);
                if RoadFacilityRiver.FindSet then
                    "River Name" := RoadFacilityRiver.Name;
            end;
        }
        field(26; "River Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Start Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(28; "Start Point Latitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(29; "End Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(30; "End Point Latitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }

    }

    keys
    {
        key(Key1; "Facility  No.", "Road Code")
        {
            Clustered = true;
        }
        key(Key2; "Road Facility Category")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Road Facility Category" = "road facility category"::Structure then begin
            if "Facility  No." = '' then begin
                RoadsManagementSetup.Get;
                RoadsManagementSetup.TestField("Facility Nos(Structure)");
                NoSeriesManagement.InitSeries(RoadsManagementSetup."Facility Nos(Structure)", xRec."No Series", Today, "Facility  No.", "No Series");
                "Facility  No." := 'RS/' + "Road Code" + '/' + "Facility  No.";
            end;
        end;

        if "Road Facility Category" = "road facility category"::Furniture then begin
            if "Facility  No." = '' then begin
                RoadsManagementSetup.Get;
                RoadsManagementSetup.TestField("Facility Nos(Furniture)");
                NoSeriesManagement.InitSeries(RoadsManagementSetup."Facility Nos(Furniture)", xRec."No Series", Today, "Facility  No.", "No Series");
                "Facility  No." := 'RF/' + "Road Code" + '/' + "Facility  No."
            end;
        end;
    end;

    var
        ///RoadSection: Record "Road Section";
        RoadsManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadFacilityRiver: Record "Road Facility River";
}

