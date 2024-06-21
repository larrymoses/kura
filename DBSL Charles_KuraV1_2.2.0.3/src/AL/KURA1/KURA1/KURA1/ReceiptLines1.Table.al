#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56008 "Receipt Lines1"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Receipt No."; Code[30])
        {

            trigger OnValidate()
            begin
                //GetRecieptHeader;
                InitHeaderDefaults(ReceiptHeader);
            end;
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4; "Account No."; Code[30])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            begin

                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            if GLAccount.Get("Account No.") then
                                "Account Name" := GLAccount.Name;
                        end;
                    "account type"::Customer:
                        begin
                            if Cust.Get("Account No.") then
                                "Account Name" := Cust.Name;
                        end;
                    "account type"::Vendor:
                        begin
                            if Vendor.Get("Account No.") then
                                "Account Name" := Vendor.Name;
                        end;
                    "account type"::Employee:
                        begin
                            if Emp.Get("Account No.") then
                                "Account Name" := Emp.FullName;
                            if ReceiptsHeader1.Get("Receipt No.") then begin
                                ReceiptsHeader1."Employee No" := "Account No.";
                            end;
                        end;
                end;


                //AutoPopulate Header with Employee No
                //if "Account Type"="account type"::Employee then begin
                ReceiptHeader.Reset;
                ReceiptHeader.SetRange(ReceiptHeader."No.", "Receipt No.");
                if ReceiptHeader.FindSet then begin
                    ReceiptHeader."Received From" := "Account Name";
                    ReceiptHeader."On Behalf Of" := "Account Name";
                    if "Account Type" = "Account Type"::Employee then
                        ReceiptHeader."Employee No" := "Account No.";
                    ReceiptHeader.Modify;
                end;
            end;
            //end;
        }
        field(5; "Account Name"; Text[70])
        {
        }
        field(6; Description; Text[70])
        {
        }
        field(7; "VAT Code"; Code[30])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(8; "W/Tax Code"; Code[30])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(9; "VAT Amount"; Decimal)
        {
        }
        field(10; "W/Tax Amount"; Decimal)
        {
        }
        field(11; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                //"Net Amount":=Amount;
                ValidateAmount(false);
            end;
        }
        field(12; "Net Amount"; Decimal)
        {
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(15; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Currency;

            trigger OnValidate()
            begin

                //TestImprestSurrenderLock;
                ReceiptHeader.Get("Receipt No.");
                if "Currency Code" <> '' then begin
                    //GetCurrency;
                    if ("Currency Code" <> xRec."Currency Code") or
                       (ReceiptHeader.Date <> ReceiptHeader.Date) or
                       (CurrFieldNo = FieldNo("Currency Code")) or
                       ("Currency Factor" = 0)
                    then
                        "Currency Factor" :=
                          CurrExchRate.ExchangeRate(ReceiptHeader.Date, "Currency Code");
                end else
                    "Currency Factor" := 0;
                Validate("Currency Factor");
                //}
            end;
        }
        field(16; "Currency Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"Net Amount":=Amount
            end;
        }
        field(25; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            Enabled = false;
            TableRelation = "Dimension Set Entry";
        }
        field(94; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(95; "Applies to ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(482; "Applies to Doc. No"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            begin
                TestField(Description);
                "Applies to Doc. No" := '';
                Amt := 0;
                // VATAmount:=0;
                //"W/TAmount":=0;

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No.");
                            CustLedger.SetRange(Open, true);
                            CustLedger.CalcFields(CustLedger.Amount);//25
                            if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                if CustLedger."Applies-to ID" <> '' then begin
                                    CustLedger1.Reset;
                                    CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                    CustLedger1.SetRange(CustLedger1."Customer No.", "Account No.");
                                    CustLedger1.SetRange(Open, true);
                                    CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                    if CustLedger1.Find('-') then begin
                                        repeat
                                            CustLedger1.CalcFields(CustLedger1.Amount);
                                            Amt := Amt + Abs(CustLedger1.Amount);
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amt <> Amt then
                                        //ERROR('Amount is not equal to the amount applied on the application PAGE');
                                        if "Gross Amount" = 0 then
                                            "Gross Amount" := Amt;
                                    Validate("Gross Amount");
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    //Insert VAT where applicable
                                    VATEntry.Reset;
                                    VATEntry.SetRange("Transaction No.", VendLedger."Transaction No.");
                                    if VATEntry.Find('-') then
                                        "VAT Code" := VATEntry."VAT Prod. Posting Group";
                                    //

                                end else begin
                                    if "Gross Amount" <> Abs(CustLedger.Amount) then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if "Gross Amount" = 0 then
                                        "Gross Amount" := Abs(CustLedger."Remaining Amount");
                                    Validate("Gross Amount");
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    //"External Document No.":=CustLedger."External Document No.";
                                    //Insert VAT where applicable
                                    VATEntry.Reset;
                                    VATEntry.SetRange("Transaction No.", VendLedger."Transaction No.");
                                    if VATEntry.Find('-') then
                                        "VAT Code" := VATEntry."VAT Prod. Posting Group";
                                    //

                                end;
                            end;
                            Validate("Gross Amount");
                        end;
                end;

                //end
                /*
                //employees
                CASE "Account Type" OF
                "Account Type"::Employee:
                BEGIN
                
                 Employee1.RESET;
                 Employee1.SETCURRENTKEY("Employee No.",Open,"Document No.");
                 Employee1.SETRANGE("Employee No.","Account No.");
                 Employee1.SETRANGE(Open,TRUE);
                 Employee1.CALCFIELDS(Employee1.Amount);
                 IF PAGE.RUNMODAL(5237,Employee1) = ACTION::LookupOK THEN BEGIN
                
                IF Employee1."Applies-to ID"<>'' THEN BEGIN
                
                 EmployeeDet.RESET;
                 EmployeeDet.SETCURRENTKEY("Employee No.","Applies-to ID",Open,Positive);
                 EmployeeDet.SETRANGE("Employee No.","Account No.");
                 EmployeeDet.SETRANGE(Open,TRUE);
                 EmployeeDet.SETRANGE("Applies-to ID",Employee1."Applies-to ID");
                 IF CustLedger1.FIND('-') THEN
                 BEGIN
                   REPEAT
                     EmployeeDet.CALCFIELDS(EmployeeDet.Amount);
                     Amt:=Amt+ABS(EmployeeDet.Amount);
                   UNTIL EmployeeDet.NEXT=0;
                 END;
                
                IF Amt<>Amt THEN
                 //ERROR('Amount is not equal to the amount applied on the application PAGE');
                 IF "Gross Amount"=0 THEN
                 "Gross Amount":=Amt;
                 VALIDATE("Gross Amount");
                 "Applies to Doc. No":=EmployeeDet."Document No.";
                
                END ELSE BEGIN
                IF "Gross Amount"<>ABS(EmployeeDet.Amount) THEN
                EmployeeDet.CALCFIELDS(EmployeeDet."Remaining Amount");
                 IF "Gross Amount"=0 THEN
                "Gross Amount":=ABS(EmployeeDet."Remaining Amount");
                //VALIDATE("Gross Amount");
                "Applies to Doc. No":=EmployeeDet."Document No.";
                //"External Document No.":=CustLedger."External Document No.";
                
                END;
                END;
                //VALIDATE("Gross Amount");
                END;
                END;
                */

                //employees
                case "Account Type" of
                    "account type"::Employee:
                        begin
                            Employee1.Reset;
                            Employee1.SetCurrentkey("Employee No.", Open, "Document No.");
                            Employee1.SetRange("Employee No.", "Account No.");
                            Employee1.SetRange(Open, true);
                            Employee1.CalcFields(Employee1.Amount);
                            if Page.RunModal(5237, Employee1) = Action::LookupOK then begin

                                if Employee1."Employee No." <> '' then begin
                                    //MESSAGE('in2');
                                    EmployeeDet.Reset;
                                    EmployeeDet.SetCurrentkey("Employee No.", "Applies-to ID", Open, Positive);
                                    EmployeeDet.SetRange("Employee No.", "Account No.");
                                    EmployeeDet.SetRange(Open, true);
                                    EmployeeDet.SetRange("Document No.", Employee1."Document No.");
                                    if EmployeeDet.FindSet then begin
                                        //REPEAT
                                        EmployeeDet.CalcFields(EmployeeDet."Remaining Amount");

                                        //Amt:=ABS(EmployeeDet.Amount);
                                        //Amount:=EmployeeDet."Remaining Amount";
                                        //Amount := EmployeeDet."Remaining Amount";
                                        "Gross Amount" := Abs(EmployeeDet."Remaining Amount");
                                        Amount := Abs(EmployeeDet."Remaining Amount");
                                        Validate(Amount);
                                        "Applies to Doc. No" := EmployeeDet."Document No.";
                                        "Posting Group" := EmployeeDet."Employee Posting Group";
                                        //UNTIL EmployeeDet.NEXT=0;
                                    end;
                                    /*
                                   IF Amt<>Amt THEN
                                    //ERROR('Amount is not equal to the amount applied on the application PAGE');
                                     //MESSAGE('in4');
                                    IF "Gross Amount"=0 THEN
                                    "Gross Amount":=Amt;
                                    Amount := "Gross Amount";
                                    //VALIDATE("Gross Amount");
                                    "Applies to Doc. No":=EmployeeDet."Document No.";
                                    */
                                end else begin
                                    /*IF "Gross Amount"<>ABS(EmployeeDet.Amount) THEN
                                    EmployeeDet.CALCFIELDS(EmployeeDet."Remaining Amount");
                                     IF "Gross Amount"=0 THEN
                                     EmployeeDet.CALCFIELDS(EmployeeDet.Amount);
                                    "Gross Amount":=Amt;//ABS(EmployeeDet."Remaining Amount");
                                    Amount := "Gross Amount";
                                    //VALIDATE("Gross Amount");
                                    "Applies to Doc. No":=EmployeeDet."Document No.";
                                    //"External Document No.":=CustLedger."External Document No.";
                                    //MESSAGE('in5%1 no%2',"Gross Amount","Applies to Doc. No");*/
                                end;
                            end;
                            //VALIDATE("Gross Amount");
                        end;
                end;

            end;
        }
        field(483; "Gross Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField(Description);
                VATAmount := 0;
                "W/Tax Amount" := 0;

                "VAT Amount" := 0;
                "W/Tax Amount" := 0;

                /*
                CSetup.GET;
                CSetup.TESTFIELD("Rounding Precision");
                IF CSetup."Rounding Type"=CSetup."Rounding Type"::Up THEN
                   Direction:='>'
                 ELSE IF CSetup."Rounding Type"=CSetup."Rounding Type"::Nearest THEN
                   Direction:='='
                 ELSE IF CSetup."Rounding Type"=CSetup."Rounding Type"::Down THEN
                   Direction:='<';
                */

                case "Account Type" of

                    "account type"::Customer:
                        begin
                            if "VAT Code" <> '' then begin
                                if Customer.Get("Account No.") then
                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "VAT Code") then begin
                                        VATAmount := ROUND(("Gross Amount" / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), CSetup."Rounding Precision", Direction);
                                        if VATSetup."VAT %" <> 0 then begin
                                            NetAmount := "Gross Amount" - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                Amount := "Gross Amount" - VATAmount
                                            else
                                                Amount := "Gross Amount";
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No.") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                            Amount := NetAmount
                                                        else
                                                            Amount := "Gross Amount" - "W/TAmount";
                                                    end;
                                            end;
                                        end else begin
                                            Amount := "Gross Amount";
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No.") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        Amount := "Gross Amount" - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                Amount := "Gross Amount";
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if Customer.Get("Account No.") then
                                        if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            Amount := "Gross Amount" - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                end;

                Validate(Amount);

                //ADD THE DIMENSIONS FROM THE POSTED INVOICES 29/11/2016
                PostedInvLines.Reset;
                PostedInvLines.SetRange(PostedInvLines."Document No.", "Applies to Doc. No");
                //MESSAGE('in%1 Doc %2',"Applies-to ID","Applies to Doc. No");
                if PostedInvLines.Find('-') then begin
                    "Dimension Set ID" := PostedInvLines."Dimension Set ID";

                    ReceiptHeader.Reset;
                    ReceiptHeader.SetRange(ReceiptHeader."No.", "Receipt No.");
                    if ReceiptHeader.Find('-') then begin
                        ReceiptHeader."Dimension Set ID" := "Dimension Set ID";
                        //ReceiptHeader."Bal Account No." := "Account No.";
                        //ReceiptHeader."Bal Account Type" := "Account Type";
                        ReceiptHeader."Received From" := "Account Name";
                        ReceiptHeader."On Behalf Of" := "Account Name";
                        ReceiptHeader.Modify;
                    end;
                end;

                //ADD THE APPLIED TO IN IN THE TABLE 21 29/11/2016
                /*
                CustLedger1.RESET;
                CustLedger1.SETRANGE(CustLedger1."Document No.","Applies to Doc. No");
                IF CustLedger1.FIND('-') THEN
                BEGIN
                  CustLedger1."Applies-to ID" := "Receipt No.";
                  CustLedger1."Applies-to Doc. Type" :=CustLedger1."Applies-to Doc. Type"::Invoice;
                  CustLedger1.MODIFY;
                END;
                */

            end;
        }
        field(69000; "Shortcut Dimension 1 Code"; Code[20])
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
        field(69001; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false),
                                                          "Region Code" = field("Shortcut Dimension 1 Code"));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(69022; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else
            if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else
            if ("Account Type" = const("Fixed Asset")) "FA Posting Group"
            else
            if ("Account Type" = const(Employee)) "Employee Posting Group";
        }
        field(69023; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(69024; "Constituency Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code where("Region Code" = field("Region Code"));
        }
        field(69026; Posted; Boolean)
        {
            CalcFormula = lookup("Receipts Header1".Posted where("No." = field("Receipt No."),
                                                                  Posted = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69027; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Contractor No") then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(69028; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(69029; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Receipt No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if UserSetup.Get(UserId) then begin
            ReceiptsHeader1.Reset;
            ReceiptsHeader1.SetRange(ReceiptsHeader1."No.", "Receipt No.");
            if ReceiptsHeader1.FindSet then begin
                "Shortcut Dimension 1 Code" := UserSetup."Purchase Resp. Ctr. Filter";
                "Shortcut Dimension 3 Code" := UserSetup."Shortcut Dimension 3 Code";
            end;
        end;
    end;

    var
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
        Amt: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        VATSetup: Record "VAT Posting Setup";
        NetAmount: Decimal;
        VATEntry: Record "VAT Entry";
        CSetup: Record "Cash Management  SetupS";
        Direction: Text[30];
        Customer: Record Customer;
        ApplyCustEntries: Page "Apply Customer Entries";
        PostedInvLines: Record "Sales Invoice Line";
        ReceiptHeader: Record "Receipts Header1";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Employee: Record Employee;
        Employee1: Record "Employee Ledger Entry";
        EmployeeDet: Record "Employee Ledger Entry";
        Emp: Record Employee;
        UserSetup: Record "User Setup";
        ReceiptsHeader1: Record "Receipts Header1";

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //VerifyItemLineDim;
    end;

    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

    local procedure ValidateAmount(ShouldCheckPaymentTolerance: Boolean)
    var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get;
        "Amount (LCY)" := ROUND(
              CurrExchRate.ExchangeAmtFCYToLCY(
                Today, "Currency Code",
                Amount, "Currency Factor"),
              GLSetup."Unit-Amount Rounding Precision");
    end;

    local procedure GetCurrency()
    begin
    end;

    local procedure GetRecieptHeader()
    begin
        TestField("Receipt No.");
        ReceiptHeader.Get("Receipt No.");
        if ReceiptHeader."Currency Code" = '' then
            Currency.InitRoundingPrecision
        else begin
            ReceiptHeader.TestField("Currency Factor");
            Currency.Get(ReceiptHeader."Currency Code");
            Currency.TestField("Amount Rounding Precision");
        end;
        //END;

        OnAfterGetReceiptHeader(Rec, ReceiptHeader);
    end;

    local procedure InitHeaderDefaults(Receipt: Record "Receipts Header1")
    begin
        "Currency Code" := Receipt."Currency Code";
        "Currency Factor" := Receipt."Currency Factor";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetReceiptHeader(var ReceiptLine: Record "Receipt Lines1"; var ReceiptHeader: Record "Receipts Header1")
    begin
    end;
}

