#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// Table Investment Asset (ID 54001).
/// </summary>
Table 54001 "Investment Asset"
{
    Caption = 'Investment Asset';
    DataCaptionFields = "No.", Description;
    DrillDownPageID = "Investment Asset List";
    LookupPageID = "Investment Asset List";
    Permissions = TableData "Ins. Coverage Ledger Entry" = r;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    FASetup.Get;
                    NoSeriesMgt.TestManual(FASetup."Fixed Asset Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            var
                FADeprBook: Record "FA Depreciation Book";
            begin
                if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
                    "Search Description" := Description;
                if Description <> xRec.Description then begin
                    FADeprBook.SetCurrentkey("FA No.");
                    FADeprBook.SetRange("FA No.", "No.");
                    FADeprBook.ModifyAll(Description, Description);
                end;
            end;
        }
        field(3; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(4; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
        }
        field(5; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";

            trigger OnValidate()
            var
                FASubclass: Record "FA Subclass";
            begin
                if "FA Subclass Code" = '' then
                    exit;

                FASubclass.Get("FA Subclass Code");
                if not (FASubclass."FA Class Code" in ['', "FA Class Code"]) then
                    "FA Subclass Code" := '';
            end;
        }
        field(6; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";

            trigger OnValidate()
            var
                FASubclass: Record "FA Subclass";
            begin
                FASubclass.Get("FA Subclass Code");
                if "FA Class Code" <> '' then begin
                    if FASubclass."FA Class Code" in ['', "FA Class Code"] then
                        exit;

                    Error(UnexpctedSubclassErr);
                end;

                Validate("FA Class Code", FASubclass."FA Class Code");
            end;
        }
        field(7; "Fund Code"; Code[20])
        {
            Caption = 'Fund Code';
            TableRelation = "Fund Code".Code;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                //ShowDocDim;
                if FundCode.Get("Fund Code") then begin
                    DefaultDIm.Reset;
                    DefaultDIm.SetRange("No.", FundCode.Code);
                    if DefaultDIm.FindSet then begin
                        if DefaultDIm1.Get(54001, "No.", DefaultDIm."Dimension Code") = false then begin
                            DefaultDIm1.Init;
                            DefaultDIm1."Table ID" := 54001;
                            DefaultDIm1."No." := "No.";
                            DefaultDIm1."Dimension Code" := DefaultDIm."Dimension Code";
                            DefaultDIm1."Dimension Value Code" := DefaultDIm."Dimension Value Code";
                            DefaultDIm1.Insert(true);
                        end else begin
                            DefaultDIm1."Dimension Value Code" := DefaultDIm."Dimension Value Code";
                            DefaultDIm1.Modify(true);
                        end;
                    end;
                    CreateDim(
                      DimMgt.TypeToTableID1(1), "No.",
                      DimMgt.TypeToTableID1(1), '',
                      Database::"Investment Asset", "No.", Database::"Investment Asset", "No.",
                      Database::"Investment Asset", "No.");
                end;
            end;
        }
        field(8; "Custodian Code"; Code[20])
        {
            Caption = 'Custodian Code';
            TableRelation = "Custodian Code".Code;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                //ShowDocDim;
                if CustodianCode.Get("Custodian Code") then begin
                    DefaultDIm.Reset;
                    DefaultDIm.SetRange("No.", CustodianCode.Code);
                    if DefaultDIm.FindSet then begin
                        if DefaultDIm1.Get(54001, "No.", DefaultDIm."Dimension Code") = false then begin
                            DefaultDIm1.Init;
                            DefaultDIm1."Table ID" := 54001;
                            DefaultDIm1."No." := "No.";
                            DefaultDIm1."Dimension Code" := DefaultDIm."Dimension Code";
                            DefaultDIm1."Dimension Value Code" := DefaultDIm."Dimension Value Code";
                            DefaultDIm1.Insert(true);
                        end else begin
                            DefaultDIm1."Dimension Value Code" := DefaultDIm."Dimension Value Code";
                            DefaultDIm1.Modify(true);
                        end;
                    end;
                    CreateDim(
                   DimMgt.TypeToTableID1(1), "No.",
                   DimMgt.TypeToTableID1(1), '',
                   Database::"Investment Asset", "No.", Database::"Investment Asset", "No.",
                   Database::"Investment Asset", "No.");

                end;
            end;
        }
        field(9; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(10; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
        }
        field(11; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(12; "Main Asset/Component"; Option)
        {
            Caption = 'Main Asset/Component';
            Editable = false;
            OptionCaption = ' ,Main Asset,Component';
            OptionMembers = " ","Main Asset",Component;
        }
        field(13; "Component of Main Asset"; Code[20])
        {
            Caption = 'Component of Main Asset';
            Editable = false;
            TableRelation = "Fixed Asset";
        }
        field(14; "Budgeted Asset"; Boolean)
        {
            Caption = 'Budgeted Asset';

            trigger OnValidate()
            begin
                //FAMoveEntries.ChangeBudget(Rec);
            end;
        }
        field(15; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
        }
        field(16; "Responsible Employee"; Code[20])
        {
            Caption = 'Responsible Employee';
            TableRelation = Employee;
        }
        field(17; "Serial No."; Text[30])
        {
            Caption = 'Serial No.';
        }
        field(18; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(19; Insured; Boolean)
        {
            CalcFormula = exist("Ins. Coverage Ledger Entry" where("FA No." = field("No."),
                                                                    "Disposed FA" = const(false)));
            Caption = 'Insured';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; Comment; Boolean)
        {
            CalcFormula = exist("Comment Line" where("Table Name" = const("Fixed Asset"),
                                                      "No." = field("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(22; Picture; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(23; "Maintenance Vendor No."; Code[20])
        {
            Caption = 'Maintenance Vendor No.';
            TableRelation = Vendor;
        }
        field(24; "Under Maintenance"; Boolean)
        {
            Caption = 'Under Maintenance';
        }
        field(25; "Next Service Date"; Date)
        {
            Caption = 'Next Service Date';
        }
        field(26; Inactive; Boolean)
        {
            Caption = 'Inactive';
        }
        field(27; "FA Posting Date Filter"; Date)
        {
            Caption = 'FA Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(28; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(29; "FA Posting Group"; Code[20])
        {
            Caption = 'FA Posting Group';
            TableRelation = "FA Posting Group";
        }
        field(30; Acquired; Boolean)
        {
            CalcFormula = exist("FA Depreciation Book" where("FA No." = field("No."),
                                                              "Acquisition Date" = filter(<> '')));
            Caption = 'Acquired';
            FieldClass = FlowField;
        }
        field(31; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(32; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;
            end;

            trigger OnValidate()
            begin
                //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
            end;
        }
        field(50000; User; Text[150])
        {
        }
        field(50001; "Description 3"; Text[50])
        {
        }
        field(50002; "Serial Number"; Text[100])
        {
        }
        field(50003; Floor; Text[100])
        {
        }
        field(50004; Department; Text[50])
        {
        }
        field(50005; "Date of purchase"; Date)
        {
        }
        field(50006; "Default VAT Code"; Code[20])
        {
        }
        field(50007; "Default Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tarriff Codes";
        }
        field(50008; "LR Number"; Code[100])
        {
        }
        field(50009; "Holding Type"; Option)
        {
            OptionMembers = " ",Leasehold,Freehold;
        }
        field(50010; Property; Boolean)
        {
        }
        field(50011; "Leasehold Period"; DateFormula)
        {
        }
        field(50012; "Real Estate Manager"; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if VendorRec.Get("Real Estate Manager") then begin
                    "Real Estate Manager Name" := VendorRec.Name;
                end;
            end;
        }
        field(50013; "Real Estate Manager Name"; Text[50])
        {
        }
        field(50014; Address; Text[30])
        {
        }
        field(50015; "Address 2"; Text[30])
        {
        }
        field(50016; City; Text[30])
        {
        }
        field(50017; Use; Option)
        {
            OptionMembers = " ",Commercial,Residential;
        }
        field(50018; Value; Decimal)
        {
            Editable = false;
        }
        field(50019; "Mortgage Type"; Option)
        {
            OptionMembers = Commercial,Staff;
        }
        field(50020; "Mortgage Term"; DateFormula)
        {

            trigger OnValidate()
            begin
                // "No. Of Interest Periods":="Mortgage Term"*12;
            end;
        }
        field(50021; "Expected Repayment"; Decimal)
        {
        }
        field(50023; "Investment Type"; Code[20])
        {
            TableRelation = "Investment Type" where(Type = field("Asset Type"));

            trigger OnValidate()
            begin
                if InvestmentType.Get("Investment Type") then begin
                    "Investment Type Name" := InvestmentType.Description;
                    if InvestmentType."Interest Rate p.a" <> 0 then
                        "Rate %" := InvestmentType."Interest Rate p.a";
                    "Interest Frequency Period" := InvestmentType."Repayment Frequency";
                    "Grace Period" := InvestmentType."Grace Period";
                end;
            end;
        }
        field(50024; "Interest Frequency Period"; DateFormula)
        {
        }
        field(50025; "Maturity Date"; Date)
        {

            trigger OnValidate()
            begin
                /*
                   "Maturity Period Days":="Maturity Date"-"Investment Date";
              MODIFY;
              */

            end;
        }
        field(50026; "Investment Date"; Date)
        {

            trigger OnValidate()
            begin
                /* IF "Asset Type"="Asset Type"::Mortgage THEN
                 BEGIN
                 IF "Date of Birth"=0D THEN
                 ERROR('You must specify the mortgagee birth date');
                 NextBirthDay:="Date of Birth";
                  REPEAT
                  NextBirthDay:=CALCDATE('1Y',NextBirthDay);
                  Age:=Age+1;
                  UNTIL NextBirthDay>="Investment Date";
                  "Age Next BirthDay":=Age;


                 IF InvestmentSetup.GET THEN
                // MESSAGE('%1 %2',InvestmentSetup."Retirement Age",Age);
                "No. Of Interest Periods":=(InvestmentSetup."Retirement Age"-Age)*12;





                    END;


                { IF "Rate %"= 0 THEN
                BEGIN

                IF "No. Of Interest Periods"<>0 THEN


                 "Expected Repayment":= ROUND("Principal Amount"/ "No. Of Interest Periods",0.0001,'>')
                 ELSE
                  "Expected Repayment" := ROUND(DebtService("Principal Amount","Rate %", "No. Of Interest Periods"),0.0001,'>');

                END;
               END
               ELSE
               ERROR('No. Of Interest Periods must be greater than Zero!');

               //"Expected Repayment":="No. Of Interest Periods"*Repayment;


               //Flat Rate
               //
                   }
               {//IF LoanType."Interest Calculation Method" =LoanType."Interest Calculation Method"::"Flat Rate" THEN
               IF "Interest Calculation Method" ="Interest Calculation Method"::"Flat Rate" THEN

                BEGIN
                  Repayment:=ROUND(("Approved Amount"/Installments)+FlatRateCalc("Approved Amount",Interest),0.01,'>');
                  "Flat rate Interest":=ROUND(FlatRateCalc("Approved Amount",Interest),0.01,'>');
                  "Flat Rate Principal":=Repayment-"Flat rate Interest";
                END;} */

            end;
        }
        field(50027; "Maturity Period"; Integer)
        {

            trigger OnValidate()
            begin
                InvestmentSetup.Get;

                if "Issue Date" <> 0D then begin
                    NoOfDays := "Maturity Period" * InvestmentSetup."CBK Year Days";
                    "Maturity Period Days" := "Maturity Period" * InvestmentSetup."CBK Year Days";


                    NofDaysTxt := Format(NoOfDays) + 'D';
                    "Maturity Date" := CalcDate(NofDaysTxt, "Issue Date");
                    "No. Of Interest Periods" := "Maturity Period" * 2;
                end;
            end;
        }
        field(50028; "No. Of Interest Periods"; Integer)
        {

            trigger OnValidate()
            begin
                Validate("Rate %");
            end;
        }
        field(50029; "Bonus Frequency Period"; DateFormula)
        {
        }
        field(50030; "Investment Type Name"; Text[50])
        {
            Editable = false;
        }
        field(50050; "No.Of Units"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50051; "Asset Type"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage,"Unit Trust";
        }
        field(50052; "Interest Rate Type"; Option)
        {
            OptionMembers = " ","Fixed",Floating;
        }
        field(50053; "Acquisition Cost"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50054; "Rate %"; Decimal)
        {
            DecimalPlaces = 3 : 8;
            MaxValue = 100;

            trigger OnValidate()
            begin
                /*IF "Asset Type"="Asset Type"::Mortgage THEN BEGIN
               //result:=5000000*(0.008333333/(1-(POWER(1.008333333,-120))));
                 MonthlyRate:=ROUND((("Rate %"/100)/12),0.000000001);
               "Expected Repayment":="Loan Amount"*(MonthlyRate/(1-(POWER((1+MonthlyRate),(-1*"No. Of Interest Periods")))));
               "Payments Over Term":="Expected Repayment"*"No. Of Interest Periods";
               "Interest Over Term":="Payments Over Term"-"Loan Amount";
                END;

               IF Receipts.GET(Receipts."Investment No") THEN
               BEGIN
               IF "No.Of Units"<Receipts."No. Of Units" THEN
               ERROR('You cannot sale more than what you have');
               END;*/

            end;
        }
        field(50055; "Issue Date"; Date)
        {
        }
        field(50056; "Date Placed"; Date)
        {
        }
        field(50057; "Term (Days)"; DateFormula)
        {
        }
        field(50058; "Repricing Intervals"; DateFormula)
        {
        }
        field(50059; "Last Repricing Date"; DateFormula)
        {
        }
        field(50060; "Purchase Type"; Option)
        {
            OptionMembers = " ",Primary,Secondary;
        }
        field(50061; "Primary Code Link"; Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(50062; "Opening No Of Units"; Decimal)
        {
        }
        field(50063; "Customer A/C No"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50064; "Disposal Value"; Decimal)
        {
            CalcFormula = - sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                         "Investment Transcation Type" = const(Disposal),
                                                         "Posting Date" = field("Date Filter"),
                                                         "GL Type" = const(Acquisition)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50065; Revaluations; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "Investment Transcation Type" = filter(Revaluation),
                                                        "GL Type" = filter(Acquisition | Revaluation),
                                                        "AC Type" = const("Balance Sheet"),
                                                        Reversed = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50066; "Interest Received"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "Investment Transcation Type" = filter(Acquisition),
                                                        "AC Type" = const("Income Statement"),
                                                        "GL Type" = const(Interest)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50067; "Dividend Received"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "GL Type" = const(Dividend)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50068; Balance; Decimal)
        {
        }
        field(50069; Premium; Decimal)
        {
        }
        field(50070; Discounts; Decimal)
        {
            FieldClass = Normal;
        }
        field(50071; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50072; "Date of Birth"; Date)
        {
        }
        field(50073; "Age Next BirthDay"; Integer)
        {
        }
        field(50074; "Grace Period"; DateFormula)
        {
        }
        field(50075; "Deposit Amount"; Decimal)
        {
        }
        field(50076; "Principal Amount"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "GL Type" = const(Acquisition)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50077; "Interest Calculation Based"; Option)
        {
            OptionMembers = " ",Daily,Monthly;
        }
        field(50078; "Current Value"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "Investment Transcation Type" = filter(Acquisition | Revaluation | Disposal | Interest),
                                                        "GL Type" = filter(Acquisition | Revaluation),
                                                        Reversed = const(false),
                                                        "AC Type" = const("Balance Sheet")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50079; "Arrears Principal Amount"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Transcation Type" = const(Contribution),
                                                        "Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "G/L Account No." = filter('3-660-01-002')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50080; "Investment Posting Group"; Code[20])
        {
            TableRelation = "Investment Posting Group";
        }
        field(50081; "Bonus Units"; Decimal)
        {
            CalcFormula = sum("G/L Entry"."No. Of Units" where("Posting Date" = field("Date Filter"),
                                                                "Investment Code" = field("No."),
                                                                "Investment Transcation Type" = const(Bonus)));
            FieldClass = FlowField;
        }
        field(50082; "Share Split"; Decimal)
        {
            CalcFormula = sum("G/L Entry"."No. Of Units" where("Posting Date" = field("Date Filter"),
                                                                "Investment Code" = field("No."),
                                                                "Investment Transcation Type" = const("Share-split"),
                                                                "GL Type" = const(Acquisition)));
            FieldClass = FlowField;
        }
        field(50083; "Acq. No. shares"; Decimal)
        {
            CalcFormula = sum("G/L Entry"."No. Of Units" where("Posting Date" = field("Date Filter"),
                                                                "Investment Code" = field("No."),
                                                                "Investment Transcation Type" = const(Acquisition),
                                                                "GL Type" = filter(Acquisition),
                                                                Reversed = const(false)));
            FieldClass = FlowField;
        }
        field(50084; "Disposal No. of Units"; Decimal)
        {
            CalcFormula = - sum("G/L Entry"."No. Of Units" where("Posting Date" = field("Date Filter"),
                                                                 "Investment Code" = field("No."),
                                                                 "Investment Transcation Type" = const(Disposal),
                                                                 "GL Type" = filter(Acquisition),
                                                                 Reversed = const(false)));
            FieldClass = FlowField;
        }
        field(50085; Cost; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50086; "Gain/(Loss) on Disposal"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50087; "FDR Number"; Code[20])
        {
            TableRelation = "Money Markets listings";

            trigger OnValidate()
            begin
                if MMList.Get("FDR Number") then begin
                    "Issue Date" := MMList."Issue Date";
                    "Investment Date" := MMList."Issue Date";
                    "Maturity Date" := MMList."Maturity Date";
                    "Rate %" := MMList."Coupon Rate";
                    if "Maturity Date" <> 0D then
                        Validate("Maturity Date");
                end;
            end;
        }
        field(50088; "Maturity Period Days"; Integer)
        {

            trigger OnValidate()
            begin
                if "Investment Date" <> 0D then
                    "Maturity Date" := CalcDate(Format("Maturity Period Days") + 'D', "Investment Date")
                else
                    Error('Please key investment date');
            end;
        }
        field(50089; "Accrued Interest"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Investment Transcation Type" = filter(Interest),
                                                        "Posting Date" = field("Date Filter"),
                                                        "AC Type" = const("Balance Sheet"),
                                                        "GL Type" = filter(Acquisition | Interest | Discounts)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50090; "Interest at purchase"; Decimal)
        {
        }
        field(50091; "Valuation Method"; Option)
        {
            OptionMembers = "Armortised Cost","Fair Value";
        }
        field(50092; Additions; Decimal)
        {
            FieldClass = Normal;
        }
        field(50093; "Mortgage Balance"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "G/L Account No." = filter('3-660-01-001')));
            FieldClass = FlowField;
        }
        field(50094; "RBA Class"; Code[20])
        {
            NotBlank = true;
            TableRelation = "RBA Compliance";
        }
        field(50095; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(50096; "Cost Forex"; Decimal)
        {
            CalcFormula = - sum("Bank Account Ledger Entry".Amount where //(Field50004=field("No."),
                                                                        ("Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50097; Institution; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Cust.Get(Institution) then begin
                    Description := Cust.Name;
                    Address := Cust.Address;
                    "Address 2" := Cust."Address 2";
                    City := Cust.City;
                end;
            end;
        }
        field(50098; "Updated Unit Cost"; Decimal)
        {
        }
        field(50099; "Gross Interest"; Decimal)
        {
            CalcFormula = - sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                         "Investment Transcation Type" = filter(Interest),
                                                         "GL Type" = const(Interest),
                                                         "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50100; "Unit value"; Decimal)
        {
        }
        field(50101; "Total Units"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50102; "Total Units Cost"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50103; "Unit Trust"; Code[10])
        {
            TableRelation = "Fixed Asset" where("Asset Type" = const("Unit Trust"));
        }
        field(50104; Type; Option)
        {
            Editable = true;
            OptionCaption = ',Equity,Money Market,Growth';
            OptionMembers = ,Equity,"Money Market",Growth;
        }
        field(50105; UnitTrust; Boolean)
        {
        }
        field(50106; Broker; Code[20])
        {
            TableRelation = Vendor where("Vendor Type1" = const(Broker));
        }
        field(50107; "Loan Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Rate %");
            end;
        }
        field(50108; "Interest Over Term"; Decimal)
        {
        }
        field(50109; "Payments Over Term"; Decimal)
        {
        }
        field(50110; "Mortgage Interest Received"; Decimal)
        {
            CalcFormula = - sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                         "Posting Date" = field("Date Filter"),
                                                         "Investment Transcation Type" = const(Contribution),
                                                         "GL Type" = const(Interest)));
            FieldClass = FlowField;
        }
        field(50111; "Principal Amount paid"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "GL Type" = const(Acquisition),
                                                        "Investment Transcation Type" = const(Acquisition)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50112; "Purchase Link"; Code[20])
        {
            TableRelation = "Receipts and Payment Types" where(Type = const(Payment));
        }
        field(50113; "Sale Link"; Code[20])
        {
            TableRelation = "Receipts and Payment Types" where(Type = const(Receipt));
        }
        field(50114; "Interest Link"; Code[20])
        {
            TableRelation = "Receipts and Payment Types" where(Type = const(Receipt));
        }
        field(50115; "Interest Received1"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50116; "Initial Unit Price"; Decimal)
        {
        }
        field(50117; "Minimum Amount"; Decimal)
        {
        }
        field(50118; "Value Date"; Date)
        {

            trigger OnValidate()
            begin
                InvestmentSetup.Get;
                "Days to Maturity" := "Maturity Date" - "Value Date";
                "Days Held" := "Value Date" - "Issue Date";

                Modify;
                if InvestmentSetup."CBK Year Days" <> 0 then begin
                    "Years to Maturity" := "Days to Maturity" / InvestmentSetup."CBK Year Days";
                    "No. Of Coupons Paid" := ROUND("Days Held" / InvestmentSetup."CBK 6months Days", 1, '<');
                    //"No. Of Int. Payments Remaining":= ROUND("Days to Maturity"/InvestmentSetup."CBK 6months Days",1,'<');
                    "No.OfFullPeriodsRemain" := "No. Of Interest Periods" - "No. Of Coupons Paid";

                    Paydate := (Format("No. Of Coupons Paid" * 182) + 'D');
                    LastCouponPayDate := CalcDate(Paydate, "Issue Date");
                    Message('%1', LastCouponPayDate);

                    ElapsedDays := "Value Date" - LastCouponPayDate;
                    Message('%1', ElapsedDays);
                    Frac := (182 - ElapsedDays) / 182;
                    "No. Of Int. Payments Remaining" := (("No. Of Interest Periods" - "No. Of Coupons Paid") - 1);
                    if
                    "No. Of Int. Payments Remaining" < 0 then begin
                        "No. Of Int. Payments Remaining" := 0;
                    end;
                    Modify;

                    if "No. Of Int. Payments Remaining" = 0 then begin
                        P := "Face Value" / Power((1 + ("Yield To Maturity %" / 2) / 100), Frac);
                    end;

                    if "No. Of Int. Payments Remaining" > 0 then begin
                        repeat
                            Accruing := Accruing + "Expected Int" / Power((1 + (("Yield To Maturity %" / 2) / 100)), Frac);
                            Frac := Frac + 1;

                        until
                         Frac > "No. Of Int. Payments Remaining";


                        //WHILE Frac<("No.OfFullPeriodsRemain") DO BEGIN
                        //Accruing:=Accruing + "Expected Int"/POWER((1+(("Yield To Maturity %"/2)/100)),Frac);
                        //Frac:=Frac+1
                        //END;


                        //Frac:=Frac-1;
                        Message('%1', Frac);
                        Message('%1', Accruing);
                        P := "Face Value" / Power((1 + ("Yield To Maturity %" / 2) / 100), Frac);
                        P := P + Accruing;
                        "Present Value" := P;
                    end;




                end;



                //INITIAL CODE COMMENTED FOR TESTING

                /*
                 //i:=0;
               "Expected Int":="Face Value"*("Rate %"/100)*0.5;

               //MESSAGE('%1',"Expected Int");
                X:="Days to Maturity";
                Y:="No. Of Int. Payments Remaining"* 182;
                Frac:=(X-Y)/182;
                N:="No. Of Int. Payments Remaining"+Frac;
                IF N=0 THEN
                N:=1;



               //MESSAGE('%1',Frac);

                {
               FOR i:= 1 TO "No. Of Int. Payments Remaining" DO BEGIN
                 P:= P + "Expected Int"/POWER((1+(("Yield To Maturity %"/2)/100)),i);
                END;

                P:=P + "Expected Int"/POWER((1+(("Yield To Maturity %"/2)/100)),N);
               //MESSAGE('The initial P %1',P);
               P:=P + "Face Value"/POWER((1+("Yield To Maturity %"/2)/100),N);

               //MESSAGE('The current Value is %1',P);
                 }


               "Present Value":=P;





                   */
                //END;



                //END;

            end;
        }
        field(50119; "Days to Maturity"; Integer)
        {
        }
        field(50120; "Years to Maturity"; Decimal)
        {
        }
        field(50121; "Days Held"; Integer)
        {
        }
        field(50122; "No. Of Coupons Paid"; Integer)
        {
        }
        field(50123; "No. Of Int. Payments Remaining"; Integer)
        {
        }
        field(50124; "Face Value"; Decimal)
        {
        }
        field(50125; "Present Value"; Decimal)
        {
        }
        field(50126; "Yield To Maturity %"; Decimal)
        {
            DecimalPlaces = 3 : 3;
        }
        field(50127; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';

            trigger OnLookup()
            begin


                LookupShortcutDimCode(3, ShortcutDimCode[3]);
                "Global Dimension 3 Code" := ShortcutDimCode[3];
            end;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, ShortcutDimCode[3]);
            end;
        }
        field(50128; "Gross proceeds"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Investment Transcation Type" = const(Disposal),
                                                        "G/L Account No." = filter('2010'),
                                                        "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50129; "Interest Received 2"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "G/L Account No." = filter('1080' .. '6199'),
                                                        "Investment Transcation Type" = const(Interest)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50130; "Interest Earned"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50131; "Bank Year Days"; Integer)
        {
        }
        field(50132; "Disposal Cost"; Decimal)
        {
        }
        field(50133; Risk; Option)
        {
            OptionCaption = ' ,Secured,Unsecured,Guaranteed';
            OptionMembers = " ",Secured,Unsecured,Guaranteed;
        }
        field(50134; "Investment type MM"; Option)
        {
            OptionCaption = ' ,New Placement,Re-Invested';
            OptionMembers = " ","New Placement","Re-Invested";
        }
        field(50135; "Opening Value"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50136; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Code';

            trigger OnLookup()
            begin


                LookupShortcutDimCode(4, ShortcutDimCode[4]);
                "Global Dimension 4 Code" := ShortcutDimCode[4];

                GLSetup.Get;
                Dim.SetRange(Dim."Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                Dim.SetRange(Dim.Code, "Global Dimension 4 Code");
                if Dim.Find('-') then begin
                    Description := Dim.Name;
                end;
            end;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                GLSetup.Get;
                Dim.SetRange(Dim."Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                Dim.SetRange(Dim.Code, "Global Dimension 4 Code");
                if Dim.Find('-') then begin
                    Description := Dim.Name;
                end;
            end;
        }
        field(50137; "Investment Period"; Option)
        {
            OptionCaption = ' ,FIXED,CALL';
            OptionMembers = " ","FIXED",CALL;
        }
        field(50138; Disposed; Boolean)
        {
            Editable = false;
        }
        field(50139; "Deposit Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50140; "Global Dimension 2 filter"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Custodian Code");
                Modify(true);
            end;
        }
        field(50141; "Date Filter 2"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50142; "No of Days Earned"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50143; "Fund Deposit"; Decimal)
        {
        }
        field(50144; "Deposit Type"; Option)
        {
            OptionCaption = ' ,Call,Fixed,Treasury,Corporate';
            OptionMembers = " ",Call,"Fixed",Treasury,Corporate;
        }
        field(50145; "Dividend Receivable"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Investment Code" = field("No."),
                                                        "Posting Date" = field("Date Filter"),
                                                        "Investment Transcation Type" = const(Dividend),
                                                        "AC Type" = const("Balance Sheet"),
                                                        "Source Type" = filter(<> "Bank Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50146; Sector; Code[10])
        {
            TableRelation = if ("Asset Type" = const(Equity)) "Equity Sectors"."Sector Code" where(Type = const(Equity))
            else
            if ("Asset Type" = const("Money Market")) "Equity Sectors"."Sector Code" where(Type = const(MMarket));

            trigger OnValidate()
            begin
                if sectors.Get(Sector) then
                    "Sector Description" := sectors.Description
                else
                    "Sector Description" := '';
            end;
        }
        field(50147; "Sector Description"; Text[200])
        {
        }
        field(50148; Offshore; Boolean)
        {
        }
        field(50149; "Current Value (FCY)"; Decimal)
        {
            CalcFormula = sum("G/L Entry"."Original Currency Amount" where("Investment Code" = field("No."),
                                                                            "Posting Date" = field("Date Filter"),
                                                                            "Investment Transcation Type" = filter(Acquisition | Revaluation | Disposal | Interest),
                                                                            "GL Type" = filter(Acquisition | Revaluation),
                                                                            Reversed = const(false),
                                                                            "AC Type" = const("Balance Sheet")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50150; "Disposal Value (FCY)"; Decimal)
        {
            CalcFormula = - sum("G/L Entry"."Original Currency Amount" where("Investment Code" = field("No."),
                                                                             "Investment Transcation Type" = const(Disposal),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "GL Type" = const(Acquisition),
                                                                             Reversed = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50151; "Revaluations (FCY)"; Decimal)
        {
            CalcFormula = sum("G/L Entry"."Original Currency Amount" where("Investment Code" = field("No."),
                                                                            "Posting Date" = field("Date Filter"),
                                                                            "Investment Transcation Type" = filter(Revaluation),
                                                                            "GL Type" = filter(Acquisition | Revaluation),
                                                                            Reversed = const(false),
                                                                            "AC Type" = const("Balance Sheet")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50152; "Acquisition Cost (FCY)"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(50153; "Gain on Disposal (FCY)"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50154; "Dividend Receivable (FCY)"; Decimal)
        {
            CalcFormula = sum("G/L Entry"."Original Currency Amount" where("Investment Code" = field("No."),
                                                                            "Posting Date" = field("Date Filter"),
                                                                            "Investment Transcation Type" = const(Dividend),
                                                                            "AC Type" = const("Balance Sheet"),
                                                                            "Source Type" = filter(<> "Bank Account"),
                                                                            Reversed = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(55000; "Lease/Tenant Spaces"; Integer)
        {
            //  CalcFormula = count("Service Item" where (Field55000=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(55001; "Total Size in Sq Feet"; Decimal)
        {
        }
        field(55002; "Land Registration Number"; Code[100])
        {
        }
        field(55003; Direction; Text[200])
        {
        }
        field(55004; "Location Description"; Text[200])
        {
        }
        field(55005; "Land size (Acres)"; Decimal)
        {
        }
        field(55006; "Title Number"; Code[30])
        {
        }
        field(55007; "Survey Plan Number"; Code[50])
        {
        }
        field(55008; "Development Status"; Option)
        {
            OptionCaption = ' ,Developed,Pending Development,Under construction,Under Renovation';
            OptionMembers = " ",Developed,"Pending Development","Under construction","Under Renovation";
        }
        field(55009; "File Reference Number"; Code[30])
        {
        }
        field(55010; "Ownership Type"; Option)
        {
            OptionCaption = ' ,Freehold,Leasehold,Vesting Order';
            OptionMembers = " ",Freehold,Leasehold,"Vesting Order";
        }
        field(55011; "Enviromental Assesment Status"; Option)
        {
            OptionCaption = ' ,Pending,Compliant';
            OptionMembers = " ",Pending,Compliant;
        }
        field(55012; "Lease Contracts"; Integer)
        {
            //  CalcFormula = count("Service Contract Header" where (Field55001=field("No.")));
            FieldClass = FlowField;
        }
        field(55013; Redeemed; Boolean)
        {

            trigger OnValidate()
            begin
                TestField("Date Redeemed");
            end;
        }
        field(55014; "Date Redeemed"; Date)
        {
        }
        field(55015; "Interest days"; Decimal)
        {
        }
        field(55016; "Discounted Original Amt"; Decimal)
        {
        }
        field(55017; "Gain or Loss On TB Sales"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Description")
        {
        }
        key(Key3; "FA Class Code")
        {
        }
        key(Key4; "FA Subclass Code")
        {
        }
        key(Key5; "Component of Main Asset", "Main Asset/Component")
        {
        }
        key(Key6; "FA Location Code")
        {
        }
        key(Key7; "Fund Code")
        {
        }
        key(Key8; "Custodian Code")
        {
        }
        key(Key9; "FA Posting Group")
        {
        }
        key(Key10; Description)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "FA Class Code")
        {
        }
        fieldgroup(Brick; "No.", Description, "FA Class Code", Image)
        {
        }
    }

    trigger OnDelete()
    var
        FADeprBook: Record "FA Depreciation Book";
    begin
        LockTable;
        MainAssetComp.LockTable;
        InsCoverageLedgEntry.LockTable;
        if "Main Asset/Component" = "main asset/component"::"Main Asset" then
            Error(Text000);
        FAMoveEntries.MoveFAInsuranceEntries("No.");
        FADeprBook.SetRange("FA No.", "No.");
        FADeprBook.DeleteAll(true);
        if not FADeprBook.IsEmpty then
            Error(Text001, TableCaption, "No.");

        MainAssetComp.SetCurrentkey("FA No.");
        MainAssetComp.SetRange("FA No.", "No.");
        MainAssetComp.DeleteAll;
        if "Main Asset/Component" = "main asset/component"::Component then begin
            MainAssetComp.Reset;
            MainAssetComp.SetRange("Main Asset No.", "Component of Main Asset");
            MainAssetComp.SetRange("FA No.", '');
            MainAssetComp.DeleteAll;
            MainAssetComp.SetRange("FA No.");
            if not MainAssetComp.FindFirst then begin
                FA.Get("Component of Main Asset");
                FA."Main Asset/Component" := FA."main asset/component"::" ";
                FA."Component of Main Asset" := '';
                FA.Modify;
            end;
        end;

        MaintenanceRegistration.SetRange("FA No.", "No.");
        MaintenanceRegistration.DeleteAll;

        CommentLine.SetRange("Table Name", CommentLine."table name"::"Fixed Asset");
        CommentLine.SetRange("No.", "No.");
        CommentLine.DeleteAll;

        DimMgt.DeleteDefaultDim(Database::"Fixed Asset", "No.");
    end;

    trigger OnInsert()
    begin
        /*IF "No." = '' THEN BEGIN
          InvestSetup.GET;
          InvestSetup.TESTFIELD("Investment Asset Nos");
          NoSeriesMgt.InitSeries(InvestSetup."Investment Asset Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
        
        "Main Asset/Component" := "Main Asset/Component"::" ";
        "Component of Main Asset" := '';*/
        /*
        DimMgt.UpdateDefaultDim(
          DATABASE::"Investment Asset","No.",
          "Global Dimension 1 Code","Global Dimension 2 Code");
        */

        if "Asset Type" = "asset type"::" " then begin
            if "No." = '' then begin
                FASetup.Get;
                FASetup.TestField("Fixed Asset Nos.");
                NoSeriesMgt.InitSeries(FASetup."Fixed Asset Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            end;
        end
        else begin

            if "Asset Type" = "asset type"::Property then begin
                if "No." = '' then begin
                    InvestmentSetup.Get;
                    InvestmentSetup.TestField(InvestmentSetup."Property Nos");
                    NoSeriesMgt.InitSeries(InvestmentSetup."Property Nos", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;

            if "Asset Type" = "asset type"::"Money Market" then begin
                if "No." = '' then begin
                    InvestmentSetup.Get;
                    InvestmentSetup.TestField(InvestmentSetup."Money Market Nos");
                    NoSeriesMgt.InitSeries(InvestmentSetup."Money Market Nos", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;

            if "Asset Type" = "asset type"::Equity then begin

                if Offshore = false then begin
                    if "No." = '' then begin
                        InvestmentSetup.Get;
                        InvestmentSetup.TestField(InvestmentSetup."Equity Nos");
                        NoSeriesMgt.InitSeries(InvestmentSetup."Equity Nos", xRec."No. Series", 0D, "No.", "No. Series");
                    end;
                end else begin
                    if "No." = '' then begin
                        InvestmentSetup.Get;
                        InvestmentSetup.TestField(InvestmentSetup."Offshore Investment Nos.");
                        NoSeriesMgt.InitSeries(InvestmentSetup."Offshore Investment Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                    end;

                end;
            end;

            if "Asset Type" = "asset type"::Mortgage then begin
                if "No." = '' then begin
                    InvestmentSetup.Get;
                    InvestmentSetup.TestField(InvestmentSetup."Mortgages/Loans");
                    NoSeriesMgt.InitSeries(InvestmentSetup."Mortgages/Loans", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;

            if "Asset Type" = "asset type"::"Unit Trust" then begin
                if "No." = '' then begin
                    InvestmentSetup.Get;
                    InvestmentSetup.TestField(InvestmentSetup."Unit Trust Nos");
                    NoSeriesMgt.InitSeries(InvestmentSetup."Unit Trust Nos", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;


        end;



        "Main Asset/Component" := "main asset/component"::" ";
        "Component of Main Asset" := '';

        DimMgt.UpdateDefaultDim(
          Database::"Fixed Asset", "No.",
          "Fund Code", "Custodian Code");

    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    var
        SalesLine: Record "Sales Line";
        PurchaseLine: Record "Purchase Line";
    begin
        SalesLine.RenameNo(SalesLine.Type::"Fixed Asset", xRec."No.", "No.");
        PurchaseLine.RenameNo(PurchaseLine.Type::"Fixed Asset", xRec."No.", "No.");

        "Last Date Modified" := Today;
    end;

    var
        Text000: label 'A main asset cannot be deleted.';
        Text001: label 'You cannot delete %1 %2 because it has associated depreciation books.';
        CommentLine: Record "Comment Line";
        FA: Record "Investment Asset";
        FASetup: Record "FA Setup";
        MaintenanceRegistration: Record "Maintenance Registration";
        MainAssetComp: Record "Main Asset Component";
        InsCoverageLedgEntry: Record "Ins. Coverage Ledger Entry";
        FAMoveEntries: Codeunit "FA MoveEntries";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        UnexpctedSubclassErr: label 'This fixed asset subclass belongs to a different fixed asset class.';
        RunAcquisitionWizardFromNotificationTok: label 'RunAcquisitionWizardFromNotification', Locked = true;
        DontAskAgainActionTxt: label 'Don''t ask again';
        DontAskAgainFunctionTxt: label 'HideNotificationForCurrentUser', Locked = true;
        NotificationNameTxt: label 'Fixed Asset Acquisition Wizard', Locked = true;
        NotificationDescriptionTxt: label 'Notify when ready to acquire the fixed asset.', Locked = true;
        ReadyToAcquireMsg: label 'You are ready to acquire the fixed asset.';
        AcquireActionTxt: label 'Acquire';
        FixedAssetNoTok: label 'FixedAssetNo', Locked = true;
        InvestmentType: Record "Investment Type";
        InvestmentSetup: Record "Investment Setup";
        NoOfDays: Integer;
        NofDaysTxt: Code[10];
        NextBirthDay: Date;
        Age: Integer;
        VendorRec: Record Vendor;
        PeriodInterval: Text[30];
        Repayment: Decimal;
        Cust: Record Customer;
        MonthlyRate: Decimal;
        P: Decimal;
        i: Integer;
        N: Decimal;
        r: Decimal;
        "Expected Int": Decimal;
        X: Decimal;
        Y: Decimal;
        Frac: Decimal;
        "No.OfFullPeriodsRemain": Integer;
        LastCouponPayDate: Date;
        ElapsedDays: Integer;
        Accruing: Decimal;
        Paydate: Text[30];
        ShortcutDimCode: array[8] of Code[20];
        Dim: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
        MMList: Record "Money Markets listings";
        Receipts: Record "Investment Setup";
        sectors: Record "Equity Sectors";
        InvestSetup: Record "Investment Setup";
        DIM1: Record "Dimension Set Entry";
        Dim2: Record "Dimension Set Entry";
        FundCode: Record "Fund Code";
        CustodianCode: Record "Custodian Code";
        DefaultDIm: Record "Default Dimension";
        DefaultDIm1: Record "Default Dimension";

    procedure AssistEdit(OldFA: Record "Investment Asset"): Boolean
    begin
        with FA do begin
            FA := Rec;
            FASetup.Get;
            FASetup.TestField("Fixed Asset Nos.");
            if NoSeriesMgt.SelectSeries(FASetup."Fixed Asset Nos.", OldFA."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := FA;
                exit(true);
            end;
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Investment Asset", "No.", FieldNumber, ShortcutDimCode);
        Modify(true);
    end;

    procedure FieldsForAcquitionInGeneralGroupAreCompleted(): Boolean
    begin
        exit(("No." <> '') and (Description <> '') and ("FA Subclass Code" <> ''));
    end;

    procedure ShowAcquireWizardNotification()
    var
        NotificationLifecycleMgt: Codeunit "Notification Lifecycle Mgt.";
        FAAcquireWizardNotification: Notification;
    begin
        if IsNotificationEnabledForCurrentUser then begin
            FAAcquireWizardNotification.ID(GetNotificationID);
            FAAcquireWizardNotification.Message(ReadyToAcquireMsg);
            FAAcquireWizardNotification.Scope(Notificationscope::LocalScope);
            FAAcquireWizardNotification.AddAction(AcquireActionTxt, Codeunit::"Fixed Asset Acquisition Wizard",
              RunAcquisitionWizardFromNotificationTok);
            FAAcquireWizardNotification.AddAction(
              DontAskAgainActionTxt, Codeunit::"Fixed Asset Acquisition Wizard", DontAskAgainFunctionTxt);
            FAAcquireWizardNotification.SetData(FixedAssetNoTok, "No.");
            NotificationLifecycleMgt.SendNotification(FAAcquireWizardNotification, RecordId);
        end
    end;


    procedure GetNotificationID(): Guid
    begin
        exit('3d5c2f86-cfb9-4407-97c3-9df74c7696c9');
    end;


    procedure SetNotificationDefaultState()
    var
        MyNotifications: Record "My Notifications";
    begin
        MyNotifications.InsertDefault(GetNotificationID, NotificationNameTxt, NotificationDescriptionTxt, true);
    end;

    local procedure IsNotificationEnabledForCurrentUser(): Boolean
    var
        MyNotifications: Record "My Notifications";
    begin
        exit(MyNotifications.IsEnabled(GetNotificationID));
    end;


    procedure DontNotifyCurrentUserAgain()
    var
        MyNotifications: Record "My Notifications";
    begin
        if not MyNotifications.Disable(GetNotificationID) then
            MyNotifications.InsertDefault(GetNotificationID, NotificationNameTxt, NotificationDescriptionTxt, false);
    end;


    procedure RecallNotificationForCurrentUser()
    var
        NotificationLifecycleMgt: Codeunit "Notification Lifecycle Mgt.";
    begin
        NotificationLifecycleMgt.RecallNotificationsForRecord(RecordId, false);
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        //DimMgt.SaveTempDim(FieldNumber,ShortcutDimCode);
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1',"No."),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

        // if OldDimSetID <> "Dimension Set ID" then begin
        //   Modify;
        // /* IF PurchLinesExist THEN
        //     UpdateAllLineDim("Dimension Set ID",OldDimSetID);*/
        // end;

    end;

    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1', "No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;

    procedure CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]; Type3: Integer; No3: Code[20]; Type4: Integer; No4: Code[20]; Type5: Integer; No5: Code[20])
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        TableID[4] := Type4;
        No[4] := No4;
        TableID[5] := Type5;
        No[5] := No5;
        OnAfterCreateDimTableIDs(Rec, CurrFieldNo, TableID, No);

        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        "Dimension Set ID" :=
          DimMgt.GetRecDefaultDimID(
            Rec, CurrFieldNo, TableID, No, '', "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", 0, 0);
        Modify;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateDimTableIDs(var InvestmentAsset: Record "Investment Asset"; FieldNo: Integer; TableID: array[10] of Integer; No: array[10] of Code[20])
    begin
    end;
}

