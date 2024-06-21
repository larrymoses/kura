#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72275 "Project Road Link"
{
    DrillDownPageID = "Project Road Links";
    LookupPageID = "Project Road Links";

    fields
    {
        field(1; "Package No"; Integer)
        {
            
        }
        field(2; "Global Budget Book Code"; Code[20])
        {
            
        }
        field(3; "Road Code"; Code[50])
        {
            
            TableRelation = "Road Inventory"."Road Code" where(Blocked = filter(false));

            trigger OnValidate()
            var
                roadreservewidth: Record "Road Reserve Width";
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                //RoadInventory.SETRANGE(RoadInventory."KeRRA Road Reference Code","KeRRA Road Code");
                if RoadInventory.FindSet then begin
                    "Link Name" := RoadInventory."Link Name";
                    "KeRRA Road Code" := RoadInventory."KeRRA Road Reference Code";
                    "Road Class" := RoadInventory."Road Class ID";
                    "Region Code" := RoadInventory."Primary Region ID";
                    "County Code" := RoadInventory."Primary County ID";
                    "Start Chainage(KM)" := RoadInventory."Start Chainage(KM)";
                    "End Chainage(KM)" := RoadInventory."End Chainage(KM)";
                    "Current Pavement Surface Type" := RoadInventory."Surface Type";
                    // "Actual Road Reserve Width":=RoadInventory."Actual Road Reserve Width(M)";
                end;
                roadreservewidth.Reset;
                roadreservewidth.SetRange(roadreservewidth."KeRRA Road Code", "Road Code");
                if roadreservewidth.FindSet then
                    "Authentic Road Reserve Width" := roadreservewidth."Authentic Road Reserve Width";
                "Actual Road Reserve Width" := roadreservewidth."Actual Road Reserve Width";



            end;
        }
        field(4; "Road Section No"; Code[20])
        {
            
            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"),
                                                                     Blocked = filter(false));

            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Code", "Road Code");
                RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No");
                if RoadSection.FindSet then begin
                    "Constituency Code" := RoadSection."Primary Constituency ID";
                    "Current Pavement Surface Type" := RoadSection."Section Surface Type";
                    "Start Chainage(KM)" := RoadSection."Start Chainage(KM)";
                    "End Chainage(KM)" := RoadSection."End Chainage(KM)";
                    "Section Name" := RoadSection."Section Name";
                end;
            end;
        }
        field(5; "Link Name"; Text[250])
        {
            
            Editable = false;
        }
        field(6; "Section Name"; Text[250])
        {
            
            Editable = false;
        }
        field(7; "Region Code"; Code[20])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(8; "County Code"; Code[20])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(9; "Constituency Code"; Code[20])
        {
            
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency));
        }
        field(10; "Start Chainage(KM)"; Decimal)
        {
            
            InitValue = 0;
            MaxValue = 999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                RoadReserveWidth.Reset;
                RoadReserveWidth.SetRange(RoadReserveWidth."KeRRA Road Code", Rec."KeRRA Road Code");
                if RoadReserveWidth.FindSet then
                    repeat
                        if (("Start Chainage(KM)" >= RoadReserveWidth."Start Chainage") and ("End Chainage(KM)" <= RoadReserveWidth."End Chainage")) then begin
                            "Authentic Road Reserve Width" := RoadReserveWidth."Authentic Road Reserve Width";
                            "Actual Road Reserve Width" := RoadReserveWidth."Actual Road Reserve Width";
                        end;
                    until RoadReserveWidth.Next = 0;
            end;
        }
        field(11; "Chainage Description"; Text[250])
        {
            
        }
        field(12; "End Chainage(KM)"; Decimal)
        {
            
            InitValue = 0;
            MaxValue = 999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "End Chainage(KM)" <> 0 then begin
                    "Workplanned Length(KM)" := "End Chainage(KM)" - "Start Chainage(KM)";
                end;

                RoadConstituency.Reset;
                RoadConstituency.SetCurrentkey("Start Chainage(KM)", "End Chainage(KM)", "Road Code");
                RoadConstituency.SetRange(RoadConstituency."Road Code", "Road Code");
                RoadConstituency.SetRange(RoadConstituency."Start Chainage(KM)", RoadConstituency."Start Chainage(KM)", "Start Chainage(KM)");
                RoadConstituency.SetRange(RoadConstituency."End Chainage(KM)", RoadConstituency."End Chainage(KM)", "End Chainage(KM)");
                RoadConstituency.SetFilter("Constituency Code", '<>%1', '');
                if RoadConstituency.FindSet then begin
                    //MESSAGE('Inapata');
                    //Start Chainage is 0                         0                           0                                 20
                    // IF (("Start Chainage(KM)">=RoadConstituency."Start Chainage(KM)") AND ("Start Chainage(KM)"<RoadConstituency."End Chainage(KM)") AND ("End Chainage(KM)"<=RoadConstituency."End Chainage(KM)")AND
                    //("End Chainage(KM)">=RoadConstituency."Start Chainage(KM)")) THEN BEGIN
                    repeat
                        // MESSAGE('"Start Chainage(KM)" %1 and RoadConstituency."Start Chainage(KM)" %2',"Start Chainage(KM)" ,RoadConstituency."Start Chainage(KM)");
                        // MESSAGE('"End Chainage(KM)" %1 and RoadConstituency."End Chainage(KM)" %2',"End Chainage(KM)" ,RoadConstituency."End Chainage(KM)");
                        ProjectRoadLinkConstituency.Init;
                        ProjectRoadLinkConstituency."Road Code" := "Road Code";
                        ProjectRoadLinkConstituency."Constituency Code" := RoadConstituency."Constituency Code";
                        ProjectRoadLinkConstituency.Validate("Constituency Code");
                        ProjectRoadLinkConstituency."Global Budget Book ID" := "Global Budget Book Code";
                        ProjectRoadLinkConstituency."KeRRA Budget Code" := "KeRRA Budget Code";
                        ProjectRoadLinkConstituency."Region Code" := RoadConstituency."Region Code";
                        ProjectRoadLinkConstituency.Validate("Region Code");
                        ProjectRoadLinkConstituency."Workplanned Length" := RoadConstituency."End Chainage(KM)" - RoadConstituency."Start Chainage(KM)";
                        if not ProjectRoadLinkConstituency.Insert(true) then
                            ProjectRoadLinkConstituency.Modify(true);
                    until RoadConstituency.Next = 0;
                end;
                //END;
                //END;

                Validate("Start Chainage(KM)");
            end;
        }
        field(13; "Workplanned Length(KM)"; Decimal)
        {
            
            InitValue = 0;
            MaxValue = 999999999;
            MinValue = 0;
        }
        field(14; "Road Class"; Code[20])
        {
            
            TableRelation = "Road Class"."Road Class ID" where(Blocked = filter(false));
            trigger OnValidate()
            var
                roadclass: Record "Road Class";
            begin
                if roadclass.get("Road Class")
                then
                    "Desired Road Reserve Width(M)" := roadclass."Desired Road Reserve Width (M)"
            end;
        }
        field(15; "Current Pavement Surface Type"; Code[20])
        {
            
            TableRelation = "Pavement Surface Type".Code where(Blocked = filter(false));
        }
        field(16; "Line No"; Integer)
        {
            AutoIncrement = true;
            
        }
        field(17; "Project No"; Code[20])
        {
            
        }
        field(18; "Actual Road Reserve Width"; Decimal)
        {
            
        }
        field(19; "KeRRA Budget Code"; Code[20])
        {
            
        }
        field(20; "New Pavement Surface Type"; Code[20])
        {
            
            TableRelation = "Pavement Surface Type".Code where(Blocked = filter(false));
        }
        field(21; "KeRRA Road Code"; Code[20])
        {
            
        }
        field(22; "Planned Road Width"; Decimal)
        {
            

            trigger OnValidate()
            begin
                if "Planned Road Width" > "Authentic Road Reserve Width" then
                    "Road Reserve Status" := "road reserve status"::"Land Acquisition";
                if (("Planned Road Width" > "Actual Road Reserve Width") and ("Planned Road Width" < "Authentic Road Reserve Width")) then
                    "Road Reserve Status" := "road reserve status"::"Encroachment Removal";
            end;
        }
        field(23; "Road Reserve Status"; Option)
        {
            
            OptionCaption = ' ,Land Acquisition,Encroachment Removal';
            OptionMembers = " ","Land Acquisition","Encroachment Removal";
        }
        field(24; "Authentic Road Reserve Width"; Decimal)
        {
            
        }
        field(25; "Desired Road Reserve Width(M)"; Decimal)
        {
            
            Editable = false;
        }
        field(26; Amount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No."=field("Project No"),"Road Code"=field("Road Code")));
        }
    }

    keys
    {
        key(Key1; "KeRRA Budget Code", "Global Budget Book Code", "Road Code", "Project No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadInventory: Record "Road Inventory";
        RoadSection: Record "Road Section";
        RoadReserveWidth: Record "Road Reserve Width";
        ProjectRoadLinkConstituency: Record "Project Road Link Constituency";
        RoadConstituency: Record "Road Constituency";
}

