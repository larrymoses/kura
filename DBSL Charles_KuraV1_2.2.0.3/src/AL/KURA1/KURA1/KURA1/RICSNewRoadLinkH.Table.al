#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72123 "RICS New Road Link H"
{
    // DrillDownPageID = "Road Condition Survey(Existing";
    //  LookupPageID = "Road Condition Survey(Existing";

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
        }
        field(3; "Link Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Table50001.Field1;
        }
        field(5; "New Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Table50001.Field1;
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
            DecimalPlaces = 20 : 20;
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
        field(18; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Service Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Outsourced,Inhouse';
            OptionMembers = " ",Outsourced,Inhouse;
        }
        field(22; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(23; "Contract No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));
        }
        field(24; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No");
                if Vendor.FindSet then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(25; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "No Of Existing Road Links"; Integer)
        {
            CalcFormula = count("RICS Existing Road Link Line" where("RICS No." = field("RICS No.")));
            FieldClass = FlowField;
        }
        field(27; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RICS County"."Region Code";
        }
        field(28; "Directorate Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(29; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(30; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(31; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Posted; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Posted then begin
                    RICSExistingRoadLink.Reset;
                    RICSExistingRoadLink.SetRange(RICSExistingRoadLink."RICS No.", "RICS No.");
                    if RICSExistingRoadLink.FindSet then
                        repeat
                            RICSExistingRoadLink.Posted := true;
                            RICSExistingRoadLink.Modify;
                        until RICSExistingRoadLink.Next = 0;
                end;

                if not Posted then begin
                    RICSExistingRoadLink.Reset;
                    RICSExistingRoadLink.SetRange(RICSExistingRoadLink."RICS No.", "RICS No.");
                    if RICSExistingRoadLink.FindSet then
                        repeat
                            RICSExistingRoadLink.Posted := true;
                            RICSExistingRoadLink.Modify;
                        until RICSExistingRoadLink.Next = 0;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "RICS No.", "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "RICS No." = '' then begin
            RoadsManagementSetup.Get;
            RoadsManagementSetup.TestField("RICS New Link No");
            NoSeriesManagement.InitSeries(RoadsManagementSetup."RICS New Link No", xRec."No. Series", Today, "RICS No.", Rec."No. Series");
        end;

        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        "Approval Status" := "approval status"::Open;

        if UserSetup.Get(UserId) then begin
            Employee.Reset;
            Employee.SetRange(Employee."No.", UserSetup."Employee No.");
            if Employee.FindSet then begin
                "Region Code" := Employee."Global Dimension 1 Code";
                "Department Code" := Employee."Department Code";
                "Directorate Code" := Employee."Directorate Code";
            end;
        end;


        Description := 'Road Inventory & Condition Survey' + ' ' + Format(Date2dmy(Dt2Date("Created DateTime"), 3));
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadsManagementSetup: Record "Road Management Setup";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        RICSExistingRoadLink: Record "RICS Existing Road Link";
        Vendor: Record Vendor;
}

