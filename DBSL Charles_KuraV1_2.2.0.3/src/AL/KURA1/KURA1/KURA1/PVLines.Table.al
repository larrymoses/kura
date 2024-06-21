#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57006 "PV Lines"
{

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = payments;
        }
        field(2; "Line No"; Integer)
        {
           // AutoIncrement = true;
        }
        field(3; Date; Date)
        {
        }
        field(4; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(5; "Account No"; Code[100])
        {
            Editable = true;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = filter(Employee)) Employee;

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            GLAccount.Get("Account No");
                            GLAccount.TestField("Direct Posting", true);
                            "Account Name" := GLAccount.Name;
                        end;
                    "account type"::Vendor:
                        begin
                            IF "Account No" <> '' THEN BEGIN
                                if Vendor.Get("Account No") then;
                                "Account Name" := Vendor.Name;
                                "Contractor No" := "Account No";
                                if vendor."VAT Registration No." = '' then
                                    Error('Tax Registration No. is mandatory for Vendor %1 %2', vendor."No.", Vendor.Name);
                            end;
                        END;
                    "account type"::Customer:
                        begin
                            if Customer.Get("Account No") then;
                            "Account Name" := Customer.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            Bank.Get("Account No");
                            "Account Name" := Bank.Name;
                            "Bank Account Number" := Bank."Bank Account No.";
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            FixedAsset.Get("Account No");
                            "Account Name" := FixedAsset.Description;
                        end;
                    "Account Type"::Employee:
                        begin
                            Employee.get("Account No");
                            "Account Name" := Employee.FullName;
                        end;

                end;
                Validate(Amount);

                //added on 23/05/17
                //add the payee and on behalf of to be the account name
                if (("Document Type" = "document type"::"Payment Voucher") or ("Document Type" = "document type"::"Petty Cash")) then begin
                    PVHeader.Reset;
                    PVHeader.SetRange(PVHeader."No.", No);
                    if PVHeader.Find('-') then begin
                        PVHeader.Payee := "Account Name";
                        PVHeader."On behalf of" := "Account Name";
                        PVHeader.Modify;
                    end;
                end;

                UpdateCommitment;
                //Check if the vendor has an agency notice
                AgencyNoticeHeader.Reset;
                AgencyNoticeHeader.SetRange(AgencyNoticeHeader."Contractor No", "Account No");
                AgencyNoticeHeader.SetRange(Posted, true);
                AgencyNoticeHeader.SetRange(Lifted, false);
                if AgencyNoticeHeader.FindSet then begin
                    "Agency Notice No." := AgencyNoticeHeader."Document No";
                    Message('The contractor %1 has an agency notice amounting to %2 and therefore should be deducted from their amount payable', "Account Name", AgencyNoticeHeader."Obligation Total Amount");
                end;
            end;
        }
        field(6; "Account Name"; Text[2000])
        {
        }
        field(7; Description; Text[1000])
        {
            trigger OnValidate()
            var
            PV1: Record payments;
            begin
                PV1.Reset();
                PV1.SetRange("No.", Rec.No);
                if PV1.FindFirst() THEN begin
                    if PV1."Payment Type" = PV1."Payment Type"::Retention THEN Begin
                        PV1."Payment Narration" := Rec.Description;
                        PV1.Modify();
                    End;
                end;
            end;
        }
        field(8; Amount; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
                Committments: Record "Committment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Committment Entries";
                PVHeader: Record payments;
                TotalCommittedAmount: Decimal;
            begin




                //////////////////////////////////////////////////////////////////////////////////////////////////////////
                CalculateTax();

                //Check if the vendor has an agency notice
                AgencyNoticeHeader.Reset;
                AgencyNoticeHeader.SetRange(AgencyNoticeHeader."Contractor No", "Account No");
                AgencyNoticeHeader.SetRange(Posted, true);
                AgencyNoticeHeader.SetRange(Lifted, false);
                if AgencyNoticeHeader.FindSet then begin
                    if "Net Amount" < AgencyNoticeHeader."Obligation Total Amount" then begin
                        "Obligation Total Amount" := "Net Amount"
                    end else begin
                        "Obligation Income Tax" := AgencyNoticeHeader."Obligation Income Tax";
                        "Obligation VAT" := AgencyNoticeHeader."Obligation VAT";
                        "Obligation WHT" := AgencyNoticeHeader."Obligation WHT";
                        "Obligation Total Amount" := AgencyNoticeHeader."Obligation Total Amount";
                        //MESSAGE(FORMAT("Obligation Total Amount"));
                    end;
                end;
                if xRec."Account No" <> "Account No" then begin
                    "Obligation Total Amount" := 0;
                    "Obligation VAT" := 0;
                    "Obligation Income Tax" := 0;
                    "Obligation WHT" := 0;
                end;


                if Amount = 0 then
                    "Net Amount" := 0;

                if "Net Amount" = 0 then begin
                    "Obligation Total Amount" := 0;
                    "Obligation VAT" := 0;
                    "Obligation Income Tax" := 0;
                    "Obligation WHT" := 0;
                end;
                //CC
                if "Net Amount" > 0 then begin
                    "Net Amount" := "Net Amount" - "Obligation Total Amount";
                    "Remaining Amount" := "Net Amount";
                end else begin
                    "Remaining Amount" := "Net Amount";
                end;


                //Budget commitments and Actual entries
                //1.0 Get the vote item used on Invoice
                pInvoice.SetRange("Document No.", "Applies to Doc. No");
                pInvoice.SetRange("Buy-from Vendor No.", "Account No");
                if pInvoice.FindSet then begin
                    if pInvoice.Type = pInvoice.Type::"G/L Account" then begin
                        "Vote Item" := pInvoice."No.";
                        bcommitments.SetRange("Document No", pInvoice."No.");
                        if bcommitments.FindSet then begin
                            //bcommitments.CALCFIELDS("Posted Dividend Schedule","Creation Date","No. Series");
                            Commitments := bcommitments."Committed Amount";
                            //MESSAGE('%1',Commitments)
                        end;
                        //2.0 Get Actual Amounts from g/l entries
                        gEntry.Reset;
                        actualAmount := 0;
                        cSetup.Get;
                        gEntry.SetRange("G/L Account No.", pInvoice."No.");
                        gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                        if gEntry.FindSet then begin
                            repeat
                                actualAmount := actualAmount + Abs(gEntry.Amount);
                            until gEntry.Next = 0;
                        end;
                        "Actual to Date" := actualAmount - Amount;
                        "Available Funds" := "Vote Amount" - (actualAmount + Amount) - Commitments;

                    end
                    else
                        if pInvoice.Type = pInvoice.Type::Item then begin
                            Item.Get(pInvoice."No.");
                            "Vote Item" := Item."Vote Item";
                            bcommitments.SetRange("Account No.", Item."Vote Item");
                            if bcommitments.FindSet then begin
                                ///bcommitments.CALCFIELDS("Posted Dividend Schedule","Creation Date","No. Series");
                                Commitments := bcommitments."Committed Amount";
                                Message('%1', Commitments)
                            end;
                            //2.0 Get Actual Amounts from g/l entries
                            gEntry.Reset;
                            actualAmount := 0;
                            cSetup.Get;
                            gEntry.SetRange("G/L Account No.", Item."Vote Item");
                            gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                            if gEntry.FindSet then begin
                                repeat
                                    actualAmount := actualAmount + Abs(gEntry.Amount);
                                until gEntry.Next = 0;
                            end;
                            "Actual to Date" := actualAmount - Amount;
                            "Available Funds" := "Vote Amount" - (actualAmount + Amount) - Commitments;
                            //"Available Funds":="Vote Amount"+"Actual to Date"-Commitments;



                        end
                        else
                            if pInvoice.Type = pInvoice.Type::"Fixed Asset" then begin
                                if FixedAsset.Get(pInvoice."No.") then begin
                                    "Vote Item" := FixedAsset."Vote Item";
                                end;
                                bcommitments.SetRange("Account No.", FixedAsset."Vote Item");
                                if bcommitments.FindSet then begin
                                    //      bcommitments.CALCFIELDS("Posted Dividend Schedule","Creation Date","No. Series");
                                    Commitments := bcommitments."Committed Amount";
                                    //MESSAGE('%1',Commitments)
                                end;
                                //2.0 Get Actual Amounts from g/l entries
                                gEntry.Reset;
                                actualAmount := 0;
                                cSetup.Get;
                                gEntry.SetRange("G/L Account No.", FixedAsset."Vote Item");
                                gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                                if gEntry.FindSet then begin
                                    repeat
                                        actualAmount := actualAmount + Abs(gEntry.Amount);
                                    until gEntry.Next = 0;
                                end;
                                "Actual to Date" := actualAmount - Amount;
                                "Available Funds" := "Vote Amount" - (actualAmount + Amount) - Commitments;
                            end;

                end;

                //Check if the account will be overdrawn
                PVHeader.Reset;
                PVHeader.SetRange(PVHeader."No.", No);
                if PVHeader.FindFirst() then
                    if PVHeader.Status <> PVHeader.status::Released then
                        PVHeader.Validate("Paying Bank Account");

                /*
                                //Check amount doesnt exceed the invoiced amount
                                PurchInvHeader.Reset;
                                PurchInvHeader.SetRange(PurchInvHeader."No.", "Applies to Doc. No");
                                PurchInvHeader.SetRange(PurchInvHeader."Buy-from Vendor No.", "Account No");
                                if PurchInvHeader.FindSet(true) then begin
                                    PurchInvHeader.CalcFields(Amount, "Amount Including VAT", "Remaining Amount");
                                    if Amount > PurchInvHeader."Amount Including VAT" then
                                        Error('Amount cannot be greater than invoice remaining amount %1', PurchInvHeader."Remaining Amount");
                                    "Advance Recovery %" := PurchInvHeader."Advance Recovery %";
                                    "Retention Code2" := PurchInvHeader."Retention %";
                                    "Retention Amount1" := PurchInvHeader."Retention %" * Amount / 100;
                                    "Advance Recovery" := PurchInvHeader."Advance Recovery %" * Amount / 100;
                                end;
                                */


                //Check amount doesnt exceed the invoiced amount
                PurchInvHeader.RESET;
                PurchInvHeader.SETRANGE(PurchInvHeader."No.", "Applies to Doc. No");
                PurchInvHeader.SETRANGE(PurchInvHeader."Buy-from Vendor No.", "Account No");
                IF PurchInvHeader.FINDSET(TRUE) THEN BEGIN
                    PurchInvHeader.CALCFIELDS(Amount, "Amount Including VAT", "Remaining Amount");
                    IF Amount > PurchInvHeader."Amount Including VAT" THEN
                        ERROR('Amount cannot be greater than invoice remaining amount %1', PurchInvHeader."Remaining Amount");
                    //"Advance Recovery %" := PurchInvHeader."Advance Recovery %";
                    //"Retention Code2" := PurchInvHeader."Retention %";
                    //"Retention Amount1" := PurchInvHeader."Retention %" * Amount / 100;
                    //"Advance Recovery" := PurchInvHeader."Advance Recovery %" * Amount / 100;
                END;


                Validate("Obligation Income Tax");
                Validate("Obligation VAT");
                Validate("Obligation WHT");

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                /// 

            end;
        }
        field(9; Posted; Boolean)
        {
            CalcFormula = lookup(payments.Posted where("No." = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Posted Date"; Date)
        {
        }
        field(11; "Posted Time"; Time)
        {
        }
        field(12; "Shortcut Dimension 1 Code"; Code[100])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));

            trigger OnValidate()
            begin
                UpdateCommitment;
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(13; "Shortcut Dimension 2 Code"; Code[100])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency),
                                                                "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"));

            trigger OnValidate()
            begin
                UpdateCommitment;
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(14; "Applies to Doc. No"; Code[100])
        {
            TableRelation = "Vendor Ledger Entry"."Document No." where(Open = const(true), "Remaining Amount" = filter(<> 0), "Vendor No." = field("Account No"));
            //Editable = false;
            trigger OnLookup()
            Var
            PV1:Record Payments;
            begin
                CalcFields(Status);
                if Status = Status::"Pending Approval" then begin
                    case "Account Type" of
                        "account type"::Customer:
                            begin
                                CustLedger.Reset;
                                CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                                CustLedger.SetRange(CustLedger."Customer No.", "Account No");
                                CustLedger.SetRange(Open, true);
                                CustLedger.CalcFields(CustLedger.Amount);
                                if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                end;
                            end;
                        "account type"::Vendor:
                            begin
                                VendLedger.Reset;
                                VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                                VendLedger.SetRange(VendLedger."Vendor No.", "Account No");
                                VendLedger.SetRange(Open, true);
                                VendLedger.CalcFields("Remaining Amount");
                                VendLedger.CalcFields("Remaining Amt. (LCY)");
                                if Page.RunModal(29, VendLedger) = Action::LookupOK then begin

                                end;
                            end;
                    end;
                end else begin
                    "Applies to Doc. No" := '';
                    Amt := 0;
                    case "Account Type" of
                        "account type"::Customer:
                            begin
                                CustLedger.Reset;
                                CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                                CustLedger.SetRange(CustLedger."Customer No.", "Account No");
                                CustLedger.SetRange(Open, true);
                                CustLedger.CalcFields(CustLedger.Amount);
                                if Page.RunModal(25, CustLedger) = Action::LookupOK then begin
                                    if CustLedger."Applies-to ID" <> '' then begin
                                        CustLedger1.Reset;
                                        CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                        CustLedger1.SetRange(CustLedger1."Customer No.", "Account No");
                                        CustLedger1.SetRange(Open, true);
                                        CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                        if CustLedger1.Find('-') then begin
                                            repeat
                                                CustLedger1.CalcFields(CustLedger1.Amount);
                                                Amt := Amt + Abs(CustLedger1.Amount);
                                                IF Rec."Dimension Set ID" <> CustLedger."Dimension Set ID" THEN
                                                    Validate("Dimension Set ID", CustLedger."Dimension Set ID");
                                            //MESSAGE('%1 IN 1',Amt);
                                            until CustLedger1.Next = 0;
                                        end;

                                        if Amt <> Amt then
                                            Error('Amount is not equal to the amount applied on the application PAGE');
                                        if Amount = 0 then
                                            Amount := Amt;
                                        Validate(Amount);
                                        "Applies to Doc. No" := CustLedger."Document No.";
                                        //cc
                                        "Document Description" := CustLedger.Description;
                                        Validate("Applies to Doc. No");
                                    end else begin
                                        if Amount <> Abs(CustLedger.Amount) then
                                            CustLedger.CalcFields(CustLedger."Remaining Amount");
                                        if Amount = 0 then
                                            Amount := Abs(CustLedger."Remaining Amount");
                                        //MESSAGE('%1 IN 3',CustLedger."Remaining Amount");
                                        Validate(Amount);
                                        "Applies to Doc. No" := CustLedger."Document No.";
                                        //"External Document No.":=CustLedger."External Document No.";
                                        //Insert VAT where applicable
                                        if Rec."Dimension Set ID" <> CustLedger."Dimension Set ID" then
                                            Validate("Dimension Set ID", CustLedger."Dimension Set ID");
                                    end;
                                end;
                                Validate(Amount);
                            end;

                        "account type"::Vendor:
                            begin
                                VendLedger.Reset;
                                VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                                VendLedger.SetRange(VendLedger."Vendor No.", "Account No");
                                VendLedger.SetRange(Open, true);
                                VendLedger.CalcFields("Remaining Amount");
                                VendLedger.CalcFields("Remaining Amt. (LCY)");
                                if Page.RunModal(29, VendLedger) = Action::LookupOK then begin
                                    if VendLedger."Applies-to ID" <> '' then begin
                                        VendLedger1.Reset;
                                        VendLedger1.SetCurrentkey(VendLedger1."Vendor No.", Open, "Applies-to ID");
                                        VendLedger1.SetRange(VendLedger1."Vendor No.", "Account No");
                                        VendLedger1.SetRange(Open, true);
                                        VendLedger1.SetRange(VendLedger1."Applies-to ID", VendLedger."Applies-to ID");
                                        if VendLedger1.Find('-') then begin
                                            repeat
                                                VendLedger1.CalcFields(VendLedger1."Remaining Amount");
                                                VendLedger1.CalcFields("Remaining Amt. (LCY)");
                                            //NetAmount:=NetAmount+ABS(VendLedger1."Remaining Amount");
                                            until VendLedger1.Next = 0;
                                        end;
                                        if Amount <> Amount then
                                            //ERROR('Amount is not equal to the amount applied on the application form');
                                            if Amount = 0 then
                                                Amount := Amount;
                                        Validate(Amount);
                                        "Applies to Doc. No" := VendLedger."Document No.";
                                        if VendLedger."Document Type"= VendLedger."Document Type"::Invoice then
                                        "Applies-to Doc. Type" := "Applies-to Doc. Type"::Invoice;
                                        //cc//
                                        "Document Description" := VendLedger.Description;
                                        Validate("Applies to Doc. No");
                                        "Advance Request No" := VendLedger."External Document No.";
                                        if Rec."Dimension Set ID" <> VendLedger."Dimension Set ID" then
                                            Validate("Dimension Set ID", VendLedger."Dimension Set ID");
                                    end else begin
                                        if Amount <> Abs(VendLedger."Remaining Amount") then
                                            VendLedger.CalcFields(VendLedger."Remaining Amount");
                                        VendLedger.CalcFields(VendLedger."Remaining Amt. (LCY)");
                                        if Amount = 0 then begin
                                            Amount := Abs(VendLedger."Remaining Amount");
                                        end;
                                        //VALIDATE(Amount);
                                        "Applies to Doc. No" := VendLedger."Document No.";
                                         if VendLedger."Document Type"= VendLedger."Document Type"::Invoice then
                                        "Applies-to Doc. Type" := "Applies-to Doc. Type"::Invoice;
                                        Validate("Applies to Doc. No");
                                        "Document Description" := VendLedger.Description;
                                        "Advance Request No" := VendLedger."External Document No.";
                                        if Rec."Dimension Set ID" <> VendLedger."Dimension Set ID" then
                                            Validate("Dimension Set ID", VendLedger."Dimension Set ID");
                                             PV1.Reset();
                PV1.SetRange("No.", Rec.No);
                if PV1.FindFirst() THEN begin
                    if PV1."Payment Type" = PV1."Payment Type"::Retention THEN Begin
                        PV1."Payment Narration" := Rec."Document Description";
                        PV1.Modify();
                    End;
                end;
                                    end;
                                end;
                                Amount := Abs(VendLedger."Remaining Amount");

                                Validate(Amount);
                            end;
                    end;
                end;
            end;

            trigger OnValidate()
            var
                vendlentry: Record "Vendor Ledger Entry";
                PVLines: Record "PV Lines";
                PV: Record payments;
                PV1: Record payments;
            begin

                if Rec."Applies-to Doc. Type" = Rec."Applies-to Doc. Type"::Invoice then begin
                PVLines.Reset();
                PVLines.SetFilter(No,'<>%1',Rec.No);
                PVLines.SetRange("Account No",Rec."Account No");
                PVLines.SetRange("Applies to Doc. No",Rec."Applies to Doc. No");
                if PVLines.FindSet() then begin
                    repeat
                    PV.Reset();
                    PV.SetRange("No.",PVLines.No);
                    PV.SetRange(Status,PV.Status::Open);
                    if PV.FindFirst() THEN
                    Error('Payment voucher %1 is already open with the same document no. Please use %1',PV."No.",PV."No.");
                    until PVLines.next()=0;
                end;
                end;
                vendlentry.Reset();
                vendlentry.SetRange("Document No.", "Applies to Doc. No");
                vendlentry.SetRange(Open, true);
                VendLentry.SetFilter("Remaining Amount",'<>%1',0);
                VendLentry.SetRange("Vendor No.","Account No");
                if not VendLentry.FindSet() then
                error('Please use the look up to get document no');
                PurchInvHeader.Reset;
                PurchInvHeader.SetRange(PurchInvHeader."No.", "Applies to Doc. No");
                if PurchInvHeader.FindSet then begin
                    Discounted := PurchInvHeader.Discounted;
                    Validate(Discounted);
                    "Contractor Payment Request No" := PurchInvHeader."Contractor Request No";
                    Modify(true);
                end;

                Validate(Discounted);
                PV1.Reset();
                PV1.SetRange("No.", Rec.No);
                if PV1.FindFirst() THEN begin
                    if PV1."Payment Type" = PV1."Payment Type"::Retention THEN Begin
                        PV1."Payment Narration" := Rec."Document Description";
                        PV1.Modify();
                    End;
                end;

                //Assign the CPR to the header
            end;
        }
        field(15; "VAT Code"; Code[100])
        {
            TableRelation = "Tariff Codes1".Code where(Type = const(VAT));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
                CalculateTax();
            end;
        }
        field(16; "W/Tax Code"; Code[100])
        {
            TableRelation = if ("Account Type" = const(Vendor)) "Tariff Codes1".Code where(Type = const("W/Tax"));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);


                CalculateTax();
            end;
        }
        field(17; "Retention Code1"; Code[100])
        {

            trigger OnValidate()
            begin

                CalculateTax();
            end;
        }
        field(18; "VAT Amount"; Decimal)
        {
        }
        field(19; "W/Tax Amount"; Decimal)
        {
        }
        field(20; "Retention Amount1"; Decimal)
        {

            trigger OnValidate()
            begin
                //VALIDATE(Amount)

                // VALIDATE("Net Amount");
            end;
        }
        field(21; "Net Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Liquidated Damages" - "Obligation Total Amount";
                "Remaining Amount" := "Net Amount";
                "Amount Paid" := 0.0;
            end;
        }
        field(22; "W/T VAT Code"; Code[100])
        {
            TableRelation = if ("Account Type" = const(Vendor)) "Tariff Codes1".Code where(Type = const("W/Tax"));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
            end;
        }
        field(23; "W/T VAT Amount"; Decimal)
        {
        }
        field(24; Type; Code[55])
        {
            NotBlank = true;
            TableRelation = "Receipts and Payment Types1".Code where(Type = filter(Payment));
            Caption = 'Adavance Type';

            trigger OnValidate()
            var
                TarrifCode: Record "Tariff Codes1";
                AdvanceTypes: Record "Receipts and Payment Types1";

            begin
                "Account No" := '';
                "Account Name" := '';
                //Remarks:='';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                if RecPayTypes.Findfirst() then begin
                    Grouping := RecPayTypes."Default Grouping";
                    //    "Require Surrender":=RecPayTypes."Pending Voucher";
                    //    "Payment Reference":=RecPayTypes."Payment Reference";
                    "Budgetary Control A/C" := RecPayTypes."Direct Expense";

                    if RecPayTypes."VAT Chargeable" = RecPayTypes."vat chargeable"::Yes then begin
                        "VAT Code" := RecPayTypes."VAT Code";
                        if TarrifCode.Get("VAT Code") then
                            "VAT Rate" := TarrifCode.Percentage;
                    end;
                    if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."withholding tax chargeable"::Yes then begin
                        "W/Tax Code" := RecPayTypes."Withholding Tax Code";
                        if TarrifCode.Get("W/Tax Code") then
                            "W/Tax Rate" := TarrifCode.Percentage;
                    end;

                    if RecPayTypes."PAYE Chargeable" = RecPayTypes."paye chargeable"::Yes then begin
                        "PAYE Code" := RecPayTypes."PAYE Code";
                        if TarrifCode.Get("PAYE Code") then
                            "PAYE Rate" := TarrifCode.Percentage;
                    end;

                    ////
                    if RecPayTypes."VAT Chargeable" = RecPayTypes."vat chargeable"::Yes then begin
                        "VAT Withheld Code" := RecPayTypes."VAT Withheld Code";
                        if TarrifCode.Get("VAT Withheld Code") then
                            "VAT Six % Rate" := TarrifCode.Percentage;
                    end;

                    ////


                    if RecPayTypes."Calculate Retention" = RecPayTypes."calculate retention"::Yes then begin
                        "Retention Code" := RecPayTypes."Retention Code";
                        if TarrifCode.Get("Retention Code") then
                            "Retention Rate" := TarrifCode.Percentage;

                    end;

                end;

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    Validate("Account Type");
                    "Transaction Name" := RecPayTypes.Description;
                    "Budgetary Control A/C" := RecPayTypes."Direct Expense";
                    if RecPayTypes."Account Type" = RecPayTypes."account type"::"G/L Account" then begin
                        RecPayTypes.TestField(RecPayTypes."G/L Account");
                        "Account No" := RecPayTypes."G/L Account";
                        "Account Name" := RecPayTypes.Description;
                        Validate("Account No");
                        Validate("Account Name");
                    end;

                    //Banks
                    if RecPayTypes."Account Type" = RecPayTypes."account type"::"Bank Account" then begin
                        //"Account No":=RecPayTypes."Bank Account";
                        Validate("Account No");
                    end;

                    if RecPayTypes."Account Type" = RecPayTypes."account type"::Customer then begin
                        "Account No" := RecPayTypes."Account no";
                        Validate("Account No");
                    end;
                end;
                PHead.Reset;
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst then begin
                    Date := PHead.Date;
                    //  PHead.TESTFIELD("Responsibility Center");
                    /*
                    "Shortcut Dimension 1 Code":=PHead."Shortcut Dimension 1 Code";
                     VALIDATE("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code":=PHead."Shortcut Dimension 2 Code";
                    VALIDATE("Shortcut Dimension 2 Code");
                    */
                    "Dimension Set ID" := PHead."Dimension Set ID";
                    //currency "Currency Code":=PHead."Currency Code";
                    //"Currency Factor":=PHead."Currency Factor";
                    "Payment Type" := PHead."Payment Type";
                end;


                if TransType.Get(Type) then begin
                    "Account Type" := TransType."Account Type";
                    "Account No" := TransType."G/L Account";
                    Validate("Account No");
                    "Account Name" := TransType."Transation Remarks";
                end;
                Validate(Amount);

                if AdvanceTypes.get(type) then begin
                    //   AdvanceTypes.TestField("G/L Account");
                    //AdvanceTypes.TestField("Account Type");

                    "Account Type" := AdvanceTypes."Account Type";
                    "Account No" := AdvanceTypes."G/L Account";

                    Rec.Validate("Account No");

                end;

            end;
        }
        field(25; "Transaction Name"; Text[100])
        {
        }
        field(37; Grouping; Code[100])
        {
            TableRelation = "Vendor Posting Group".Code;
        }
        field(38; "Payment Type"; Option)
        {
            CalcFormula = lookup(payments."Payment Type" where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender,Retention';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender,Retention;
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(73; "VAT Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                /*"VAT Amount":=(Amount * 100);
                "VAT Amount":=Amount-("VAT Amount"/(100 + "VAT Rate"));*/

            end;
        }
        field(74; "Amount With VAT"; Decimal)
        {
        }
        field(79; "Budgetary Control A/C"; Boolean)
        {
        }
        field(83; Committed; Boolean)
        {
        }
        field(85; "NetAmount LCY"; Decimal)
        {
        }
        field(86; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(87; "Applies-to Doc. No."; Code[100])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                VendLedgEntry: Record "Vendor Ledger Entry";
                ApplyVendEntries: Page "Apply Vendor Entries";
                PayToVendorNo: Code[20];
                OK: Boolean;
                Text000: label 'You must specify %1 or %2.';
            begin
                //CODEUNIT.RUN(CODEUNIT::"Payment Voucher Apply",Rec);
                /*
                IF (Rec."Account Type"<>Rec."Account Type"::Customer) AND (Rec."Account Type"<>Rec."Account Type"::Vendor) THEN
                    ERROR('You cannot apply to %1',"Account Type");
                
                WITH Rec DO BEGIN
                  Amount:=0;
                  VALIDATE(Amount);
                  PayToVendorNo := "Account No." ;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  IF "Applies-to ID" = '' THEN
                    "Applies-to ID" := No;
                  IF "Applies-to ID" = '' THEN
                    ERROR(
                      Text000,
                      FIELDCAPTION(No),FIELDCAPTION("Applies-to ID"));
                  //ApplyVendEntries."SetPVLine-Delete"(PVLine,PVLine.FIELDNO("Applies-to ID"));
                  ApplyVendEntries.SetPVLine(Rec,VendLedgEntry,Rec.FIELDNO("Applies-to ID"));
                  ApplyVendEntries.SETRECORD(VendLedgEntry);
                  ApplyVendEntries.SETTABLEVIEW(VendLedgEntry);
                  ApplyVendEntries.LOOKUPMODE(TRUE);
                  OK := ApplyVendEntries.RUNMODAL = ACTION::LookupOK;
                  CLEAR(ApplyVendEntries);
                  IF NOT OK THEN
                    EXIT;
                  VendLedgEntry.RESET;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
                  IF VendLedgEntry.FIND('-') THEN BEGIN
                    "Applies-to Doc. Type" := 0;
                    "Applies-to Doc. No." := '';
                  END ELSE
                    "Applies-to ID" := '';
                END;
                
                //Calculate  Total To Apply
                  VendLedgEntry.RESET;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open,"Applies-to ID");
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
                  IF VendLedgEntry.FIND('-') THEN BEGIN
                        VendLedgEntry.CALCSUMS("Amount to Apply");
                        Amount:=ABS(VendLedgEntry."Amount to Apply");
                        VALIDATE(Amount);
                  END;
                
                */

            end;

            trigger OnValidate()
            begin
                Validate(Amount);
                Validate("Account No");
                //VALIDATE(Discounted);
            end;
        }
        field(88; "Applies-to ID"; Code[100])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            var
                TempVendLedgEntry: Record "Vendor Ledger Entry";
            begin
                /*
                //IF "Applies-to ID" <> '' THEN
                //  TESTFIELD("Bal. Account No.",'');
                IF ("Applies-to ID" <> xRec."Applies-to ID") AND (xRec."Applies-to ID" <> '') THEN BEGIN
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.","Account No.");
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID",xRec."Applies-to ID");
                  IF VendLedgEntry.FINDFIRST THEN
                    VendEntrySetApplID.SetApplId(VendLedgEntry,TempVendLedgEntry,0,0,'');
                  VendLedgEntry.RESET;
                END;
                */

            end;
        }
        field(90; "Retention Code"; Code[100])
        {
            TableRelation = "Tariff Codes1".Code where(Type = const(Retention));

            trigger OnValidate()
            begin
                //CalculateTax();
            end;
        }
        field(91; "Retention  Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Liquidated Damages" - "Obligation Total Amount";
            end;
        }
        field(92; "Retention Rate"; Decimal)
        {
        }
        field(93; "W/Tax Rate"; Decimal)
        {
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
            trigger OnValidate()
            var
                OldDimSetID: Integer;
                Payment: Record payments;
            begin

                //Rec.MODIFY;
                Payment.Reset();
                    Payment.SetRange("No.", Rec.No);
                    if Payment.FindFirst() then begin
                        Payment."Dimension Set ID" := Rec."Dimension Set ID";
                        payment.Modify();
                    end;

            end;
            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(50000; "Gl Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50003; "VAT Withheld Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                //"VAT Withheld Amount":="VAT Amount"*0.06;
            end;
        }
        field(50004; "VAT Withheld Code"; Code[200])
        {
            TableRelation = "Tariff Codes1".Code where(Type = const(VAT));
        }
        field(50005; "VAT Six % Rate"; Decimal)
        {
        }
        field(50006; "Advance Recovery"; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Liquidated Damages" - "Obligation Total Amount";
            end;
        }
        field(50007; "Total Net Pay"; Decimal)
        {
        }
        field(50008; "Job Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Shortcut Dimension 2 Code"));
        }
        field(50009; "Project Description"; Text[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field("Shortcut Dimension 2 Code")));
            FieldClass = FlowField;
        }
        field(50010; "Claim Doc No."; Code[200])
        {
            TableRelation = payments."No." where("Payment Type" = filter("Staff Claim"),
                                                  "Account No." = field("Account No"),
                                                  Status = const(Released),
                                                  Posted = const(true));

            trigger OnValidate()
            begin
                sclaims.Reset;
                sclaims.SetRange(sclaims."No.", "Claim Doc No.");
                if sclaims.FindFirst then
                    sclaims.CalcFields(sclaims."Total Amount");
                Amount := sclaims."Total Amount";
                Validate(Amount);
                sclaims."Used Claim" := true;
                sclaims.Modify;
            end;
        }
        field(50011; "Amount Paid"; Decimal)
        {
            Description = 'Fields Added By David To cater for part payment of the Payment Vouchers';

            trigger OnValidate()
            begin
                // TestField(Status, Status::Released);
                if "Amount Paid" > "Net Amount" then
                    Error(Text001, No);
                if "Remaining Amount" = 0 then begin
                    "Remaining Amount" := "Net Amount" - "Amount Paid";
                end
                else begin
                    "Remaining Amount" := "Remaining Amount" - "Amount Paid";
                    if "Remaining Amount" < 0 then
                        Error(Text002, No);
                end;
            end;
        }
        field(50012; "Remaining Amount"; Decimal)
        {
        }
        field(50013; "Part Payment"; Boolean)
        {
        }
        field(50014; Status; Option)
        {
            CalcFormula = lookup(payments.Status where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(50015; "Date Paid"; Date)
        {
            Description = 'End of Field Added';
        }
        field(50016; "No. Posted"; Integer)
        {
        }
        field(50017; "Paying Bank Account"; Code[200])
        {
            TableRelation = "Bank Account";
        }
        field(50018; "Bank Name"; Code[200])
        {
            CalcFormula = lookup("Bank Account".Name where("No." = field("Paying Bank Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019; "Document Type"; Option)
        {
            CalcFormula = lookup(payments."Document Type" where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Petty Cash,Imprest,Imprest Surrender,Bank Transfer,Surrender';
            OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender;
        }
        field(50020; "Vote Item"; Code[200])
        {
            Editable = false;
            TableRelation = "G/L Account"."No.";
        }
        field(50021; "Vote Amount"; Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where("G/L Account No." = field("Vote Item"),
                                                                  "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "Actual to Date"; Decimal)
        {
            Editable = false;
        }
        field(50023; Commitments; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50024; "Vote Item Desc."; Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(50026; "Type of Expense"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));

            trigger OnValidate()
            begin
                tExpense.Reset;
                tExpense.SetRange(Code, "Type of Expense");
                if tExpense.FindSet then begin
                    "Account Type" := "account type"::"G/L Account";
                    "Vote Item" := tExpense."G/L Account";
                    "Account No" := tExpense."G/L Account";
                    Validate("Account No");

                    gEntry.Reset;
                    actualAmount := 0;
                    cSetup.Get;
                    bcommitments.Reset;
                    gEntry.SetRange("G/L Account No.", tExpense."G/L Account");
                    gEntry.SetFilter(gEntry."Posting Date", '%1..%2', cSetup."Leave Posting Period[FROM]", cSetup."Leave Posting Period[TO]");
                    if gEntry.FindSet then begin
                        repeat
                            actualAmount := actualAmount + Abs(gEntry.Amount);
                        until gEntry.Next = 0;
                    end;

                    "Actual to Date" := actualAmount;

                    bcommitments.SetRange("Account No.", "Vote Item");
                    if bcommitments.FindSet then begin
                        "Vote Amount" := bcommitments."Committed Amount";
                        //bcommitments.CALCFIELDS("No. Series","Posted Dividend Schedule","Creation Date");
                        Commitments := bcommitments."Committed Amount";
                        //"Available Funds":="Vote Amount"-actualAmount-(bcommitments."No. Series"+bcommitments."Posted Dividend Schedule"+bcommitments."Creation Date");
                    end;
                end;
            end;
        }
        field(50027; "Reference No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50028; Budget; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Shortcut Dimesnion 4 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50030; "Mobile Phone No"; Code[20])
        {
            CalcFormula = lookup("Employee Payment Information"."Employee Mobile No" where("Employee No" = field("Account No")));
            FieldClass = FlowField;
        }
        field(50031; "Mpesa Charges"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50032; "Bank Account Number"; Code[30])
        {
            Caption = 'Account Number';
            DataClassification = ToBeClassified;
        }
        field(50033; "Payee Bank Account Number"; Text[200])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*         VendorBankAccount.RESET;
                        VendorBankAccount.SETRANGE(VendorBankAccount.Code,"Payee Bank Account Number");
                        IF VendorBankAccount.FINDSET THEN BEGIN
                          "Payee Bank Account Number":=VendorBankAccount."Bank Account No.";
                          END;
                          */

            end;
        }
        field(50034; "Payee Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Discounted = filter(false)) "Vendor Bank Account".Code where("Vendor No." = field("Account No"))
            else
            if (Discounted = filter(true)) "Employee Bank AccountX".Code;

            trigger OnValidate()
            begin
                VendorBankAccount.Reset;
                VendorBankAccount.SetRange(VendorBankAccount."Vendor No.", "Account No");
                VendorBankAccount.SetRange(VendorBankAccount.Code, "Payee Bank Name");
                if VendorBankAccount.FindSet then begin
                    "Payee Bank Account Number" := VendorBankAccount."Bank Account No.";
                    "Payee Bank Branch Code" := VendorBankAccount."Bank Branch No.";
                    "Vendor Bank Name" := VendorBankAccount.Name;
                    "Payee Bank Name" := VendorBankAccount.Name;
                    "Payee Account Name" := VendorBankAccount.Contact;
                end;

                // EmployeeBankAccountX.Reset;
                // EmployeeBankAccountX.SetRange(EmployeeBankAccountX.Code, "Payee Account Name");
                // if EmployeeBankAccountX.FindSet then begin
                //     "Payee Bank Name" := EmployeeBankAccountX."Bank Name";
                //     //"Payee Bank Branch Code":=
                // end;
            end;
        }
        field(50035; "Payee Bank Branch Code"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50036; "Vendor Bank Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "Advance Recovery %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50038; "Retention Code2"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50039; "Payee Account Name"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "PAYE Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50041; "PAYE Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tariff Codes1".Code where(Type = filter(PAYE));
            trigger OnValidate()
            var
            TarriffCodes: Record "Tariff Codes1";
            begin
                if TarriffCodes.Get("PAYE Code") then begin
                    Rec.Validate("PAYE Rate",TarriffCodes.Percentage);
                end;
            end;
        }
        field(50042; "PAYE Rate"; Decimal)
        {
            trigger OnValidate()
            begin
                Rec.Validate("PAYE Amount",(Rec."PAYE Rate"/100*Rec.Amount));
            end;
        }
        field(50043; "Liquidated Damages"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Liquidated Damages" - "Obligation Total Amount";
            end;
        }
        field(50044; "Project No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where("Contractor No." = field("Contractor No"));

            trigger OnValidate()
            var
            Vend: Record Vendor;
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project No");
                if ObjJob.FindFirst() then begin
                    //   ObjJob.TestField("Purchase Contract ID");
                    ObjPurchaseHeader.Reset;
                    ObjPurchaseHeader.SetRange(ObjPurchaseHeader."No.", ObjJob."Purchase Contract ID");
                    ObjPurchaseHeader.SetRange(ObjPurchaseHeader."Document Type", ObjPurchaseHeader."document type"::"Blanket Order");
                    if ObjPurchaseHeader.FindSet then begin
                        Bid_ContractSecurityRegister.Reset;
                        Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Vendor No.", "Account No");
                        Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."No.", ObjPurchaseHeader."No.");
                        Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Security Type", Bid_ContractSecurityRegister."security type"::"Advance Payment Security");
                        if Bid_ContractSecurityRegister.FindSet then begin
                            if Bid_ContractSecurityRegister."Bid Security Validity Expiry" < Today then
                                Error('This Contractors %1 Advance Guarantee security has expired %2', "Account No", Bid_ContractSecurityRegister."Security ID");
                        end;
                    end;
                end;
                if not Discounted then
                if ObjJob."Vendor Bank Account No." <> '' then
                Rec.Validate("Payee Bank Code",ObjJob."Vendor Bank Account No.")
                else begin
                    if Vend.Get(Rec."Account No") then
                    Rec.Validate("Payee Bank Code",Vend."Preferred Bank Account Code");
                end;
            end;
        }
        field(50045; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(50046; "Obligation Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50047; "Obligation VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Obligation Total Amount" := "Obligation Income Tax" + "Obligation VAT" + "Obligation WHT";
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Supervision Cost" - "Obligation Total Amount";

            end;
        }
        field(50048; "Obligation Income Tax"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Obligation Total Amount" := "Obligation Income Tax" + "Obligation VAT" + "Obligation WHT";
                "Net Amount" := "Amount" - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Supervision Cost" - "Obligation Total Amount";
            end;
        }
        field(50049; "Obligation WHT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Obligation Total Amount" := "Obligation Income Tax" + "Obligation VAT" + "Obligation WHT";
                "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Supervision Cost" - "Obligation Total Amount";
            end;
        }
        field(50050; Discounted; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Discounted = true then begin
                    BillDiscountingHeader.Reset;
                    BillDiscountingHeader.SetRange(BillDiscountingHeader."Contractor No", "Account No");
                    BillDiscountingHeader.SetRange(BillDiscountingHeader.Posted, true);
                    if BillDiscountingHeader.FindSet then begin
                        "Payee Bank Name" := BillDiscountingHeader."Bank Code";
                        "Payee Bank Branch Code" := BillDiscountingHeader."Bank Branch No";
                        "Vendor Bank Name" := BillDiscountingHeader."Bank Name";
                        "Payee Account Name" := "Account Name";
                        "Payee Bank Account Number" := BillDiscountingHeader."Bank Account Number";
                        //MESSAGE("Payee Bank Account Number");
                    end;
                end;
            end;
        }
        field(50051; "Contractor Payment Request No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Measurement &  Payment Header"."Document No." where("Document Type" = filter("Contractor Payment Request"));
        }
        field(50052; "Advance Request No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50053; "Bill Discounting No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50054; "Agency Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50055; "Installment No."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50056; "Supervision Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50057; "Advance Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50058; "Document Description"; text[250])
        {
            DataClassification = ToBeClassified;
        }
           field(50059; "Committed Amount"; Decimal)
        {
            Editable =false;
        }
        field(50060; "Budgeted Amount"; Decimal)
        {
            Editable =false;
        }
        field(50061; "Available Amount"; Decimal)
        {
            Editable =false;
        }
        field(50062; "Actual Spent"; Decimal)
        {
            Editable =false;
        }
        field(50063; "Payee Bank Code"; Code[30])
        {
            TableRelation = if (Discounted = filter(false)) "Vendor Bank Account".Code where("Vendor No." = field("Account No"))
            else
            if (Discounted = filter(true)) "Employee Bank AccountX".Code;
            trigger OnValidate()
            var
                VendorBankAccount: Record "Vendor Bank Account";
                EmployeeBankAccountX: Record "Employee Bank AccountX";
                Emp: Record Employee;
            begin
                if Discounted = false then begin
                    VendorBankAccount.Reset();
                    VendorBankAccount.SetRange("Vendor No.", "Account No");
                    VendorBankAccount.SetRange(Code, "Payee Bank Code");
                    if VendorBankAccount.FindFirst() then begin
                        EmployeeBankAccountX.Reset();
                        EmployeeBankAccountX.SetRange(Code, "Payee Bank Code");
                        IF EmployeeBankAccountX.FindFirst() then
                            Rec."Payee Bank Name" := EmployeeBankAccountX."Bank Name";
                        Rec."Payee Bank Account Number" := VendorBankAccount."Bank Account No.";
                        Rec."Payee Bank Branch Code" := VendorBankAccount."Bank Branch No.";
                        Rec."Payee Account Name" := VendorBankAccount.Name;
                    end;
                end else begin
                    EmployeeBankAccountX.Reset();
                    EmployeeBankAccountX.SetRange("Employee No.", "Account No");
                    EmployeeBankAccountX.SetRange(Code, "Payee Bank Code");
                    if EmployeeBankAccountX.FindFirst() then begin
                        Rec."Payee Bank Name" := EmployeeBankAccountX."Bank Name";
                        Rec."Payee Bank Account Number" := EmployeeBankAccountX."Bank Account No.";
                        Rec."Payee Bank Branch Code" := EmployeeBankAccountX."Bank Branch No.";
                        if Emp.Get(Rec."Account No") then
                            Rec."Payee Account Name" := Emp.FullName();
                    end;
                end;
            end;
        }

    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
    Lines: Record "PV Lines";
    begin
        Lines.Reset();
        Lines.SetRange(No,Rec.No);
        if Lines.findlast() then
        Rec."Line No" := Lines."Line No" +1
        else
        Rec."Line No" :=1;
        PVHeader.Reset;
        PVHeader.SetRange(PVHeader."No.", No);
        if PVHeader.FindSet then begin
            "Shortcut Dimension 1 Code" := PVHeader."Shortcut Dimension 1 Code";
            "Shortcut Dimension 2 Code" := PVHeader."Shortcut Dimension 2 Code";
            if PVHeader."Payment Type" = PVHeader."payment type"::"Bank Transfer" then
                "Account Type" := "account type"::"Bank Account";

        end;
    end;

    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        RetAmount: Decimal;
        NetAmount: Decimal;
        VATSetup: Record "VAT Posting Setup";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        CSetups: Record "Cash Management Setup";
        Direction: Text[30];
        WTVATAmount: Decimal;
        VATSetup2: Record "VAT Posting Setup";
        VATEntry: Record "VAT Entry";
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
        RecPayTypes: Record "Receipts and Payment Types1";
        PHead: Record payments;
        TransType: Record "Receipts and Payment Types1";
        sclaims: Record payments;
        CashMgt: Record "Cash Management Setup";
        Text001: label 'Amount Paid For document No. %1 Cannot be more than The Net Amount. Kindly Check.';
        Text002: label 'Remaining Amount in document No. %1 Cannot be less than 0. Please verify that you have correctly specified the Amount paid.';
        PVHeader: Record payments;
        pInvoice: Record "Purch. Inv. Line";
        bcommitments: Record "Commitment Entries";
        Item: Record Item;
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        tExpense: Record "Receipts and Payment Types1";
        fAsset: Record "Fixed Asset";
        VendorBankAccount: Record "Vendor Bank Account";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchaseHeader: Record "Purchase Header";
        AgencyNoticeHeader: Record "Agency Notice Header";
        BillDiscountingHeader: Record "Bill Discounting Header";
        BillDiscountingLine: Record "Bill Discounting Line";
        EmployeeBankAccountX: Record "Employee Bank AccountX";
        Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
        ObjJob: Record Job;
        ObjPurchaseHeader: Record "Purchase Header";


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin


        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if No <> '' then
            Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            //IF SalesLinesExist THEN
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;


    procedure GetCurrency()
    begin
    end;


    procedure ShowDimensions()
    begin
        /*
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2 %3',"Payment Type","No.","Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */

    end;


    procedure CalculateTax()
    var
        CalculationType: Option VAT,"W/Tax",Retention,PAYE;
        TotalTax: Decimal;
        TaxCalc: Codeunit "Tax Calculation";
    begin
        "VAT Amount" := 0;
        "W/Tax Amount" := 0;
        "Retention  Amount" := 0;
        TotalTax := 0;
        "Net Amount" := 0;
        "PAYE Amount" := 0;
        if Amount <> 0 then begin
            if "VAT Rate" <> 0 then begin
                "VAT Amount" := TaxCalc.CalculateTax(Rec, Calculationtype::VAT);
                TotalTax := TotalTax + "VAT Amount"
            end;

            if "W/Tax Rate" <> 0 then begin
                "W/Tax Amount" := TaxCalc.CalculateTax(Rec, Calculationtype::"W/Tax");
                TotalTax := TotalTax + "W/Tax Amount"
            end;

            if "PAYE Rate" <> 0 then begin
                "PAYE Amount" := TaxCalc.CalculateTax(Rec, Calculationtype::PAYE);
                TotalTax := TotalTax + "PAYE Amount";
            end;

            if "Retention Rate" <> 0 then begin
                "Retention  Amount" := TaxCalc.CalculateTax(Rec, Calculationtype::Retention);
                TotalTax := TotalTax + "Retention  Amount"
            end;
        end;


        "VAT Withheld Amount" := 0;
        if "VAT Six % Rate" <> 0 then begin
            "VAT Withheld Amount" := (Amount - "VAT Amount") * ("VAT Six % Rate") / 100;

            /// "VAT Withheld Amount":=0;

            /*IF Amount <>0 THEN BEGIN
            IF "VAT Rate"<>0 THEN BEGIN
             "VAT Withheld Amount":=(Amount-"VAT Amount")*0.06;
            END;
            END;*/
        end;

        "Net Amount" := Amount - "W/Tax Amount" - "VAT Withheld Amount" - "Retention  Amount" - "Advance Recovery" - "PAYE Amount" - "Liquidated Damages";
        Validate("Net Amount");
    end;
     Local Procedure UpdateCommitment()
    var
        CustomFunction: Codeunit "Custom Function";
        PV: Record payments;
    begin
        if "Account Type" = "Account Type"::"G/L Account" then begin  
        PV.Reset();
        PV.SetRange("No.", No);
        if PV.findfirst() then begin
            if (PV."Payment Type" = PV."Payment Type"::"Petty Cash") or (PV."Payment Type" = PV."Payment Type"::"Staff Claim") then begin
            "Budgeted Amount" := CustomFunction.GetBudgtedAmount("Account No", PV."Shortcut Dimension 1 Code", PV."Shortcut Dimension 2 Code", PV."Shortcut Dimension 3 Code");
            "Actual Spent" := CustomFunction.GetActualSpent("Account No", PV."Shortcut Dimension 1 Code", PV."Shortcut Dimension 2 Code", PV."Shortcut Dimension 3 Code");
            "Committed Amount" := CustomFunction.GetCommittedAmount("Account No", CustomFunction.GetBudgetYear(PV.Date), PV."Shortcut Dimension 1 Code", PV."Shortcut Dimension 2 Code", PV."Shortcut Dimension 3 Code");
            "Available Amount" := "Budgeted Amount" - ("Actual Spent" + "Committed Amount");
            end;
        end;
        end;
    end;
}

