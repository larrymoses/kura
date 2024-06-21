#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56007 "Receipts Header1"
{
    DrillDownPageID = "Receipt List All";
    LookupPageID = "Receipt List All";

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                //GLSetup.GET;
                /*
                IF "No."<>xRec."No." THEN BEGIN
                  NoSeriesMgt.TestManual(GLSetup."Receipt Nos");
                  END;
                
                */

                if "No." <> xRec."No." then
                    NoSeriesMgt.TestManual(CashMgt."Receipt Nos");

            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(4; "Cheque No"; Code[20])
        {
        }
        field(5; "Cheque Date"; Date)
        {
        }
        field(6; Amount; Decimal)
        {
            CalcFormula = sum("Receipt Lines1".Amount where("Receipt No." = field("No.")));
            FieldClass = FlowField;
        }
        field(7; "Amount(LCY)"; Decimal)
        {
            CalcFormula = sum("Receipt Lines1"."Amount (LCY)" where("Receipt No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No." where("Responsibility Center" = field("Responsibility Center"));
        }
        field(9; "Received From"; Text[70])
        {
        }
        field(10; "On Behalf Of"; Text[70])
        {
        }
        field(11; Cashier; Code[50])
        {
        }
        field(12; Posted; Boolean)
        {
        }
        field(13; "Posted Date"; Date)
        {
        }
        field(14; "Posted Time"; Time)
        {
        }
        field(15; "Posted By"; Code[30])
        {
        }
        field(16; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; "Currency Code"; Code[20])
        {
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo(Date)]) or ("Currency Code" <> xRec."Currency Code") then
                    TestField(Status, Status::Open);
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else
                    if "Currency Code" <> xRec."Currency Code" then
                        UpdateCurrencyFactor
                    else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                            if "Currency Factor" <> xRec."Currency Factor" then
                                ConfirmUpdateCurrencyFactor;
                        end;
            end;
        }
        field(18; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(19; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(20; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,,,Closed;
        }
        field(21; "Fully Allocated"; Boolean)
        {
            CalcFormula = lookup("Petty Cash Lines"."Fully Allocated" where("Receipt No." = field("No.")));
            FieldClass = FlowField;
        }
        field(22; "Allocated Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines"."Cash Receipt Amount" where("Receipt No." = field("No.")));
            FieldClass = FlowField;
        }
        field(23; "Fully Allocated Imprest"; Boolean)
        {
            CalcFormula = lookup("Imprest Lines"."Fully Allocated" where("Receipt No." = field("No.")));
            FieldClass = FlowField;
        }
        field(24; "Depot Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Being Payment of"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Payment Reference"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(28; ID; Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Tel No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(80; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender,"Staff Claims";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(481; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(482; "Reason for Reversing"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(483; Reversed; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(484; "Reversed By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(485; "Date Reversed"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(486; "Time Reversed"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(487; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(488; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(489; "Direct Income Voucher"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(490; "Expense Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(491; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(492; "Document No"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(493; "Current Budget"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(494; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(495; "Funding Agency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                // IF Customer.GET("Funding Agency ID") THEN
                //  "Funding Agency Name":=Customer.Name;
            end;
        }
        field(496; "Funding Agency Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(497; "Receipt Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Cash Request';
            OptionMembers = " ",Normal,"Cash Request";
        }
        field(498; "Cash Request No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Cash Request Header"."Document No" where(Posted = const(true));
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        //No. series
        if "No." = '' then begin
            CashMgt.Get;
            CashMgt.TestField(CashMgt."Receipt Nos");
            NoSeriesMgt.InitSeries(CashMgt."Receipt Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        //insert today's date as default
        Date := Today;
        Cashier := UserId;
        CashMgt.TestField("Current Budget");
        "Current Budget" := CashMgt."Current Budget";

        //Fred RC
        if UserSetup.Get(UserId) then
            "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";

        ResponsibilityCenter.Reset;
        ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Responsibility Center");
        if ResponsibilityCenter.FindSet then
            "Document No" := 'KURA' + '/' + ResponsibilityCenter.Code + '/' + CopyStr("No.", 9) + '/' + "Current Budget";
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        CashMgt: Record "Cash Management Setup";
        DimMgt: Codeunit DimensionManagement;
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        PurchLine: Record "Receipt Lines1";
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Text022: label 'Do you want to update the exchange rate?';
        CurrencyDate: Date;
        CurrencyCode: Code[10];
        CurrExchRate: Record "Currency Exchange Rate";
        Confirmed: Boolean;
        HideValidationDialog: Boolean;
        UserSetup: Record "User Setup";
        County: Record County1;
        ResponsibilityCenter: Record "Responsibility Center";
        Customer: Record Customer;

    procedure CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]; Type3: Integer; No3: Code[20]; Type4: Integer; No4: Code[20])
    var
        SourceCodeSetup: Record "Source Code Setup";
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
        OldDimSetID: Integer;
    begin
        SourceCodeSetup.Get;
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        TableID[4] := Type4;
        No[4] := No4;
        OnAfterCreateDimTableIDs(Rec, CurrFieldNo, TableID, No);

        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.GetRecDefaultDimID(
            Rec, CurrFieldNo, TableID, No, SourceCodeSetup.Purchases, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", 0, 0);

        if (OldDimSetID <> "Dimension Set ID") and PurchLinesExist then begin
            Modify;
            UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "No." <> '' then
            Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            if PurchLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin

            if PurchLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not Confirm(Text051) then
            exit;

        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange("Receipt No.", "No.");
        PurchLine.LockTable;
        if PurchLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if PurchLine."Dimension Set ID" <> NewDimSetID then begin
                    PurchLine."Dimension Set ID" := NewDimSetID;


                    DimMgt.UpdateGlobalDimFromDimSetID(
                      PurchLine."Dimension Set ID", PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
                    PurchLine.Modify;
                end;
            until PurchLine.Next = 0;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateDimTableIDs(var ReceiptHeader: Record "Receipts Header1"; FieldNo: Integer; var TableID: array[10] of Integer; var No: array[10] of Code[20])
    begin
    end;

    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange("Receipt No.", "No.");
        exit(PurchLine.FindFirst);
    end;

    local procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        Updated: Boolean;
    begin
        OnBeforeUpdateCurrencyFactor(Rec, Updated);
        if Updated then
            exit;

        if "Currency Code" <> '' then begin
            if Date <> 0D then
                CurrencyDate := Date
            else
                CurrencyDate := WorkDate;

            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
                "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");

            end else begin
                if Confirm(StrSubstNo(MissingExchangeRatesQst, "Currency Code", CurrencyDate)) then begin
                    UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
                    UpdateCurrencyFactor;
                end else
                    RevertCurrencyCodeAndPostingDate;
            end;
        end else
            "Currency Factor" := 0;
    end;

    local procedure ConfirmUpdateCurrencyFactor(): Boolean
    begin
        if GetHideValidationDialog then
            Confirmed := true
        else
            Confirmed := Confirm(Text022, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
        exit(Confirmed);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var ReceiptHeader: Record "Receipts Header1"; var Updated: Boolean)
    begin
    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        "Currency Code" := xRec."Currency Code";
        Date := xRec.Date;
        Modify;
    end;

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;

    procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;
}

