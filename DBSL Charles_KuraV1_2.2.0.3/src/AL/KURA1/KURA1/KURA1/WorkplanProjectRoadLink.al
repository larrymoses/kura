/// <summary>
/// Table Workplan Project Road Link (ID 92015).
/// </summary>
table 92015 "Workplan Project Road Link"
{
    DrillDownPageID = 72518;
    LookupPageID = 72518;

    fields
    {
        field(1; "Workplan Type"; Enum "WorkPlan Type")
        {
            DataClassification = ToBeClassified;
            Editable = false;
            // OptionCaption = 'Constituency,Regional,Consolidated,Consolidated East,Consolidated West';
            // OptionMembers = Constituency,Regional,Consolidated,"Consolidated East","Consolidated West";
        }
        field(2; "Workplan No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Region Code" = FILTER(<> 'R48'),
                                "Check Entire Inventory" = CONST(false)) "Road Inventory"."Road Code" WHERE(Blocked = FILTER(false),
                                                                                                      "Primary Region ID" = FIELD("Region Code"))
            ELSE
            IF ("Region Code" = FILTER(<> 'R48'),
                                                                                                               "Check Entire Inventory" = CONST(true)) "Road Inventory"."Road Code" WHERE(Blocked = FILTER(false))
            ELSE
            IF ("Region Code" = FILTER('R48')) "Road Inventory"."Road Code" WHERE(Blocked = FILTER(false));

            trigger OnValidate()
            begin
                RoadInventory.RESET;
                RoadInventory.SETRANGE(RoadInventory."Road Code", "Road Code");
                //RoadInventory.SETRANGE(RoadInventory."KeRRA Road Reference Code","KeRRA Road Code");
                IF RoadInventory.FINDSET THEN BEGIN
                    "Link Name" := RoadInventory."Link Name";
                    "KeRRA Road Code" := RoadInventory."KeRRA Road Reference Code";
                    "Road Class" := RoadInventory."Road Class ID";
                    "Region Code" := RoadInventory."Primary Region ID";
                    "County Code" := RoadInventory."Primary County ID";
                    "Start Chainage(KM)" := RoadInventory."Start Chainage(KM)";
                    "End Chainage(KM)" := RoadInventory."End Chainage(KM)";
                    "Current Pavement Surface Type" := RoadInventory."Surface Type";
                    // "Actual Road Reserve Width":=RoadInventory."Actual Road Reserve Width(M)";
                END;
            end;
        }
        field(4; "Road Section No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No." WHERE(Blocked = FILTER(false),
                                                                     "Primary Constituency ID" = FIELD("Constituency Code"));

            trigger OnValidate()
            begin
                RoadSection.RESET;
                RoadSection.SETRANGE(RoadSection."Road Code", "Road Code");
                RoadSection.SETRANGE(RoadSection."Road Section No.", "Road Section No");
                //RoadSection.SETRANGE(RoadSection."Primary Region ID","Region Code");
                IF RoadSection.FINDSET THEN BEGIN
                    "Road Code" := RoadSection."Road Code";

                    "Region Code" := RoadSection."Primary Region ID";
                    "County Code" := RoadSection."Primary County ID";
                    "Current Pavement Surface Type" := RoadSection."Section Surface Type";
                    "Start Chainage(KM)" := RoadSection."Start Chainage(KM)";
                    "End Chainage(KM)" := RoadSection."End Chainage(KM)";
                    "Section Name" := RoadSection."Section Name";
                END;
            end;
        }
        field(5; "Link Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code WHERE("Operating Unit Type" = FILTER(Region));
        }
        field(8; "County Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code WHERE("Operating Unit Type" = FILTER(Region));
        }
        field(9; "Constituency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code WHERE("Region Code" = FIELD("Region Code"));
        }
        field(10; "Start Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            InitValue = 0;
            MaxValue = 999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                RoadReserveWidth.RESET;
                RoadReserveWidth.SETRANGE(RoadReserveWidth."KeRRA Road Code", Rec."KeRRA Road Code");
                IF RoadReserveWidth.FINDSET THEN
                    REPEAT
                        IF (("Start Chainage(KM)" >= RoadReserveWidth."Start Chainage") AND ("End Chainage(KM)" <= RoadReserveWidth."End Chainage")) THEN BEGIN
                            "Authentic Road Reserve Width" := RoadReserveWidth."Authentic Road Reserve Width";
                            "Actual Road Reserve Width" := RoadReserveWidth."Actual Road Reserve Width";
                        END;
                    UNTIL RoadReserveWidth.NEXT = 0;
            end;
        }
        field(11; "Chainage Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "End Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            InitValue = 0;
            MaxValue = 999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF "End Chainage(KM)" <> 0 THEN BEGIN
                    "Workplanned Length(KM)" := "End Chainage(KM)" - "Start Chainage(KM)";
                END;

                RoadConstituency.RESET;
                RoadConstituency.SETCURRENTKEY("Start Chainage(KM)", "End Chainage(KM)", "Road Code");
                RoadConstituency.SETRANGE(RoadConstituency."Road Code", "Road Code");
                RoadConstituency.SETRANGE(RoadConstituency."Start Chainage(KM)", RoadConstituency."Start Chainage(KM)", "Start Chainage(KM)");
                RoadConstituency.SETRANGE(RoadConstituency."End Chainage(KM)", RoadConstituency."End Chainage(KM)", "End Chainage(KM)");
                RoadConstituency.SETFILTER("Constituency Code", '<>%1', '');
                IF RoadConstituency.FINDSET THEN BEGIN
                    REPEAT
                        ProjectRoadLinkConstituency.INIT;
                        ProjectRoadLinkConstituency."Road Code" := "Road Code";
                        ProjectRoadLinkConstituency."Constituency Code" := RoadConstituency."Constituency Code";
                        ProjectRoadLinkConstituency.VALIDATE("Constituency Code");
                        ProjectRoadLinkConstituency."Global Budget Book ID" := "Workplan No";
                        ProjectRoadLinkConstituency."KeRRA Budget Code" := "KeRRA Budget Code";
                        ProjectRoadLinkConstituency."Region Code" := RoadConstituency."Region Code";
                        ProjectRoadLinkConstituency.VALIDATE("Region Code");
                        ProjectRoadLinkConstituency."Workplanned Length" := RoadConstituency."End Chainage(KM)" - RoadConstituency."Start Chainage(KM)";
                        IF NOT ProjectRoadLinkConstituency.INSERT(TRUE) THEN
                            ProjectRoadLinkConstituency.MODIFY(TRUE);
                    UNTIL RoadConstituency.NEXT = 0;
                END;

                VALIDATE("Start Chainage(KM)");

                //Check if this section has been used else where
                ProjectRoadLink.RESET;
                ProjectRoadLink.SETRANGE(ProjectRoadLink."Road Code", "Road Code");
                ProjectRoadLink.SETRANGE(ProjectRoadLink."Start Chainage(KM)", "Start Chainage(KM)");
                ProjectRoadLink.SETRANGE(ProjectRoadLink."End Chainage(KM)", "End Chainage(KM)");
                ProjectRoadLink.SETRANGE(ProjectRoadLink."Funding Source Code", "Funding Source Code");
                ProjectRoadLink.SETRANGE(ProjectRoadLink."Financial Year Code", FnGetFinancialYearCode(Rec));
                IF ProjectRoadLink.FINDSET THEN
                    ERROR(TXT0001, ProjectRoadLink."Workplan No", FnGetRegionName(ProjectRoadLink."Region Code"), ProjectRoadLink."Funding Source Code");
            end;
        }
        field(13; "Workplanned Length(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            InitValue = 0;
            MaxValue = 999999999;
            MinValue = 0;
        }
        field(14; "Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID" WHERE(Blocked = FILTER(false));
        }
        field(15; "Current Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code WHERE(Blocked = FILTER(false));
        }
        field(16; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Actual Road Reserve Width"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "New Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code WHERE(Blocked = FILTER(false));
        }
        field(21; "KeRRA Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Planned Road Width"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IF "Planned Road Width" > "Authentic Road Reserve Width" THEN
                    "Road Reserve Status" := "Road Reserve Status"::"Land Acquisition";
                IF (("Planned Road Width" > "Actual Road Reserve Width") AND ("Planned Road Width" < "Authentic Road Reserve Width")) THEN
                    "Road Reserve Status" := "Road Reserve Status"::"Encroachment Removal";
            end;
        }
        field(23; "Road Reserve Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Land Acquisition,Encroachment Removal';
            OptionMembers = " ","Land Acquisition","Encroachment Removal";
        }
        field(24; "Authentic Road Reserve Width"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Planned Road Width");
            end;
        }
        field(25; "Desired Road Reserve Width(M)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Funding Source Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(28; "Check Entire Inventory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Funding Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(30; Revised; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Revision No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Financial Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Workplan Type", "Workplan No", "Line No", "Funding Source Code", "Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        RAMWorkplanLine: Record "RAM Workplan Line";
    begin
        RAMWorkplanLine.RESET;
        RAMWorkplanLine.SETRANGE("Document No", Rec."Workplan No");
        IF RAMWorkplanLine.FINDSET THEN BEGIN
            "Region Code" := RAMWorkplanLine."Region Code";
            "Constituency Code" := RAMWorkplanLine."Constituency Code";
            "Funding Source Code" := RAMWorkplanLine."Global Dimension 2 Code";
            "Funding Source Type" := RAMWorkplanLine."Funding Source Type";
            "Financial Year Code" := FnGetFinancialYearCode(Rec);
        END;
    end;

    var
        RoadInventory: Record "Road Inventory";
        RoadSection: Record "Road Section";
        RoadReserveWidth: Record "Road Reserve Width";
        ProjectRoadLinkConstituency: Record "Project Road Link Constituency";
        RoadConstituency: Record "Road Constituency";
        RAMWorkplanLine10: Record "RAM Budget Ceiling Details";
        RAMWorkplanLine: Record "RAM Workplan Line";
        ProjectRoadLink: Record "Workplan Project Road Link";
        TXT0001: Label 'Please not that the section has been selected for work planning by Workplan %1 Region %2 and funding source %3';

    procedure FnGetRegionName(RegionCode: Code[50]) RegionName: Text[250]
    var
        RespCenter: Record "Responsibility Center";
    begin
        RespCenter.RESET;
        RespCenter.SETRANGE(RespCenter.Code, RegionCode);
        RespCenter.SETRANGE(RespCenter."Operating Unit Type", RespCenter."Operating Unit Type"::Region);
        IF RespCenter.FINDSET THEN
            RegionName := RespCenter.Name;
        EXIT(RegionName);
    end;

    procedure FnGetFinancialYearCode(WorkplanProjectRoadLink: Record "Workplan Project Road Link") FinancialYear: Text[250]
    var
        RAMWorkplanHeader: Record "RAM Workplan Header";
    begin
        RAMWorkplanHeader.RESET;
        RAMWorkplanHeader.SETRANGE(RAMWorkplanHeader."Document No", WorkplanProjectRoadLink."Workplan No");
        RAMWorkplanHeader.SETRANGE(RAMWorkplanHeader."Workplan Type", WorkplanProjectRoadLink."Workplan Type");
        IF RAMWorkplanHeader.FINDSET THEN BEGIN
            FinancialYear := RAMWorkplanHeader."Financial Year Code";
            EXIT(FinancialYear);
        END;
    end;
}

