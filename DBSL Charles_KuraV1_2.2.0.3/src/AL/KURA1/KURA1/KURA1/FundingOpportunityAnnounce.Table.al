#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72021 "Funding Opportunity Announce"
{
    DrillDownPageID = "All Research Proposals";
    LookupPageID = "All Research Proposals";

    fields
    {
        field(1; "FOA No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Title; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Organization ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Issuing Organization"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Call Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Call For Proposals,Call For Applications,Call For Concept Notes,Call For Nominations,Expression Of Interest';
            OptionMembers = " ","Call For Proposals","Call For Applications","Call For Concept Notes","Call For Nominations","Expression Of Interest";
        }
        field(6; "External Announcement No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Release Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Application Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Earliest Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Expiration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Home Page"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(14; "TimeStamp Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "FOA No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GrantsSetup: Record "Grants Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FOA: Record "Funding Opportunity";
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Confirmed: Boolean;
        Text021: label 'Do you want to update the exchange rate?';
        HideValidationDialog: Boolean;
        Customer: Record Customer;
        Contact: Record Contact;
        Currency: Record Currency;
        GLSetup: Record "General Ledger Setup";
        CurrencyCode: Code[10];
        GLSetupRead: Boolean;

    local procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        Updated: Boolean;
    begin
        // OnBeforeUpdateCurrencyFactor(Rec,Updated);
        // if Updated then
        //   exit;

        // if "Currency Code" <> '' then begin
        //   if "Posting Date" <> 0D then
        //     CurrencyDate := "Posting Date"
        //   else
        //     CurrencyDate := WorkDate;

        //   if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate,"Currency Code") then begin
        //     "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate,"Currency Code");
        //     if "Currency Code" <> xRec."Currency Code" then
        //       RecreateSalesLines(FieldCaption("Currency Code"));
        //   end else begin
        //     if Confirm(StrSubstNo(MissingExchangeRatesQst,"Currency Code",CurrencyDate)) then begin
        //       Commit;
        //       UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
        //       UpdateCurrencyFactor;
        //     end else
        //       RevertCurrencyCodeAndPostingDate;
        //   end;
        // end else
        //   "Currency Factor" := 0;
    end;

    local procedure ConfirmUpdateCurrencyFactor()
    begin
        // if GetHideValidationDialog then
        //   Confirmed := true
        // else
        //   Confirmed := Confirm(Text021,false);
        // if Confirmed then
        //   Validate("Currency Factor")
        // else
        //   "Currency Factor" := xRec."Currency Factor";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var SalesHeader: Record "Grant Funding Application"; var Updated: Boolean)
    begin
    end;

    local procedure RecreateSalesLines(ChangedFieldName: Text[100])
    var
        TempSalesLine: Record "Sales Line" temporary;
        ItemChargeAssgntSales: Record "Item Charge Assignment (Sales)";
        TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary;
        TempInteger: Record "Integer" temporary;
        TempATOLink: Record "Assemble-to-Order Link" temporary;
        ATOLink: Record "Assemble-to-Order Link";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ExtendedTextAdded: Boolean;
        ConfirmText: Text;
    begin
        /*IF SalesLinesExist THEN BEGIN
          IF GetHideValidationDialog OR NOT GUIALLOWED THEN
            Confirmed := TRUE
          ELSE BEGIN
            IF HasItemChargeAssignment THEN
              ConfirmText := ResetItemChargeAssignMsg
            ELSE
              ConfirmText := RecreateSalesLinesMsg;
            Confirmed := CONFIRM(ConfirmText,FALSE,ChangedFieldName);
          END;
        
          IF Confirmed THEN BEGIN
            SalesLine.LOCKTABLE;
            ItemChargeAssgntSales.LOCKTABLE;
            ReservEntry.LOCKTABLE;
            MODIFY;
            OnBeforeRecreateSalesLines(Rec);
            SalesLine.RESET;
            SalesLine.SETRANGE("Document Type","Document Type");
            SalesLine.SETRANGE("Document No.","No.");
            IF SalesLine.FINDSET THEN BEGIN
              TempReservEntry.DELETEALL;
              RecreateReservEntryReqLine(TempSalesLine,TempATOLink,ATOLink);
              TransferItemChargeAssgntSalesToTemp(ItemChargeAssgntSales,TempItemChargeAssgntSales);
              SalesLine.DELETEALL(TRUE);
              SalesLine.INIT;
              SalesLine."Line No." := 0;
              TempSalesLine.FINDSET;
              ExtendedTextAdded := FALSE;
              SalesLine.BlockDynamicTracking(TRUE);
              REPEAT
                IF TempSalesLine."Attached to Line No." = 0 THEN BEGIN
                  CreateSalesLine(TempSalesLine);
                  ExtendedTextAdded := FALSE;
                  OnAfterRecreateSalesLine(SalesLine,TempSalesLine);
        
                  IF SalesLine.Type = SalesLine.Type::Item THEN BEGIN
                    ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
                    TempItemChargeAssgntSales.SETRANGE("Applies-to Doc. Type",TempSalesLine."Document Type");
                    TempItemChargeAssgntSales.SETRANGE("Applies-to Doc. No.",TempSalesLine."Document No.");
                    TempItemChargeAssgntSales.SETRANGE("Applies-to Doc. Line No.",TempSalesLine."Line No.");
                    IF TempItemChargeAssgntSales.FINDSET THEN
                      REPEAT
                        IF NOT TempItemChargeAssgntSales.MARK THEN BEGIN
                          TempItemChargeAssgntSales."Applies-to Doc. Line No." := SalesLine."Line No.";
                          TempItemChargeAssgntSales.Description := SalesLine.Description;
                          TempItemChargeAssgntSales.MODIFY;
                          TempItemChargeAssgntSales.MARK(TRUE);
                        END;
                      UNTIL TempItemChargeAssgntSales.NEXT = 0;
                  END;
                  IF SalesLine.Type = SalesLine.Type::"Charge (Item)" THEN BEGIN
                    TempInteger.INIT;
                    TempInteger.Number := SalesLine."Line No.";
                    TempInteger.INSERT;
                  END;
                END ELSE
                  IF NOT ExtendedTextAdded THEN BEGIN
                    TransferExtendedText.SalesCheckIfAnyExtText(SalesLine,TRUE);
                    TransferExtendedText.InsertSalesExtText(SalesLine);
                    OnAfterTransferExtendedTextForSalesLineRecreation(SalesLine);
        
                    SalesLine.FINDLAST;
                    ExtendedTextAdded := TRUE;
                  END;
                CopyReservEntryFromTemp(TempSalesLine,SalesLine."Line No.");
                RecreateReqLine(TempSalesLine,SalesLine."Line No.",FALSE);
                SynchronizeForReservations(SalesLine,TempSalesLine);
        
                IF TempATOLink.AsmExistsForSalesLine(TempSalesLine) THEN BEGIN
                  ATOLink := TempATOLink;
                  ATOLink."Document Line No." := SalesLine."Line No.";
                  ATOLink.INSERT;
                  ATOLink.UpdateAsmFromSalesLineATOExist(SalesLine);
                  TempATOLink.DELETE;
                END;
              UNTIL TempSalesLine.NEXT = 0;
        
              ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
              TempSalesLine.SETRANGE(Type,SalesLine.Type::"Charge (Item)");
              CreateItemChargeAssgntSales(ItemChargeAssgntSales,TempItemChargeAssgntSales,TempSalesLine,TempInteger);
              TempSalesLine.SETRANGE(Type);
              TempSalesLine.DELETEALL;
              OnAfterDeleteAllTempSalesLines;
              ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
              TempItemChargeAssgntSales.DELETEALL;
            END;
          END ELSE
            ERROR(
              Text017,ChangedFieldName);
        END;
        
        SalesLine.BlockDynamicTracking(FALSE);
        */

    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        // "Currency Code" := xRec."Currency Code";
        // "Posting Date" := xRec."Posting Date";
    end;

    procedure GetHideValidationDialog(): Boolean
    var
        IdentityManagement: Codeunit "Identity Management";
    begin
        //exit(HideValidationDialog or IdentityManagement.IsInvAppId);
    end;

    procedure UpdateSalesLinesByFieldNo(ChangedFieldNo: Integer; AskQuestion: Boolean)
    var
        "Field": Record "Field";
        JobTransferLine: Codeunit "Job Transfer Line";
        PermissionManager: Codeunit "Permission Manager";
        Question: Text[250];
        NotRunningOnSaaS: Boolean;
        IsHandled: Boolean;
    begin
        /*IF NOT SalesLinesExist THEN
          EXIT;
        
        IF NOT Field.GET(DATABASE::"Sales Header",ChangedFieldNo) THEN
          Field.GET(DATABASE::"Sales Line",ChangedFieldNo);
        
        NotRunningOnSaaS := TRUE;
        CASE ChangedFieldNo OF
          FIELDNO("Shipping Agent Code"),
          FIELDNO("Shipping Agent Service Code"):
            NotRunningOnSaaS := NOT PermissionManager.SoftwareAsAService;
        END;
        IF AskQuestion THEN BEGIN
          Question := STRSUBSTNO(Text031,Field."Field Caption");
          IF GUIALLOWED THEN
            IF NotRunningOnSaaS THEN
              IF DIALOG.CONFIRM(Question,TRUE) THEN
                CASE ChangedFieldNo OF
                  FIELDNO("Shipment Date"),
                  FIELDNO("Shipping Agent Code"),
                  FIELDNO("Shipping Agent Service Code"),
                  FIELDNO("Shipping Time"),
                  FIELDNO("Requested Delivery Date"),
                  FIELDNO("Promised Delivery Date"),
                  FIELDNO("Outbound Whse. Handling Time"):
                    ConfirmResvDateConflict;
                END
              ELSE
                EXIT
            ELSE
              ConfirmResvDateConflict;
        END;
        
        SalesLine.LOCKTABLE;
        MODIFY;
        
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type","Document Type");
        SalesLine.SETRANGE("Document No.","No.");
        IF SalesLine.FINDSET THEN
          REPEAT
            OnBeforeSalesLineByChangedFieldNo(SalesHeader,SalesLine,ChangedFieldNo,IsHandled);
            IF NOT IsHandled THEN
              CASE ChangedFieldNo OF
                FIELDNO("Shipment Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipment Date","Shipment Date");
                FIELDNO("Currency Factor"):
                  IF SalesLine.Type <> SalesLine.Type::" " THEN BEGIN
                    SalesLine.VALIDATE("Unit Price");
                    SalesLine.VALIDATE("Unit Cost (LCY)");
                    IF SalesLine."Job No." <> '' THEN
                      JobTransferLine.FromSalesHeaderToPlanningLine(SalesLine,"Currency Factor");
                  END;
                FIELDNO("Transaction Type"):
                  SalesLine.VALIDATE("Transaction Type","Transaction Type");
                FIELDNO("Transport Method"):
                  SalesLine.VALIDATE("Transport Method","Transport Method");
                FIELDNO("Exit Point"):
                  SalesLine.VALIDATE("Exit Point","Exit Point");
                FIELDNO(Area):
                  SalesLine.VALIDATE(Area,Area);
                FIELDNO("Transaction Specification"):
                  SalesLine.VALIDATE("Transaction Specification","Transaction Specification");
                FIELDNO("Shipping Agent Code"):
                  SalesLine.VALIDATE("Shipping Agent Code","Shipping Agent Code");
                FIELDNO("Shipping Agent Service Code"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipping Agent Service Code","Shipping Agent Service Code");
                FIELDNO("Shipping Time"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipping Time","Shipping Time");
                FIELDNO("Prepayment %"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Prepayment %","Prepayment %");
                FIELDNO("Requested Delivery Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Requested Delivery Date","Requested Delivery Date");
                FIELDNO("Promised Delivery Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Promised Delivery Date","Promised Delivery Date");
                FIELDNO("Outbound Whse. Handling Time"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Outbound Whse. Handling Time","Outbound Whse. Handling Time");
                SalesLine.FIELDNO("Deferral Code"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Deferral Code");
                ELSE
                  OnUpdateSalesLineByChangedFieldName(Rec,SalesLine,Field."Field Caption");
              END;
            SalesLineReserve.AssignForPlanning(SalesLine);
            SalesLine.MODIFY(TRUE);
          UNTIL SalesLine.NEXT = 0;
          */

    end;

    local procedure FnReCalculateAmountLCY(ChangedFieldName: Text[100])
    begin
        // if (ChangedFieldName='') then begin
        //   "Requested Grant Amount(LCY)":="Requested Grant Amount";
        // end;
        // if (ChangedFieldName<>'') then begin
        //    "Requested Grant Amount(LCY)":="Requested Grant Amount"*"Currency Factor";
        //   end;
    end;

    // procedure CloseOpportunity()
    // var
    //     TempOppEntry: Record "GFA Opportunity Entry" temporary;
    // begin
    //     if "FOA No" <> '' then
    //      // TempOppEntry.CloseOppFromOpp(Rec);
    // end;
    // local procedure GetCurrency()
    // begin
    // if "Additional-Currency Posting" =
    //    "additional-currency posting"::"2"
    // then begin
    //   if GLSetup."Additional Reporting Currency" = '' then
    //     ReadGLSetup;
    //   CurrencyCode := GLSetup."Additional Reporting Currency";
    // end else
    //   CurrencyCode := "Currency Code";

    // if CurrencyCode = '' then begin
    //   Clear(Currency);
    //   Currency.InitRoundingPrecision
    // end else
    //   if CurrencyCode <> Currency.Code then begin
    //     Currency.Get(CurrencyCode);
    //     Currency.TestField("Amount Rounding Precision");
    //   end;
    //end;

    local procedure ReadGLSetup()
    begin
        if not GLSetupRead then begin
            GLSetup.Get;
            GLSetupRead := true;
        end;
    end;
}

