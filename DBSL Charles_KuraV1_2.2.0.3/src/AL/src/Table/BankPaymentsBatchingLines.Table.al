#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57038 "Bank Payments Batching Lines"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Batch No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = if ("Payment Type"=const("Payment Voucher")) payments."No." where ("Payment Type"=const("Payment Voucher"),
            //                                                                                    Posted=const(true),
            //                                                                                    Status=const(Released),
            //                                                                                    "Pay Mode"=filter('RTGS'|'EFT'),
            //                                                                                    "Total Obligation Amount"=const(No),
            //                                                                                    "Obligation VAT"=filter(<1))
            //                                                                                    else if ("Payment Type"=const("Bank Transfer")) payments."No." where ("Payment Type"=const("Bank Transfer"),
            //                                                                                                                                                          "Pay Mode"=filter('RTGS'|'EFT'),
            //                                                                                                                                                          Posted=const(true),
            //                                                                                                                                                          Status=const(Released),
            //                                                                                                                                                          "Total Obligation Amount"=const(No),
            //                                                                                                                                                          "Obligation VAT"=filter(<1));

            trigger OnValidate()
            var
                PaymentNarration: Text[250];
                Flag: Boolean;
            begin

                //Ensure item selected does not exist in another batch
                BankPaymentsBatchingLines.Reset;
                BankPaymentsBatchingLines.SetRange(BankPaymentsBatchingLines."Document No.", "Document No.");
                if BankPaymentsBatchingLines.FindFirst() then begin

                    Flag := true;

                    //If batch is approved but Items is not approved allow item to be selected
                    BankPaymentsBatching.Reset;
                    BankPaymentsBatching.SetRange("Batch No", BankPaymentsBatchingLines."Batch No");
                    BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                    if BankPaymentsBatching.FindFirst() then begin
                        //Error if line exists in a batch that is approved and the line is also approved
                        if not BankPaymentsBatchingLines.Approve then
                            Flag := false;
                    end;

                    if Flag then
                        Error('The payment voucher %1 has already been selected in Batch %2', "Document No.", BankPaymentsBatchingLines."Batch No");

                end;

                //Ensure item is not selected in this batch
                BankPaymentsBatchingLines.Reset;
                BankPaymentsBatchingLines.SetRange(BankPaymentsBatchingLines."Batch No", "Batch No");
                BankPaymentsBatchingLines.SetRange(BankPaymentsBatchingLines."Document No.", "Document No.");
                if BankPaymentsBatchingLines.FindFirst() then begin
                    Error('The payment voucher %1 has already been selected in Batch %2', "Document No.", "Batch No");
                end;

                PaymentHeader.Reset();
                PaymentHeader.SetAutocalcFields("Total Amount");
                PaymentHeader.SetRange("No.", "Document No.");
                if PaymentHeader.Find('-') then begin
                    "Pay Mode" := PaymentHeader."Pay Mode";
                    "Cheque Date" := PaymentHeader."Cheque Date";
                    "Cheque No" := PaymentHeader."Cheque No";
                    "Bank Code" := PaymentHeader."Paying Bank Account";
                    Payee := PaymentHeader.Payee;
                    "On behalf of" := PaymentHeader."On behalf of";
                    "Created By" := PaymentHeader."Created By";
                    "Posted By" := PaymentHeader."Posted By";
                    "Posted Date" := PaymentHeader."Posted Date";
                    "Shortcut Dimension 1 Code" := PaymentHeader."Shortcut Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := PaymentHeader."Shortcut Dimension 2 Code";
                    "Total Amount" := PaymentHeader."Total Amount";
                    "Paying Bank Account" := PaymentHeader."Paying Bank Account";
                    Status := PaymentHeader.Status;
                    PaymentNarration := DelChr(PaymentHeader."Payment Narration", '=', '/');
                    PaymentNarration := DelChr(PaymentNarration, '=', '\');
                    "Payment Narration" := PaymentNarration;
                    "Payment Type" := PaymentHeader."Payment Type";
                    Currency := PaymentHeader.Currency;
                    "Account Name" := PaymentHeader."Account Name";
                    "Account No." := PaymentHeader."Account No.";
                    "Account Type" := PaymentHeader."Account Type";
                    "Source Bank Acc No." := PaymentHeader."Source Bank Acc No.";
                    BankAccount.Reset;
                    BankAccount.SetRange("Bank Account No.", PaymentHeader."Source Bank Acc No.");
                    if BankAccount.Find('-') then begin
                        "Bank Code" := BankAccount."Bank Code";
                        "Source Bank Acc Name" := BankAccount.Name;
                        Used := true;
                    end;
                    GeneratePaymentLines();
                end;
            end;
        }
        field(4; "Pay Mode"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pay Mode";
        }
        field(5; "Cheque No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Cheque Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Payee; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "On behalf of"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(11; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(12; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(13; "Posted Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(14; "Shortcut Dimension 1 Code"; Code[50])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(15; "Shortcut Dimension 2 Code"; Code[50])
        {
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(17; "Total Amount"; Decimal)
        {
            Editable = false;
        }
        field(18; "Paying Bank Account"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(20; "Payment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Payment Voucher,Bank Transfer';
            OptionMembers = "Payment Voucher","Bank Transfer";
        }
        field(21; Currency; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(23; "Account Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(24; "Account No."; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer."No." where("Customer Type" = filter(" "))
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const(Employee)) Employee."No.";
        }
        field(25; "Account Name"; Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Source Bank Acc No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Source Bank Acc Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "No. of PV Lines"; Integer)
        {
            CalcFormula = count("PV Lines" where(No = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Payment Narration"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(30; Approve; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                KCBPaymentLines.Reset;
                KCBPaymentLines.SetRange(KCBPaymentLines."Batch No", "Batch No");
                KCBPaymentLines.SetRange(KCBPaymentLines."Document No", "Document No.");
                if KCBPaymentLines.Find('-') then begin
                    repeat
                        KCBPaymentLines.Approved := Approve;
                        KCBPaymentLines.Modify();
                    until KCBPaymentLines.Next = 0;
                end;
            end;
        }
        field(31; Used; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Batch No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        BankPaymentsBatching.Reset;
        BankPaymentsBatching.SetRange("Batch No", "Batch No");
        if BankPaymentsBatching.Find('-') then begin

            if BankPaymentsBatching."Payment Processed" then
                Error('You cannot delete line.Document has already been processed');

            if BankPaymentsBatching."Payment File Generated" then
                Error('You cannot delete line, payment file has already been generated');

            if BankPaymentsBatching."Approval  Status" = BankPaymentsBatching."approval  status"::Approved then
                Error('You cannot delete line.Document has already been approved');

            KCBPaymentLines.Reset;
            KCBPaymentLines.SetRange("Document No", "Document No.");
            KCBPaymentLines.SetRange("Batch No", "Batch No");
            if KCBPaymentLines.Find('-') then begin
                KCBPaymentLines.DeleteAll;
            end;
        end;
    end;

    trigger OnModify()
    begin
        BankPaymentsBatching.Reset;
        BankPaymentsBatching.SetRange("Batch No", "Batch No");
        if BankPaymentsBatching.Find('-') then begin

            if BankPaymentsBatching."Payment Processed" then
                Error('You cannot modify line.Document has already been processed');

            if BankPaymentsBatching."Payment File Generated" then
                Error('You cannot modify line, payment file has already been generated');

            if BankPaymentsBatching."Approval  Status" = BankPaymentsBatching."approval  status"::Approved then
                Error('You cannot modify line.Document has already been approved');
        end;
    end;

    var
        BankPaymentsBatchingLines: Record "Bank Payments Batching Lines";
        PaymentHeader: Record payments;
        PaymentLines: Record "PV Lines";
        BankAccount: Record "Bank Account";
        KCBPaymentLines: Record "KCB Payment Lines";
        BankPaymentsBatching: Record "Bank Payments Batching";
        PVLines: Record "PV Lines";

    local procedure GeneratePaymentLines()
    begin
        KCBPaymentLines.Reset;
        KCBPaymentLines.SetRange("Batch No", "Batch No");
        KCBPaymentLines.SetRange("Document No", "Document No.");
        if KCBPaymentLines.Find('-') then begin
            KCBPaymentLines.DeleteAll;
        end;

        if xRec."Document No." <> Rec."Document No." then begin
            KCBPaymentLines.Reset;
            KCBPaymentLines.SetRange("Document No", xRec."Document No.");
            KCBPaymentLines.SetRange("Batch No", "Batch No");
            if KCBPaymentLines.Find('-') then begin
                KCBPaymentLines.DeleteAll;
            end;
        end;

        PVLines.Reset;
        PVLines.SetRange(No, "Document No.");
        if PVLines.Find('-') then begin

            KCBPaymentLines.Init;
            KCBPaymentLines.Entry := 0;
            KCBPaymentLines.Trcode := '65';//PayMode
            if "Pay Mode" = 'EFT' then
                KCBPaymentLines.Trcode := '26';//PayMode

            KCBPaymentLines."pay Mode" := "Pay Mode";
            KCBPaymentLines.DrAccount := "Source Bank Acc No.";// To come from header
            KCBPaymentLines.DrName := "Source Bank Acc Name";
            KCBPaymentLines.DrBnkCode := '1100';

            if PVLines."Payment Type" = PVLines."payment type"::"Bank Transfer" then begin
                if PVLines."Account No" = '' then
                    Error('Bank Account No for ' + "Document No." + ' is blank');

                KCBPaymentLines.CrAccount := PVLines."Account No";
            end
            else
                if PVLines."Payment Type" = PVLines."payment type"::"Payment Voucher" then begin
                    if PVLines."Payee Bank Account Number" = '' then
                        Error('Bank Account No for ' + "Document No." + ' is blank');

                    KCBPaymentLines.CrAccount := PVLines."Payee Bank Account Number";
                end;
            KCBPaymentLines.CrName := PVLines."Account Name";
            KCBPaymentLines.CrBnkCode := PVLines."Payee Bank Branch Code";
            KCBPaymentLines.Reference := "Document No." + '-' + Format("Entry No");
            KCBPaymentLines.Amount := Format(ROUND(PVLines."Net Amount"));
            KCBPaymentLines."Amount Decimal" := ROUND(PVLines."Net Amount");
            KCBPaymentLines."Batch No" := "Batch No";
            KCBPaymentLines."Document No" := "Document No.";
            KCBPaymentLines."Payment Narration" := "Payment Narration";
            KCBPaymentLines.Insert;
        end;
    end;
}

