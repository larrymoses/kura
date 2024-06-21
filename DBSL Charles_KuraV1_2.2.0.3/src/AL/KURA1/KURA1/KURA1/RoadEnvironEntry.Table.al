#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72114 "Road Environ Entry"
{
    DrillDownPageID = "Road Environ Entries";
    LookupPageID = "Road Environ Entries";

    fields
    {
        field(1; "Environ ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Environ Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Environ Category".Code;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Inventory"."Road Code";
            //
            trigger OnValidate()
            begin
                // RoadInventory.Reset;
                // RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                // if RoadInventory.FindSet then begin
                //     "County ID" := RoadInventory."Primary County ID";
                //     "Region ID" := RoadInventory."Primary Region ID";
                //     "Road Class ID" := RoadInventory."Road Class ID";
                //     //"Constituency ID":=RoadInventory
            end;
            //  end;
        }
        field(5; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"));

            trigger OnValidate()
            begin
                // RoadSection.Reset;
                // RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No.");
                // if RoadSection.FindSet then begin
                //     "Constituency ID" := RoadSection."Primary Constituency ID";
                // end;
            end;
        }
        field(6; "Connected to Road Link"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Connection Road Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Location Details"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID";
        }
        field(10; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Constituency.Code;
        }
        field(11; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = County1.Code;
        }
        field(12; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(13; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Road Side"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Right Hand Side,Left Hand Side';
            OptionMembers = " ","Right Hand Side","Left Hand Side";
        }
        field(15; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Environ ID", "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Environ ID" = '' then begin
            RoadManagementSetup.Get;
            RoadManagementSetup.TestField("Road Environs Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Road Environs Nos", xRec."No Series", Today, "Environ ID", "No Series");
        end;
    end;

    var
        //  RoadInventory: Record "Road Inventory";
        // RoadSection: Record "Road Section";
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

