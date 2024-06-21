#pragma warning disable AA0005, AA0008Job task , AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 57000 "Payments-Post"
{

    trigger OnRun()
    begin
    end;

    var
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record "Cash Management Setup";
        Text000: label 'There is a remaining amount of %1 are you sure you want to create a receipt for this amount?';
        Text001: label '&Post and Create &Receipt,&Post';
        Text002: label 'Are you sure you want to post Imprest No %1 ?';
        Text102: label 'Are you sure you want to Send Imprest No %1?';
        Text003: label 'The Imprest No %1  has not been fully approved';
        Text004: label 'The Imprest Lines are empty';
        Text005: label 'Amount cannot be zero';
        Text006: label 'Imprest %1 has been posted';
        Text007: label 'Are u sure u want to post Imprest Surrender No. %1 ?';
        Text008: label 'The Imprest Surrender No. %1 has not been fully approved';
        Text009: label 'The Imprest Surrender Lines are empty';
        Text010: label 'Imprest %1 has been surrendered';
        Text011: label 'Are you sure you want to post Imprest Memo %1 ?';
        Text012: label 'The Imprest Memo amount is zero';
        Text013: label 'The Imprest Memo has already been posted';
        Tariffs: Record "Tariff Codes1";
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        NumberText: array[2] of Text[80];
        CurrencyCodeText: Code[10];
        Text014: label 'Are you sure you want to post petty cash surrender No %1 ?';
        Text015: label 'Petty Cash %1 has been surrendered';
        Text016: label 'Actual amount spent cannot be zero';
        Text017: label 'Are you sure you want to post receipt no. %1 ?';
        Text018: label 'The receipt is already posted';
        WText001: label 'Last Check No. must be filled in.';
        WText002: label 'Filters on %1 and %2 are not allowed.';
        WText003: label 'XXXXXXXXXXXXXXXX';
        WText004: label 'must be entered.';
        WText005: label 'The Bank Account and the General Journal Line must have the same currency.';
        WText006: label 'Salesperson';
        WText007: label 'Purchaser';
        WText008: label 'Both Bank Accounts must have the same currency.';
        WText009: label 'Our Contact';
        WText010: label 'XXXXXXXXXX';
        WText011: label 'XXXX';
        WText012: label 'XX.XXXXXXXXXX.XXXX';
        WText013: label '%1 already exists.';
        WText014: label 'Check for %1 %2';
        WText015: label 'Payment';
        WText016: label 'In the Check report, One Check per Vendor and Document No.\';
        WText017: label 'must not be activated when Applies-to ID is specified in the journal lines.';
        WText018: label 'XXX';
        WText019: label 'Total';
        WText020: label 'The total amount of check %1 is %2. The amount must be positive.';
        WText021: label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        WText022: label 'NON-NEGOTIABLE';
        WText023: label 'Test print';
        WText024: label 'XXXX.XX';
        WText025: label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        WText026: label 'ZERO';
        WText027: label 'HUNDRED';
        WText028: label 'AND';
        WText029: label '%1 results in a written number that is too long.';
        WText030: label ' is already applied to %1 %2 for customer %3.';
        WText031: label ' is already applied to %1 %2 for vendor %3.';
        WText032: label 'ONE';
        WText033: label 'TWO';
        WText034: label 'THREE';
        WText035: label 'FOUR';
        WText036: label 'FIVE';
        WText037: label 'SIX';
        WText038: label 'SEVEN';
        WText039: label 'EIGHT';
        WText040: label 'NINE';
        WText041: label 'TEN';
        WText042: label 'ELEVEN';
        WText043: label 'TWELVE';
        WText044: label 'THIRTEEN';
        WText045: label 'FOURTEEN';
        WText046: label 'FIFTEEN';
        WText047: label 'SIXTEEN';
        WText048: label 'SEVENTEEN';
        WText049: label 'EIGHTEEN';
        WText050: label 'NINETEEN';
        WText051: label 'TWENTY';
        WText052: label 'THIRTY';
        WText053: label 'FORTY';
        WText054: label 'FIFTY';
        WText055: label 'SIXTY';
        WText056: label 'SEVENTY';
        WText057: label 'EIGHTY';
        WText058: label 'NINETY';
        WText059: label 'THOUSAND';
        WText060: label 'MILLION';
        WText061: label 'BILLION';
        Acct: Record "G/L Account";
        Imprest1: Record payments;
        Text019: label 'Are you sure tou want to post Imprest Memo Surrender %1 ?';
        Text020: label 'The Imprest Memo has already been surrendered';
        Text021: label 'Are you sure you want to post Staff Claim %1?';
        text022: label 'Staff claim amount cannot be 0. Please confirm the amount and try again.';
        Text023: label 'Staff claim must be fully approved before posting';
        text024: label 'Are you sure you want to post staff claim No. %1?';
        text025: label 'Are you sure you want to post salary Advance No. %1?';
        Text026: label 'Salary Advance  must be fully approved before posting';
        text027: label 'Approved Salary Advance amount cannot be 0. Please confirm the amount and try again.';
        text028: label 'Are you sure you want to post Standing Imprest Surrender No. %1?';
        ObjJob: Record Job;
        JobPostingGroup: Record "Job Posting Group";
        Text0155: label 'Are you sure you want to post advance request no. %1 ?';
        Text0199: label 'The contractor advance request is already posted.';


    procedure "Post Payment Voucher"(PV: Record payments)
    var
        CMS: Record "Cash Management Setup";
    begin
        CMS.get();
        if CMS."Post PV with Taxes" then
            PostPVWithTaxes(PV)
        else
            PostPVWithoutTaxes(PV);
    end;

    Local Procedure PostPVWithTaxes(PV: Record payments)
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        vendorledentry: record "Vendor Ledger Entry";
        HasValue: boolean;
    begin
        IF CONFIRM('Are you sure you want to post the Payment Voucher No. ' + PV."No." + ' ?') = TRUE THEN BEGIN
            IF PV.Status <> PV.Status::Released THEN
                ERROR('The Payment Voucher No %1 has not been fully approved', PV."No.");
            IF PV.Posted THEN
                ERROR('Payment Voucher %1 has been posted', PV."No.");
            //cc  check if posted
            vendorledentry.RESET;
            vendorledentry.SETRANGE(vendorledentry."Document No.", PV."No.");
            IF vendorledentry.findset then begin
                error('This PV has Already Been Posted!');
                PV.Posted := TRUE;
                PV.Modify();
            end;


            PV.TESTFIELD(Date);
            PV.TESTFIELD("Paying Bank Account");
            PV.TESTFIELD(PV.Payee);
            PV.TESTFIELD(PV."Pay Mode");
            PV.TESTFIELD(PV."Posting Date");
            IF PV."Pay Mode" = 'CHEQUE' THEN BEGIN
                PV.TESTFIELD(PV."Cheque No");
                PV.TESTFIELD(PV."Cheque Date");
            END;

            PV.CALCFIELDS(PV."Total Retention Amount");
            //Check Lines
            PV.CALCFIELDS("Total Amount");
            IF PV."Total Amount" = 0 THEN
                ERROR('Amount cannot be zero');
            PVLines.RESET;
            PVLines.SETRANGE(PVLines.No, PV."No.");
            IF NOT PVLines.FINDLAST THEN
                ERROR('Payment voucher Lines cannot be empty');



            CMSetup.GET();
            // Delete Lines Present on the General Journal Line
            GenJnLine.RESET;
            GenJnLine.SETRANGE(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SETRANGE(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DELETEALL;

            LineNo := LineNo + 10000;
            PV.CALCFIELDS(PV."Total Amount");
            PVLines.RESET;
            PVLines.SETRANGE(PVLines.No, PV."No.");
            PVLines.VALIDATE(PVLines.Amount);
            PVLines.CALCSUMS(PVLines.Amount);
            PVLines.CALCSUMS(PVLines."W/Tax Amount");
            PVLines.CALCSUMS(PVLines."VAT Amount");
            PVLines.CALCSUMS(PVLines."Obligation WHT");
            PVLines.CALCSUMS(PVLines."Obligation VAT");
            PVLines.CALCSUMS(PVLines."Obligation Income Tax");
            PVLines.CALCSUMS(PVLines."Obligation Total Amount");
            PVLines.CALCSUMS(PVLines."Retention  Amount");
            PVLines.CALCSUMS(PVLines."Net Amount");
            PVLines.CALCSUMS(PVLines."Amount Paid");
            PVLines.CALCSUMS(PVLines."PAYE Amount");
            PVLines.CALCSUMS("Liquidated Damages");
            IF PVLines."Amount Paid" = PVLines."Net Amount" THEN
                MESSAGE('', PVLines."Amount Paid");

            GenJnLine.INIT;
            IF CMSetup.GET THEN
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
            GenJnLine."Document Type" := PV."Document Type";
            GenJnLine."Account No." := PV."Paying Bank Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            IF PV.Date = 0D THEN
                ERROR('You must specify the PV date');
            GenJnLine."Posting Date" := PV."Posting Date";
            GenJnLine."Document No." := PV."No.";
            GenJnLine."External Document No." := PV."Cheque No";
            GenJnLine."Payment Method Code" := PV."Pay Mode";
            //GenJnLine.Description:='Pay To:'+PV.Payee;
            GenJnLine.Description := CopyStr(PVLines.Description, 1, 100);
            GenJnLine.Amount := -PV."Total Net Amount";
            GenJnLine.VALIDATE("Currency Code");
            GenJnLine.VALIDATE(GenJnLine.Amount);
            GenJnLine."Project No" := PVLines."Project No";
            GenJnLine."Contractor No" := PVLines."Contractor No";
            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

            IF GenJnLine.Amount <> 0 THEN
                GenJnLine.INSERT;

            //PV Lines Entries
            PVLines.RESET;
            PVLines.SETRANGE(PVLines.No, PV."No.");
            IF PVLines.FindSet() THEN BEGIN
                REPEAT
                    //check VLE
                    Hasvalue := false;
                    vendorledentry.RESET();
                    vendorledentry.SETRANGE(vendorledentry."Vendor No.", PVLines."Account No");
                    vendorledentry.SETRANGE(vendorledentry."Document No.", PVLines."Applies to Doc. No");
                    vendorledentry.SETRANGE("Document type", vendorledentry."Document type"::" ");
                    IF vendorledentry.findfirst() then begin
                        hasvalue := true;
                    end;
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PVLines.Description, 1, 100);
                    ;
                    GenJnLine.Amount := PVLines."Net Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    //Payment Vouchers With Part Payment David.




                    //add jobs if g/l account and income statement account

                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::"G/L Account" THEN BEGIN
                        IF Acct.GET(GenJnLine."Account No.") THEN BEGIN
                            IF Acct."Income/Balance" = Acct."Income/Balance"::"Income Statement" THEN BEGIN
                                GenJnLine."Job No." := PV.Project;
                                GenJnLine."Job Task No." := PV."Job Task No.";
                                GenJnLine."Job Quantity" := 1;

                                GenJnLine.VALIDATE(GenJnLine."Job No.");
                                GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                                GenJnLine.VALIDATE(GenJnLine."Job Quantity");
                            END;
                        END;
                    END;
                    //end jobs

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                    //application only to type Vendor with invoice
                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                        // to return back cc
                        if hasvalue = true then
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                        else
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                    END;

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    // VAT withheld

                    IF PVLines."VAT Withheld Amount" > 0 THEN
                        Tariffs.GET(PVLines."VAT Withheld Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + '-VAT Withheld', 1, 100);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := -PVLines."VAT Withheld Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //VAT W/Held balancing Entry
                    IF PVLines."VAT Withheld Amount" > 0 THEN
                        Tariffs.GET(PVLines."VAT Withheld Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + '-VAT Withheld', 1, 100);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := PVLines."VAT Withheld Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.VALIDATE("Applies-to Doc. No.");
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr('VAT Withheld on:' + PVLines.Description, 1, 100);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."VAT Withheld Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);

                    //Fred..VAT W/Held Balancing Account
                    GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.VALIDATE("Bal. Account No.");
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                        // to return back cc
                        // 
                        if hasvalue = true then
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                        else
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                    END;

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;


                    //Posting of Advance Recovery David & Spencer

                    IF PV."Advance Recovery" <> 0 THEN BEGIN
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PV."Account Type";

                        Vendor.RESET;
                        Vendor.SETRANGE(Vendor."No.", PVLines."Account No");
                        IF Vendor.FINDSET THEN BEGIN
                            IF PV."Advance Recovery" <> 0 THEN BEGIN
                                Vendor.TESTFIELD("Advance Customer No");
                                GenJnLine."Account No." := Vendor."Advance Customer No";
                            END;
                        END;
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV posting date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-AdA', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //MESSAGE('%1',PV."Advance Recovery");
                        GenJnLine.Amount := -PV."Advance Recovery";

                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;

                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the Posting PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr('Advance Recovery Amount:', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        GenJnLine.Amount := PV."Advance Recovery";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);

                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                        //application only to type Vendor
                        IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                            // to return back cc
                            if hasvalue = true then
                                GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                            else
                                GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                            GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                            GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                        END;

                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    END;
                    //end of Posting of Advance Recovery David & Spencer




                    //Withholding Tax
                    IF PVLines."W/Tax Amount" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + '-WholdingTax', 1, 100);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := -PVLines."W/Tax Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);

                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";


                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Withholding Tax...Fred Balancing W/tax entry
                    IF PVLines."W/Tax Amount" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + '-WholdingTax', 1, 100);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := PVLines."W/Tax Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.VALIDATE("Applies-to Doc. No.");

                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";


                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;



                    //Post PAYE
                    IF PVLines."PAYE Amount" > 0 THEN
                        Tariffs.GET(PVLines."PAYE Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'PAYE', 1, 100);
                    GenJnLine.Amount := -PVLines."PAYE Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Post PAYE..Fred PAYE Balancing Entry
                    IF PVLines."PAYE Amount" > 0 THEN
                        Tariffs.GET(PVLines."PAYE Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'PAYE', 1, 100);
                    GenJnLine.Amount := PVLines."PAYE Amount";
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.VALIDATE("Applies-to Doc. No.");
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;



                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'PAYE', 1, 100);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."PAYE Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    //Fred ..Balancing PAYE Entry
                    GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.VALIDATE("Bal. Account No.");
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.VALIDATE("Applies-to Doc. No.");

                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                        //cc to return

                        if hasvalue = true then
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                        else
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                    END;

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;
                    ////End Posting PAYE

                    //W/Tax Vendor Entry
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'WITHHOLDING TAX:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."W/Tax Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);


                    //Fred ...W/tax balancing entry
                    GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.VALIDATE("Bal. Account No.");
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                        //       to return back cc
                        //   GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                        if hasvalue = true then
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                        else
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;

                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                    END;

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;




                    //Retention
                    IF PVLines."Retention  Amount" > 0 THEN
                        Tariffs.GET(PVLines."Retention Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    //
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + '-Amount Retained', 1, 100);
                    GenJnLine.Amount := -PV."Total Retention Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;




                    //Debit Contractor Account
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PVLines."Project No" + ' ' + 'AMOUNT RETAINED:', 1, 100);
                    GenJnLine.Amount := PV."Total Retention Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    //application only to type Vendor
                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                    END;

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;


                    //cancel interbank transfer cc
                    // //Fred Debit Retention Account>>>>>>Retention Amount
                    // IF PVLines."Retention  Amount" > 0 THEN BEGIN
                    //     LineNo := LineNo + 10000;
                    //     GenJnLine.INIT;
                    //     IF CMSetup.GET THEN
                    //         GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    //     GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    //     GenJnLine."Line No." := LineNo;
                    //     GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
                    //     GenJnLine."Account No." := PV."Retention Account";
                    //     GenJnLine.VALIDATE(GenJnLine."Account No.");
                    //     IF PV."Posting Date" = 0D THEN
                    //         ERROR('You must specify the PV date');
                    //     GenJnLine."Posting Date" := PV."Posting Date";
                    //     GenJnLine."Document No." := PV."No.";
                    //     GenJnLine."External Document No." := PV."Cheque No";
                    //     GenJnLine."Payment Method Code" := PV."Pay Mode";
                    //     GenJnLine.Description := PV.Payee + '-Amount Retained';
                    //     GenJnLine.Amount := PV."Total Retention Amount";
                    //     GenJnLine.VALIDATE(Amount);
                    //     IF PV."Pay Mode" = 'CHEQUE' THEN
                    //         GenJnLine."Currency Code" := PV.Currency;
                    //     GenJnLine."Project No" := PVLines."Project No";
                    //     GenJnLine."Contractor No" := PVLines."Contractor No";
                    //     GenJnLine.VALIDATE("Currency Code");
                    //     GenJnLine.VALIDATE(GenJnLine.Amount);
                    //     GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    //     GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    //     IF GenJnLine.Amount <> 0 THEN
                    //         GenJnLine.INSERT;

                    //     //Credit The Paying Account>>>>Retention Amount
                    //     LineNo := LineNo + 10000;
                    //     GenJnLine.INIT;
                    //     IF CMSetup.GET THEN
                    //         GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    //     GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    //     GenJnLine."Line No." := LineNo;
                    //     GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
                    //     GenJnLine."Account No." := PV."Paying Bank Account";
                    //     GenJnLine.VALIDATE(GenJnLine."Account No.");
                    //     IF PV."Posting Date" = 0D THEN
                    //         ERROR('You must specify the PV date');
                    //     GenJnLine."Posting Date" := PV."Posting Date";
                    //     GenJnLine."Document No." := PV."No.";
                    //     GenJnLine."External Document No." := PV."Cheque No";
                    //     GenJnLine."Payment Method Code" := PV."Pay Mode";
                    //     GenJnLine.Description := PV.Payee + '-Amount Retained';
                    //     GenJnLine.Amount := -PV."Total Retention Amount";
                    //     GenJnLine.VALIDATE(Amount);
                    //     IF PV."Pay Mode" = 'CHEQUE' THEN
                    //         GenJnLine."Currency Code" := PV.Currency;
                    //     GenJnLine."Project No" := PVLines."Project No";
                    //     GenJnLine."Contractor No" := PVLines."Contractor No";
                    //     GenJnLine.VALIDATE("Currency Code");
                    //     GenJnLine.VALIDATE(GenJnLine.Amount);
                    //     GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    //     GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    //     IF GenJnLine.Amount <> 0 THEN
                    //         GenJnLine.INSERT;
                    // END;

                    //Fred Liquidated Damages
                    IF PVLines."Liquidated Damages" > 0 THEN BEGIN
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."Account Type"::"G/L Account";
                        ObjJob.RESET;
                        ObjJob.SETRANGE("No.", PVLines."Project No");
                        IF ObjJob.FINDSET THEN BEGIN
                            JobPostingGroup.RESET;
                            JobPostingGroup.SETRANGE(Code, ObjJob."Job Posting Group");
                            IF JobPostingGroup.FINDSET THEN BEGIN

                                GenJnLine."Account No." := JobPostingGroup."G/L Expense Acc. (Contract)";
                            END;
                        END;

                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-' + 'Liquidated Damages', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        PV.CALCFIELDS("Total Liquidated Damages");
                        GenJnLine.Amount := -PV."Total Liquidated Damages";
                        //GenJnLine.Amount:=-PVLines."Retention  Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;


                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := 'Liquidated Damages:';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        GenJnLine.Amount := PV."Total Liquidated Damages";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    END;


                    //Debit Contractor Obligation - WHT
                    IF PVLines."Obligation WHT" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation WHT', 1, 100);
                    GenJnLine.Amount := PVLines."Obligation WHT";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Post Obligation - WHT Balancing Entry
                    IF PVLines."Obligation WHT" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation WHT', 1, 100);
                    GenJnLine.Amount := -PVLines."Obligation WHT";
                    // GenJnLine."Applies-to Doc. No.":=PV."No.";
                    // GenJnLine.VALIDATE("Applies-to Doc. No.");
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Debit Contractor Obligation - Income Tax
                    IF PVLines."Obligation Income Tax" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                    GenJnLine.Amount := PVLines."Obligation Income Tax";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Post Obligation - Income Tax Balancing Entry
                    IF PVLines."Obligation Income Tax" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                    GenJnLine.Amount := -PVLines."Obligation Income Tax";
                    // GenJnLine."Applies-to Doc. No.":=PV."No.";
                    // GenJnLine.VALIDATE("Applies-to Doc. No.");
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;


                    //Debit Contractor Obligation - VAT
                    IF PVLines."Obligation VAT" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                    ;
                    GenJnLine.Amount := PVLines."Obligation VAT";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Post Obligation - VAT Balancing Entry
                    IF PVLines."Obligation VAT" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                    GenJnLine.Amount := -PVLines."Obligation VAT";
                    // GenJnLine."Applies-to Doc. No.":=PV."No.";
                    // GenJnLine.VALIDATE("Applies-to Doc. No.");
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Debit Master Obligation WHT
                    IF PVLines."Obligation WHT" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;

                    GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
                    GenJnLine."Account No." := PV."Paying Bank Account";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");

                    GenJnLine."Bal. Account Type" := Tariffs."Account Type";
                    GenJnLine."Bal. Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE("Bal. Account No.");

                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation WHT', 1, 100);
                    GenJnLine.Amount := -PVLines."Obligation WHT";
                    // GenJnLine."Applies-to Doc. No.":=PV."No.";
                    // GenJnLine.VALIDATE("Applies-to Doc. No.");
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;


                    //Debit Master Obligation Income Tax
                    IF PVLines."Obligation Income Tax" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
                    GenJnLine."Account No." := PV."Paying Bank Account";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");

                    GenJnLine."Bal. Account Type" := Tariffs."Account Type";
                    GenJnLine."Bal. Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE("Bal. Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                    GenJnLine.Amount := -PVLines."Obligation Income Tax";
                    // GenJnLine."Applies-to Doc. No.":=PV."No.";
                    // GenJnLine.VALIDATE("Applies-to Doc. No.");
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    //Debit Master Obligation VAT
                    IF PVLines."Obligation VAT" > 0 THEN
                        Tariffs.GET(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
                    GenJnLine."Account No." := PV."Paying Bank Account";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");

                    GenJnLine."Bal. Account Type" := Tariffs."Account Type";
                    GenJnLine."Bal. Account No." := Tariffs."Account No.";
                    GenJnLine.VALIDATE("Bal. Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                    GenJnLine.Amount := -PVLines."Obligation VAT";
                    // GenJnLine."Applies-to Doc. No.":=PV."No.";
                    // GenJnLine.VALIDATE("Applies-to Doc. No.");
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                UNTIL PVLines.NEXT = 0;
            END;
            //End of Posting Withholding Tax
            //David

            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnLine);
            //{GLEntry.RESET;
            //GLEntry.SETRANGE(GLEntry."Document No.",PV."No.");
            // GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            // IF GLEntry.FINDFIRST THEN BEGIN}
            PV.Posted := TRUE;
            PV."Posted By" := USERID;
            PV."Posted Date" := TODAY;
            PV."Time Posted" := TIME;
            PV.MODIFY;
            PVLines."No. Posted" := PVLines."No. Posted" + 1;
        END; //end of if No. Posted statement David

        //END;
    end;

    Local Procedure PostPVWithoutTaxes(PV: Record payments)
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        vendorledentry: record "Vendor Ledger Entry";
        HasValue: boolean;
    begin
        IF CONFIRM('Are you sure you want to post the Payment Voucher No. ' + PV."No." + ' ?') = TRUE THEN BEGIN
            IF PV.Status <> PV.Status::Released THEN
                ERROR('The Payment Voucher No %1 has not been fully approved', PV."No.");
            IF PV.Posted THEN
                ERROR('Payment Voucher %1 has been posted', PV."No.");
            //cc  check if posted
            vendorledentry.RESET;
            vendorledentry.SETRANGE(vendorledentry."Document No.", PV."No.");
            IF vendorledentry.findset then begin
                error('This PV has Already Been Posted!');
                PV.Posted := TRUE;
                PV.Modify();
            end;


            PV.TESTFIELD(Date);
            PV.TESTFIELD("Paying Bank Account");
            PV.TESTFIELD(PV.Payee);
            PV.TESTFIELD(PV."Pay Mode");
            PV.TESTFIELD(PV."Posting Date");
            IF PV."Pay Mode" = 'CHEQUE' THEN BEGIN
                PV.TESTFIELD(PV."Cheque No");
                PV.TESTFIELD(PV."Cheque Date");
            END;

            PV.CALCFIELDS(PV."Total Retention Amount");
            //Check Lines
            PV.CALCFIELDS("Total Amount");
            IF PV."Total Amount" = 0 THEN
                ERROR('Amount cannot be zero');
            PVLines.RESET;
            PVLines.SETRANGE(PVLines.No, PV."No.");
            IF NOT PVLines.FINDLAST THEN
                ERROR('Payment voucher Lines cannot be empty');



            CMSetup.GET();
            // Delete Lines Present on the General Journal Line
            GenJnLine.RESET;
            GenJnLine.SETRANGE(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SETRANGE(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DELETEALL;

            LineNo := LineNo + 10000;
            PV.CALCFIELDS(PV."Total Amount");
            PVLines.RESET;
            PVLines.SETRANGE(PVLines.No, PV."No.");
            PVLines.VALIDATE(PVLines.Amount);
            PVLines.CALCSUMS(PVLines.Amount);
            PVLines.CALCSUMS(PVLines."W/Tax Amount");
            PVLines.CALCSUMS(PVLines."VAT Amount");
            PVLines.CALCSUMS(PVLines."Obligation WHT");
            PVLines.CALCSUMS(PVLines."Obligation VAT");
            PVLines.CALCSUMS(PVLines."Obligation Income Tax");
            PVLines.CALCSUMS(PVLines."Obligation Total Amount");
            PVLines.CALCSUMS(PVLines."Retention  Amount");
            PVLines.CALCSUMS(PVLines."Net Amount");
            PVLines.CALCSUMS(PVLines."Amount Paid");
            PVLines.CALCSUMS(PVLines."PAYE Amount");
            PVLines.CALCSUMS("Liquidated Damages");
            IF PVLines."Amount Paid" = PVLines."Net Amount" THEN
                MESSAGE('', PVLines."Amount Paid");

            GenJnLine.INIT;
            IF CMSetup.GET THEN
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
            GenJnLine."Document Type" := PV."Document Type";
            GenJnLine."Account No." := PV."Paying Bank Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            IF PV.Date = 0D THEN
                ERROR('You must specify the PV date');
            GenJnLine."Posting Date" := PV."Posting Date";
            GenJnLine."Document No." := PV."No.";
            GenJnLine."External Document No." := PV."Cheque No";
            GenJnLine."Payment Method Code" := PV."Pay Mode";
            //GenJnLine.Description:='Pay To:'+PV.Payee;
            GenJnLine.Description := CopyStr(PVLines.Description, 1, 100);
            GenJnLine.Amount := -PV."Total Net Amount";
            GenJnLine.VALIDATE("Currency Code");
            GenJnLine.VALIDATE(GenJnLine.Amount);
            GenJnLine."Project No" := PVLines."Project No";
            GenJnLine."Contractor No" := PVLines."Contractor No";
            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

            IF GenJnLine.Amount <> 0 THEN
                GenJnLine.INSERT;

            //PV Lines Entries
            PVLines.RESET;
            PVLines.SETRANGE(PVLines.No, PV."No.");
            IF PVLines.FindSet() THEN BEGIN
                REPEAT
                    //check VLE
                    Hasvalue := false;
                    vendorledentry.RESET;
                    vendorledentry.SETRANGE(vendorledentry."Vendor No.", PVLines."Account No");
                    vendorledentry.SETRANGE(vendorledentry."Document No.", PVLines."Applies to Doc. No");
                    vendorledentry.SetRange("Document type", vendorledentry."Document type"::" ");
                    IF vendorledentry.findset() then begin
                        hasvalue := true;
                    end;

                    LineNo := LineNo + 10000;
                    GenJnLine.INIT;
                    IF CMSetup.GET THEN
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.VALIDATE(GenJnLine."Account No.");
                    IF PV."Posting Date" = 0D THEN
                        ERROR('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr(PVLines.Description, 1, 100);
                    GenJnLine.Amount := PVLines."Net Amount";
                    IF PV."Pay Mode" = 'CHEQUE' THEN
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Project No" := PVLines."Project No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    //Payment Vouchers With Part Payment David.
                    //add jobs if g/l account and income statement account
                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::"G/L Account" THEN BEGIN
                        IF Acct.GET(GenJnLine."Account No.") THEN BEGIN
                            IF Acct."Income/Balance" = Acct."Income/Balance"::"Income Statement" THEN BEGIN
                                GenJnLine."Job No." := PV.Project;
                                GenJnLine."Job Task No." := PV."Job Task No.";
                                GenJnLine."Job Quantity" := 1;

                                GenJnLine.VALIDATE(GenJnLine."Job No.");
                                GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                                GenJnLine.VALIDATE(GenJnLine."Job Quantity");
                            END;
                        END;
                    END;
                    //end jobs

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                    //application only to type Vendor with invoice
                    IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN begin
                        if hasvalue then
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                        else
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                    end;
                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;

                    // VAT withheld

                    IF PVLines."VAT Withheld Amount" > 0 THEN begin
                        Tariffs.GET(PVLines."VAT Withheld Code");

                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-VAT Withheld', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        GenJnLine.Amount := -PVLines."VAT Withheld Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    //VAT W/Held balancing Entry
                    IF PVLines."VAT Withheld Amount" > 0 THEN begin
                        Tariffs.GET(PVLines."VAT Withheld Code");

                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-VAT Withheld', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        GenJnLine.Amount := PVLines."VAT Withheld Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        // GenJnLine."Applies-to Doc. No." := PV."No.";
                        // GenJnLine.VALIDATE("Applies-to Doc. No.");
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    LineNo := LineNo + 10000;


                    //Posting of Advance Recovery David & Spencer

                    IF PV."Advance Recovery" <> 0 THEN BEGIN
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PV."Account Type";

                        Vendor.RESET;
                        Vendor.SETRANGE(Vendor."No.", PVLines."Account No");
                        IF Vendor.FINDSET THEN BEGIN
                            IF PV."Advance Recovery" <> 0 THEN BEGIN
                                Vendor.TESTFIELD("Advance Customer No");
                                GenJnLine."Account No." := Vendor."Advance Customer No";
                            END;
                        END;
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV posting date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-AdA', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //MESSAGE('%1',PV."Advance Recovery");
                        GenJnLine.Amount := -PV."Advance Recovery";

                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;

                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the Posting PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr('Advance Recovery Amount:', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        GenJnLine.Amount := PV."Advance Recovery";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);

                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                        //application only to type Vendor
                        IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                            // to return back cc
                            //  GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                            if hasvalue = true then
                                GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                            else
                                GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                            GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                            GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                        END;

                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    END;
                    //end of Posting of Advance Recovery David & Spencer




                    //Withholding Tax
                    IF PVLines."W/Tax Amount" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");

                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-WholdingTax', 1, 100);
                        GenJnLine.Amount := -PVLines."W/Tax Amount";
                        // IF PV."Pay Mode" = 'CHEQUE' THEN
                        // GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    //Withholding Tax...Fred Balancing W/tax entry
                    IF PVLines."W/Tax Amount" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-WholdingTax', 1, 100);
                        GenJnLine.Amount := PVLines."W/Tax Amount";
                        //IF PV."Pay Mode" = 'CHEQUE' THEN
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    //Post PAYE
                    IF PVLines."PAYE Amount" > 0 THEN begin
                        Tariffs.GET(PVLines."PAYE Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'PAYE', 1, 100);
                        GenJnLine.Amount := -PVLines."PAYE Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;


                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'PAYE', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        GenJnLine.Amount := PVLines."PAYE Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        // GenJnLine."Applies-to Doc. No." := PV."No.";
                        if hasvalue = true then
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                        else
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                        // GenJnLine.VALIDATE("Applies-to Doc. No.");
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;
                    //end;
                    ////End Posting PAYE

                    //W/Tax Vendor Entry
                    // LineNo := LineNo + 10000;
                    // GenJnLine.INIT;
                    // IF CMSetup.GET THEN
                    //     GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    // GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    // GenJnLine."Line No." := LineNo;
                    // GenJnLine."Account Type" := PVLines."Account Type";
                    // GenJnLine."Account No." := PVLines."Account No";
                    // GenJnLine.VALIDATE(GenJnLine."Account No.");
                    // IF PV."Posting Date" = 0D THEN
                    //     ERROR('You must specify the PV date');
                    // GenJnLine."Posting Date" := PV."Posting Date";
                    // GenJnLine."Document No." := PV."No.";
                    // GenJnLine."External Document No." := PV."Cheque No";
                    // GenJnLine."Payment Method Code" := PV."Pay Mode";
                    // GenJnLine.Description := 'WITHHOLDING TAX:';
                    // //GenJnLine."Description 2":=PV."On behalf of";
                    // //GenJnLine.Amount:=PVLines.Amount;
                    // GenJnLine.Amount := PVLines."W/Tax Amount";
                    // IF PV."Pay Mode" = 'CHEQUE' THEN
                    //     //GenJnLine."Pay Mode":=PV."Pay Mode";
                    //     GenJnLine."Currency Code" := PV.Currency;
                    // GenJnLine."Project No" := PVLines."Project No";
                    // GenJnLine."Contractor No" := PVLines."Contractor No";
                    // GenJnLine.VALIDATE("Currency Code");
                    // GenJnLine.VALIDATE(GenJnLine.Amount);
                    // //GenJnLine.VALIDATE("Bal. Account No.");
                    // GenJnLine."Project No" := PVLines."Project No";
                    // GenJnLine."Contractor No" := PVLines."Contractor No";
                    // GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    // GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                    // IF GenJnLine.Amount <> 0 THEN
                    //     GenJnLine.INSERT;


                    //Retention
                    IF PVLines."Retention  Amount" > 0 THEN begin
                        Tariffs.GET(PVLines."Retention Code");

                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        //
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-Amount Retained', 1, 100);
                        GenJnLine.Amount := -PV."Total Retention Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;

                        //Debit Contractor Account retention
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PVLines."Project No" + ' ' + 'AMOUNT RETAINED:', 1, 100);
                        GenJnLine.Amount := PV."Total Retention Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        //application only to type Vendor
                        IF GenJnLine."Account Type" = GenJnLine."Account Type"::Vendor THEN BEGIN
                            if hasvalue then
                                GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::" "
                            else
                                GenJnLine."Applies-to Doc. Type" := GenJnLine."Applies-to Doc. Type"::Invoice;
                            GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                            GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                        END;
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;
                    //Fred Liquidated Damages
                    IF PVLines."Liquidated Damages" > 0 THEN BEGIN
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."Account Type"::"G/L Account";
                        ObjJob.RESET;
                        ObjJob.SETRANGE("No.", PVLines."Project No");
                        IF ObjJob.FINDSET THEN BEGIN
                            JobPostingGroup.RESET;
                            JobPostingGroup.SETRANGE(Code, ObjJob."Job Posting Group");
                            IF JobPostingGroup.FINDSET THEN BEGIN

                                GenJnLine."Account No." := JobPostingGroup."G/L Expense Acc. (Contract)";
                            END;
                        END;

                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + '-' + 'Liquidated Damages', 1, 100);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        PV.CALCFIELDS("Total Liquidated Damages");
                        GenJnLine.Amount := -PV."Total Liquidated Damages";
                        //GenJnLine.Amount:=-PVLines."Retention  Amount";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;


                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := 'Liquidated Damages:';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        GenJnLine.Amount := PV."Total Liquidated Damages";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    END;


                    //Debit Contractor Obligation - WHT
                    IF PVLines."Obligation WHT" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation WHT', 1, 100);
                        GenJnLine.Amount := PVLines."Obligation WHT";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    //Post Obligation - WHT Balancing Entry
                    IF PVLines."Obligation WHT" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation WHT', 1, 100);
                        GenJnLine.Amount := -PVLines."Obligation WHT";
                        // GenJnLine."Applies-to Doc. No.":=PV."No.";
                        // GenJnLine.VALIDATE("Applies-to Doc. No.");
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    //Debit Contractor Obligation - Income Tax
                    IF PVLines."Obligation Income Tax" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                        GenJnLine.Amount := PVLines."Obligation Income Tax";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    //Post Obligation - Income Tax Balancing Entry
                    IF PVLines."Obligation Income Tax" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                        GenJnLine.Amount := -PVLines."Obligation Income Tax";
                        // GenJnLine."Applies-to Doc. No.":=PV."No.";
                        // GenJnLine.VALIDATE("Applies-to Doc. No.");
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;


                    //Debit Contractor Obligation - VAT
                    IF PVLines."Obligation VAT" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                        GenJnLine.Amount := PVLines."Obligation VAT";
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                    //Post Obligation - VAT Balancing Entry
                    IF PVLines."Obligation VAT" > 0 THEN begin
                        Tariffs.GET(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.INIT;
                        IF CMSetup.GET THEN
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.VALIDATE(GenJnLine."Account No.");
                        IF PV."Posting Date" = 0D THEN
                            ERROR('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := CopyStr(PV.Payee + ' ' + 'Obligation Income Tax', 1, 100);
                        GenJnLine.Amount := -PVLines."Obligation VAT";
                        // GenJnLine."Applies-to Doc. No.":=PV."No.";
                        // GenJnLine.VALIDATE("Applies-to Doc. No.");
                        IF PV."Pay Mode" = 'CHEQUE' THEN
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Project No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.VALIDATE("Currency Code");
                        GenJnLine.VALIDATE(GenJnLine.Amount);
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        // GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        // GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");
                        IF GenJnLine.Amount <> 0 THEN
                            GenJnLine.INSERT;
                    end;

                UNTIL PVLines.NEXT = 0;
            END;
            //End of Posting Withholding Tax
            //David

            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnLine);
            //{GLEntry.RESET;
            //GLEntry.SETRANGE(GLEntry."Document No.",PV."No.");
            // GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            // IF GLEntry.FINDFIRST THEN BEGIN}
            PV.Posted := TRUE;
            PV."Posted By" := USERID;
            PV."Posted Date" := TODAY;
            PV."Time Posted" := TIME;
            PV.MODIFY;
            PVLines."No. Posted" := PVLines."No. Posted" + 1;
        END; //end of if No. Posted statement David
    end;

    procedure "Post Imprest"(var Imprest: Record payments)
    var
        ImprestLines: Record payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
        CurrExchRate: RECORD "Currency Exchange Rate";
        newamount: decimal;
        ImprestlinesComm: Record "Imprest Lines";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentType: Enum "Commitment Type";
    begin

        if Confirm(Text002, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");

            CMSetup.Get;

            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            Imprest.TestField("Shortcut Dimension 1 Code");

            //Imprest.TestField("Shortcut Dimension 2 Code");
            //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            Imprest.TestField("Posting Date");


            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error(Text004);

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);
            //convert currency
            //  Message('%1', Imprest.ConvertedAmount);
            if Imprest.Posted then
                Error(Text006, Imprest."No.");

            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            CMSetup.TestField("IMPREST Journal Batch Name");
            CMSetup.TestField("Imprest Journal Template");

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST Journal Batch Name");
            GenJnLine.DeleteAll;


            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."IMPREST Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Imprest."Paying Bank Account";
            GenJnLine."Posting Date" := Imprest."Posting Date";
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Cheque No";
            //GenJnLine.Description:='Imprest issued to '+Imprest.Payee;
            GenJnLine.Description := CopyStr(Imprest.Purpose, 1, 100);
            GenJnLine."Currency Code" := '';
            // GenJnLine.VALIDATE("Currency Code");
            GenJnLine.Amount := -Imprest.ConvertedAmount;
            GenJnLine."Posting Group" := CMSetup."Imprest Posting Group";
            GenJnLine.Validate(Amount);
            GenJnLine."Shortcut Dimension 1 Code" := Imprest."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Imprest."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::Employee;
            GenJnLine."Bal. Account No." := Imprest."Account No.";
            GenJnLine.Validate("Bal. Account No.");

            GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", Imprest."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            //GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
            if GLEntry.FindFirst then begin

                Imprest.Posted := true;
                Imprest."Posted By" := UserId;
                Imprest."Posted Date" := Today;
                Imprest."Time Posted" := Time;
                /*/// Imprest.Status:=Imprest.Status::Open;
                 //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
                 //Update the Imprest Deadline
                 //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);*///Dont change for KeRRA
                Imprest.Modify;
            end;
            //pending


        end;

        /*
         IF Imprest1.GET(ImprestLines."No.") THEN BEGIN
         Imprest1."Payment Type":=Imprest1."Payment Type"::"Imprest Surrender";
         Imprest1."Document Type":=Imprest1."Document Type"::"Imprest Surrender";
         Imprest1.Status:=Imprest1.Status::Open;
         Imprest1."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",GenJnLine."Posting Date");
         Imprest1.MODIFY;
         END;
         */

    end;


    procedure "Post ImprestSurrenderBCK"(var ImprestSurrender: Record payments)
    var
        ImprestLines: Record "Imprest Lines";
        LineNo: Integer;
        GenJnLine: Record "Gen. Journal Line";
        Committment: Codeunit Committment;
        GLEntry: Record "G/L Entry";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        Window: Dialog;
        Selection: Integer;
    begin

        if Confirm(Text007, false, ImprestSurrender."No.") = true then begin

            ImprestSurrender.TestField("Surrender Date");
            //Check if amount surrendered is less than amount advanced
            ImprestSurrender.CalcFields("Remaining Amount");
            if ImprestSurrender."Remaining Amount" > 0 then
                Selection := StrMenu(Text001, 1);
            if ImprestSurrender.Status <> ImprestSurrender.Status::Released then
                Error(Text008, ImprestSurrender."No.");

            ImprestSurrender.TestField("Account No.");
            ImprestSurrender.TestField("Paying Bank Account");
            ImprestSurrender.TestField(Date);
            ImprestSurrender.TestField(Payee);
            ImprestSurrender.TestField("Pay Mode");
            if ImprestSurrender."Pay Mode" = 'CHEQUE' then begin
                ImprestSurrender.TestField("Cheque No");
                ImprestSurrender.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if not ImprestLines.FindLast then
                Error(Text009);

            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            /*IF ImprestLines."Actual Spent"=0 THEN
             ERROR('Actual Spent Amount cannot be zero');*/

            if ImprestSurrender.Surrendered then
                Error(Text010, ImprestSurrender."No.");
            //MESSAGE('Tuko hapa!');
            GLSetup.Get;

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", ImprestSurrender."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Imprest Surrender Template";
            Batch.Name := ImprestSurrender."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            //Staff entries
            LineNo := 10000;
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
            GenJnLine."Account No." := ImprestSurrender."Account No.";
            GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
            GenJnLine."Document No." := ImprestSurrender."No.";
            GenJnLine."External Document No." := ImprestSurrender."Cheque No";
            GenJnLine.Description := CopyStr(ImprestSurrender.Payee, 1, 100);
            GenJnLine.Amount := -ImprestLines."Actual Spent";
            //GenJnLine.VALIDATE(Amount);
            GenJnLine."Applies-to Doc. No." := ImprestSurrender."No.";
            GenJnLine.Validate("Applies-to Doc. No.");
            GenJnLine."Shortcut Dimension 1 Code" := ImprestSurrender."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ImprestSurrender."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            //Create Receipt IF Chosen
            if Selection = 1 then begin
                //Insert Header
                ImprestSurrender.CalcFields("Remaining Amount");
                if ImprestSurrender."Remaining Amount" > 0 then begin
                    if ImprestSurrender."Receipt Created" = false then begin
                        /*
                        ReceiptHeader.INIT;
                        ReceiptHeader."No.":=NoSeriesMgt.GetNextNo(GLSetup."Receipt Nos",TODAY,TRUE);
                        ReceiptHeader.Date:=ImprestSurrender."Imprest Surrender Date";
                        ReceiptHeader."Received From":=ImprestSurrender.Payee;
                        ReceiptHeader."On Behalf Of":=ImprestSurrender."On behalf of";
                        ReceiptHeader."Global Dimension 1 Code":=ImprestSurrender."Global Dimension 1 Code";
                        ReceiptHeader."Global Dimension 2 Code":=ImprestSurrender."Global Dimension 2 Code";
                        IF NOT ReceiptHeader.GET(ReceiptHeader."No.") THEN
                        ReceiptHeader.INSERT;
                        */
                    end;
                end;
            end;

            //Expenses
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    if GenJnLine."Account Type" = ImprestLines."account type"::"Fixed Asset" then
                        GenJnLine."FA Posting Type" := GenJnLine."fa posting type"::"Acquisition Cost";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    GenJnLine.Validate("Account No.");
                    GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
                    GenJnLine."Document No." := ImprestSurrender."No.";
                    GenJnLine.Description := CopyStr(ImprestLines.Description, 1, 100);
                    GenJnLine.Amount := ImprestLines."Actual Spent";
                    GenJnLine.Validate(Amount);
                    //Set these fields to blanks
                    //GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
                    //GenJnLine.VALIDATE("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");
                    //
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    GenJnLine.Validate("Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    GenJnLine.Validate("Shortcut Dimension 2 Code");
                    //Ushindi...Insert Job Nos
                    GenJnLine."Job No." := ImprestLines."Job No.";
                    GenJnLine."Job No." := ImprestSurrender.JobNo;
                    GenJnLine."Job Task No." := ImprestSurrender."Job Task No";
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine."Job Task No." := ImprestLines."Job Task No.";
                    //MESSAGE('Tuko hapa!');
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine."Job Quantity" := ImprestLines."Job Quantity";
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //End Of Ushindi changes
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Insert Receipt Lines
                    if Selection = 1 then begin
                        if ImprestLines."Remaining Amount" > 0 then begin
                            if ImprestSurrender."Receipt Created" = false then begin
                                /*
                                ReceiptLine.INIT;
                                ReceiptLine."Line No":=LineNo;
                                ReceiptLine."Receipt No.":=ReceiptHeader."No.";
                                ReceiptLine."Account Type":=ImprestSurrender."Account Type";
                                ReceiptLine."Account No.":=ImprestSurrender."Account No.";
                                ReceiptLine."Account Name":=ImprestSurrender."Account Name";
                                ReceiptLine.Description:=ImprestLines.Description;
                                ReceiptLine.Amount:=ImprestLines."Remaining Amount";
                                ReceiptLine."Global Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                                ReceiptLine."Global Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                                IF NOT ReceiptLine.GET(ReceiptLine."Line No",ReceiptLine."Receipt No.") THEN
                                 ReceiptLine.INSERT;
                                */
                            end;
                        end;
                    end;
                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /* GLEntry.RESET;
             GLEntry.SETRANGE(GLEntry."Document No.",ImprestSurrender."No.");
             GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
             GLEntry.SETRANGE("Posting Date",ImprestSurrender."Surrender Date");
             IF GLEntry.FINDFIRST THEN BEGIN*/
            ImprestSurrender.Surrendered := true;
            if Selection = 1 then
                ImprestSurrender."Receipt Created" := true;
            ImprestSurrender.Modify;
            //Uncommit Entries made to the varoius expenses accounts
            Committment.UncommitImprest(ImprestSurrender);
            //END;
        end;

    end;


    procedure PostImprestMemo(var ImprestMemo: Record "Imprest Memo")
    var
        JobPlanningLines: Record "Job Planning Line";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text011, false, ImprestMemo."No.") then
            exit;

        with ImprestMemo do begin
            //Check if Posted
            if Posted then
                Error(Text013);

            //
            //Check totals
            ImprestMemo.CalcFields("Total Subsistence Allowance");
            //  IF ImprestMemo."Total Subsistence Allowance"=0 THEN
            //    ERROR(Text012);
            // {
            //  //Post Entries into the Job Task Lines
            //   JobPlanningLines.RESET;
            //   JobPlanningLines.SETRANGE("Job No.",Project);
            //   JobPlanningLines.SETRANGE("Job Task No.","Project Task");
            //    IF JobPlanningLines.FINDLAST THEN
            //     LineNo:=JobPlanningLines."Line No."+1
            //    ELSE
            //     LineNo:=1000;
            // }
            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    /*
                     LineNo:=LineNo+1000;
                     JobPlanningLines.INIT;
                     JobPlanningLines."Job No.":=ImprestMemo.Project;
                     JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                     JobPlanningLines."Line No.":=LineNo;
                     JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                     JobPlanningLines."No.":=ProjectMembers."No.";
                     JobPlanningLines.VALIDATE("No.");
                     JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                     JobPlanningLines."Planning Date":=Date;
                     JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(ProjectMembers.Delivery)+'D',Date);
                     JobPlanningLines.Description:=ProjectMembers."Tasks to Carry Out";
                     JobPlanningLines."Work Type Code":=ProjectMembers."Work Type";
                     JobPlanningLines.VALIDATE("Work Type Code");
                     JobPlanningLines.Quantity:=ProjectMembers."Time Period";
                     IF ProjectMembers.Entitlement<>0 THEN //Cases of Personell
                     BEGIN
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers.Entitlement;
                       JobPlanningLines."Line Amount (LCY)":=ProjectMembers.Entitlement;
                    END ELSE
                    BEGIN//Cases of Machinery
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers."Expected Maintenance Cost";
                        JobPlanningLines."Line Amount (LCY)":=ProjectMembers."Expected Maintenance Cost";
                    END;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                      BEGIN
                       JobPlanningLines.INSERT(TRUE);
                       */
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", "No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                    JobPlanningLines."No.":=Casuals."Resource No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(Casuals."No. of Days")+'D',Date);
                    JobPlanningLines.Description:=Casuals.Activity;
                    JobPlanningLines."Work Type Code":=Casuals."Work Type";
                    JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=Casuals."No. of Days"*Casuals."No. Required";
                    JobPlanningLines."Unit Cost":=Casuals.Rate;
                    JobPlanningLines."Unit Cost (LCY)":=Casuals.Rate;
                    JobPlanningLines."Line Amount":=Casuals.Amount;
                    JobPlanningLines."Line Amount (LCY)":=Casuals.Amount;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", "No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::"G/L Account";
                    JobPlanningLines."No.":=OtherCosts."No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=Date;
                    JobPlanningLines.Description:=OtherCosts.Description;
                    JobPlanningLines."Work Type Code":=OtherCosts."Work Type";
                    //JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=OtherCosts."Quantity Required";
                    JobPlanningLines."Unit Cost":=OtherCosts."Unit Cost";
                    JobPlanningLines."Unit Cost (LCY)":=OtherCosts."Unit Cost";
                    JobPlanningLines."Line Amount":=OtherCosts."Line Amount";
                    JobPlanningLines."Line Amount (LCY)":=OtherCosts."Line Amount";
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            //

            Posted := true;
            "Posted By" := UserId;
            Modify;
            //

            //
        end;

    end;

    Procedure PostRetention(Retention: Record payments)
    var
        RetentionLines: Record "PV Lines";
        Vend: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
    begin
        Retention.TestField(Status,Retention.Status::Released);
        Retention.TestField(Date);
        Retention.TestField("Account Type", Retention."Account Type"::Vendor);
        Retention.TestField("Account No.");
        //Retention.TestField(PCASH.Payee);
        // Retention.TestField(PCASH."Pay Mode");
        Retention.TestField(Retention."Posting Date");
        Retention.CalcFields("Total Amount");
        if Retention."Total Amount" = 0 then
            Error('Amount is cannot be zero');
        RetentionLines.Reset;
        RetentionLines.SetRange(RetentionLines.No, Retention."No.");
        if RetentionLines.FindSet() then begin
            repeat
            until RetentionLines.next() = 0;
        end else
            Error('Petty Cash voucher Lines cannot be empty');
        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Retention Journal Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Retention Journal Batch Name");
        GenJnLine.DeleteAll;

        LineNo := 0;
        LineNo := LineNo + 10000;
        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Retention Journal Template";
        GenJnLine."Journal Batch Name" := CMSetup."Retention Journal Batch Name";
        GenJnLine."Line No." := LineNo;
        GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
        GenJnLine."Account No." := Retention."Account No.";
        GenJnLine.Validate(GenJnLine."Account No.");
        if Retention.Date = 0D then
            Error('You must specify the Retention date');
        GenJnLine."Posting Date" := Retention."Posting Date";
        GenJnLine."Document No." := Retention."No.";
        GenJnLine."External Document No." := Retention."Cheque No";
        GenJnLine."Payment Method Code" := Retention."Pay Mode";
        //GenJnLine.Description:='Pay To:'+PCASH.Payee;
        GenJnLine.Description := CopyStr(Retention."Payment Narration", 1, 100);
        GenJnLine.Amount := (-Retention."Total Amount");
        GenJnLine.Validate("Currency Code");
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"G/L Account";
        /*GenJnLine."Bal. Account No." := PCASH."Account No.";
        GenJnLine.Validate("Bal. Account No.");*/
        GenJnLine."Dimension Set ID" := Retention."Dimension Set ID";
        GenJnLine.Validate(GenJnLine."Dimension Set ID");
        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        //Credit Vendor
        RetentionLines.Reset();
        RetentionLines.SetRange(No, Retention."No.");
        if RetentionLines.FindSet() then begin
            repeat
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."Retention Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."Retention Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
                GenJnLine."Account No." := RetentionLines."Account No";
                GenJnLine.Validate(GenJnLine."Account No.");
                if Retention.Date = 0D then
                    Error('You must specify the Retention date');
                GenJnLine."Posting Date" := Retention."Posting Date";
                GenJnLine."Document No." := RetentionLines.No;
                GenJnLine.Validate("Applies-to Doc. No.", RetentionLines."Applies to Doc. No");
                GenJnLine."External Document No." := Retention."Cheque No";
                GenJnLine."Payment Method Code" := Retention."Pay Mode";
                //GenJnLine.Description:='Pay To:'+PCASH.Payee;
                GenJnLine.Description := RetentionLines.Description;
                GenJnLine.Amount := (-RetentionLines."Net Amount") * -1;
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);//
                GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"G/L Account";
                /* GenJnLine."Bal. Account No." := CMSetup."Mpesa Settlement Account";
                 GenJnLine.Validate("Bal. Account No.");*/
                GenJnLine."Dimension Set ID" := Retention."Dimension Set ID";
                GenJnLine.Validate(GenJnLine."Dimension Set ID");
                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;
            until RetentionLines.Next = 0;
        end;
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."Document No.", Retention."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        if GLEntry.FindFirst then begin
            Retention.Posted := true;
            Retention."Posted By" := UserId;
            Retention."Posted Date" := Today;
            Retention."Time Posted" := Time;
            Retention.Modify;


        end;
    end;

    procedure PostPettyCash(PCASH: Record payments)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PCLines: Record "Petty Cash Lines";
        PvLines: Record "PV Lines";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentType: Enum "Commitment Type";
    begin
        if Confirm('Are you sure you want to post the Petty Cash Voucher No. ' + PCASH."No." + ' ?') = true then begin
            if PCASH.Status <> PCASH.Status::Released then
                Error('The Petty Cash Voucher No %1 has not been fully approved', PCASH."No.");
            if PCASH.Posted then
                Error('Petty Cash Voucher %1 has been posted', PCASH."No.");
            PCASH.TestField(Date);
            PCASH.TestField("Paying Bank Account");
            PCASH.TestField(PCASH.Payee);
            PCASH.TestField(PCASH."Pay Mode");
            PCASH.TestField(PCASH."Posting Date");
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                PCASH.TestField(PCASH."Cheque No");
                PCASH.TestField(PCASH."Cheque Date");
            end;

            //Check Lines
            PCASH.CalcFields("Total Amount");
            if PCASH."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if not PCASHLines.FindLast then
                Error('Petty Cash voucher Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PCASH Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;


            //Bank Entries
            LineNo := LineNo + 10000;
            PCASH.CalcFields(PCASH."Total Amount", "Total Mpesa Charges");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PCASH Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := PCASH."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PCASH.Date = 0D then
                Error('You must specify the PCASH date');
            GenJnLine."Posting Date" := PCASH."Posting Date";
            GenJnLine."Document No." := PCASH."No.";
            GenJnLine."External Document No." := PCASH."Cheque No";
            GenJnLine."Payment Method Code" := PCASH."Pay Mode";
            //GenJnLine.Description:='Pay To:'+PCASH.Payee;
            GenJnLine.Description := CopyStr(PCASH."Payment Narration", 1, 100);//Fred Chnaged as advised By QA
            GenJnLine.Amount := -(PCASH."Total Amount");//Fred Added Mpesa Charges
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);//
            GenJnLine."Bal. Account Type" := PCASH."Account Type";
            GenJnLine."Bal. Account No." := PCASH."Account No.";
            GenJnLine.Validate("Bal. Account No.");

            GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Insert Mpesa Charges
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if PCASHLines.FindSet then
                repeat
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PCASH Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                    GenJnLine."Account No." := PCASH."Paying Bank Account";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PCASH.Date = 0D then
                        Error('You must specify the PCASH date');
                    GenJnLine."Posting Date" := PCASH."Posting Date";
                    GenJnLine."Document No." := PCASH."No.";
                    GenJnLine."External Document No." := PCASH."Cheque No";
                    GenJnLine."Payment Method Code" := PCASH."Pay Mode";
                    //GenJnLine.Description:='Pay To:'+PCASH.Payee;
                    GenJnLine.Description := PCASH."Payment Narration";//Fred Chnaged as advised By QA
                    GenJnLine.Amount := -(PCASH."Total Mpesa Charges");//Fred Added Mpesa Charges
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);//
                    GenJnLine."Bal. Account Type" := PCASHLines."Account Type";
                    GenJnLine."Bal. Account No." := CMSetup."Mpesa Settlement Account";
                    GenJnLine.Validate("Bal. Account No.");

                    GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                until PCASHLines.Next = 0;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", PCASH."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                PCASH.Posted := true;
                PCASH."Posted By" := UserId;
                PCASH."Posted Date" := Today;
                PCASH."Time Posted" := Time;
                //PCASH.Status:=PCASH.Status::Open;//Dont change here fro KeRRA
                //PCASH."Payment Type":=PCASH."Payment Type"::"Petty Cash Surrender";//Dont change here fro KeRRA
                PCASH.Modify;

                //Update Petty Cash Lines
                UpdatePCLines(PCASH);
            end;
        end;
        //Decommit Petty cash
        PvLines.Reset();
        PvLines.SetRange(No, PCASH."No.");
        if PvLines.findset() then begin
            repeat
                CustomFunction.FnCommitAmount(-PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(PCASH.Date), PCASH."No.", CommitmentEntries."Source Type"::Payment, PCASH."Shortcut Dimension 1 Code", PCASH."Shortcut Dimension 2 Code", PCASH."Shortcut Dimension 3 Code", PCASH.Date, CommitmentType::Reversal, CopyStr('Posting ' + PvLines.Description, 1, 2048));
            until PvLines.Next() = 0;
        end;
    end;


    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, WText026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No DIV Power(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, WText027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        AddToNoText(NoText, NoTextIndex, PrintExponent, WText028);
        AddToNoText(NoText, NoTextIndex, PrintExponent, Format(No * 100) + '/100');

        if CurrencyCode <> '' then
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(WText029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := WText032;
        OnesText[2] := WText033;
        OnesText[3] := WText034;
        OnesText[4] := WText035;
        OnesText[5] := WText036;
        OnesText[6] := WText037;
        OnesText[7] := WText038;
        OnesText[8] := WText039;
        OnesText[9] := WText040;
        OnesText[10] := WText041;
        OnesText[11] := WText042;
        OnesText[12] := WText043;
        OnesText[13] := WText044;
        OnesText[14] := WText045;
        OnesText[15] := WText046;
        OnesText[16] := WText047;
        OnesText[17] := WText048;
        OnesText[18] := WText049;
        OnesText[19] := WText050;

        TensText[1] := '';
        TensText[2] := WText051;
        TensText[3] := WText052;
        TensText[4] := WText053;
        TensText[5] := WText054;
        TensText[6] := WText055;
        TensText[7] := WText056;
        TensText[8] := WText057;
        TensText[9] := WText058;

        ExponentText[1] := '';
        ExponentText[2] := WText059;
        ExponentText[3] := WText060;
        ExponentText[4] := WText061;
    end;


    procedure "Post ImprestSurrender"(var Imprest: Record payments)
    var
        ImprestLines: Record "Imprest Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImprestHeader: Record payments;
        ImprestlinesComm: Record "Imprest Lines";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentType: Enum "Commitment Type";
        Safari2: record "Project Members";
        ImpMemo2: Record "Imprest Memo";
    begin

        if Confirm(Text002, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");


            Imprest.TestField("Account No.");
            //Imprest.TESTFIELD("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            // Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            Imprest.TestField("Posting Date");
            Imprest.TestField(Posted, false);

            /*
              //Check if the imprest Lines have been populated
              ImprestLines.SETRANGE(ImprestLines."No.",Imprest."No.");
              IF NOT ImprestLines.FINDLAST  THEN
               ERROR(Text004);

            */

            Imprest.CalcFields("Imprest Amount", "Actual Amount Spent");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);
            if Imprest."Actual Amount Spent" = 0 then
                Error(Text005);


            if Imprest.Posted then
                Error(Text006, Imprest."No.");


            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            CMSetup.TestField(CMSetup."IMPREST SUR Journal Batch Name");
            CMSetup.TestField(CMSetup."Imprest Surrender Template");

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST SUR Journal Batch Name");
            GenJnLine.DeleteAll;



            /*
              // Delete Lines Present on the General Journal Line
              GenJnLine.RESET;
              GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Imprest Template");
              GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",Imprest."No.");
              GenJnLine.DELETEALL;

              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Imprest Template";
              Batch.Name:=Imprest."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
              */
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Employee;
            GenJnLine."Account No." := Imprest."Account No.";
            GenJnLine.Validate("Account No.");
            GenJnLine."Posting Date" := Imprest."Posting Date";
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Imprest Issue Doc. No";
            GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
            //GenJnLine.Description:='Surrendered by: '+Imprest.Payee;
            if ImprestHeader.Get(Imprest."Imprest Issue Doc. No") then
                GenJnLine.Description := copystr(ImprestHeader.Purpose, 1, 99);
            Imprest.CalcFields("Remaining Amount", "Imprest Amount", "Actual Amount Spent");
            if Imprest."Remaining Amount" < 0 then begin
                GenJnLine.Amount := -Imprest."Imprest Amount";
            end else
                if Imprest."Remaining Amount" > 0 then begin
                    GenJnLine.Amount := -Imprest."Actual Amount Spent";
                end
                else
                    GenJnLine.Amount := -Imprest."Actual Amount Spent";
            GenJnLine.Validate(Amount);
            /*
            GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

          *///
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
            //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
            // GenJnLine.VALIDATE("Bal. Account No.");

            GenJnLine."Applies-to Doc. No." := Imprest."Imprest Issue Doc. No";
            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

            GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //IMP surrender Lines Entries
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, Imprest."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    //ImprestLines.TESTFIELD(ImprestLines."Job Task No.");
                    ImprestLines.Validate(ImprestLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    //IF CMSetup.GET THEN
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
                    //GenJnLine."Journal Template Name":=CMSetup."PCASH Journal Template";
                    //GenJnLine."Journal Batch Name":=CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    //GenJnLine.VALIDATE(GenJnLine."Account No.");
                    if Imprest."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Imprest."Posting Date";
                    GenJnLine."Document No." := Imprest."No.";
                    GenJnLine."External Document No." := Imprest."Imprest Issue Doc. No";
                    GenJnLine.Description := copystr(ImprestHeader.Purpose, 1, 99);
                    if ImprestLines."Remaining Amount" < 0 then begin
                        GenJnLine.Amount := ImprestLines.Amount;
                    end else
                        if ImprestLines."Remaining Amount" > 0 then begin
                            GenJnLine.Amount := ImprestLines."Actual Spent";
                        end
                        else
                            GenJnLine.Amount := ImprestLines."Actual Spent";
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    //IF PCASH."Pay Mode"='CHEQUE' THEN
                    //GenJnLine."Pay Mode":=PCASH."Pay Mode";
                    GenJnLine."Currency Code" := Imprest.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //add jobs
                    /*GenJnLine."Job No.":=Imprest.Project;
                    GenJnLine."Job Task No.":=ImprestLines."Job Task No.";
                    GenJnLine."Job Quantity":=1;
                    GenJnLine.VALIDATE(GenJnLine."Job No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Quantity");*/ //Commented by Morris
                                                                    //end jobs

                    //add jobs Morris
                    GenJnLine."Job No." := ImprestLines."Job No.";
                    GenJnLine."Job Task No." := ImprestLines."Job Task No.";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity"); //Added by Morris
                                                                  //end jobs
                                                                  //GenJnLine."Shortcut Dimension 1 Code":=PCASHLines."Shortcut Dimension 1 Code";
                                                                  //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                                                                  //GenJnLine."Shortcut Dimension 2 Code":=PCASHLines."Shortcut Dimension 2 Code";
                                                                  //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PCASHLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",Imprest."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
            IF GLEntry.FINDFIRST THEN BEGIN*/
            Imprest.Posted := true;
            Imprest."Posted By" := UserId;
            Imprest."Surrendered By" := Imprest.Payee;
            Imprest."Posted Date" := Today;
            Imprest."Time Posted" := Time;
            /// Imprest.Status:=Imprest.Status::Open;
            //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
            //Update the Imprest Deadline
            //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
            Imprest.Modify;

            if ImprestHeader.Get(Imprest."Imprest Issue Doc. No") then begin
                ImprestHeader.Surrendered := true;
                ImprestHeader."Surrender Date" := Today;
                ImprestHeader.Modify;
            end;

            //END;

        end;
        //uncommit requisition
        ImprestlinesComm.Reset();
        ImprestlinesComm.SetRange(No, Imprest."No.");
        if ImprestlinesComm.findset() then begin
            repeat
                CustomFunction.FnCommitAmount(-ImprestlinesComm.Amount, "Account Type"::"G/L Account", ImprestlinesComm."Account No.", CustomFunction.GetBudgetYear(Imprest.Date), Imprest."No.", CommitmentEntries."Source Type"::Payment, Imprest."Shortcut Dimension 1 Code", Imprest."Shortcut Dimension 2 Code", Imprest."Shortcut Dimension 3 Code", Imprest.Date, CommitmentType::Reversal, CopyStr('Posting ' + ImprestlinesComm.Purpose, 1, 2048));
            until ImprestlinesComm.next() = 0;
        end;
        ImpMemo2.Reset();
        ImpMemo2.SetRange(Status, ImpMemo2.Status::Open);
        if ImpMemo2.FindSet() then begin
            repeat
                Safari2.Reset();
                Safari2.SetRange("Imprest Memo No.", ImpMemo2."No.");
                if Safari2.FindSet() then begin
                    repeat
                        Safari2.Validate("No.");
                        Safari2.Modify();
                    until Safari2.next() = 0;
                end;
            until ImpMemo2.Next() = 0;
        end;

    end;


    procedure PostBankTransfer(PCASH: Record payments)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm('Are u sure u want to post this InterBank Transfer' + PCASH."No." + ' ?') = true then begin
            if PCASH.Status <> PCASH.Status::Released then
                Error('The InterBank Transfer No %1 has not been fully approved', PCASH."No.");
            if PCASH.Posted then
                Error('InterBank Transfer %1 has been posted', PCASH."No.");
            PCASH.TestField(Date);
            PCASH.TestField("Paying Bank Account");
            //PCASH.TESTFIELD(PCASH.Payee);
            PCASH.TestField(PCASH."Pay Mode");
            PCASH.TestField(PCASH."Posting Date");
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                PCASH.TestField(PCASH."Cheque No");
                PCASH.TestField(PCASH."Cheque Date");
            end;

            //Check Lines
            PCASH.CalcFields("Total Amount");
            if PCASH."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if not PCASHLines.FindLast then
                Error('InterBank Transfer Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Bank TR Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
              Batch.Name:=PV."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
            */
            //Bank Entries
            LineNo := LineNo + 10000;
            PCASH.CalcFields(PCASH."Total Amount");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);
            PCASHLines.CalcSums(PCASHLines.Amount);
            //PCASHLines.CALCSUMS(PCASHLines."W/Tax Amount");
            /////PCASHLines.CALCSUMS(PCASHLines."VAT Amount");
            //PCASHLines.CALCSUMS(PCASHLines."Retention Amount1");
            //PCASHLines.CALCSUMS(PCASHLines."Net Amount");


            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Bank TR Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Bank TR Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := PCASH."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PCASH.Date = 0D then
                Error('You must specify the Transfer date');
            GenJnLine."Posting Date" := PCASH."Posting Date";
            GenJnLine."Document No." := PCASH."No.";
            GenJnLine."External Document No." := PCASH."Cheque No";
            GenJnLine."Payment Method Code" := PCASH."Pay Mode";
            GenJnLine.Description := PCASH."Payment Narration";
            GenJnLine.Amount := -PCASH."Total Amount";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);//

            /*
            //add jobs
            GenJnLine."Job No.":=PCASH.Project;
            GenJnLine."Job Task No.":=PCASH."Job Task No.";
            GenJnLine.Quantity:=1;
            GenJnLine.VALIDATE(GenJnLine."Job No.");
            GenJnLine.VALIDATE(GenJnLine."Job Task No.");
            GenJnLine.VALIDATE(GenJnLine.Quantity);
            */
            //GenJnLine."Pay Mode":=PCASH."Pay Mode";//
            //IF PCASH."Pay Mode"='CHEQUE' THEN
            //GenJnLine."Cheque Date":=PCASH."Cheque Date";

            /*GenJnLine."Shortcut Dimension 1 Code":=PCASH."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=PCASH."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

            GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //PCASH Lines Entries
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if PCASHLines.FindFirst then begin
                repeat
                    PCASHLines.Validate(PCASHLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Bank TR Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Bank TR Journal Batch Name";
                    //GenJnLine."Journal Template Name":=CMSetup."PCASH Journal Template";
                    //GenJnLine."Journal Batch Name":=CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PCASHLines."Account Type";
                    GenJnLine."Account No." := PCASHLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PCASH."Posting Date" = 0D then
                        Error('You must specify the Transfer date');
                    GenJnLine."Posting Date" := PCASH."Posting Date";
                    GenJnLine."Document No." := PCASH."No.";
                    GenJnLine."External Document No." := PCASH."Cheque No";
                    GenJnLine."Payment Method Code" := PCASH."Pay Mode";
                    GenJnLine.Description := PCASH."Payment Narration";
                    //GenJnLine."Description 2":=PCASH."On behalf of";
                    GenJnLine.Amount := PCASHLines.Amount;
                    if PCASH."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PCASH."Pay Mode";
                        GenJnLine."Currency Code" := PCASH.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    /*
                    //add jobs
                    GenJnLine."Job No.":=PCASH.Project;
                    GenJnLine."Job Task No.":=PCASH."Job Task No.";
                    GenJnLine."Job Quantity":=1;
                    GenJnLine.VALIDATE(GenJnLine."Job No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Quantity");
                    //end jobs
                    */
                    /*GenJnLine."Shortcut Dimension 1 Code":=PCASHLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PCASHLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    /*
                    GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    GenJnLine."Applies-to Doc. No.":=PCASHLines."Applies to Doc. No";
                    GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    */

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PCASHLines.Next = 0;
            end;



            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",PCASH."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            IF GLEntry.FINDFIRST THEN BEGIN*/
            PCASH.Posted := true;
            PCASH."Posted By" := UserId;
            PCASH."Posted Date" := Today;
            PCASH."Time Posted" := Time;
            PCASH.Modify;


            //Create Imprest Surrender in the event the document originated from an imprest.
            /*
            IF PV."Original Document"=PV."Original Document"::Imprest THEN BEGIN
               PV."Payment Type":=PV."Payment Type"::"10";
               PV.Status:=PV.Status::Open;
               PV.MODIFY;
            END;
            */
            //END;


        end;



        //staff claims posting



        //end of staff claims posting

    end;


    procedure PostPettyCashSurrender(var PCash: Record payments)
    var
        PCLines: Record "Petty Cash Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
    begin

        if Confirm(Text014, false, PCash."No.") = true then begin
            if PCash.Status <> PCash.Status::Released then
                Error(Text003, PCash."No.");

            PCash.TestField("Surrender Date");


            PCash.CalcFields("Petty Cash Amount", PCash."Actual Petty Cash Amount Spent");
            if PCash."Petty Cash Amount" = 0 then
                Error(Text005);
            if PCash."Actual Petty Cash Amount Spent" = 0 then
                Error(Text016);


            if PCash.Surrendered then
                Error(Text015, PCash."No.");


            CMSetup.Get();
            CMSetup.TestField("Petty Cash Surrender Template");
            CMSetup.TestField("PCASH Journal Batch Name");

            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Petty Cash Surrender Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            Batch.Name := CMSetup."PCASH Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := PCash."Account Type";
            GenJnLine."Account No." := PCash."Account No.";
            if PCash."Posting Date" = 0D then
                Error('You must specify the posting date');
            GenJnLine."Posting Date" := PCash."Posting Date";
            GenJnLine."Document No." := PCash."No.";
            //GenJnLine.Description:='Petty Cash Surrendered by: '+PCash.Payee;
            GenJnLine.Description := 'Surrender For: ' + PCash."Payment Narration" + PCash."Imprest Issue Doc. No";
            PCash.CalcFields("Remaining Petty Cash Amount", "Total Amount");
            if PCash."Remaining Petty Cash Amount" < 0 then begin
                GenJnLine.Amount := -PCash."Total Amount"
            end else
                if PCash."Remaining Petty Cash Amount" > 0 then begin
                    GenJnLine.Amount := -PCash."Actual Petty Cash Amount Spent"

                end else
                    GenJnLine.Amount := -PCash."Actual Petty Cash Amount Spent";
            GenJnLine.Validate(Amount);
            /*
            GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

          *///
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
            //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
            // GenJnLine.VALIDATE("Bal. Account No.");

            GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Petty Cash surrender Lines Entries
            PCLines.Reset;
            PCLines.SetRange(PCLines.No, PCash."No.");
            if PCLines.FindFirst then begin
                repeat
                    PCLines.Validate(PCLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PCLines."Account Type";
                    GenJnLine."Account No." := PCLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PCash."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := PCash."Posting Date";
                    GenJnLine."Document No." := PCash."No.";
                    //PCLines.TESTFIELD(Description);
                    GenJnLine.Description := 'Petty Cash to  ' + PCash."Account Name";
                    if PCLines."Remaining Amount" < 0 then begin
                        GenJnLine.Amount := PCLines.Amount
                    end else
                        if PCLines."Remaining Amount" > 0 then begin
                            GenJnLine.Amount := PCLines."Actual Spent"
                        end

                        else begin
                            GenJnLine.Amount := PCLines."Actual Spent";
                        end;
                    GenJnLine."Currency Code" := PCash.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Set these fields to blanks
                    //GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
                    //GenJnLine.VALIDATE("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");

                    //add jobs
                    GenJnLine."Job No." := PCash.JobNo;
                    GenJnLine."Job Task No." := PCash."Job Task No";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PCLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",PCash."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            GLEntry.SETRANGE("Posting Date",PCash."Posting Date");
            IF GLEntry.FINDFIRST THEN BEGIN*/
            PCash.Surrendered := true;
            PCash.Posted := true;
            PCash."Posted Date" := PCash."Posting Date";
            PCash."Surrendered By" := PCash.Payee;
            PCash."Date Surrendered" := Today;
            PCash."Posted By" := UserId;
            PCash.Modify;
            //END;

            PCash.Reset;
            PCash.SetRange(PCash."No.", PCash."Imprest Issue Doc. No");
            if PCash.FindSet then begin
                PCash.Surrendered := true;
                PCash."Surrender Date" := PCash."Surrender Date";
                PCash."Surrendered By" := PCash."Surrendered By";
                PCash.Surrendered := true;
                PCash.Posted := true;
                PCash."Posted Date" := PCash."Posting Date";
                PCash."Surrendered By" := UserId;
                PCash."Date Surrendered" := Today;
                PCash."Posted By" := PCash."Posted By";
                PCash.Modify;
            end;


        end;

    end;

    local procedure UpdatePCLines(PCash: Record payments)
    var
        PCLines: Record "Petty Cash Lines";
        PVLines: Record "PV Lines";
    begin
        PVLines.Reset;
        PVLines.SetRange(No, PCash."No.");
        if PVLines.Find('-') then
            repeat
                PCLines.Init;
                PCLines.No := PVLines.No;
                PCLines."Line No" := PVLines."Line No";
                PCLines."Account Type" := PVLines."Account Type";
                PCLines."Account No" := PVLines."Account No";
                PCLines."Account Name" := PVLines."Account Name";
                PCLines.Description := PVLines.Description;
                PCLines.Amount := PVLines.Amount;
                PCLines.Validate(Amount);
                if not PCLines.Get(PCLines.No, PCLines."Line No") then
                    PCLines.Insert;
            until
           PVLines.Next = 0;
    end;


    procedure PostReceipt(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm(Text017, false, ReceiptRec."No.") = true then begin

            if ReceiptRec.Posted = true then
                Error(Text018, ReceiptRec."No.");
            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);
            //Check Lines
            if ReceiptRec.Amount = 0 then
                Error('Amount cannot be zero');
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := ReceiptRec."Bank Code";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec."Posted Date";
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := ReceiptRec.Amount;
            GenJnLine."Currency Code" := ReceiptRec."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
            GenJnLine.Validate("Currency Factor");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := -RcptLines.Amount;
                    GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
                    GenJnLine.Validate("Currency Factor");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                ReceiptRec.Posted := true;
                ReceiptRec."Posted By" := UserId;
                ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
                ReceiptRec."Posted Time" := Time;
                ReceiptRec.Modify;

            end;

        end;
    end;


    procedure PostImprestMemoSurr(var ImprestMemo: Record "Imprest Memo")
    var
        JobPlanningLines: Record "Job Planning Line";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text019, false, ImprestMemo."No.") then
            exit;

        with ImprestMemo do begin
            //Check if Posted
            if Posted and Surrendered then
                Error(Text020);

            //
            //Check totals
            /*
            ImprestMemo.CALCFIELDS("Actual Subsistence Allowance");
            IF ImprestMemo."Actual Subsistence Allowance"=0 THEN
              ERROR(Text012);
              */

            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", "No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");

                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", "No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");

                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            //

            Posted := true;
            "Posted By" := UserId;
            Surrendered := true;
            Modify;
            //

            //
        end;

        //post of staff claims

    end;


    procedure PostStaffClaims(Sclaims: Record payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
        PV: Record payments;
        PvLines: Record "PV Lines";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentType: Enum "Commitment Type";
    begin

        if Confirm(text024, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text023, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField("Employee Bank Account Code");
            Sclaims.TestField("Employee Bank Brach Code");
            Sclaims.TestField("Employee Bank Account Number");
            Sclaims.CalcFields(Sclaims."Total Amount");
            if Sclaims."Total Amount" = 0 then
                Error(text022);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Staff Claim Journal Template");
            CMSetup.TestField(CMSetup."Staff Claim Journal Batch Name");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Staff Claim Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Staff Claim Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Staff Claim Journal Template";
            Batch.Name := CMSetup."Staff Claim Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Sclaims."Paying Bank Account";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Staff Claim From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := -Sclaims."Total Amount";
            GenJnLine.Validate(Amount);

            //Added for Jobs
            /*GenJnLine."Job No.":=Sclaims.Job;
            GenJnLine."Job Task No.":=Sclaims."Job Task No";*/

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
            GenJnLine."Line No." := LineNo + 1000;
            GenJnLine."Account Type" := GenJnLine."account type"::Employee;
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Staff Claim From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Total Amount";
            GenJnLine.Validate(Amount);

            //Added for Jobs
            /*GenJnLine."Job No.":=Sclaims.Job;
            GenJnLine."Job Task No.":=Sclaims."Job Task No";*/

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Staff Claim Lines
            sclaimlines.Reset;
            sclaimlines.SetRange(sclaimlines.No, Sclaims."No.");
            if sclaimlines.FindFirst then begin
                repeat
                    sclaimlines.Validate(sclaimlines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := sclaimlines."Account Type";
                    GenJnLine."Account No." := sclaimlines."Account No";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Sclaims."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Sclaims."Posting Date";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                    GenJnLine."Document No." := Sclaims."No.";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    sclaimlines.TestField(Description);
                    GenJnLine.Description := sclaimlines.Description;
                    GenJnLine.Amount := sclaimlines.Amount;
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Job ledger entries

                    //Added for Jobs
                    //GenJnLine."Job No.":=Sclaims.Job;
                    //GenJnLine."Job Task No.":=Sclaims."Job Task No";

                    //GenJnLine."Job Quantity":=1;
                    //GenJnLine.VALIDATE(GenJnLine."Job No.");
                    //GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    //GenJnLine.VALIDATE(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."account type"::Employee;
                    GenJnLine."Account No." := Sclaims."Account No.";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Sclaims."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Sclaims."Posting Date";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                    GenJnLine."Document No." := Sclaims."No.";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    sclaimlines.TestField(Description);
                    GenJnLine.Description := sclaimlines.Description;
                    GenJnLine.Amount := -sclaimlines.Amount;
                    GenJnLine.Validate(GenJnLine.Amount);

                    // //Added for Jobs
                    // GenJnLine."Job No.":=Sclaims.Job;
                    // GenJnLine."Job Task No.":=Sclaims."Job Task No";
                    //
                    // GenJnLine."Job Quantity":=1;
                    // GenJnLine.VALIDATE(GenJnLine."Job No.");
                    // GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    // GenJnLine.VALIDATE(GenJnLine."Job Quantity");
                    // //end jobs

                    GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until sclaimlines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;

        end;

        //end of staff claim post
        //Decommit staff claim
        PvLines.Reset();
        PvLines.SetRange(No, Sclaims."No.");
        if PvLines.findset() then begin
            repeat
                CustomFunction.FnCommitAmount(-PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(Sclaims.Date), Sclaims."No.", CommitmentEntries."Source Type"::Payment, Sclaims."Shortcut Dimension 1 Code", Sclaims."Shortcut Dimension 2 Code", Sclaims."Shortcut Dimension 3 Code", Sclaims.Date, CommitmentType::Reversal, CopyStr('Posting ' + PvLines.Description, 1, 2048));
            until PvLines.Next() = 0;
        end;
    end;


    procedure SendforPosting(var Imprest: Record payments)
    var
        ImprestLines: Record payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
    begin

        if Confirm(Text102, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");


            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            // Imprest.TESTFIELD("Posting Date");


            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error(Text004);

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);

            if Imprest.Posted then
                Error(Text006, Imprest."No.");

            Imprest."Send for Posting" := true;
            Imprest.Modify;
            Message('Imprest %1 has been sent for posting successfully', Imprest."No.");

        end;
    end;


    procedure PostSalaryAdvance(Sclaims: Record payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
    begin
        if Confirm(text025, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text026, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField(Sclaims.Purpose);
            if Sclaims."Amount Approved" = 0 then
                Error(text027);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Salary Adv Journal Batch Name");
            CMSetup.TestField(CMSetup."Salary Adv Journal Template");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Salary Adv Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Salary Adv Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            Batch.Name := CMSetup."Salary Adv Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Salary Adv Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := Sclaims."Account Type";
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Salary Advance From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Amount Approved";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
            GenJnLine."Bal. Account No." := Sclaims."Paying Bank Account";

            GenJnLine.Validate(Amount);
            //GenJnLine."Posting Group":=CMSetup."SClaims Posting Group";
            //GenJnLine.VALIDATE(GenJnLine."Posting Group");
            //GenJnLine."Transaction Type":=Sclaims."Transaction Type";

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            /*
            //Staff Claim Lines
            sclaimlines.RESET;
            sclaimlines.SETRANGE(sclaimlines.No,Sclaims."No.");
            IF sclaimlines.FINDFIRST THEN BEGIN
            REPEAT
            sclaimlines.VALIDATE(sclaimlines.Amount);
            LineNo:=LineNo+10000;
            GenJnLine.INIT;
            GenJnLine."Journal Template Name":=CMSetup."Staff Claim Journal Template";
            GenJnLine."Journal Batch Name":=CMSetup."Staff Claim Journal Batch Name";
            GenJnLine."Line No.":=LineNo;
            GenJnLine."Account Type":=sclaimlines."Account Type";
            GenJnLine."Account No.":=sclaimlines."Account No";
            GenJnLine."External Document No.":=Sclaims."Account No.";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
             IF Sclaims."Posting Date"=0D THEN
              ERROR('You must specify the posting date');
            GenJnLine."Posting Date":=Sclaims."Posting Date";
            //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
            GenJnLine."Document No.":=Sclaims."No.";
            GenJnLine."External Document No.":=Sclaims."Account No.";
            sclaimlines.TESTFIELD(Description);
            GenJnLine.Description:=sclaimlines.Description;
            GenJnLine.Amount:=sclaimlines.Amount;
            GenJnLine.VALIDATE(GenJnLine.Amount);

            //Job ledger entries
            {
            GenJnLine."Job No.":=sclaimlines."Shortcut Dimension 2 Code";
            GenJnLine."Job Task No.":=sclaimlines."Job Task No.";
            GenJnLine."Job Quantity":=1;
            GenJnLine.VALIDATE(GenJnLine."Job No.");
            GenJnLine.VALIDATE(GenJnLine."Job Task No.");
            GenJnLine.VALIDATE(GenJnLine."Job Quantity");
            }
            //end jobs

            GenJnLine."Dimension Set ID":=Sclaims."Dimension Set ID";
            GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

             IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;

            UNTIL sclaimlines.NEXT=0;
            END;
            */
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;

        end;

        //end of staff claim post

    end;


    procedure PostStandingImprestSurrenders(StandingImprest: Record payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        StandingImprestlines: Record "PV Lines";
        LineNo: Integer;
    begin
        if Confirm(text028, false, StandingImprest."No.") = true then begin
            if StandingImprest.Status <> StandingImprest.Status::Released then
                Error(Text023, StandingImprest."No.");
            StandingImprest.TestField(StandingImprest.Date);
            StandingImprest.CalcFields(StandingImprest."Total Amount");
            if StandingImprest."Total Amount" = 0 then
                Error(text022);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Standing Imp Journal Template");
            CMSetup.TestField(CMSetup."StandingImp Journal Batch Name");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Standing Imp Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."StandingImp Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Standing Imp Journal Template";
            Batch.Name := CMSetup."StandingImp Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;




            //Staff Claim Lines
            StandingImprestlines.Reset;
            StandingImprestlines.SetRange(StandingImprestlines.No, StandingImprest."No.");
            if StandingImprestlines.FindFirst then begin
                repeat
                    StandingImprestlines.TestField("Reference No");
                    StandingImprestlines.TestField(Description);
                    StandingImprestlines.Validate(StandingImprestlines.Amount);



                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Standing Imp Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."StandingImp Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                    GenJnLine."Account No." := StandingImprest."Paying Bank Account";
                    GenJnLine."Posting Date" := StandingImprest.Date;
                    // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
                    GenJnLine."Document No." := StandingImprest."No.";
                    GenJnLine."External Document No." := StandingImprestlines."Reference No";
                    GenJnLine.Description := StandingImprestlines.Description;
                    GenJnLine.Amount := -StandingImprestlines.Amount;
                    GenJnLine.Validate(Amount);

                    //Added for Jobs
                    /*GenJnLine."Job No.":=StandingImprest.Job;
                    GenJnLine."Job Task No.":=StandingImprest."Job Task No";*/

                    GenJnLine."Dimension Set ID" := StandingImprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");


                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;





                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Standing Imp Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."StandingImp Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := StandingImprestlines."Account Type";
                    GenJnLine."Account No." := StandingImprestlines."Account No";
                    GenJnLine."External Document No." := StandingImprest."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if StandingImprest.Date = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := StandingImprest.Date;
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                    GenJnLine."Document No." := StandingImprest."No.";
                    GenJnLine."External Document No." := StandingImprest."Account No.";
                    //StandingImprestlines.TESTFIELD(Description);
                    GenJnLine.Description := StandingImprestlines."Account Name";
                    GenJnLine.Amount := StandingImprestlines.Amount;
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Job ledger entries

                    //Added for Jobs
                    GenJnLine."Job No." := StandingImprest.JobNo;
                    GenJnLine."Job Task No." := StandingImprest."Job Task No";

                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := StandingImprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                until StandingImprestlines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            StandingImprest.Posted := true;
            StandingImprest."Posted By" := UserId;
            StandingImprest."Posted Date" := Today;
            StandingImprest.Modify;

        end;

        //end of standing imprest surrender

    end;


    procedure PostDIV(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm(Text017, false, ReceiptRec."No.") = true then begin

            if ReceiptRec.Posted = true then
                Error(Text018, ReceiptRec."No.");
            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);
            //Check Lines
            if ReceiptRec.Amount = 0 then
                Error('Amount cannot be zero');
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := ReceiptRec."Bank Code";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec."Posted Date";
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := ReceiptRec.Amount;
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := -RcptLines.Amount;
                    //GenJnLine."Currency Code":=ReceiptRec.Currency;
                    //GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            //DIV
            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Account No." := ReceiptRec."Expense Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec."Posted Date";
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := -ReceiptRec.Amount;
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := RcptLines.Amount;
                    //GenJnLine."Currency Code":=ReceiptRec.Currency;
                    //GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                ReceiptRec.Posted := true;
                ReceiptRec."Posted By" := UserId;
                ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
                ReceiptRec."Posted Time" := Time;
                ReceiptRec.Modify;

            end;

        end;
    end;


    procedure PostPaymentVoucherTaxKeRRA(PV: Record payments)
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm('Are you sure you want to post the Payment Voucher No. ' + PV."No." + ' ?') = true then begin
            if PV.Status <> PV.Status::Released then
                Error('The Payment Voucher No %1 has not been fully approved', PV."No.");
            if PV.Posted then
                Error('Payment Voucher %1 has been posted', PV."No.");
            PV.TestField(Date);
            PV.TestField("Paying Bank Account");
            PV.TestField(PV.Payee);
            PV.TestField(PV."Pay Mode");
            PV.TestField(PV."Posting Date");
            if PV."Pay Mode" = 'CHEQUE' then begin
                PV.TestField(PV."Cheque No");
                PV.TestField(PV."Cheque Date");
            end;

            PV.CalcFields(PV."Total Retention Amount");
            //Check Lines
            PV.CalcFields("Total Amount");
            if PV."Total Amount" = 0 then
                Error('Amount cannot be zero');
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if not PVLines.FindLast then
                Error('Payment voucher Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
              Batch.Name:=PV."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
            */
            //Bank Entries

            LineNo := LineNo + 10000;
            PV.CalcFields(PV."Total Amount");
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            PVLines.Validate(PVLines.Amount);
            PVLines.CalcSums(PVLines.Amount);
            PVLines.CalcSums(PVLines."W/Tax Amount");
            PVLines.CalcSums(PVLines."VAT Amount");
            PVLines.CalcSums(PVLines."Retention  Amount");
            PVLines.CalcSums(PVLines."Net Amount");
            PVLines.CalcSums(PVLines."Amount Paid");
            PVLines.CalcSums(PVLines."PAYE Amount");
            if PVLines."Amount Paid" = PVLines."Net Amount" then
                Message('', PVLines."Amount Paid");

            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Document Type" := PV."Document Type";
            GenJnLine."Account No." := PV."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PV.Date = 0D then
                Error('You must specify the PV date');
            GenJnLine."Posting Date" := PV."Posting Date";
            GenJnLine."Document No." := PV."No.";
            GenJnLine."External Document No." := PV."Cheque No";
            GenJnLine."Payment Method Code" := PV."Pay Mode";
            //GenJnLine.Description:='Pay To:'+PV.Payee;
            GenJnLine.Description := PVLines.Description;
            GenJnLine.Amount := -PV."Total Net Amount";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            //GenJnLine."Pay Mode":=PV."Pay Mode";
            //IF PV."Pay Mode"='CHEQUE' THEN
            //GenJnLine."Cheque Date":=PV."Cheque Date";




            /*GenJnLine."Shortcut Dimension 1 Code":=PV."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=PV."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //PV Lines Entries
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if PVLines.FindFirst then begin
                repeat
                    //PVLines.VALIDATE(PVLines.Amount);
                    //PVLines.VALIDATE(PVLines."Retention  Amount");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    //enJnLine.Description:='Pay To:'+PV.Payee;
                    GenJnLine.Description := PVLines.Description;
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := PVLines."Net Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //Payment Vouchers With Part Payment David.




                    //add jobs if g/l account and income statement account

                    if GenJnLine."Account Type" = GenJnLine."account type"::"G/L Account" then begin
                        if Acct.Get(GenJnLine."Account No.") then begin
                            if Acct."Income/Balance" = Acct."income/balance"::"Income Statement" then begin
                                GenJnLine."Job No." := PV.Project;
                                GenJnLine."Job Task No." := PV."Job Task No.";
                                GenJnLine."Job Quantity" := 1;

                                GenJnLine.Validate(GenJnLine."Job No.");
                                GenJnLine.Validate(GenJnLine."Job Task No.");
                                GenJnLine.Validate(GenJnLine."Job Quantity");
                            end;
                        end;
                    end;
                    //end jobs

                    /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    // VAT withheld

                    if PVLines."VAT Withheld Amount" > 0 then begin
                        Tariffs.Get(PVLines."VAT Withheld Code");

                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PV.Payee + '-VAT Withheld';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        GenJnLine.Amount := -PVLines."VAT Withheld Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        // GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Vendor;
                        // GenJnLine."Account No.":=Tariffs."Account No.";
                        // GenJnLine.VALIDATE("Account No.");
                        // GenJnLine."Applies-to Doc. No.":=PV."No.";
                        // GenJnLine.VALIDATE("Applies-to Doc. No.");
                        /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;

                    //VAT W/Held balancing Entry
                    if PVLines."VAT Withheld Amount" > 0 then begin
                        Tariffs.Get(PVLines."VAT Withheld Code");

                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."Account Type"::Vendor;
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PV.Payee + '-VAT Withheld';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        GenJnLine.Amount := PVLines."VAT Withheld Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Applies-to Doc. No." := PV."No.";
                        GenJnLine.Validate("Applies-to Doc. No.");
                        // GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Vendor;
                        // GenJnLine."Account No.":=Tariffs."Account No.";
                        // GenJnLine.VALIDATE("Account No.");
                        // GenJnLine."Applies-to Doc. No.":=PV."No.";
                        // GenJnLine.VALIDATE("Applies-to Doc. No.");
                        /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'VAT Withheld on:' + PVLines.Description;
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."VAT Withheld Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Fred..VAT W/Held Balancing Account
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.Validate("Bal. Account No.");
                    // GenJnLine."Applies-to Doc. No.":=PV."No.";
                    // GenJnLine.VALIDATE("Applies-to Doc. No.");

                    /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                    //Posting of Advance Recovery David & Spencer

                    if PV."Advance Recovery" <> 0 then begin
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PV."Account Type";

                        Vendor.Reset;
                        Vendor.SetRange(Vendor."No.", PVLines."Account No");
                        if Vendor.FindSet then begin
                            if PV."Advance Recovery" <> 0 then begin
                                Vendor.TestField("Advance Customer No");
                                GenJnLine."Account No." := Vendor."Advance Customer No";
                            end;
                        end;
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV posting date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PV.Payee + '-AdA';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //MESSAGE('%1',PV."Advance Recovery");
                        GenJnLine.Amount := -PV."Advance Recovery";

                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);

                        /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;

                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the Posting PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := 'Advance Recovery Amount:';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        GenJnLine.Amount := PV."Advance Recovery";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);

                        /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");

                        //application only to type Vendor
                        if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                            GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                        end;

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;
                    //end of Posting of Advance Recovery David & Spencer




                    //Withholding Tax
                    if PVLines."W/Tax Amount" > 0 then begin
                        Tariffs.Get(PVLines."W/Tax Code");

                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PV.Payee + '-WholdingTax';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        GenJnLine.Amount := -PVLines."W/Tax Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);

                        /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/


                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;

                    //Withholding Tax...Fred Balancing W/tax entry
                    if PVLines."W/Tax Amount" > 0 then begin
                        Tariffs.Get(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."Account Type"::Vendor;
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PV.Payee + '-WholdingTax';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        GenJnLine.Amount := PVLines."W/Tax Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Applies-to Doc. No." := PV."No.";
                        GenJnLine.Validate("Applies-to Doc. No.");

                        /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/


                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;



                    //Post PAYE
                    if PVLines."PAYE Amount" > 0 then begin
                        Tariffs.Get(PVLines."PAYE Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PVLines.Description + ' ' + 'PAYE' + ' ' + PVLines."Account No";
                        ;
                        GenJnLine.Amount := -PVLines."PAYE Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;

                    //Post PAYE..Fred PAYE Balancing Entry
                    if PVLines."PAYE Amount" > 0 then begin
                        Tariffs.Get(PVLines."PAYE Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."Account Type"::Vendor;
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PVLines.Description + ' ' + 'PAYE' + ' ' + PVLines."Account No";
                        ;
                        GenJnLine.Amount := PVLines."PAYE Amount";
                        GenJnLine."Applies-to Doc. No." := PV."No.";
                        GenJnLine.Validate("Applies-to Doc. No.");
                        if PV."Pay Mode" = 'CHEQUE' then
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;


                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + ' ' + 'PAYE' + ' ' + PVLines."Account No";
                    ;
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."PAYE Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    //Fred ..Balancing PAYE Entry
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.Validate("Bal. Account No.");
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.Validate("Applies-to Doc. No.");

                    /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                    ////End Posting PAYE

                    //W/Tax Vendor Entry
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'WITHHOLDING TAX:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."W/Tax Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //Fred ...W/tax balancing entry
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.Validate("Bal. Account No.");
                    /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;




                    //Retention

                    if PVLines."Retention  Amount" > 0 then
                        Tariffs.Get(PVLines."Retention Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";

                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + '-' + 'AmRetained';
                    //GenJnLine."Description 2":=PV."On behalf of";

                    GenJnLine.Amount := -PV."Total Retention Amount";
                    //GenJnLine.Amount:=-PVLines."Retention  Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'AMOUNT RETAINED:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    //GenJnLine.Amount:=PVLines."Retention  Amount";
                    GenJnLine.Amount := PV."Total Retention Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PVLines.Next = 0;
            end;
            //End of Posting Withholding Tax
            //END;
            /*
            GenJnLine.VALIDATE(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
            GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
            GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
            IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;

            LineNo:=LineNo+10000;
            GenJnLine.INIT;
            IF CMSetup.GET THEN
            GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
            GenJnLine."Journal Batch Name":=PV."No.";
            GenJnLine."Line No.":=LineNo;
            GenJnLine."Account Type":=GenJnLine."Account Type"::"G/L Account";
            CASE PVLines."Account Type" OF
            PVLines."Account Type"::"G/L Account":
            BEGIN
            GLAccount.GET(PVLines."Account No");
            GLAccount.TESTFIELD("VAT Bus. Posting Group");
            IF VATSetup.GET(GLAccount."VAT Bus. Posting Group",PVLines."W/T VAT Code") THEN
            GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            END;
            PVLines."Account Type"::Vendor:
            BEGIN
            Vendor.GET(PVLines."Account No");
            Vendor.TESTFIELD("VAT Bus. Posting Group");
            IF VATSetup.GET(Vendor."VAT Bus. Posting Group",PVLines."W/T VAT Code") THEN
            GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            END;
            PVLines."Account Type"::Customer:
            BEGIN
            Customer.GET(PVLines."Account No");
            Customer.TESTFIELD("VAT Bus. Posting Group");
            IF VATSetup.GET(Customer."VAT Bus. Posting Group",PVLines."W/T VAT Code") THEN
            GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            END;
            END;
             IF PV.Date=0D THEN
              ERROR('You must specify the PV date');
            GenJnLine."Posting Date":=PV.Date;
            GenJnLine."Document No.":=PV."No.";
            GenJnLine."External Document No.":=PV."Cheque No";
            GenJnLine.Description:=PVLines.Description;
            GenJnLine.Amount:=-PVLines."W/T VAT Amount";
            //Set these fields to blanks
            GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
            GenJnLine.VALIDATE("Gen. Posting Type");
            GenJnLine."Gen. Bus. Posting Group":='';
            GenJnLine.VALIDATE("Gen. Bus. Posting Group");
            GenJnLine."Gen. Prod. Posting Group":='';
            GenJnLine.VALIDATE("Gen. Prod. Posting Group");
            GenJnLine."VAT Bus. Posting Group":='';
            GenJnLine.VALIDATE("VAT Bus. Posting Group");
            GenJnLine."VAT Prod. Posting Group":='';
            GenJnLine.VALIDATE("VAT Prod. Posting Group");
            //
            //IF PV."Pay Mode"='CHEQUE' THEN
            //GenJnLine."Pay Mode":=PV."Pay Mode";
            GenJnLine."Currency Code":=PV.Currency;
            GenJnLine.VALIDATE("Currency Code");
            GenJnLine.VALIDATE(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
            //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::"";
            //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
            //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
            IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;
            END;
            //End of Posting Withholding VAT

            UNTIL PVLines.NEXT=0;
            END;
            */


            //David

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",PV."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            IF GLEntry.FINDFIRST THEN BEGIN*/
            PV.Posted := true;
            PV."Posted By" := UserId;
            PV."Posted Date" := Today;
            PV."Time Posted" := Time;
            PV.Modify;
            PVLines."No. Posted" := PVLines."No. Posted" + 1;

            //Create Imprest Surrender in the event the document originated from an imprest.
            /*
            IF PV."Original Document"=PV."Original Document"::Imprest THEN BEGIN
               PV."Payment Type":=PV."Payment Type"::"10";
               PV.Status:=PV.Status::Open;
               PV.MODIFY;
            END;
            */
            //END;

        end; //end of if No. Posted statement David

    end;


    procedure PostPaymentVoucherTaxRetLiquidatedDamages(PV: Record payments)
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm('Are you sure you want to post the Payment Voucher No. ' + PV."No." + ' ?') = true then begin
            if PV.Status <> PV.Status::Released then
                Error('The Payment Voucher No %1 has not been fully approved', PV."No.");
            if PV.Posted then
                Error('Payment Voucher %1 has been posted', PV."No.");
            PV.TestField(Date);
            PV.TestField("Paying Bank Account");
            PV.TestField(PV.Payee);
            PV.TestField(PV."Pay Mode");
            PV.TestField(PV."Posting Date");
            if PV."Pay Mode" = 'CHEQUE' then begin
                PV.TestField(PV."Cheque No");
                PV.TestField(PV."Cheque Date");
            end;

            PV.CalcFields(PV."Total Retention Amount");
            //Check Lines
            PV.CalcFields("Total Amount");
            if PV."Total Amount" = 0 then
                Error('Amount cannot be zero');
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if not PVLines.FindLast then
                Error('Payment voucher Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
              Batch.Name:=PV."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
            */
            //Bank Entries

            LineNo := LineNo + 10000;
            PV.CalcFields(PV."Total Amount");
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            PVLines.Validate(PVLines.Amount);
            PVLines.CalcSums(PVLines.Amount);
            PVLines.CalcSums(PVLines."W/Tax Amount");
            PVLines.CalcSums(PVLines."VAT Amount");
            PVLines.CalcSums(PVLines."Retention  Amount");
            PVLines.CalcSums(PVLines."Net Amount");
            PVLines.CalcSums(PVLines."Amount Paid");
            PVLines.CalcSums(PVLines."PAYE Amount");
            PVLines.CalcSums("Project No");
            PVLines.CalcSums("Obligation WHT");
            PVLines.CalcSums("Advance Recovery");
            if PVLines."Amount Paid" = PVLines."Net Amount" then
                Message('', PVLines."Amount Paid");

            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Document Type" := PV."Document Type";
            GenJnLine."Account No." := PV."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PV.Date = 0D then
                Error('You must specify the PV date');
            GenJnLine."Posting Date" := PV."Posting Date";
            GenJnLine."Document No." := PV."No.";
            GenJnLine."External Document No." := PV."Cheque No";
            GenJnLine."Payment Method Code" := PV."Pay Mode";
            //GenJnLine.Description:='Pay To:'+PV.Payee;
            GenJnLine.Description := PVLines.Description;
            GenJnLine.Amount := -PV."Total Net Amount";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Project No" := PVLines."Contractor No";
            GenJnLine."Contractor No" := PVLines."Contractor No";
            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //PV Lines Entries
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if PVLines.FindFirst then begin
                repeat
                    //PVLines.VALIDATE(PVLines.Amount);
                    //PVLines.VALIDATE(PVLines."Retention  Amount");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    //enJnLine.Description:='Pay To:'+PV.Payee;
                    GenJnLine.Description := PVLines.Description;
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := PVLines."Net Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    //Payment Vouchers With Part Payment David.




                    //add jobs if g/l account and income statement account
                    if GenJnLine."Account Type" = GenJnLine."account type"::"G/L Account" then begin
                        if Acct.Get(GenJnLine."Account No.") then begin
                            if Acct."Income/Balance" = Acct."income/balance"::"Income Statement" then begin
                                GenJnLine."Job No." := PV.JobNo;
                                GenJnLine."Job Task No." := PV."Job Task No.";
                                GenJnLine."Job Quantity" := 1;

                                GenJnLine.Validate(GenJnLine."Job No.");
                                GenJnLine.Validate(GenJnLine."Job Task No.");
                                GenJnLine.Validate(GenJnLine."Job Quantity");
                            end;
                        end;
                    end;
                    //end jobs

                    /*GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");*/

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    // VAT withheld

                    if PVLines."VAT Withheld Amount" > 0 then
                        Tariffs.Get(PVLines."VAT Withheld Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + '-' + 'VAT Withheld';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := -PVLines."VAT Withheld Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //VAT W/Held balancing Entry
                    if PVLines."VAT Withheld Amount" > 0 then
                        Tariffs.Get(PVLines."VAT Withheld Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + '-' + 'VAT Withheld';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := PVLines."VAT Withheld Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.Validate("Applies-to Doc. No.");
                    GenJnLine."Project No" := PVLines."Contractor No";
                    //GenJnLine.Amount:=PVLines."Obligation Total Amount";
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'VAT Withheld on:' + PVLines.Description;
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."VAT Withheld Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Fred..VAT W/Held Balancing Account
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.Validate("Bal. Account No.");
                    GenJnLine."Project No" := PVLines."Contractor No";
                    // GenJnLine."Contractor No":=PVLines."Obligation Total Amount";

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                    //Posting of Advance Recovery David & Spencer

                    if PV."Advance Recovery" <> 0 then begin
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PV."Account Type";

                        Vendor.Reset;
                        Vendor.SetRange(Vendor."No.", PVLines."Account No");
                        if Vendor.FindSet then begin
                            if PV."Advance Recovery" <> 0 then begin
                                Vendor.TestField("Advance Customer No");
                                GenJnLine."Account No." := Vendor."Advance Customer No";
                            end;
                        end;
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV posting date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PVLines.Description + '-' + 'AdA';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //MESSAGE('%1',PV."Advance Recovery");
                        GenJnLine.Amount := -PV."Advance Recovery";

                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;

                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the Posting PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := 'Advance Recovery Amount:';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        GenJnLine.Amount := PV."Advance Recovery";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);

                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");

                        //application only to type Vendor
                        if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                            GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                        end;

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;
                    //end of Posting of Advance Recovery David & Spencer




                    //Withholding Tax
                    if PVLines."W/Tax Amount" > 0 then
                        Tariffs.Get(PVLines."W/Tax Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + '-' + 'WholdingTax';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := -PVLines."W/Tax Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";


                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Withholding Tax...Fred Balancing W/tax entry
                    if PVLines."W/Tax Amount" > 0 then
                        Tariffs.Get(PVLines."W/Tax Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + '-' + 'WholdingTax';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := PVLines."W/Tax Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.Validate("Applies-to Doc. No.");

                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";


                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;



                    //Post PAYE
                    if PVLines."PAYE Amount" > 0 then
                        Tariffs.Get(PVLines."PAYE Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + ' ' + 'PAYE' + ' ' + PVLines."Account No";
                    ;
                    GenJnLine.Amount := -PVLines."PAYE Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Post PAYE..Fred PAYE Balancing Entry
                    if PVLines."PAYE Amount" > 0 then
                        Tariffs.Get(PVLines."PAYE Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + ' ' + 'PAYE' + ' ' + PVLines."Account No";
                    ;
                    GenJnLine.Amount := PVLines."PAYE Amount";
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.Validate("Applies-to Doc. No.");
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;



                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + ' ' + 'PAYE' + ' ' + PVLines."Account No";
                    ;
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."PAYE Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    //Fred ..Balancing PAYE Entry
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.Validate("Bal. Account No.");
                    GenJnLine."Applies-to Doc. No." := PV."No.";
                    GenJnLine.Validate("Applies-to Doc. No.");

                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                    ////End Posting PAYE

                    //W/Tax Vendor Entry
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'WITHHOLDING TAX:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    GenJnLine.Amount := PVLines."W/Tax Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //Fred ...W/tax balancing entry
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
                    GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                    GenJnLine.Validate("Bal. Account No.");
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;




                    //Retention
                    if PVLines."Retention  Amount" > 0 then
                        Tariffs.Get(PVLines."Retention Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines.Description + '-Amount Retained';
                    GenJnLine.Amount := -PV."Total Retention Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;




                    //Debit Contractor Account
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PVLines."Contractor No" + ' ' + 'AMOUNT RETAINED:';
                    GenJnLine.Amount := PV."Total Retention Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV.Currency;
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    GenJnLine."Project No" := PVLines."Contractor No";
                    GenJnLine."Contractor No" := PVLines."Contractor No";
                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Fred Debit Retention Account>>>>>>Retention Amount
                    if PVLines."Retention  Amount" > 0 then begin
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                        GenJnLine."Account No." := PV."Retention Account";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PV.Payee + '-Amount Retained';
                        GenJnLine.Amount := PV."Total Retention Amount";
                        GenJnLine.Validate(Amount);
                        if PV."Pay Mode" = 'CHEQUE' then
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;

                        //Credit The Paying Account>>>>Retention Amount
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                        GenJnLine."Account No." := PV."Paying Bank Account";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PV.Payee + '-Amount Retained';
                        GenJnLine.Amount := -PV."Total Retention Amount";
                        GenJnLine.Validate(Amount);
                        if PV."Pay Mode" = 'CHEQUE' then
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;

                    //Fred Liquidated Damages
                    if PVLines."Liquidated Damages" > 0 then begin
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
                        ObjJob.Reset;
                        ObjJob.SetRange("No.", PVLines."Contractor No");
                        if ObjJob.FindSet then begin
                            ObjJob.TestField("Job Posting Group");
                            JobPostingGroup.Reset;
                            JobPostingGroup.SetRange(Code, ObjJob."Job Posting Group");
                            if JobPostingGroup.FindSet then begin
                                GenJnLine."Account No." := JobPostingGroup."G/L Expense Acc. (Contract)";
                            end;
                        end;

                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PVLines.Description + '-' + 'Liquidated Damages';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        PV.CalcFields("Total Liquidated Damages");
                        GenJnLine.Amount := -PV."Total Liquidated Damages";
                        //GenJnLine.Amount:=-PVLines."Retention  Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;


                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PVLines.Description + ' ' + 'Liquidated Damages:';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        GenJnLine.Amount := PV."Total Liquidated Damages";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;


                    //Fred Supervision Costs To Be Confirmed By William Abungu 22/05/2021
                    if PVLines."Obligation WHT" > 0 then begin
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
                        ObjJob.Reset;
                        ObjJob.SetRange("No.", PV.JobNo);
                        if ObjJob.FindSet then begin
                            ObjJob.TestField("Job Posting Group");
                            JobPostingGroup.Reset;
                            JobPostingGroup.SetRange(Code, ObjJob."Job Posting Group");
                            if JobPostingGroup.FindSet then begin
                                GenJnLine."Account No." := JobPostingGroup."G/L Expense Acc. (Contract)";
                            end;
                        end;

                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PVLines.Description + '-' + 'Supervision Cost';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        PV.CalcFields("Total Supervision Cost");
                        GenJnLine.Amount := -PV."Total Supervision Cost";
                        //GenJnLine.Amount:=-PVLines."Retention  Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;


                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := PVLines.Description + ' ' + 'Supervision Cost';
                        //GenJnLine."Description 2":=PV."On behalf of";
                        //GenJnLine.Amount:=PVLines.Amount;
                        //GenJnLine.Amount:=PVLines."Retention  Amount";
                        PV.CalcFields("Total Supervision Cost");
                        GenJnLine.Amount := PV."Total Supervision Cost";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV.Currency;
                        GenJnLine."Project No" := PVLines."Contractor No";
                        GenJnLine."Contractor No" := PVLines."Contractor No";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");

                        //application only to type Vendor
                        if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                            GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                        end;

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;
                until PVLines.Next = 0;
            end;
            //End of Posting Withholding Tax
            //David

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",PV."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            IF GLEntry.FINDFIRST THEN BEGIN*/
            PV.Posted := true;
            PV."Posted By" := UserId;
            PV."Posted Date" := Today;
            PV."Time Posted" := Time;
            PV.Modify;
            PVLines."No. Posted" := PVLines."No. Posted" + 1;
        end; //end of if No. Posted statement David

    end;


    procedure FnPostTContractorAdvancePaymentRequest(MeasurementPaymentHeader: Record "Measurement &  Payment Header")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        CashRequestLines: Record "Cash Request Lines";
    begin
        if Confirm(Text0155, false, MeasurementPaymentHeader."Document No.") = true then begin

            if MeasurementPaymentHeader.Posted = true then
                Error(Text0199, MeasurementPaymentHeader."Document No.");

            if MeasurementPaymentHeader."Approved Advance Amount" = 0 then
                Error('Amount cannot be zero');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;


            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
            GenJnLine."Account No." := MeasurementPaymentHeader."Advance Customer No";
            GenJnLine.Validate(GenJnLine."Account No.");
            if MeasurementPaymentHeader."Document Date" = 0D then
                Error('You must specify the document date');
            GenJnLine."Posting Date" := MeasurementPaymentHeader."Document Date";
            MeasurementPaymentHeader.TestField("Advance Request No");
            GenJnLine."Document No." := MeasurementPaymentHeader."Document No.";
            //  + '-' + MeasurementPaymentHeader."Advance Request No";
            GenJnLine."External Document No." := MeasurementPaymentHeader."Document No.";
            GenJnLine.Description := MeasurementPaymentHeader.Description + ' -  ' + MeasurementPaymentHeader."Document No.";
            GenJnLine.Amount := MeasurementPaymentHeader."Approved Advance Amount";
            GenJnLine.Validate(Amount);
            GenJnLine."Project No" := MeasurementPaymentHeader."Project ID";
            GenJnLine."Contractor No" := MeasurementPaymentHeader."Contractor No";
            GenJnLine."Dimension Set ID" := MeasurementPaymentHeader."Dimension Set ID";
            GenJnLine.Validate("Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
            GenJnLine."Account No." := MeasurementPaymentHeader."Contractor No";
            GenJnLine.Validate(GenJnLine."Account No.");
            GenJnLine."Posting Date" := MeasurementPaymentHeader."Document Date";
            GenJnLine."Document No." := MeasurementPaymentHeader."Document No.";// + '-' + MeasurementPaymentHeader."Advance Request No";
            GenJnLine.Description := MeasurementPaymentHeader.Description + ' - ' + MeasurementPaymentHeader."Document No.";
            GenJnLine.Amount := -MeasurementPaymentHeader."Approved Advance Amount";
            GenJnLine."External Document No." := MeasurementPaymentHeader."Document No.";
            GenJnLine."Project No" := MeasurementPaymentHeader."Project ID";
            GenJnLine."Contractor No" := MeasurementPaymentHeader."Contractor No";
            GenJnLine.Validate(Amount);
            GenJnLine."Dimension Set ID" := MeasurementPaymentHeader."Dimension Set ID";
            GenJnLine.Validate("Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Post the Journal
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);


            MeasurementPaymentHeader.Posted := true;
            MeasurementPaymentHeader."Posted By" := UserId;
            MeasurementPaymentHeader.Modify;

        end;
    end;
}

