#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54008 "Payments1"
{

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                // IF No <> xRec.No THEN BEGIN
                //  GenLedgerSetup.GET;
                //  IF "Payment Type"="Payment Type"::Normal THEN BEGIN
                //    NoSeriesMgt.TestManual(GenLedgerSetup."Normal Payments No");
                //  END
                //  ELSE BEGIN
                //    NoSeriesMgt.TestManual(GenLedgerSetup."Petty Cash Payments No");
                //  END;
                // // "No. Series" := '';
                // END;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Payement Type"; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(Type = const(Payment));

            trigger OnValidate()
            begin
                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, "Payement Type");
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if RecPayTypes.Find('-') then begin
                    Grouping := RecPayTypes."Default Grouping";
                end;

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    "Transaction Name" := RecPayTypes.Description;
                    "Investment Type" := RecPayTypes."Investment Type";
                    "Investment Transcation Type" := RecPayTypes."Investment Transcation Type";
                    "No. Of Units Required" := RecPayTypes."No. Of Units Required";
                    "VAT Code" := RecPayTypes."VAT Code";
                    "Calculate Interest" := RecPayTypes."Calculate Interest";
                    if RecPayTypes."Account Type" = RecPayTypes."account type"::"G/L Account" then begin
                        //RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."G/L Account";
                        if "Account No." <> '' then
                            Validate("Account No.");
                    end;


                end;

                //VALIDATE("Account No.");
            end;
        }
        field(4; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Modes".Code;
        }
        field(5; "Cheque No"; Code[20])
        {
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Cheque Type"; Code[20])
        {
        }
        field(8; "Bank Code"; Code[20])
        {
        }
        field(9; "Received From"; Text[100])
        {
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; Cashier; Code[30])
        {
        }
        field(12; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer where("Customer Posting Group" = field(Grouping))
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Investment Asset" where("Asset Type" = field("Investment Type"))
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name" := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, "Payement Type");
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if "Account Type" in ["account type"::"G/L Account", "account type"::Customer, "account type"::Vendor, "account type"::"IC Partner"]
                then
                    case "Account Type" of
                        "account type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Custodian Code" := '';
                                "Control Ac" := "Account No.";
                            end;
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                Payee := Cust.Name;
                                //"VAT Code":=Cust."Default VAT Code";
                                //"Withholding Tax Code":=Cust."Default Withholding Tax Code";
                                "Custodian Code" := Cust."Global Dimension 1 Code";
                                "Control Ac" := Cust."Customer Posting Group";
                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                Payee := Vend.Name;
                                //"VAT Code":=Vend."Default VAT Code";
                                //"Withholding Tax Code":=Vend."Pensionable Service Start Date";
                                "Custodian Code" := Vend."Global Dimension 1 Code";
                                "Control Ac" := Vend."Vendor Posting Group";
                            end;
                        "account type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Custodian Code" := BankAcc."Global Dimension 1 Code";
                                "Control Ac" := BankAcc."Bank Acc. Posting Group";

                            end;
                        "account type"::"Fixed Asset":
                            begin
                                FA.Get("Account No.");
                                "Account Name" := FA.Description;
                                "VAT Code" := FA."Default VAT Code";
                                "Withholding Tax Code" := FA."Default Withholding Tax Code";
                                "Custodian Code" := FA."Fund Code";
                            end;
                    end;
            end;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Account Name"; Text[150])
        {
        }
        field(16; Posted; Boolean)
        {
        }
        field(17; "Date Posted"; Date)
        {
        }
        field(18; "Time Posted"; Time)
        {
        }
        field(19; "Posted By"; Code[30])
        {
        }
        field(20; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                //Amount:="Gross Amount"+"Broker Fees"+"Other Charges"+"Revenue Stamp Fees";
                //Amount:=ROUND(Amount,0.01);
                //Amount:="Interest Amount"+"Broker Fees";
            end;
        }
        field(21; Remarks; Text[100])
        {
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(23; "VAT Code"; Code[20])
        {
            TableRelation = "Tarriff Codes";
        }
        field(24; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tarriff Codes";
        }
        field(25; "VAT Amount"; Decimal)
        {
        }
        field(26; "Withholding Tax Amount"; Decimal)
        {
        }
        field(27; "Net Amount"; Decimal)
        {

        }
        field(28; "Paying Bank Account"; Code[20])
        {
            // TableRelation = "Bank Account"."No." where (test1=field("Bank Type"));

            trigger OnValidate()
            begin
                if "Investment Payment Type" = "investment payment type"::"Member Deposit" then begin
                    BankAcc.Get("Paying Bank Account");

                    "Custodian Code" := BankAcc."Global Dimension 1 Code";
                end;
            end;
        }
        field(29; Payee; Text[100])
        {
        }
        field(30; "Custodian Code"; Code[20])
        {
            Caption = 'Custodian Code';
            TableRelation = "Custodian Code".Code;
        }
        field(31; "Fund Code"; Code[20])
        {
            TableRelation = "Fund Code".Code;
        }
        field(32; "PO/INV No"; Code[20])
        {
        }
        field(33; "Bank Account No"; Code[20])
        {
        }
        field(34; "Cashier Bank Account"; Code[20])
        {
        }
        field(35; Status; Option)
        {
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Cancelled;
        }
        field(36; Select; Boolean)
        {
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(41; "Apply to"; Code[20])
        {
            TableRelation = "Vendor Ledger Entry"."Vendor No." where("Vendor No." = field("Account No."));
        }
        field(42; "Apply to ID"; Code[20])
        {
        }
        field(44; "No. Of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                if "No. Of Units" < 0 then
                    Error('You cannot purchase Negative No. of Shares');
                Validate("Price Per Share");
            end;
        }
        field(45; "Investment No"; Code[20])
        {
            TableRelation = "Investment Asset" where("Asset Type" = field("Investment Type"));

            trigger OnValidate()
            begin
                if FA.Get("Investment No") then begin
                    "Custodian Code" := FA."Custodian Code";
                    "Fund Code" := FA."Fund Code";
                    Broker := FA.Broker;
                    if Broker <> '' then
                        Validate(Broker);

                    //IF "Investment Payment Type"="Investment Payment Type"::"Unit Trust" THEN BEGIN
                    if FA."Asset Type" = FA."asset type"::"Unit Trust" then begin

                        //"No. Of Units":=FA."Minimum Amount"/FA."Initial Unit Price";
                        FA.CalcFields("Current Value", "No.Of Units");
                        if FA."Current Value" = 0 then
                            "Price Per Share" := FA."Initial Unit Price"
                        else
                            "Price Per Share" := FA."Current Value" / FA."No.Of Units";



                    end;

                end;


                if "Calculate Interest" then begin

                    if InvestmentRec.Get("Investment No") then begin

                        if InvestmentRec."Investment Type" = '05' then begin
                            "Interest Rate" := InvestmentRec."Rate %";
                            // Principal:=ROUND("Gross Amount"/(1+("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)),0.01);
                            Principal := "Gross Amount" / 100 * ROUND(100 / (1 + ("Interest Rate" / 100) * (InvestmentRec."Maturity Period Days" / 365)), 0.001);
                            //Principal:=ROUND("Gross Amount"/(1+("Interest Rate"/100)*(91/365)),0.01);

                            //MESSAGE('%1',Principal);
                            "Interest Amount" := "Gross Amount" - Principal;
                            // "Interest Amount":=ROUND(("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)*Amount,0.01);
                        end;

                        /*
                        if InvestmentRec."Investment Type"='06' then begin
                            "Interest Rate":=InvestmentRec."Rate %";
                          // Principal:=ROUND("Gross Amount"/(1+("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)),0.01);
                           Principal:="Gross Amount"/100*ROUND(100/(1+("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)),0.001);


                        //MESSAGE('%1',Principal);
                            "Interest Amount":="Gross Amount"-Principal;
                           // "Interest Amount":=ROUND(("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)*Amount,0.01);
                          end;
                        */

                    end;
                end;

            end;
        }
        field(46; "Investment Type"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(47; "Investment Transcation Type"; Option)
        {
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Principal;
        }
        field(48; "No. Of Units Required"; Boolean)
        {
        }
        field(49; Multiple; Boolean)
        {
        }
        field(50; "Interest Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                //Amount:="Gross Amount"+"Interest Amount";
                Amount := "Interest Amount" + "Broker Fees";
            end;
        }
        field(51; "Interest Rate"; Decimal)
        {
            DecimalPlaces = 2 : 6;

            trigger OnValidate()
            begin
                if "Calculate Interest" then begin
                    if InvestmentRec.Get("Investment No") then begin

                        "Interest Amount" := ROUND(("Interest Rate" / 100) * (InvestmentRec."Maturity Period Days" / 365) * Amount, 0.01);
                        Amount := "Broker Fees" + "Interest Amount";
                        Validate(Amount);

                    end;
                end;
            end;
        }
        field(52; "Calculate Interest"; Boolean)
        {
        }
        field(53; "Control Ac"; Code[20])
        {
        }
        field(54; Broker; Code[20])
        {
            TableRelation = Vendor where("Vendor Type1" = const(Broker));

            trigger OnValidate()
            begin

                if Brokers.Get(Broker) then begin
                    Payee := Brokers.Name;
                    Commission := Brokers."Taxable Income";
                end;
                // MESSAGE('%1',Commission);
            end;
        }
        field(55; Currency; Code[20])
        {
            TableRelation = Currency;
        }
        field(56; "Security Cost"; Decimal)
        {
        }
        field(57; "Broker Fees"; Decimal)
        {
            DecimalPlaces = 1 : 4;

            trigger OnValidate()
            begin
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) *2;
                //VALIDATE("Broker Fees");
                //"Broker Fees":="Interest Amount"*("Broker Fees"/100);
                Amount := "Interest Amount" + "Broker Fees";
            end;
        }
        field(58; "Other Charges"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := "Gross Amount" + "Broker Fees" + "Other Charges";
                //"Revenue Stamp Fees";
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) *2;
            end;
        }
        field(59; "Gross Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Account Type" <> "account type"::Vendor then begin


                    if RecPayTypes.Get("Payement Type") then
                        if RecPayTypes."Calculate Broker Commission" then begin
                            if Vend.Get(Broker) then
                                //"Broker Fees":=Amount*(Vend."Commision Percentage"/100);
                                //Revenue Stamp Fees Calculation
                                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                                //Larger := '>';
                                //Precision := 1;
                                // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                                //MESSAGE('%1',"Revenue Stamp Fees");
                                //END;
                                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) *2;
                                // Amount:="Gross Amount"+"Broker Fees"+"Other Charges";

                                FA.Get("Investment No");

                            if FA."Investment Type" = '05' then begin
                                Validate("Investment No");

                                //Amount:="Gross Amount"-"Interest Amount";
                                Amount := "Broker Fees" + "Interest Amount";
                                Modify;
                            end;

                            if FA."Investment Type" = '06' then begin
                                Validate("Investment No");

                                //Amount:="Gross Amount"-"Interest Amount";
                                Modify;
                            end;



                        end;

                    if "Account Type" = "account type"::Vendor then begin

                        if RecPayTypes.Get("Payement Type") then
                            if RecPayTypes."Calculate Broker Commission" then begin
                                if Vend.Get(Broker) then
                                    //"Broker Fees" := Amount* (Vend."Commision Percentage"/100);
                                    "Broker Fees" := ("Broker Fees" / 100) * "Gross Amount";
                                "Other Charges" := ("Other Charges" / 100) * "Interest Amount";


                                ///"Revenue Stamp Fees" :="Broker Fees" + "Other Charges" + "Gross Amount";
                                //Larger := '>';
                                //Precision := 1;
                                // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                            end;
                        Amount := "Gross Amount" + "Broker Fees" + "Other Charges" + "Revenue Stamp Fees";
                        //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                        // Larger := '>';
                        // Precision := 1;
                        // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);


                    end;

                    /*
                    IF
                    FA.GET("Investment No") THEN
                    BEGIN
                     IF
                       FA."Asset Type"= FA."Asset Type"::"Unit Trust" THEN
                      BEGIN
                      IF Vend.GET("Unit Trust Member No") THEN
                        BEGIN
                            Vend.CALCFIELDS("Employer additional","Death Certificate","Marital Status","Balance (LCY)","Pensionable Service",
                    Wrong Expression
                            DeficitMin:=(FA."Minimum Amount"-Vend."Employer additional"+Vend."Death Certificate"+Vend."Marital Status");
                            Uninvamt:= Vend."Balance (LCY)"- ( Vend."Pensionable Service"+ Vend."Retirement Date"+ Vend."Acquisition Cost2");

                        IF Uninvamt<"Gross Amount" THEN BEGIN
                          ERROR('The Max amount available for Investment is %1',Uninvamt);
                         END;

                      IF (Vend."Employer additional"+Vend."Death Certificate"+Vend."Marital Status"+"Gross Amount") < FA."Minimum Amount" THEN BEGIN
                    Wrong Ex
                       ERROR('The minimum amount required for Investment is atleast %1',DeficitMin);
                          END;
                         END;
                        END;
                      END;
                     */
                    /*
                    IF Vend.GET("Investment No") THEN BEGIN

                    Vend.CALCFIELDS(Cost);

                    MESSAGE('%1',Vend.Cost);

                    Vend.CALCFIELDS(Cost); */
                end;

            end;
        }
        field(60; "Price Per Share"; Decimal)
        {
            DecimalPlaces = 1 : 6;

            trigger OnValidate()
            begin
                "Gross Amount" := "No. Of Units" * "Price Per Share";
                //MESSAGE('%1',"Gross Amount");
                //MESSAGE('%1',Commission);
                if Vend.Get(Broker) then begin
                    Commission := Vend."Taxable Income";
                    //MESSAGE('%1',Commission);
                    //"Broker Fees":=Amount*(Vend."Commision Percentage"/100);
                    //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                    // Larger := '>';
                    // Precision := 1;
                    // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);

                end;

                //"Broker Fees":="Gross Amount"*Commission/100;
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                //Larger := '>';
                //Precision := 1;
                //"Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                //"Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                Modify;
                if ("Investment Payment Type" <> "investment payment type"::"Member Deposit") or
                ("Investment Payment Type" <> "investment payment type"::"Unit Trust")
                 then begin
                    if InvestSetup.Get then
                        "Other Charges" := "Gross Amount" * InvestSetup."Other Commission Percentage" / 100;

                end;
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                //Larger := '>';
                // Precision := 1;
                // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);

                //Amount Calcultaion
                //Amount := "Gross Amount" + "Broker Fees" + "Other Charges";
                Amount := "Gross Amount" + "Broker Fees" + "Other Charges" + "Revenue Stamp Fees";


                if "Investment Payment Type" = "investment payment type"::"Unit Trust" then begin
                    if FA.Get("Investment No") then begin
                        if Amount < FA."Minimum Amount" then
                            Error('The member allocation amount is less than the minimum deposit.Please check!!');
                    end;
                end;


                "Share Unit Price" := Amount / "No. Of Units";
                Modify;
                Validate("Gross Amount");
                Validate(Amount);


                FA.Get("Investment No");

                if FA.UnitTrust = true then begin

                    if InvestmentRec.Get(FA."Unit Trust") then begin
                        InvestmentRec.CalcFields("Acquisition Cost");
                        FA2.Reset;
                        //WHERE(Asset Type=CONST(Equity),UnitTrust=CONST(Yes))
                        //FA.SETRANGE(FA2."Asset Type",FA2."Asset Type"::Equity);
                        FA2.SetRange(FA2.UnitTrust, true);
                        FA2.SetRange(FA2."Unit Trust", InvestmentRec."No.");

                        if FA2.Find('-') then begin
                            repeat
                                FA2.CalcFields(FA2."Acquisition Cost", "Current Value");
                                AmountInvested := AmountInvested + FA2."Acquisition Cost";
                            //"Investments Current Value":="Investments Current Value"+FA."Current Value";
                            until FA2.Next = 0;
                        end;

                    end;
                    RemainingAmt := InvestmentRec."Acquisition Cost" - AmountInvested;
                    //MESSAGE('%1',AmountInvested);
                    //MESSAGE('%1',RemainingAmt);

                    if Amount > RemainingAmt then
                        Error

('You have exceeded the remaining amount of unit trust.Please check!!');
                end;
            end;
        }
        field(61; "Share Unit Price"; Decimal)
        {
            DecimalPlaces = 1 : 4;
        }
        field(62; Institution; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Institutions.Get(Institution) then
                    "Intitution Name" := Institutions.Name;
                Modify;
            end;
        }
        field(63; "Intitution Name"; Text[100])
        {
        }
        field(64; "Investment Payment Type"; Option)
        {
            OptionCaption = ''''',Equity,Money Market,Unit Trust';
            OptionMembers = ,Equity,"Money Market","Unit Trust","Member Deposit","Member Redeem",Mortgage,property;
        }
        field(65; "Unit Trust Member No"; Code[20])
        {
            TableRelation = Vendor where("Payroll Pay Mode" = const('1'));

            trigger OnValidate()
            begin
                if Brokers.Get("Unit Trust Member No") then begin
                    "Unit Trust Member Name" := Brokers.Name
                end else begin
                    "Unit Trust Member Name" := '';

                end;
            end;
        }
        field(66; "Unit Trust Member Name"; Text[100])
        {
        }
        field(67; UnitTrust; Boolean)
        {
        }
        field(68; "Payment Schedule"; Date)
        {
            TableRelation = "Payment schedule"."Expected Date";

            trigger OnValidate()
            begin
                /*IF  PaymentSchedule.GET("Unit Trust Member No","Payment Schedule") THEN BEGIN
                 "Gross Amount":=PaymentSchedule."Expected  Amount";
                 VALIDATE("Gross Amount");
                 MODIFY;
                END;
                 */

            end;
        }
        field(69; "Available Money"; Decimal)
        {

            trigger OnValidate()
            begin
                // IF Vend.GET("Investment No") THEN BEGIN
                //
                // Vend.CALCFIELDS("Employer additional");
                //
                // MESSAGE('%1',Vend."Employer additional");
                // END;
            end;
        }
        field(70; "Revenue Stamp Fees"; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                /*"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                 Larger := '>';
                 Precision := 1;
                 "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                 VALIDATE("Revenue Stamp Fees");*/
                Amount := "Gross Amount" + "Broker Fees" + "Other Charges" + "Revenue Stamp Fees";

            end;
        }
        field(71; "Dirty Price"; Decimal)
        {
            DecimalPlaces = 2 : 8;

            trigger OnValidate()
            begin
                "Interest Amount" := ("Dirty Price" * "Gross Amount") / 100;
                "Broker Fees" := "Interest Amount" * ("Broker Fees" / 100);
                //Amount:="Interest Amount"+"Broker Fees";
                Validate("Clean Price");
            end;
        }
        field(72; "Clean Price"; Decimal)
        {
            DecimalPlaces = 2 : 6;

            trigger OnValidate()
            begin
                if "Dirty Price" > 0 then begin
                    "Cum-Interest Purchase" := ("Dirty Price" - "Clean Price") / 100 * "Gross Amount";
                    Amount := "Dirty Price" / 100 * "Gross Amount";
                end;
            end;
        }
        field(73; "Cum-Interest Purchase"; Decimal)
        {
        }
        field(74; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(75; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where(Blocked = const(false));

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
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Unit Trust Member No", "Payment Schedule")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        // IF No = '' THEN BEGIN
        //  GenLedgerSetup.GET;
        //
        //  IF "Payment Type"="Payment Type"::Normal THEN BEGIN
        //     GenLedgerSetup.TESTFIELD(GenLedgerSetup."Normal Payments No");
        //     NoSeriesMgt.InitSeries(GenLedgerSetup."Normal Payments No",xRec."No. Series",0D,No,"No. Series");
        //  END
        //  ELSE BEGIN
        //     GenLedgerSetup.TESTFIELD(GenLedgerSetup."Petty Cash Payments No");
        //     NoSeriesMgt.InitSeries(GenLedgerSetup."Petty Cash Payments No",xRec."No. Series",0D,No,"No. Series");
        //  END;
        // END;
        //
        // //Date:=TODAY;
        // Cashier:=USERID;
        /*
        CashierLinks.RESET;
        CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
        IF CashierLinks.FIND('-') THEN BEGIN
        "Fund Code":=CashierLinks."Branch Code";
        "Cashier Bank Account":=CashierLinks."Bank Account No";
        END;
         */

    end;

    var
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Investment Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        RecPayTypes: Record "Receipts and Payment Types";
        InvestmentRec: Record "Investment Asset";
        Brokers: Record Vendor;
        Commission: Decimal;
        InvestSetup: Record "Investment Setup";
        Principal: Decimal;
        Institutions: Record Customer;
        DeficitMin: Decimal;
        Uninvamt: Decimal;
        FA2: Record "Investment Asset";
        AmountInvested: Decimal;
        RemainingAmt: Decimal;
        Larger: Text[30];
        Precision: Integer;
        StampFees: Decimal;
        Res: Decimal;
        GAMOUNT: Decimal;
        DimMgt: Codeunit DimensionManagement;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::Payments1, No, FieldNumber, ShortcutDimCode);
        Modify(true);
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1',No),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        // if OldDimSetID <> "Dimension Set ID" then begin
        //   Modify;
        // /*  IF PurchLinesExist THEN
        //     UpdateAllLineDim("Dimension Set ID",OldDimSetID);*/
        // end;

    end;
}

