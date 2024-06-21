table 99464 "Work Plan Bill Item"
{
   DrillDownPageID ="Work Plan Bill Items";
   LookupPageID = "Work Plan Bill Items";

    fields
    {
        field(1; "Workplan Type"; Enum "WorkPlan Type")
        {
            DataClassification = ToBeClassified;
            // OptionCaption = 'Constituency,Regional,Consolidated,Consolidated East,Consolidated West';
            // OptionMembers = Constituency,Regional,Consolidated,"Consolidated East","Consolidated West";
        }
        field(2; "Workplan No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Bill Code"."BoQ Template Code";
        }
        field(4; "Bill Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "BoQ Template Bill Code"."Bill Item Category Code";
            TableRelation = "Item Category".Code WHERE(Blocked = const(false),
                                                        "Bill Item Group" = const(true));
        }
        field(5; "Activity Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // Description = '"Requisition Template Line" WHERE (Type=FILTER(Item))';
            TableRelation = Item."No." where("Item Category Code" = field("Bill Item Category Code"));

            trigger OnValidate()
            begin
                Item.RESET();
                Item.SETRANGE("No.", "Activity Code");
                IF Item.FindFirst() THEN begin
                    Description := Item.Description;
                    "Unit of Measure Code" := Item."Base Unit of Measure";
                end;

            end;
        }
        field(6; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Technology Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Technology".Code;

            trigger OnValidate()
            begin
                RoadTechnology.RESET;
                RoadTechnology.SETRANGE(RoadTechnology.Code, "Technology Type");
                IF RoadTechnology.FINDSET THEN
                    "Labour %" := RoadTechnology."Labour Percentage";
            end;
        }
        field(8; "Labour %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '20';
        }
        field(10; "Planned Rate (Unit Cost)"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Line Amount Excl. VAT", "Planned Quantity" * "Engineer's Rate (Unit Cost)");
                Validate("Line Amount Incl. VAT", "Line Amount Excl. VAT" + "VAT Amount");
            end;
        }
        field(11; "Planned Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                validate("Planned Rate (Unit Cost)");
            end;
        }
        field(12; "Contingency %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Engineer's Rate (Unit Cost)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                 VALIDATE("Planned Rate (Unit Cost)","Engineer's Rate (Unit Cost)");
                Validate("Line Amount Excl. VAT", "Planned Quantity" * "Engineer's Rate (Unit Cost)");
                //Validate("Line Amount Incl. VAT", "Line Amount Excl. VAT" + "VAT Amount");
            end;
        }
        field(14; "Packaged Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                VALIDATE("Planned Quantity");
            end;
        }
        field(15; "Line Amount Excl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Line Amount Incl. VAT","VAT Amount"+ "Line Amount Excl. VAT");
            end;
        }
        field(16; "Gen. Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
            trigger OnValidate()
            begin
                Validate("VAT Prod. Posting Group");
            end;
        }
        field(17; "VAT Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
            trigger OnValidate()
            var
                VATPostingSetup: Record "VAT Posting Setup";
            begin
                validate("Engineer's Rate (Unit Cost)");
                if VATPostingSetup.Get("Gen. Prod. Posting Group", "VAT Prod. Posting Group") then begin
                    Validate("VAT %", VATPostingSetup."VAT %");
                end;
            end;
        }
        field(18; "VAT %"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("VAT Amount" ,("VAT %"/100 * "Line Amount Excl. VAT")) ;
                Validate("Line Amount Incl. VAT","Line Amount Excl. VAT" + "VAT Amount");
            end;
        }
        field(19; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
              //  VALIDATE("VAT %");
            end;
        }
        field(20; "Line Amount Incl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                RAMHeader: Record "RAM Workplan Header";
                CurrencyDate: Date;
                WorkPlanBillItem: Record "Work Plan Bill Item";
                BillAmount: Decimal;
            begin
                RAMHeader.Reset();
                RAMHeader.SetRange("Document No", Rec."Workplan No");
                RAMHeader.SetRange("Workplan Type", Rec."Workplan Type");
                if RAMHeader.FindFirst() then begin
                    BillAmount := 0;
                    WorkPlanBillItem.Reset();
                    WorkPlanBillItem.SetRange("Workplan No", RAMHeader."Document No");
                    WorkPlanBillItem.SetRange("Workplan Type", RAMHeader."Workplan Type");
                    if WorkPlanBillItem.FindSet() then begin
                        repeat
                            BillAmount += WorkPlanBillItem."Line Amount Incl. VAT";
                        until WorkPlanBillItem.Next() = 0;
                    end;
                    BillAmount := BillAmount + Rec."Line Amount Incl. VAT";
                    if BillAmount > RAMHeader."Budget Ceiling Amount" then
                        error('Total Workplan amount %1 cannot be more than %2 ceiling amnount', BillAmount, RAMHeader."Budget Ceiling Amount");
                    if "Currency Code" = '' then
                        "Line Amount Inc VAT(LCY)" := "Line Amount Incl. VAT"
                    else begin
                        if RAMHeader."Document Date" <> 0D then
                            CurrencyDate := RAMHeader."Document Date"
                        else begin
                            CurrencyDate := WorkDate();
                    Rec.TestField("Currency Factor");
                    "Line Amount Inc VAT(LCY)" := Round(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          CurrencyDate, "Currency Code",
                           "Line Amount Incl. VAT", "Currency Factor"));
                        end;
                    end;
                end;
            end;
        }
        field(21; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Variant Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Default Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Entry No"; Integer)
        {
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(27; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Contract Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Construction,PBRM';
            OptionMembers = " ",Construction,PBRM;
        }
        field(29; "Reversion Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'To Contractor,To Authority';
            OptionMembers = "To Contractor","To Authority";
        }
        field(30; "Funding Source Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Funding Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(32; "Constituency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code WHERE("Region Code" = FIELD("Region Code"));
        }
        field(33; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code WHERE(Blocked = FILTER(false),
                                                               "Operating Unit Type" = FILTER(Region));
        }
        field(34; Revised; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Revision No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Line Amount Inc VAT(LCY)"; Decimal)
        {
            Editable = false;
        }
        field(37; "Road Code"; Code[20])
        {
            TableRelation = "Road Inventory"."Road Code";
        }
        field(38; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
            trigger OnValidate()
            var
                CurrencyDate: Date;
                RAMHeader: Record "RAM Workplan Header";
            begin
                RAMHeader.Reset();
                RAMHeader.SetRange("Document No", Rec."Workplan No");
                RAMHeader.SetRange("Workplan Type", Rec."Workplan Type");
                if RAMHeader.FindFirst() then
                    CurrencyDate := RAMHeader."Document Date"
                else
                    CurrencyDate := WorkDate();
                if "Currency Code" <> '' then begin
                    //GetCurrency;
                    if ("Currency Code" <> xRec."Currency Code") or
                       (CurrFieldNo = FieldNo("Currency Code")) or
                       ("Currency Factor" = 0)
                    then
                        "Currency Factor" :=
                          CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
                end else
                    "Currency Factor" := 0;
                    Validate("Line Amount Excl. VAT");
            end;
        }
        field(39; "Currency Factor"; Decimal)
        {

        }
        field(40; "Town Code"; Code[20])
        {
            TableRelation = Towns where("Region Code" = field("Region Code"));
        }
    }

    keys
    {
        key(Key1; "Workplan Type", "Workplan No", "Line No", "Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        WorkPlanBillItem: Record "Work Plan Bill Item";
    begin
        WorkPlanBillItem.Reset();
        WorkPlanBillItem.SetRange("Workplan Type", Rec."Workplan Type");
        WorkPlanBillItem.SetRange("Workplan No", Rec."Workplan No");
        WorkPlanBillItem.SetRange("Line No", Rec."Line No");
        if WorkPlanBillItem.FindLast() then
            Rec."Entry No" := WorkPlanBillItem."Entry No" + 1
        ELSE
            Rec."Entry No" := 1;
        RAMWorkplanLine.RESET;
        RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Document No", "Workplan No");
        RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Workplan Type", RAMWorkplanLine."Workplan Type"::Constituency);
        IF RAMWorkplanLine.FindFirst() THEN BEGIN

            "Region Code" := RAMWorkplanLine."Region Code";
            "Constituency Code" := RAMWorkplanLine."Constituency Code";
            "Funding Source Code" := RAMWorkplanLine."Global Dimension 2 Code";
            "Funding Source Type" := RAMWorkplanLine."Funding Source Type";

        END;

    end;

    var
        RoadTechnology: Record "Road Technology";
        Item: Record Item;
        RAMWorkplanLine: Record "RAM Workplan Line";
        CurrExchRate: Record "Currency Exchange Rate";
}

