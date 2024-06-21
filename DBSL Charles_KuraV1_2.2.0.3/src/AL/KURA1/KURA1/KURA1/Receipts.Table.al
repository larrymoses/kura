#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54007 "Receipts"
{

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin


                // IF No <> xRec.No THEN BEGIN
                //  GenLedgerSetup.GET;
                // NoSeriesMgt.TestManual(GenLedgerSetup."Receipts No");
                //  "No. Series" := '';
                // END;
            end;
        }
        field(2; Date; Date)
        {

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
            end;
        }
        field(3; "Receipt Type"; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(Type = const(Receipt));

            trigger OnValidate()
            begin
                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, "Receipt Type");
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Receipt);

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    "Transaction Name" := RecPayTypes.Description;
                    Grouping := RecPayTypes."Default Grouping";
                    "Investment Type" := RecPayTypes."Investment Type";
                    "Investment Transcation Type" := RecPayTypes."Investment Transcation Type";
                    "No. Of Units Required" := RecPayTypes."No. Of Units Required";
                    "Calculate Interest" := RecPayTypes."Calculate Interest";
                    "Schedule Mandatory" := RecPayTypes."Schedule Mandatory";

                    if RecPayTypes."Account Type" = RecPayTypes."account type"::"G/L Account" then begin
                        //RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                        if RecPayTypes."G/L Account" <> '' then begin
                            "Account No." := RecPayTypes."G/L Account";
                            Validate("Account No.");
                        end;
                    end;
                end;
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

            trigger OnValidate()
            begin
                // GenLedgerSetup.GET;
                // IF CALCDATE(GenLedgerSetup."Cheque Reject Period","Cheque Date")<=TODAY THEN BEGIN
                // ERROR('The cheque date is not within the allowed range.');
                // END;
                //
                // IF "Cheque Date">TODAY THEN BEGIN
                // ERROR('The cheque date is not within the allowed range.');
                // END;
            end;
        }
        field(7; "Cheque Type"; Code[20])
        {
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account";

            trigger OnValidate()
            begin
                if BankAcc.Get("Bank Code") then
                    Currency := BankAc."Currency Code";
                /*
                IF "Investment Payment Type"="Investment Payment Type"::"unit trust" THEN BEGIN
                BankAcc.GET("Bank Code");

               "Global Dimension 1 Code":=BankAcc."Global Dimension 1 Code";
               END;
               */

            end;
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
            if ("Account Type" = const("Fixed Asset")) "Investment Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name" := '';

                if "Account Type" in ["account type"::"G/L Account", "account type"::Customer,
                "account type"::Vendor, "account type"::"IC Partner"] then
                    case "Account Type" of
                        "account type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "Custodian Code" := '';
                                "Control Ac" := "Account No.";
                            end;
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                "Custodian Code" := Cust."Global Dimension 1 Code";
                                "Control Ac" := Cust."Customer Posting Group";

                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                "Custodian Code" := Vend."Global Dimension 1 Code";
                                "Control Ac" := Vend."Vendor Posting Group";
                            end;
                        "account type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                "Custodian Code" := BankAcc."Global Dimension 1 Code";
                                "Control Ac" := BankAcc."Bank Acc. Posting Group";
                            end;
                        "account type"::"Fixed Asset":
                            begin
                                FA.Get("Account No.");
                                "Account Name" := FA.Description;
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

                if "Calculate Interest" then begin
                    "Interest Amount" := CalculateInterest;
                    "Interest On Arrears" := CalculateInterestOnArrears;

                end;


                if "Interest On Arrears" = 0 then
                    "Capital Amount" := Amount - "Interest Amount";





                //Calculate Revaluation release and Gain/Loss

                if "Investment Transcation Type" = "investment transcation type"::Disposal then begin


                    if InvestmentRec.Get("Investment No") then begin

                        if InvestmentRec."Asset Type" = InvestmentRec."asset type"::Equity then begin

                            //InvestmentRec.SETRANGE(InvestmentRec."Date Filter",0D,EndYear(Date));
                            //InvestmentRec.SETRANGE(InvestmentRec."Date Filter",0D,Date-1);
                            InvestmentRec.SetRange(InvestmentRec."Date Filter", 0D, Date);
                            InvestmentRec.CalcFields(InvestmentRec."No.Of Units", InvestmentRec.Revaluations, InvestmentRec."Acquisition Cost",
                            InvestmentRec.Cost, InvestmentRec."Acquisition Cost (FCY)", InvestmentRec."Revaluations (FCY)");
                            // MESSAGE('%1',InvestmentRec."No.Of Units");
                            if Currency = '' then begin
                                "Revaluation Release Amount" := ROUND(("No. Of Units" / InvestmentRec."No.Of Units") * InvestmentRec.Revaluations, 0.01);
                            end else begin
                                "Revaluation Release Amount" := ROUND(("No. Of Units" / InvestmentRec."No.Of Units") * InvestmentRec."Revaluations (FCY)", 0.000000001);
                                "Revaluation Release Amount LCY" := ROUND(("No. Of Units" / InvestmentRec."No.Of Units") * InvestmentRec.Revaluations, 0.01);

                            end;
                            //InvestmentRec.SETRANGE(InvestmentRec."Date Filter",0D,Date-1);

                            //kugun
                            // InvestmentRec.SETRANGE(InvestmentRec."Date Filter",0D,Date);
                            //end
                            InvestmentRec.CalcFields(InvestmentRec."No.Of Units", InvestmentRec.Revaluations, InvestmentRec."Acquisition Cost",
                            InvestmentRec."Acquisition Cost (FCY)", InvestmentRec."Revaluations (FCY)");

                            if Currency = '' then begin
                                "Cost Reduced" := ROUND(("No. Of Units" / InvestmentRec."No.Of Units") * InvestmentRec.Cost, 0.01);
                            end else begin
                                "Cost Reduced" := ROUND(("No. Of Units" / InvestmentRec."No.Of Units") * InvestmentRec."Acquisition Cost (FCY)", 0.0000001);
                                "Cost Reduced LCY" := ROUND(("No. Of Units" / InvestmentRec."No.Of Units") * InvestmentRec.Cost, 0.01);

                            end;
                            // MESSAGE('%1',"Cost Reduced");
                            "Gain/(Loss) on Disposal" := "Cost Reduced" - Amount;
                            // "Gain/(Loss) on Disposal LCY":="Cost Reduced LCY"-Amount;

                            //MESSAGE('%1',"Gain/Loss on Disposal");


                        end;

                        /*

                        IF InvestmentRec."Asset Type"=InvestmentRec."Asset Type"::"Unit Trust"    THEN
                        BEGIN
                      UnitHolder.GET("Unit Trust Member No");
                      UnitHolder.SETRANGE(UnitHolder."Date Filter",0D,Date);
                      UnitHolder.CALCFIELDS(UnitHolder."Pension Type",UnitHolder."Pensionable Service",UnitHolder."Employer Normal",UnitHolder.
                      Wrong Expression
                        //MESSAGE('%1',UnitHolder.Revaluations);
                        "Revaluation Release Amount":=ROUND(("No. Of Units"/UnitHolder."Pension Type")*UnitHolder."Employer Normal",0.01);
                          "Cost Reduced":=ROUND(("No. Of Units"/UnitHolder."Pension Type")*UnitHolder."Employer additional",0.01);
                           "Gain/Loss on Disposal":="Cost Reduced"-Amount;
                       //MESSAGE('%1',"Revaluation Release Amount");
                       //MESSAGE('%1',"Cost Reduced");

                        END;

                      //end kugun
                       */



                        if InvestmentRec."Asset Type" = InvestmentRec."asset type"::Property then begin
                            InvestmentRec.CalcFields(InvestmentRec."No.Of Units", InvestmentRec.Revaluations, InvestmentRec."Acquisition Cost");
                            "Revaluation Release Amount" := InvestmentRec.Revaluations;
                            "Cost Reduced" := InvestmentRec."Acquisition Cost";
                            "Gain/(Loss) on Disposal" := "Cost Reduced" - Amount;


                        end;
                    end;
                end;

                if InvestmentRec.Get("Investment No") then begin
                    if InvestmentRec."Asset Type" = InvestmentRec."asset type"::Mortgage then begin
                        InvestmentRec.CalcFields(InvestmentRec."Principal Amount", InvestmentRec."Arrears Principal Amount");

                        if InvestmentRec."Arrears Principal Amount" > 0 then begin
                            "Repayment Arrears" := Amount - InvestmentRec."Expected Repayment";
                            "Capital Amount" := InvestmentRec."Expected Repayment";


                            if PrincipalRepaid(Date, "Investment No") then begin
                                "Repayment Arrears" := Amount - "Interest On Arrears";
                                "Capital Amount" := 0;
                                "Interest Amount" := 0;


                            end;


                        end;




                    end;
                end;



            end;
        }
        field(21; Remarks; Text[100])
        {
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(23; "Fund Code"; Code[20])
        {
            TableRelation = "Fund Code".Code;
        }
        field(24; "Agent Code"; Code[20])
        {
        }
        field(25; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(26; "Custodian Code"; Code[20])
        {
            Caption = 'Custodian Code';
            TableRelation = "Custodian Code".Code;
        }
        field(27; "No. Of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                // IF "Receipt Payment Type"="Receipt Payment Type"::"Unit Trust" THEN BEGIN
                // IF Brokers.GET("Unit Trust Member No") THEN BEGIN
                //
                // Brokers.CALCFIELDS("Pays tax","Non Cash Benefit","Pay Period Filter","Employer Normal");
                // IF "No. Of Units">Brokers."Pays tax" THEN
                //  ERROR('You cannot redeem more units than you have!!');


                // IF  Brokers."Pension Type" >0 THEN
                // "Current unit price":=Brokers."Current Value"/Brokers."No.Of Units" ;
                //"Price Per Share":="Current unit price";
                //VALIDATE("Price Per Share");
                //VALIDATE(Amount);
                //END;

                // END ELSE BEGIN
                //  IF "No. Of Units"<0 THEN
                //  ERROR('You Cannot Sale Negative No. of Shares!!');
                //
                //  // VALIDATE(Amount);
                // END;
                //
                //
                // IF FA.GET("Investment No") THEN BEGIN
                // FA.CALCFIELDS(FA."No.Of Units");
                // //MESSAGE('%1',FA."No.Of Units");
                // IF "No. Of Units">FA."No.Of Units" THEN
                //  ERROR('You cannot redeem more units than you have!!');
                //
                //
                // END;
                // END;
                // "Gross Amount":="No. Of Units"*"Price Per Share";
                // VALIDATE("Price Per Share");
            end;
        }
        field(28; "Investment No"; Code[20])
        {
            TableRelation = "Investment Asset" where("Asset Type" = field("Investment Type"));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
                if FA.Get("Investment No") then begin
                    "Custodian Code" := FA."Custodian Code";
                    "Fund Code" := FA."Fund Code";
                    Broker := FA.Broker;

                    if "Receipt Payment Type" = "receipt payment type"::"Unit Trust" then begin
                        //"No. Of Units":=FA."Minimum Amount"/FA."Initial Unit Price";
                        FA.CalcFields("Current Value", "No.Of Units");
                        if FA."Current Value" = 0 then
                            "Price Per Share" := FA."Initial Unit Price"
                        else
                            "Price Per Share" := FA."Current Value" / FA."No.Of Units";
                    end;

                    if FA."Asset Type" = FA."asset type"::Mortgage then begin
                        "Gross Amount" := FA."Expected Repayment";
                        Validate("Gross Amount");
                    end;
                end;
            end;
        }
        field(29; "Investment Type"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage,"Unit Trust";
        }
        field(30; "Schedule Date"; Date)
        {
            TableRelation = "Expected Interest1"."Expected Interest Date" where("Investment No" = field("Investment No"));
        }
        field(31; "Investment Transcation Type"; Option)
        {
            OptionMembers = ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Principal;
        }
        field(32; "No. Of Units Required"; Boolean)
        {
        }
        field(33; Multiple; Boolean)
        {
        }
        field(34; "Interest Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Interest On Arrears" = 0 then
                    "Capital Amount" := Amount - "Interest Amount"
                else
                    "Capital Amount" := Amount - "Repayment Arrears";
            end;
        }
        field(35; "No. of Days"; Integer)
        {
        }
        field(36; "Interest Subsidy"; Decimal)
        {
        }
        field(37; "Tax Benefit"; Decimal)
        {
        }
        field(38; "Capital Amount"; Decimal)
        {
        }
        field(39; "Revaluation Release Amount"; Decimal)
        {
        }
        field(40; "Gain/(Loss) on Disposal"; Decimal)
        {
        }
        field(41; "Cost Reduced"; Decimal)
        {
        }
        field(42; "Bank Codes"; Code[20])
        {
            // TableRelation = Table50121;
        }
        field(43; "Interest On Arrears"; Decimal)
        {
        }
        field(44; "Repayment Arrears"; Decimal)
        {
        }
        field(45; "Calculate Interest"; Boolean)
        {
        }
        field(46; "Receipt No"; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                /*IF "Receipt No" = '' THEN BEGIN
                  GenLedgerSetup.GET;
                  GenLedgerSetup.TESTFIELD(GenLedgerSetup."Posted Receipts No");
                  NoSeriesMgt.InitSeries(GenLedgerSetup."Posted Receipts No",xRec."No. Series",0D,No,"No. Series");
                END;
                */

            end;
        }
        field(47; "Schedule Mandatory"; Boolean)
        {
        }
        field(48; "Control Ac"; Code[20])
        {
        }
        field(49; "FA Posting Type"; Option)
        {
            OptionMembers = " ","Acquisition Cost",Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2",Disposal,Maintenance;
        }
        field(50; Broker; Code[20])
        {
        }
        field(51; Currency; Code[20])
        {
            TableRelation = Currency;
        }
        field(52; "Commission %"; Decimal)
        {
        }
        field(53; "Withholding Tax %"; Decimal)
        {
        }
        field(54; "Broker Fees"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Gross Amount" <> 0 then
                    Amount := "Gross Amount" - "Broker Fees" - "Withholding Tax %" - "Other Charges" - "Revenue Stamp Fees";
                // VALIDATE(Amount);
            end;
        }
        field(55; "Gross Amount"; Decimal)
        {

            trigger OnValidate()
            begin

                // // "Price Per Share":="Gross Amount"/"No. Of Units";
                // InvestmentSetup.GET;
                // IF Vend.GET(Broker) THEN
                // IF Vend."Commision Percentage">0 THEN
                // "Broker Fees":=(Vend."Commision Percentage"/100)*"Gross Amount";
                //
                // IF InvestmentSetup.GET THEN
                // IF InvestmentSetup."Other Commission Percentage">0 THEN
                // "Other Charges":="Gross Amount"*InvestmentSetup."Other Commission Percentage"/100;
                //
                //
                //  IF RecPayTypes.GET("Receipt Type") THEN
                // IF RecPayTypes."Calculate Withholding Tax" THEN
                //
                // IF InvestmentSetup."Withholding Tax Percentage">0 THEN
                // "Whtax Amount":=(InvestmentSetup."Withholding Tax Percentage"/100)*"Gross Amount";
                // Amount:= "Gross Amount"- "Whtax Amount";
                // Amount:="Gross Amount"-"Broker Fees"-"Whtax Amount"-"Other Charges"-"Revenue Stamp Fees";
                // VALIDATE(Amount);



                /*
                
                IF
                FA.GET("Investment No") THEN BEGIN
                IF
                 FA."Asset Type"= FA."Asset Type"::"Unit Trust" THEN BEGIN
                
                IF Vend.GET("Unit Trust Member No") THEN BEGIN
                     Vend.CALCFIELDS("Balance (LCY)","Acquisition Cost","Acquisition Cost1","Acquisition Cost2");
                       Uninvamt:= Vend."Balance (LCY)"- ( Vend."Acquisition Cost"+ Vend."Acquisition Cost1"+ Vend."Acquisition Cost2");
                  IF Uninvamt<"Gross Amount" THEN BEGIN
                
                
                      ERROR('The Max amount available for Investment is ',Uninvamt);
                     END;
                  END;
                 END;
                END;
                
                */

            end;
        }
        field(56; "Price Per Share"; Decimal)
        {
            DecimalPlaces = 1 : 4;

            trigger OnValidate()
            begin

                FA.Get("Investment No");

                if FA.UnitTrust = false then begin
                    InvestmentSetup.Get;
                    "Gross Amount" := "No. Of Units" * "Price Per Share";
                    if RecPayTypes.Get("Receipt Type") then
                        if RecPayTypes."Calculate Withholding Tax" then
                            "Whtax Amount" := (InvestmentSetup."Withholding Tax Percentage" / "Gross Amount") * "Gross Amount";
                    Amount := "Gross Amount" - "Whtax Amount";
                    //VALIDATE("Gross Amount");
                    Validate(Amount);

                end;

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
                    InvestmentSetup.Get;
                    "Gross Amount" := "No. Of Units" * "Price Per Share";
                    if RecPayTypes.Get("Receipt Type") then
                        if RecPayTypes."Calculate Withholding Tax" then
                            "Whtax Amount" := (InvestmentSetup."Withholding Tax Percentage" / "Gross Amount") * "Gross Amount";
                    Amount := "Gross Amount" - "Whtax Amount";
                    //VALIDATE("Gross Amount");
                    // VALIDATE(Amount);

                end;
            end;
        }
        field(57; "Whtax Amount"; Decimal)
        {
        }
        field(58; "Other Charges"; Decimal)
        {
            DecimalPlaces = 1 : 4;

            trigger OnValidate()
            begin
                /* IF "Gross Amount"<>0 THEN
                 Amount:="Gross Amount"-"Broker Fees"-"Withholding Tax %"-"Other Charges";
                  VALIDATE(Amount);*/

            end;
        }
        field(59; "Share unit price"; Decimal)
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
        field(64; "Receipt Payment Type"; Option)
        {
            OptionCaption = ',Equity,Money Market,Mortgage,property,Unit Trust';
            OptionMembers = ,Equity,"Money Market",Mortgage,property,"Unit Trust";
        }
        field(65; "Unit Trust Member No"; Code[20])
        {
            TableRelation = Vendor where("Payroll Pay Mode" = const('1'));

            trigger OnValidate()
            begin
                // IF Brokers.GET("Unit Trust Member No") THEN BEGIN
                // "Unit Trust Member Name":=Brokers.Name;
                // Brokers.CALCFIELDS("Pays tax","Non Cash Benefit","Pay Period Filter","Employer Normal");
                // END ELSE BEGIN
                // "Unit Trust Member Name":='';
                //
                // END;
            end;
        }
        field(66; "Unit Trust Member Name"; Text[100])
        {
        }
        field(67; UnitTrust; Boolean)
        {
        }
        field(68; "Revenue Stamp Fees"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := "Gross Amount" - "Broker Fees" - "Whtax Amount" - "Other Charges" - "Revenue Stamp Fees";
                Validate(Amount);
            end;
        }
        field(69; "Date fiter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(70; "Percentage Redeem"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Percentage Redeem" > 0 then begin
                    Amount := "Percentage Redeem" / 100 * "Cost-Temp";
                    "Revaluation Gain/(Loss)" := "Percentage Redeem" / 100 * "Revaluation-Temp";
                    "Accrued Interest" := "Percentage Redeem" / 100 * "Accrued Interest-Temp";

                    if InvestmentRec.Get("Investment No") then begin
                        if "Percentage Redeem" < 100 then begin
                            InvestmentRec."Face Value" := (100 - "Percentage Redeem") / 100 * InvestmentRec."Face Value";
                            InvestmentRec.Modify;
                        end else begin
                            InvestmentRec."Face Value" := 0;
                            InvestmentRec.Modify;

                        end;
                    end;
                end;
            end;
        }
        field(71; "Clean Price"; Decimal)
        {
        }
        field(72; "Cum-Interest Purchase"; Decimal)
        {
        }
        field(73; "Revaluation Gain/(Loss)"; Decimal)
        {
        }
        field(74; "Cost-Temp"; Decimal)
        {
        }
        field(75; "Revaluation-Temp"; Decimal)
        {
        }
        field(76; "Disposal Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Gain/(Loss) on Disposal" := -("Disposal Amount" - (Amount + "Revaluation Gain/(Loss)" +
               "Accrued Interest"));
            end;
        }
        field(77; "Accrued Interest"; Decimal)
        {
        }
        field(78; "Accrued Interest-Temp"; Decimal)
        {
        }
        field(79; "Capital Amount LCY"; Decimal)
        {
        }
        field(80; "Revaluation Release Amount LCY"; Decimal)
        {
        }
        field(81; "Gain/(Loss) on Disposal LCY"; Decimal)
        {
        }
        field(82; "Cost Reduced LCY"; Decimal)
        {
        }
        field(83; "Face Value"; Decimal)
        {
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
        field(481; "Post Gain/Loss Redeem"; Boolean)
        {
        }
        field(482; "Gain/(Loss) on TBill Disposal"; Decimal)
        {
        }
        field(483; "Partial Redemption"; Boolean)
        {
        }
        field(484; "Document No"; Code[50])
        {
        }
        field(485; "TBond No"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        // IF No = '' THEN BEGIN
        //  GenLedgerSetup.GET;
        //  GenLedgerSetup.TESTFIELD(GenLedgerSetup."Receipts No");
        //  NoSeriesMgt.InitSeries(GenLedgerSetup."Receipts No",xRec."No. Series",0D,No,"No. Series");
        // END;
        //
        // Date:=TODAY;
        // Cashier:=USERID;
        /*CashierLinks.RESET;
        CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
        IF CashierLinks.FIND('-') THEN BEGIN
        "Branch Code":=CashierLinks."Branch Code";
        END;*/

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
        MortgageRec: Record "Investment Asset";
        LastInterestCalcDate: Date;
        NoOfDays4Calc: Integer;
        InterestCalcDate: Date;
        InterestAmount: Decimal;
        NextmonthStartdate: Date;
        MonthInt: Integer;
        YearInt: Integer;
        InterestSubsidy: Decimal;
        MarketRateInterest: Decimal;
        Invsetup: Record "Investment Setup";
        InvestmentRec: Record "Investment Asset";
        InterestOnArrears: Decimal;
        BankAc: Record "Bank Account";
        InvestmentSetup: Record "Investment Setup";
        Institutions: Record Customer;
        Brokers: Record Vendor;
        "Current unit price": Decimal;
        UnitHolder: Record Vendor;
        X: Decimal;
        Uninvamt: Decimal;
        AmountInvested: Decimal;
        FA2: Record "Investment Asset";
        RemainingAmt: Decimal;
        Payments: Record Payments1;
        DimMgt: Codeunit DimensionManagement;


    procedure CalculateInterest() InterestAmt: Decimal
    var
        ExpectedInterest: Record "Expected Interest1";
    begin
        // //Find the last Date when the interest was calculated and posted; if no interest has been calculated make the date issued to be
        // //last interest date
        // InterestCalcDate:=Date;
        //
        // IF MortgageRec.GET("Investment No") THEN
        // BEGIN
        // IF MortgageRec."Asset Type"=MortgageRec."Asset Type"::Mortgage THEN
        // BEGIN
        //
        //
        //
        // IF MortgageRec."Interest Calculation Based"=MortgageRec."Interest Calculation Based"::Daily THEN
        // ExpectedInterest.RESET;
        // //ExpectedInterest.SETCURRENTKEY(ExpectedInterest."Posting Date",ExpectedInterest."Document No.");
        // //ExpectedInterest.SETRANGE(ExpectedInterest."Investment Code","Investment No");
        // ExpectedInterest.SETRANGE(ExpectedInterest.Reversed,FALSE);
        // ExpectedInterest.SETFILTER(ExpectedInterest.Amount,'>%1',0);
        // ExpectedInterest.SETRANGE(ExpectedInterest."Investment Transcation Type",ExpectedInterest."Investment Transcation Type"::"3");
        //
        // IF ExpectedInterest.FIND('+') THEN
        // LastInterestCalcDate:=ExpectedInterest."Posting Date";
        // MonthInt:=DATE2DMY(Date,2);
        // YearInt:= DATE2DMY(Date,3);
        //
        //
        // IF LastInterestCalcDate=0D THEN
        // LastInterestCalcDate:= DMY2DATE(1,MonthInt,YearInt);
        //
        // MESSAGE('Last interest date=%1',LastInterestCalcDate);
        //
        // {
        //
        // MonthInt:=DATE2DMY(MortgageRec."Investment Date",2);
        // YearInt:= DATE2DMY(MortgageRec."Investment Date",3);
        //
        // }
        //
        //
        //
        // IF MonthInt=12 THEN
        // BEGIN
        // MonthInt:=1;
        // YearInt:=YearInt+1;
        // END
        // ELSE
        // MonthInt:=MonthInt+1;
        //
        // NextmonthStartdate:=DMY2DATE(1,MonthInt,YearInt);
        //
        // //IF LastInterestCalcDate<NextmonthStartdate THEN
        // //LastInterestCalcDate:=NextmonthStartdate-1;
        // InterestCalcDate:=Date;
        // NoOfDays4Calc:=(InterestCalcDate-LastInterestCalcDate)+1;
        //
        //
        // MortgageRec.SETRANGE("Date Filter",0D,Date-1);
        // MortgageRec.CALCFIELDS(MortgageRec."Principal Amount");
        // IF MortgageRec."Principal Amount">0 THEN
        // InterestAmt:=ROUND((NoOfDays4Calc/365)*(MortgageRec."Rate %"/100)*MortgageRec."Principal Amount",1);
        // MESSAGE(' %1 Interest amount=%2',MortgageRec."Principal Amount",InterestAmt);
        // Invsetup.GET;
        // MarketRateInterest:=ROUND((NoOfDays4Calc/365)*(Invsetup."Market Mortgage Interest Rate"/100)*MortgageRec."Principal Amount",1);
        // "Interest Amount":=InterestAmt;
        // InterestSubsidy:=MarketRateInterest-InterestAmt;
        // "Interest Subsidy":=InterestSubsidy;
        //
        // END;
        // END;
        //
        // IF MortgageRec."Interest Calculation Based"=MortgageRec."Interest Calculation Based"::Monthly THEN
        // BEGIN
        // MonthInt:=DATE2DMY(MortgageRec."Investment Date",2);
        // YearInt:= DATE2DMY(MortgageRec."Investment Date",3);
        //
        //
        //
        // IF MonthInt=12 THEN
        // BEGIN
        // MonthInt:=1;
        // YearInt:=YearInt+1;
        // END
        // ELSE
        // MonthInt:=MonthInt+1;
        //
        // NextmonthStartdate:=DMY2DATE(1,MonthInt,YearInt);
        //
        // IF Date>=NextmonthStartdate THEN
        // BEGIN
        // MortgageRec.CALCFIELDS(MortgageRec."Principal Amount");
        // InterestAmt:=ROUND(((MortgageRec."Rate %"/100)/12)*MortgageRec."Principal Amount",1);
        // "Interest Amount":=InterestAmt;
        // END;
        // END;
        //
        //
        // IF MortgageRec."Mortgage Type"=MortgageRec."Mortgage Type"::Commercial THEN
        // "Interest Subsidy":=0;
        //
        //
        // //END;
        //
        //
        //
        //
        //
        // IF MortgageRec.GET("Investment No") THEN
        // BEGIN
        //
        // IF MortgageRec."Asset Type"=MortgageRec."Asset Type"::"Money Market" THEN
        // BEGIN
        // IF "Investment Transcation Type"="Investment Transcation Type"::Disposal THEN
        // BEGIN
        //
        // IF MortgageRec."Interest Calculation Based"=MortgageRec."Interest Calculation Based"::Daily THEN
        // BEGIN
        // ExpectedInterest.RESET;
        // //ExpectedInterest.SETFILTER(ExpectedInterest."G/L Account No.",'%1','3-660-01-001..3-660-01-002');
        // ExpectedInterest.SETRANGE(ExpectedInterest."Investment Code","Investment No");
        // ExpectedInterest.SETRANGE(ExpectedInterest.Reversed,FALSE);
        // ExpectedInterest.SETFILTER(ExpectedInterest.Amount,'<%1',0);
        // //IF ExpectedInterest.FIND('+') THEN
        // //LastInterestCalcDate:=ExpectedInterest."Posting Date";
        //
        //
        // IF LastInterestCalcDate=0D THEN
        // LastInterestCalcDate:= MortgageRec."Investment Date";
        // Invsetup.GET;
        //
        // NoOfDays4Calc:=(InterestCalcDate-LastInterestCalcDate);
        // //MESSAGE('%1..%2',InterestCalcDate,LastInterestCalcDate);
        // MortgageRec.CALCFIELDS(MortgageRec."Acquisition Cost");
        // InterestAmt:=ROUND((NoOfDays4Calc/Invsetup."Calendar Days")*(MortgageRec."Rate %"/100)*MortgageRec."Acquisition Cost",1);
        // //MESSAGE('nO OF DAYS=%1 AND COST=%2',NoOfDays4Calc,MortgageRec."Acquisition Cost");
        // //Invsetup.GET;
        // //MarketRateInterest:=ROUND((NoOfDays4Calc/365)*(Invsetup."Market Mortgage Interest Rate"/100)*MortgageRec."Principal Amount",1);
        //
        //
        // "Interest Amount":=InterestAmt;
        // //InterestSubsidy:=MarketRateInterest-InterestAmt;
        // //"Interest Subsidy":=InterestSubsidy;
        //
        // END;
        //
        // END;
        // END;
        // END;
    end;


    procedure CalculateInterestOnArrears() InterestOnArrears: Decimal
    var
        ExpectedInterest: Record "G/L Entry";
    begin
        //Find the last Date when the interest was calculated and posted; if no interest has been calculated make the date issued to be
        //last interest date
        // InterestCalcDate:=Date;
        //
        // IF MortgageRec.GET("Investment No") THEN
        // BEGIN
        // IF MortgageRec."Asset Type"=MortgageRec."Asset Type"::Mortgage THEN
        // BEGIN
        //
        //
        //
        // IF MortgageRec."Interest Calculation Based"=MortgageRec."Interest Calculation Based"::Daily THEN
        //
        // ExpectedInterest.RESET;
        // ExpectedInterest.SETFILTER(ExpectedInterest."G/L Account No.",'1%..%2','3-660-01-001..3-660-01-002');
        // ExpectedInterest.SETRANGE(ExpectedInterest."Investment Code","Investment No");
        // ExpectedInterest.SETRANGE(ExpectedInterest.Reversed,FALSE);
        // ExpectedInterest.SETFILTER(ExpectedInterest.Amount,'<%1',0);
        // IF ExpectedInterest.FIND('+') THEN
        // LastInterestCalcDate:=ExpectedInterest."Posting Date";
        // BEGIN
        // IF LastInterestCalcDate=0D THEN
        // LastInterestCalcDate:= MortgageRec."Investment Date";
        //
        //
        // MonthInt:=DATE2DMY(MortgageRec."Investment Date",2);
        // YearInt:= DATE2DMY(MortgageRec."Investment Date",3);
        //
        //
        //
        // IF MonthInt=12 THEN
        // BEGIN
        // MonthInt:=1;
        // YearInt:=YearInt+1;
        // END
        // ELSE
        // MonthInt:=MonthInt+1;
        //
        // NextmonthStartdate:=DMY2DATE(1,MonthInt,YearInt);
        //
        // IF LastInterestCalcDate<NextmonthStartdate THEN
        // LastInterestCalcDate:=NextmonthStartdate-1;
        //
        // IF Date>=NextmonthStartdate THEN
        //
        // BEGIN
        // NoOfDays4Calc:=(InterestCalcDate-LastInterestCalcDate);
        // MortgageRec.CALCFIELDS(MortgageRec."Principal Amount",MortgageRec."Arrears Principal Amount");
        //
        // IF MortgageRec."Arrears Principal Amount">0 THEN
        // InterestOnArrears:=ROUND((NoOfDays4Calc/365)*(MortgageRec."Rate %"/100)*MortgageRec."Arrears Principal Amount",1);
        // "Interest On Arrears":=InterestOnArrears;
        //
        //
        //
        // {Invsetup.GET;
        // MarketRateInterest:=ROUND((NoOfDays4Calc/365)*(Invsetup."Market Mortgage Interest Rate"/100)*
        // MortgageRec."Arrears Principal Amount",1);
        //
        //
        // "Interest Amount":=InterestOnArrears;
        // InterestSubsidy:=MarketRateInterest-InterestOnArrears;
        // "Interest Subsidy":=InterestSubsidy;}
        //
        // END;
        // END;
        //
        // IF MortgageRec."Interest Calculation Based"=MortgageRec."Interest Calculation Based"::Monthly THEN
        // BEGIN
        // MonthInt:=DATE2DMY(MortgageRec."Investment Date",2);
        // YearInt:= DATE2DMY(MortgageRec."Investment Date",3);
        //
        //
        //
        // IF MonthInt=12 THEN
        // BEGIN
        // MonthInt:=1;
        // YearInt:=YearInt+1;
        // END
        // ELSE
        // MonthInt:=MonthInt+1;
        //
        // NextmonthStartdate:=DMY2DATE(1,MonthInt,YearInt);
        // //MESSAGE('Next month start=%1',NextmonthStartdate);
        // IF Date>=NextmonthStartdate THEN
        // BEGIN
        // MortgageRec.CALCFIELDS(MortgageRec."Principal Amount");
        // InterestOnArrears:=ROUND(((MortgageRec."Rate %"/100)/12)*MortgageRec."Principal Amount",1);
        // "Interest On Arrears":=InterestOnArrears;
        // END;
        // END;
        //
        //
        // IF MortgageRec."Mortgage Type"=MortgageRec."Mortgage Type"::Commercial THEN
        // "Interest Subsidy":=0;
        //
        //
        // END;
        // END;
        //
        //
        //
        //
        // IF MortgageRec.GET("Investment No") THEN
        // BEGIN
        //
        // IF MortgageRec."Asset Type"=MortgageRec."Asset Type"::"Money Market" THEN
        // BEGIN
        // IF "Investment Transcation Type"="Investment Transcation Type"::Disposal THEN
        // BEGIN
        //
        // IF MortgageRec."Interest Calculation Based"=MortgageRec."Interest Calculation Based"::Daily THEN
        // ExpectedInterest.RESET;
        // ExpectedInterest.SETFILTER(ExpectedInterest."G/L Account No.",'%1','3-660-01-001..3-660-01-002');
        // ExpectedInterest.SETRANGE(ExpectedInterest."Investment Code","Investment No");
        // ExpectedInterest.SETRANGE(ExpectedInterest.Reversed,FALSE);
        // ExpectedInterest.SETFILTER(ExpectedInterest.Amount,'<%1',0);
        // IF ExpectedInterest.FIND('+') THEN
        // LastInterestCalcDate:=ExpectedInterest."Posting Date";
        //
        // IF LastInterestCalcDate=0D THEN
        // LastInterestCalcDate:= MortgageRec."Investment Date";
        // NoOfDays4Calc:=(InterestCalcDate-LastInterestCalcDate);
        // MortgageRec.CALCFIELDS(MortgageRec."Acquisition Cost");
        // //InterestAmt:=ROUND((NoOfDays4Calc/365)*(MortgageRec."Rate %"/100)*MortgageRec."Acquisition Cost");
        // //Invsetup.GET;
        // //MarketRateInterest:=ROUND((NoOfDays4Calc/365)*(Invsetup."Market Mortgage Interest Rate"/100)*MortgageRec."Principal Amount",1);
        //
        //
        // //"Interest Amount":=InterestAmt;
        // //InterestSubsidy:=MarketRateInterest-InterestAmt;
        // //"Interest Subsidy":=InterestSubsidy;
        //
        // END;
        //
        // END;
        // END;
    end;


    procedure PrincipalRepaid(var PaymentDate: Date; var InvestmentCode: Code[20]) Paid: Boolean
    var
        GLEntry: Record "G/L Entry";
        mindate: Date;
        maxdate: Date;
    begin
        mindate := Dmy2date(1, Date2dmy(PaymentDate, 2), Date2dmy(PaymentDate, 3));
        maxdate := CalcDate('1M', mindate) - 1;
        //MESSAGE('%1..%2',mindate,maxdate);
        if InvestmentRec.Get(InvestmentCode) then begin
            InvestmentRec.SetRange(InvestmentRec."Date Filter", mindate, maxdate);
            InvestmentRec.CalcFields(InvestmentRec."Principal Amount");
            if InvestmentRec."Expected Repayment" = 0 then
                Error('You must specify expected repayment for mortgage %1- %2', InvestmentRec."No.", InvestmentRec.Description);

            if Abs(InvestmentRec."Principal Amount") >= InvestmentRec."Expected Repayment" then
                Paid := true
            else
                Paid := false;



        end;
    end;


    procedure EndYear(var PostDate: Date) EndYearDate: Date
    var
        Year: Integer;
    begin
        Year := Date2dmy(PostDate, 3);
        Year := Year - 1;
        Evaluate(EndYearDate, '3112' + Format(Year));
        //MESSAGE('%1',EndYearDate);
    end;
}

