table 99466 "RICS Detailed Line"
{
    Caption = 'RICS Detailed Line';


    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
            TableRelation = "Road Inv. Condition Survey"."Document No.";
        }
        field(2; "Road Code"; Code[20])
        {
            Caption = 'Road Code';
            Editable = false;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(4; "Start Chainage(Km)"; Decimal)
        {
            trigger OnValidate()
            var
                RoadInventory: Record "Road Inventory";
            begin
                if RoadInventory.Get(Rec."Road Code") then begin
                    if Rec."Start Chainage(Km)" < RoadInventory."Start Chainage(KM)" then
                        Error(StrSubstNo('%1 cannot be less than the road end  chainage %2', Rec.FieldCaption("Start Chainage(Km)"), RoadInventory."Start Chainage(KM)"));
                end;
            end;
        }
        field(5; "End Chainage(Km)"; Decimal)
        {
            trigger OnValidate()
            var
                RoadInventory: Record "Road Inventory";
            begin
                if RoadInventory.Get(Rec."Road Code") then begin
                    if Rec."End Chainage(Km)" > RoadInventory."End Chainage(KM)" then
                        Error(StrSubstNo('%1 cannot be more than the road end  chainage %2', Rec.FieldCaption("End Chainage(Km)"), RoadInventory."End Chainage(KM)"));
                end;
            end;
        }
        field(6; Terrain; Code[50])
        {
            TableRelation = Terrains;
        }
        field(7; "Road Condition"; Code[30])
        {
            TableRelation = "Road Conditions"."Condition Code" where("RICS Type"=field("Surface Type"));
        }
        field(8; "Road Condition %"; Decimal)
        {
            MinValue = 0;
            MaxValue = 100;
            trigger OnValidate()
            var
            RoadConditions: Record "Road Conditions";
            begin
                RoadConditions.Reset();
                RoadConditions.SetRange("RICS Type",Rec."Surface Type");
                RoadConditions.SetFilter("Maximum Percentage",'<%1',"Road Condition %");
                RoadConditions.SetFilter("Maximum Percentage",'<%1',"Road Condition %");
                if RoadConditions.FindFirst() then begin
                    Rec.validate("Road Condition",RoadConditions."Condition Code");
                end;
            end;
        }
        field(9; "Surface Type"; Enum "RICS Type")
        {
            NotBlank =true;
        }
        field(10; "Proposed Intervention";Text[200])
        {
            TableRelation = "Survey Interventions";
            ValidateTableRelation = false;
        }
        field(11; "Existing Culverts(Lines)"; Decimal)
        {
            
        }
        field(12;"Proposed Culverts(Lines)"; Decimal)
        {
            
        }
         field(13; "Cut to spoil mtr (M³)"; Decimal)
        {
            
        }
         field(14; "Drain Cleaning (M)"; Decimal)
        {
            
        }
         field(15; "Bush Clearing (M²)"; Decimal)
        {
            
        }
        field(16; "Side Slabs (M²)"; Decimal)
        {
            
        }
        field(17; "Kerbs Installation"; Decimal)
        {
            
        }
        field(18; "Patching Required M³"; Decimal)
        {
            
        }
         field(19; "Overlay Required M³"; Decimal)
        {
            
        }
        field(20; "Gravel Required M³"; Decimal)
        {
            
        }
        field(21; "Other Structures"; Text[200])
        {
            
        }
        field(22; "Width (M)"; Decimal)
        {
           
        }
       

    }
    keys
    {
        key(PK; "Document No.", "Road Code", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        RICSDetailedLine: Record "RICS Detailed Line";
    begin
        RICSDetailedLine.Reset();
        RICSDetailedLine.SetRange("Document No.", Rec."Document No.");
        RICSDetailedLine.SetRange("Road Code", Rec."Road Code");
        if RICSDetailedLine.FindLast() then
            Rec."Line No." := RICSDetailedLine."Line No." + 1
        else
            Rec."Line No." := 1;
    end;
}
