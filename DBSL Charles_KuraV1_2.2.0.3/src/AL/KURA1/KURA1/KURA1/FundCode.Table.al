#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54022 "Fund Code"
{
    Caption = 'Fund Code';
    DrillDownPageID = "Fund Code List";
    LookupPageID = "Fund Code List";

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(29; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(30; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDocDim;
            end;

            trigger OnValidate()
            begin
                //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
            end;
        }
        field(50000; Sorting; Integer)
        {
        }
        field(50001; "BUS.LEDGER TYPE"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50002; "Broad Class"; Code[10])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(50003; "Fund Management Fee"; Decimal)
        {
        }
        field(50004; "Fund  Value"; Decimal)
        {
            //CalcFormula = sum("Equity Sectors".Field6 where (Field5=field(Code)));
            FieldClass = Normal;
        }
        field(50005; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50006; Inflows; Decimal)
        {
        }
        field(50007; Outflows; Decimal)
        {
        }
        field(50008; Income; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = filter('1-950-01-001' .. '1-950-05-023'),
                                                        "Global Dimension 1 Code" = field(Code),
                                                        "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50009; Inflow1; Decimal)
        {
        }
        field(50010; Outflow1; Decimal)
        {
        }
        field(50011; Income1; Decimal)
        {
        }
        field(50013; Opening; Decimal)
        {
        }
        field(50014; "Fund Deposit"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimMgt: Codeunit DimensionManagement;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1',Code),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        // DimMgt.UpdateDefaultDim(54022,Code,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        // if OldDimSetID <> "Dimension Set ID" then begin
        //   Modify;
        // /*  IF PurchLinesExist THEN
        //     UpdateAllLineDim("Dimension Set ID",OldDimSetID);*/
        // end;

    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if Code <> '' then
            Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            /* IF PurchLinesExist THEN
               UpdateAllLineDim("Dimension Set ID",OldDimSetID);*/
        end;

    end;
}

