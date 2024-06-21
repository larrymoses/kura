#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72176 "Cons Road Work Program Package"
{

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Package No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Package Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Road Inventory"."Road Code";
        }
        field(5; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"));

            // trigger OnValidate()
            // begin
            //     RoadSection.Reset;
            //     RoadSection.SetRange(RoadSection."Road Section No.", "Road Section No.");
            //     if RoadSection.FindSet then begin
            //         "Section Name" := RoadSection."Section Name";
            //         "Start Chainage" := RoadSection."Start Chainage(KM)";
            //         "End Chainage" := RoadSection."End Chainage(KM)";
            //         "Total Road Section Length" := RoadSection."Total Road Length (KMs)";
            //         "Workplanned Length (Km)" := RoadSection."Total Road Length (KMs)";
            //     end;
            // end;
        }
        field(6; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Road Works Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Works Category".Code;
        }
        field(8; "Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code;
        }
        field(9; "Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Source".Code WHERE (Blocked=CONST(No))';
            TableRelation = "Funding Source".Code where(Blocked = const(false));
        }
        field(10; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
        }
        field(11; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
        }
        field(12; "Workplanned Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
        }
        field(13; "Budget (Cost) Excl. VAT"; Decimal)
        {
            CalcFormula = sum("Con Road Work Program Activity"."Line Amount Excl. VAT" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                              "Package No." = field("Package No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Budget (VAT Amount)"; Decimal)
        {
            CalcFormula = sum("Con Road Work Program Activity"."VAT Amount" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                   "Package No." = field("Package No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Budget (Cost) Incl. VAT"; Decimal)
        {
            CalcFormula = sum("Con Road Work Program Activity"."Line Amount Incl. VAT" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                              "Package No." = field("Package No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Funding Agency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Agency".Code';
            TableRelation = Customer."No.";
        }
        field(17; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where("Template Type" = filter(BoQ));
        }
        field(18; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Construction,Structure Construction,Routine Maintenance,Periodic Maintenance,Spot Improvement,Rehabilitation Work,Asset Protection,Studies & Surveys,Design Works';
            OptionMembers = " ","New Construction","Structure Construction","Routine Maintenance","Periodic Maintenance","Spot Improvement","Rehabilitation Work","Asset Protection","Studies & Surveys","Design Works";
        }
        field(19; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Table50001.Field1;
        }
        field(22; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Total Road Section Length"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Road Section Length';
        }
        field(26; "Global Dimension 1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Global Dimension 2"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Posted Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Planning Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Top-Down (New Works),Bottom-Up (Existing Works)';
            OptionMembers = " ","Top-Down (New Works)","Bottom-Up (Existing Works)";
        }
        field(31; "Procurement Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where("Procurement Type" = filter('WORKS'));
        }
        field(32; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "Package No.", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
    // RoadSection: Record "Road Section";
}

