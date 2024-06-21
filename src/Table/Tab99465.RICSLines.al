table 99465 "RICS Lines"
{
    LookupPageId = "Link RICS";
   
    Caption = 'RICS Lines';
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Road Inv. Condition Survey"."Document No.";
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(4; "Shortcut Dimension 2 Code"; Code[20])
        {

            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(5; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(6; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(7; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(8; "Road Code"; Code[20])
        {
            TableRelation = "Road Inventory"."Road Code" where("Primary Region ID"=field("Shortcut Dimension 1 Code"));
            Caption = 'Road Code';
            trigger OnValidate()
            var
                RoadInventory: Record "Road Inventory";
            begin
                if RoadInventory.Get(Rec."Road Code") then begin
                    Rec."Link Name" := RoadInventory."Link Name";
                    Rec."Road Category" := RoadInventory."Road Category";
                    Rec."Start Chainage(Km)" := RoadInventory."Start Chainage(KM)";
                    Rec."End Chainage(Km)" := RoadInventory."End Chainage(KM)";
                    Rec."Shortcut Dimension 1 Code" := RoadInventory."Primary Region ID";
                    Rec."Shortcut Dimension 5 Code" :=RoadInventory.Town;
                end;
            end;
        }
        field(9; "Link Name"; Text[50])
        {
            Caption = 'Link Name';
            Editable = false;
        }
        field(10; "Road Category"; Enum "Road Category")
        {
            Caption = 'Road Category';
            Editable = false;
        }
        field(11; "Start Chainage(Km)"; Decimal)
        {
            Caption = 'Start Chainage(Km)';
            Editable = false;
        }
        field(12; "End Chainage(Km)"; Decimal)
        {
            Caption = 'End Chainage(Km)';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
        field(13; "Existing Culverts(Lines)"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Existing Culverts(Lines)" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(14; "Proposed Culverts(Lines)"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Proposed Culverts(Lines)" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(15; "Cut to spoil mtr (M³)"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Cut to spoil mtr (M³)" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(16; "Drain Cleaning (M)"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Drain Cleaning (M)" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(17; "Bush Clearing (M²)"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Bush Clearing (M²)" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(18; "Side Slabs (M²)"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Side Slabs (M²)" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(19; "Kerbs Installation"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Kerbs Installation" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(20; "Patching Required M³"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Patching Required M³" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(21; "Overlay Required M³"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Overlay Required M³" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(22; "Gravel Required M³"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("RICS Detailed Line"."Gravel Required M³" where("Document No." = field("Document No."), "Road Code" = field("Road Code")));
        }
        field(23; "Approval Status"; Enum "App Status")
        {
            FieldClass = FlowField;
            Editable = false;
             CalcFormula= lookup("Road Inv. Condition Survey"."Approval Status" where("Document No."=field("Document No.")));
        }
        field(25; "Proposed Intervention"; Code[60])
        {
          TableRelation ="Survey Interventions";
          
        }
        field(26; "Financial Year"; Code[30])
        {
             FieldClass = FlowField;
            Editable = false;
             CalcFormula= lookup("Road Inv. Condition Survey"."Financial Year" where("Document No."=field("Document No.")));
        }
       
    }
    keys
    {
        key(PK; "Document No.", "Road Code","Shortcut Dimension 1 Code")
        {
            Clustered = true;
        }
    }
    var
        DimMgt: Codeunit DimensionManagement;
        trigger OnInsert()
        var
        RICS: Record "Road Inv. Condition Survey";
        begin
            if RICS.Get("Document No.") then
            Rec."Shortcut Dimension 1 Code" := RICS.Region;
        end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;

    procedure ShowDimensions() IsChanged: Boolean
    var
        OldDimSetID: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2 %3', "Document No.", "Road Code", "Line No."));
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IsChanged := OldDimSetID <> "Dimension Set ID";

    end;
}
