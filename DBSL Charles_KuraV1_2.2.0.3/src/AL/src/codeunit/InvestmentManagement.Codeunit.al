#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 54000 "Investment Management"
{

    trigger OnRun()
    begin
    end;

    var
        Temp: Record "Funds User Setup";
        JTemplate: Code[50];
        JBatch: Code[50];
        VarianceOnFaceValue: Decimal;


    procedure FnPost(InvestmentInstory: Record "Investment History")
    var
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Investment History";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        InvestmentPostingGrp: Record "Investment Posting Group";
        BFRevaluation: Decimal;
        EquityRec: Record "Investment Asset";
        Equities: Record "Investment Asset";
        InvestmentHistory: Record "Investment History";
        InstitutionAction: Record "Institutional Actions";
        Institution: Record Customer;
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
    begin


        if InvestmentInstory.Posted then
            Error('This Revaluation has been Posted');

        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then
            Error('Ensure the PV Template is set up in Funds User Setup');
        if JBatch = '' then
            Error('Ensure the PV Batch is set up in the Funds User Setup');


        LineNo := LineNo + 10000;
        if Property.Get(InvestmentInstory.No) then begin
            Property.SetRange("Date Filter", 0D, InvestmentInstory.Date);
            Property.CalcFields("Current Value", "No.Of Units", Cost, Revaluations, "Revaluations (FCY)", "Acquisition Cost (FCY)");
            //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);

            EquityRec.Copy(Property);
            EquityRec.SetRange("Date Filter", 0D, EndYear(InvestmentInstory.Date));
            EquityRec.CalcFields(EquityRec.Revaluations, EquityRec."Revaluations (FCY)", "Acquisition Cost (FCY)");
            //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);

            //Reverse Previous
            LineNo := LineNo + 10000;
            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
            else
                Error('You must specify Investment Posting Group for Property %1', InvestmentInstory.No);

            if InvestmentInstory."Currency Code" = '' then begin
                //LineNo:=LineNo+10000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                // GenJnlLine."Line No.":=LineNo+10000;
                GenJnlLine."Line No." := FnGetLastLineNo(JTemplate, JBatch) + 10000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := InvestmentInstory.Date;
                GenJnlLine."Document No." := CopyStr(JBatch + InvestmentInstory.No + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine.Amount := (Property.Revaluations - EquityRec.Revaluations);
                //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
                GenJnlLine."Investment Code" := InvestmentInstory.No;
                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";


                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                /*
                IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                ELSE
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                */
                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Investment Cost Account";
                /*
                GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                GenJnline."Fund Code" := Property."Fund Code";
                GenJnline."Custodian Code" := Property."Custodian Code";
                GenJnline.Validate(GenJnline."Fund Code");
                GenJnline.Validate(GenJnline."Custodian Code");

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert(true);

            end else begin

                //Foreign Currency
                GenJnlLine.Validate(GenJnlLine."Account No.");
                //GenJnlLine."Line No.":=LineNo+10000;
                GenJnlLine."Line No." := FnGetLastLineNo(JTemplate, JBatch) + 10000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := InvestmentInstory.Date;
                GenJnlLine."Document No." := CopyStr(JTemplate + InvestmentInstory.No + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine."Currency Code" := InvestmentInstory."Currency Code";
                GenJnlLine.Validate("Currency Code");
                GenJnlLine.Amount := (Property."Revaluations (FCY)" - EquityRec."Revaluations (FCY)");
                //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
                GenJnlLine."Investment Code" := InvestmentInstory.No;
                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";


                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";

                /*
                IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                ELSE
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                */
                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Investment Cost Account";

                /*
                GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := InvestmentInstory."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                GenJnline."Fund Code" := Property."Fund Code";
                GenJnline."Custodian Code" := Property."Custodian Code";
                GenJnline.Validate(GenJnline."Fund Code");
                GenJnline.Validate(GenJnline."Custodian Code");

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert(true);

                //*******end Foreign Currency
            end;

            //End the reversal

            //LineNo:=FnGetLastLineNo('GENERAL','JVS')+10000;

            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            if GenJnlLine.Find('+') then
                //LineNo:=LineNo+10000;
                GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
            else
                Error('You must specify Investment Posting Group for Property %1', InvestmentInstory.No);


            if InvestmentInstory."Currency Code" = '' then begin
                GenJnlLine.Validate(GenJnlLine."Account No.");
                //GenJnlLine."Line No.":=LineNo+10000;
                GenJnlLine."Line No." := FnGetLastLineNo(JTemplate, JBatch) + 10000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := InvestmentInstory.Date;
                GenJnlLine."Document No." := CopyStr(JBatch + InvestmentInstory.No + '-' + Format(GenJnlLine."Posting Date"), 1, 20);

                GenJnlLine.Amount := -(((Property."No.Of Units" * InvestmentInstory."Current Market Value") - Property.Cost) - EquityRec.Revaluations);

                //GenJnlLine."External Document No.":="Cheque No";
                //GenJnlLine.Amount:=-(((Property."No.Of Units"*"Current Market Value")-Property."Acquisition Cost (FCY)")-
                //EquityRec."Revaluations (FCY)");
                //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Property.Description + '' + 'Revaluation';
                GenJnlLine."Investment Code" := InvestmentInstory.No;
                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

                GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := InvestmentInstory."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                GenJnline."Fund Code" := Property."Fund Code";
                GenJnline."Custodian Code" := Property."Custodian Code";
                GenJnline.Validate(GenJnline."Fund Code");
                GenJnline.Validate(GenJnline."Custodian Code");

                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                /*
                IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                ELSE
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                */
                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Investment Cost Account";

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert(true);

            end else begin

                //Foreign Currency.
                //LineNo:=LineNo+10000;
                GenJnlLine."Line No." := FnGetLastLineNo(JTemplate, JBatch) + 10000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := InvestmentInstory.Date;
                GenJnlLine."Document No." := CopyStr(JBatch + InvestmentInstory.No + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine."Currency Code" := InvestmentInstory."Currency Code";
                GenJnlLine.Validate("Currency Code");

                GenJnlLine.Amount := -(((Property."No.Of Units" * InvestmentInstory."Current Market Value") - Property."Acquisition Cost (FCY)") -
                EquityRec."Revaluations (FCY)");

                //GenJnlLine.Amount:=-(((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations);
                //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Property.Description + '' + 'Revaluation';
                GenJnlLine."Investment Code" := InvestmentInstory.No;
                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

                GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := InvestmentInstory."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                GenJnline."Fund Code" := Property."Fund Code";
                GenJnline."Custodian Code" := Property."Custodian Code";
                GenJnline.Validate(GenJnline."Fund Code");
                GenJnline.Validate(GenJnline."Custodian Code");

                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";

                /*
                IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                ELSE
                GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                 */

                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Investment Cost Account";

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert(true);

                //end foreign currency

            end;
        end
        else
            Error('The Property has not been defined');


        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        if GenJnlLine.Find('-') then
            repeat
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
            //GenJnline.MODIFY;

            until GenJnlLine.Next = 0;


        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

        InvestmentInstory.Posted := true;
        InvestmentInstory.Modify;

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

    local procedure FnGetLastLineNo(JournalName: Code[20]; JournalBatch: Code[20]) LineNumber: Integer
    var
        GenLine: Record "Gen. Journal Line";
    begin
        GenLine.Reset;
        GenLine.SetRange("Journal Template Name", JournalName);
        GenLine.SetRange("Journal Batch Name", JournalBatch);
        if GenLine.FindLast then begin
            LineNumber := GenLine."Line No.";
            exit(LineNumber);
        end;
    end;


    procedure FnPostBuy(Payment: Record Payments1)
    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tarriff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        Payments: Record Payments1;
        InvestmentRec: Record "Investment Asset";
        InvestmentPG: Record "Investment Posting Group";
        PaymentLines: Record "Payments Line1";
        RBA: Record "RBA Compliance";
        "RBA Class": Code[10];
        Funds: Code[10];
        Dimensions: Record "Dimension Value";
        FundsAvailable: Decimal;
        InvestRec: Record "Investment Asset";
        TotalInvestment: Decimal;
        TotalPerClass: Decimal;
        PerCentagePerClass: Decimal;
        RBARecomended: Decimal;
        BankAcc: Record "Bank Account";
        GAMOUNT: Decimal;
        RES: Decimal;
        ANS: Decimal;
    begin

        if Confirm('Are you sure you would like to POST this transaction?', false) = true then begin


            if Payment.Posted = true then
                Error('Transaction already posted!!');

            TotalInvestment := 0;
            FundsAvailable := 0;
            InvestmentRec.Get(Payment."Investment No");
            "RBA Class" := InvestmentRec."RBA Class";
            Funds := Payment."Fund Code";


            TotalPerClass := 0;
            InvestRec.Reset;
            InvestRec.SetRange(InvestRec."RBA Class", "RBA Class");
            InvestRec.SetRange(InvestRec."Date Filter", 0D, Payment.Date);

            InvestRec.SetRange(InvestRec."Fund Code", Funds);
            if InvestRec.Find('-') then
                repeat
                    InvestRec.CalcFields(InvestRec."Acquisition Cost");
                    TotalPerClass := TotalPerClass + InvestRec."Acquisition Cost";
                until InvestRec.Next = 0;
            //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);

            TotalPerClass := TotalPerClass + Payment.Amount;
            //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);
            //IF TotalInvestment<>0 THEN
            //PerCentagePerClass:=(TotalPerClass/TotalInvestment)*100;


            //kugun
            if FundsAvailable <> 0 then
                PerCentagePerClass := (TotalPerClass / FundsAvailable) * 100;
            //MESSAGE(PerCentagePerClass);
            //MESSAGE('Percentage %1 =%2',"RBA Class",PerCentagePerClass);

            if RBA.Get("RBA Class") then begin
                //MESSAGE('Percentage %1 =%2',"RBA Class",RBA."% Recommended");
                RBARecomended := RBA."% Recommended";
                if PerCentagePerClass > RBARecomended then
                    Error('You will exceed the RBA Limit for this Investment.Please check!!');
            end;


            Temp.Get(UserId);
            JTemplate := Temp."Payment Journal Template";
            JBatch := Temp."Payment Journal Batch";
            if JTemplate = '' then begin
                Error('Ensure the PV Template is set up in Funds User Setup');
            end;
            if JBatch = '' then begin
                Error('Ensure the PV Batch is set up in the Funds User Setup')
            end;

            // DELETE ANY LINE ITEM THAT MAY BE PRESENT
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;




            LineNo := 0;




            if Payment."Pay Mode" = 'CHEQUE' then begin
                Payment.TestField("Paying Bank Account");
            end;
            Payment.TestField("Transaction Name");
            Payment.TestField("Pay Mode");
            //TESTFIELD(Payee);
            Payment.TestField(Amount);
            Payment.TestField("VAT Code");
            Payment.TestField("Withholding Tax Code");
            //TESTFIELD("Global Dimension 1 Code");
            Payment.TestField("Fund Code");


            //BANK
            if Payment."Pay Mode" = 'CASH' then begin

                //CashierLinks.RESET;
                //CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                //IF CashierLinks.FIND('-') THEN BEGIN

                //CASH
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                GenJnlLine."Account No." := Payment."Paying Bank Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine.Amount := -(Payment.Amount);
                //MESSAGE('CASH =%1',GenJnlLine.Amount);
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name" + '_' + InvestRec.Description;
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                //GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");


                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                GenJnlLine."GL Code" := Payment."Control Ac";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                //END
                //ELSE BEGIN
                //ERROR('Please link the user/cashier to a collection account before proceeding.');
                //END;

            end;

            if Payment."Pay Mode" = 'EFT' then begin
                //EFT
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                GenJnlLine."Account No." := Payment."Paying Bank Account";
                //GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Manual Check";
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Amount := -Payment.Amount;
                //MESSAGE('EFT =%1',GenJnlLine.Amount);
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name" + '_' + InvestRec.Description;
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                //GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                GenJnlLine."GL Code" := Payment."Control Ac";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;


            if Payment."Pay Mode" = 'CHEQUE' then begin
                //CHEQUE
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                GenJnlLine."Account No." := Payment."Paying Bank Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Bank Payment Type" := GenJnlLine."bank payment type"::"Computer Check";
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Amount := -Payment.Amount;
                //MESSAGE('CHEQUE =%1',GenJnlLine.Amount);
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name" + '_' + InvestRec.Description;
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";*/
                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/


                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine."GL Code" := Payment."Control Ac";
                GenJnlLine.Payee := Payment.Payee;
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;

            TarriffCodes.Reset;
            TarriffCodes.SetRange(TarriffCodes.Code, Payment."VAT Code");
            if TarriffCodes.Find('-') then begin
                TarriffCodes.TestField(TarriffCodes."G/L Account");
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Account No." := TarriffCodes."G/L Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Amount := -Payment."VAT Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := 'VAT';
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";*/
                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                //GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");

                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                GenJnlLine."GL Code" := Payment."Control Ac";


                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;

            TarriffCodes.Reset;
            TarriffCodes.SetRange(TarriffCodes.Code, Payment."Withholding Tax Code");
            if TarriffCodes.Find('-') then begin
                TarriffCodes.TestField(TarriffCodes."G/L Account");
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Account No." := TarriffCodes."G/L Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Amount := -Payment."Withholding Tax Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := 'Withholding Tax';
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/

                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                //GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine."GL Code" := Payment."Control Ac";
                GenJnlLine.Payee := Payment.Payee;
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;

            if Payment.Multiple = false then begin
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := Payment."Account Type";
                GenJnlLine."Account No." := Payment."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;

                InvestRec.Get(Payment."Investment No");
                if InvestRec."Investment Type" = '05' then
                    GenJnlLine.Amount := Payment.Amount;
                if InvestRec."Investment Type" = '04' then
                    GenJnlLine.Amount := Payment.Amount;
                if InvestRec."Investment Type" = '07' then
                    GenJnlLine.Amount := Payment.Amount;

                //END ELSE BEGIN
                // GenJnlLine.Amount:=Amount;
                //END;
                if InvestRec."Investment Type" = '06' then
                    GenJnlLine.Amount := Payment.Amount - Payment."Cum-Interest Purchase";


                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Investment No" + ' ' + Payment."Transaction Name";
                /*GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;

                //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                //END;
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;


                //Interest Account
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;

                GenJnlLine."Account Type" := Payment."Account Type";

                if InvestmentRec.Get(Payment."Investment No") then
                    if InvestmentPG.Get(InvestmentRec."Investment Posting Group") then
                        GenJnlLine."Account No." := InvestmentPG."Interest Receivable Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Amount := Payment."Cum-Interest Purchase";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := 'Cum-Interest Purchase';
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;


            end;


            if Payment.Multiple = true then begin
                //Insert Multiple Lines
                PaymentLines.Reset;
                PaymentLines.SetRange(PaymentLines."PV No", Payment.No);
                if PaymentLines.Find('-') then
                    repeat
                        //MESSAGE('%1',PaymentLines.Description);
                        LineNo := LineNo + 1000;
                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Account Type" := PaymentLines."Account Type";
                        GenJnlLine."Account No." := PaymentLines."Account No.";
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Payment.Date;
                        GenJnlLine."Document No." := Payment.No;
                        GenJnlLine."External Document No." := Payment."Cheque No";
                        GenJnlLine."Currency Code" := Payment.Currency;
                        GenJnlLine.Amount := PaymentLines.Amount;
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.Description := PaymentLines.Description;
                        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                        /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                        GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                        GenJnlLine."Fund Code" := Payment."Fund Code";
                        GenJnlLine."Custodian Code" := Payment."Custodian Code";
                        GenJnlLine.Validate(GenJnlLine."Fund Code");
                        GenJnlLine.Validate(GenJnlLine."Custodian Code");

                        GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                        //GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");

                        GenJnlLine."Investment Code" := Payment."Investment No";
                        GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                        GenJnlLine."No. Of Units" := Payment."No. Of Units";

                        //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                        GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                        GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                        GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                        GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                        //END;
                        GenJnlLine.Payee := Payment.Payee;
                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert;

                    until PaymentLines.Next = 0;

            end;




            LineNo := LineNo + 1000;
            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No." := LineNo;
            GenJnlLine."Account Type" := Payment."Account Type";
            GenJnlLine."Account No." := Payment."Account No.";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := Payment.Date;
            GenJnlLine."Document No." := Payment.No;
            GenJnlLine."Currency Code" := Payment.Currency;
            GenJnlLine.Amount := Payment."VAT Amount";
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
            GenJnlLine."Bal. Account No." := '';
            GenJnlLine.Description := 'VAT';
            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");

            /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN

            GenJnlLine."Fund Code" := Payment."Fund Code";
            GenJnlLine."Custodian Code" := Payment."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
            //GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");

            GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
            GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID" := Payment."Apply to ID";
            //END;
            GenJnlLine."Investment Code" := Payment."Investment No";
            GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
            GenJnlLine."No. Of Units" := Payment."No. Of Units";
            GenJnlLine.Payee := Payment.Payee;

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;

            LineNo := LineNo + 1000;
            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No." := LineNo;
            GenJnlLine."Account Type" := Payment."Account Type";
            GenJnlLine."Account No." := Payment."Account No.";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := Payment.Date;
            GenJnlLine."Document No." := Payment.No;
            GenJnlLine."Currency Code" := Payment.Currency;
            GenJnlLine.Amount := Payment."Withholding Tax Amount";
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
            GenJnlLine."Bal. Account No." := '';
            GenJnlLine.Description := 'Withholding Tax';
            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
            /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN

            GenJnlLine."Fund Code" := Payment."Fund Code";
            GenJnlLine."Custodian Code" := Payment."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
            GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID" := Payment."Apply to ID";
            //END;
            GenJnlLine."Investment Code" := Payment."Investment No";
            GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
            GenJnlLine."No. Of Units" := Payment."No. Of Units";
            GenJnlLine.Payee := Payment.Payee;
            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;


            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.SetRange(GenJnlLine."Document No.", Payment.No);
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);


            if InvestmentRec.Get(Payment."Investment No") then begin

                InvestmentRec."Face Value" := Payment."Gross Amount";
                InvestmentRec.Modify;
            end;

            Payment.Posted := true;
            Payment."Date Posted" := Today;
            Payment."Time Posted" := Time;
            Payment."Posted By" := UserId;
            Payment.Modify;




            Payment.Status := Payment.Status::"Cheque Printing";
            Payment.Modify;


        end;

    end;


    procedure FnPostSell(Receipts: Record Receipts)
    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types";
        ExpectedInterest: Record "Expected Interest1";
        InvestmentRec: Record "Investment Asset";
        InvestmentPostingGroup: Record "Investment Posting Group";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
    begin

        if Receipts.Posted then
            Error('The transaction has already been posted.');

        if Receipts."Transaction Name" = '' then
            Error('Please enter the transaction description under transaction name.');

        if Receipts.Amount = 0 then
            Error('Please enter amount.');

        if Receipts.Amount < 0 then
            Error('Amount cannot be less than zero.');

        if GenSetup.Get then begin
            //GenSetup."Posted Receipts No":=INCSTR(GenSetup."Posted Receipts No");
            //"Receipt No":=GenSetup."Posted Receipts No";

        end;


        if Receipts."Schedule Mandatory" then begin
            if Receipts."Schedule Date" = 0D then
                Error('YOU MUST SPECIFY THE SCHEDULE DATE WHEN TRANSACTION TYPE IS %1', Receipts."Receipt Type");


        end;




        if Receipts."Fund Code" = '' then
            Error('Please specify the branch code');

        if Receipts."Bank Code" = '' then
            Error('Please specify Receiving bank');

        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then begin
            Error('Ensure the PV Template is set up in Funds User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the PV Batch is set up in the Funds User Setup')
        end;


        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        GenJnlLine.DeleteAll;

        if DefaultBatch.Get(JTemplate, JBatch) then
            DefaultBatch.Delete;

        DefaultBatch.Reset;
        DefaultBatch."Journal Template Name" := JTemplate;
        DefaultBatch.Name := JBatch;
        DefaultBatch.Insert;

        //*********Redemption

        if Receipts."Investment Type" = Receipts."investment type"::"Money Market" then begin
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Line No." := 10000;
            GenJnlLine."Account Type" := Receipts."account type"::"Bank Account";
            GenJnlLine."Account No." := Receipts."Bank Code";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := Receipts.Date;
            GenJnlLine."Document No." := Receipts.No;
            GenJnlLine."External Document No." := Receipts.No;
            GenJnlLine."Currency Code" := Receipts.Currency;
            //GenJnlLine.Amount:=Receipts.Amount;****Commented by Morris
            GenJnlLine.Amount := Receipts.Amount + Receipts."Revaluation Gain/(Loss)";
            GenJnlLine.Validate(GenJnlLine.Amount);
            //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
            //GenJnlLine."Bal. Account No.":="Bank Code";
            //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            //IF GenJnlLine."Investment Transcation Type"="Investment Transcation Type"::Interest THEN
            GenJnlLine.Description := Receipts."Intitution Name";
            //IF GenJnlLine."Investment Transcation Type"="Investment Transcation Type"::Disposal THEN
            //GenJnlLine.Description:="Intitution Name"+'-Redemption';

            GenJnlLine."Investment Code" := Receipts."Investment No";
            GenJnlLine."Investment Transcation Type" := Receipts."Investment Transcation Type";
            GenJnlLine."No. Of Units" := Receipts."No. Of Units";
            GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";

            GenJnlLine."Fund Code" := Receipts."Fund Code";
            GenJnlLine."Custodian Code" := Receipts."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            GenJnlLine."Cheque Type" := Receipts."Cheque Type";
            GenJnlLine."Drawer Bank Name" := Receipts."Bank Codes";
            GenJnlLine."GL Code" := Receipts."Control Ac";

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;

            //IF "Calculate Interest" THEN
            //BEGIN

            if Receipts.Amount > 0 then begin
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 20000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Investment Transcation Type" := Receipts."Investment Transcation Type";

                if InvestmentRec.Get(Receipts."Investment No") then begin
                    if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then begin
                        if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Interest Receivable Account";
                        if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Investment Cost Account";
                        InvestmentRec.CalcFields("Acquisition Cost");//Added by Morris  ***to be done on a separate function
                    end;


                end;


                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipts.Date;
                GenJnlLine."Document No." := Receipts.No;
                GenJnlLine."External Document No." := Receipts.No;
                GenJnlLine."Currency Code" := Receipts.Currency;

                if (InvestmentRec."Investment Type" = '05') and (Receipts."Investment Transcation Type" <> Receipts."investment transcation type"::Interest) then //second arguement added by morris
                    GenJnlLine.Amount := -(InvestmentRec."Acquisition Cost")
                else
                    GenJnlLine.Amount := -(Receipts.Amount);

                //GenJnlLine.Amount:=-1*InvestmentRec."Acquisition Cost";  ***to be done on a separate function
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine.Description:="Transaction Name";
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Interest';
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Redemption';

                GenJnlLine."Investment Code" := Receipts."Investment No";
                GenJnlLine."No. Of Units" := Receipts."No. Of Units";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Fund Code" := Receipts."Fund Code";
                GenJnlLine."Custodian Code" := Receipts."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

            end;


            if Receipts."Revaluation Gain/(Loss)" <> 0 then begin
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 30000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Investment Transcation Type" := Receipts."Investment Transcation Type";


                if InvestmentRec.Get(Receipts."Investment No") then begin
                    if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then begin
                        if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Interest Receivable Account";
                        if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
                        GenJnlLine."Account No." := InvestmentPostingGroup."Investment Cost Account";

                    end;
                end;


                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipts.Date;
                GenJnlLine."Document No." := Receipts.No;
                GenJnlLine."External Document No." := Receipts.No;
                GenJnlLine."Currency Code" := Receipts.Currency;
                GenJnlLine.Amount := -(Receipts."Revaluation Gain/(Loss)");
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine.Description:="Transaction Name";
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Interest';
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Revaluation Redeption';

                GenJnlLine."Investment Code" := Receipts."Investment No";
                GenJnlLine."No. Of Units" := Receipts."No. Of Units";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Fund Code" := Receipts."Fund Code";
                GenJnlLine."Custodian Code" := Receipts."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

            end;



            //Added to Cater for interest by Morris
            if (InvestmentRec."Investment Type" = '05') then begin
                if Receipts."Accrued Interest" > 0 then begin
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 40000;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                    GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
                    if InvestmentRec.Get(Receipts."Investment No") then
                        GenJnlLine."Account No." := InvestmentPostingGroup."Interest Receivable Account";

                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipts.Date;
                    GenJnlLine."Document No." := Receipts.No;
                    GenJnlLine."External Document No." := Receipts.No;
                    GenJnlLine."Currency Code" := Receipts.Currency;
                    GenJnlLine.Amount := -(Receipts."Accrued Interest");
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    //GenJnlLine.Description:="Transaction Name";
                    if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                        GenJnlLine.Description := Receipts."Intitution Name" + '-Interest';

                    GenJnlLine."Investment Code" := Receipts."Investment No";
                    GenJnlLine."No. Of Units" := Receipts."No. Of Units";

                    GenJnlLine."Fund Code" := Receipts."Fund Code";
                    GenJnlLine."Custodian Code" := Receipts."Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");

                    GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                    GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;

                end;
            end;


            //end Cater for Interest


            //Added to Cater for Gain/Loss on Tbill  by Morris
            if (InvestmentRec."Investment Type" = '05') then begin
                if Receipts."Gain/(Loss) on TBill Disposal" <> 0 then begin
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 50000;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                    GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Disposal;
                    if InvestmentRec.Get(Receipts."Investment No") then
                        GenJnlLine."Account No." := InvestmentPostingGroup."Gain/Loss on Disposal Account";

                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipts.Date;
                    GenJnlLine."Document No." := Receipts.No;
                    GenJnlLine."External Document No." := Receipts.No;
                    GenJnlLine."Currency Code" := Receipts.Currency;
                    GenJnlLine.Amount := -1 * (Receipts."Gain/(Loss) on TBill Disposal");
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    //GenJnlLine.Description:="Transaction Name";
                    if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                        GenJnlLine.Description := Receipts."Intitution Name" + '-Gain/Loss';

                    GenJnlLine."Investment Code" := Receipts."Investment No";
                    GenJnlLine."No. Of Units" := Receipts."No. Of Units";

                    GenJnlLine."Fund Code" := Receipts."Fund Code";
                    GenJnlLine."Custodian Code" := Receipts."Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");

                    GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                    GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;

                end;
            end;


            //end Cater for Interest

        end;

        //END;


        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);


        Receipts.Posted := true;

        Receipts."Date Posted" := Today;
        Receipts."Time Posted" := Time;
        Receipts."Posted By" := UserId;
        Receipts.Modify;

        GenSetup.Modify;

    end;


    procedure FnPostAccruedInt(BondCal: Record "Bond Calculator")
    var
        //BondReport: Report "Bondo Cash Flow to Excel";
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        InvestmentHistory: Record "Investment History";
        InstitutionAction: Record "Institutional Actions";
        Institution: Record Customer;
        Property: Record "Investment Asset";
        EquityRec: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        Calculator: Record "Bond Calculator";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Investment History";
        RevaluationGainLoss: Decimal;
        UnitCost: Decimal;
        FA: Record "Investment Asset";
        Purchase: Record Payments1;
        Sale: Record Receipts;
        GLsetup: Record "General Ledger Setup";
    begin

        //IF Posted THEN
        //ERROR('This Revaluation has been Posted');

        if Property.Get(BondCal."System Bond No") then begin

            Property.SetRange("Date Filter", 0D, BondCal."Settlement Date");
            Property.CalcFields("Current Value", "No.Of Units", Cost, Revaluations, "Accrued Interest");
            //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);

            EquityRec.Copy(Property);
            EquityRec.SetRange("Date Filter", 0D, EndYear(BondCal."Settlement Date"));
            EquityRec.CalcFields(EquityRec.Revaluations);
            //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);

            Temp.Get(UserId);
            JTemplate := Temp."Payment Journal Template";
            JBatch := Temp."Payment Journal Batch";
            if JTemplate = '' then begin
                Error('Ensure the PV Template is set up in Funds User Setup');
            end;
            if JBatch = '' then begin
                Error('Ensure the PV Batch is set up in the Funds User Setup')
            end;


            // DELETE ANY LINE ITEM THAT MAY BE PRESENT
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;

            //*********ACCRUED INTEREST***********//
            //Reverse Previous

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Interest Receivable Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr(JBatch + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);

            GenJnlLine.Amount := -Property."Accrued Interest";
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Accrued interest Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
            //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");



            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Income Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr(JBatch + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := Property."Accrued Interest";
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::" ";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //End the reversal

            //current accrued interest

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Interest Receivable Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := BondCal."Accrued Interest 2";
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Income Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := -BondCal."Accrued Interest 2";
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::" ";
            //GenJnlLine."No. Of Units":="No. Of Units";
            //GenJnlLine."Expected Receipt date":="Schedule Date";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");


            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //end accrued interest

            //*********END ACCRUED INTEREST******************//


        end
        else
            Error('The Property has not been defined');
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        if GenJnlLine.Find('-') then
            repeat
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
            //GenJnline.MODIFY;

            until GenJnlLine.Next = 0;

        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);


        BondCal.Posted := true;
        BondCal."Interest Posted" := true;
        BondCal.Modify;

    end;


    procedure FnPostRevaluation(BondCal: Record "Bond Calculator")
    var
        //BondReport: Report "Bondo Cash Flow to Excel";
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        InvestmentHistory: Record "Investment History";
        InstitutionAction: Record "Institutional Actions";
        Institution: Record Customer;
        Property: Record "Investment Asset";
        EquityRec: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        Calculator: Record "Bond Calculator";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Investment History";
        RevaluationGainLoss: Decimal;
        UnitCost: Decimal;
        FA: Record "Investment Asset";
        Purchase: Record Payments1;
        Sale: Record Receipts;
        GLsetup: Record "General Ledger Setup";
    begin

        //IF Posted THEN
        //ERROR('This Revaluation has been Posted');

        if Property.Get(BondCal."System Bond No") then begin

            Property.SetRange("Date Filter", 0D, BondCal."Settlement Date");
            Property.CalcFields("Current Value", "No.Of Units", Cost, Revaluations, "Accrued Interest");
            //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);

            EquityRec.Copy(Property);
            EquityRec.SetRange("Date Filter", 0D, EndYear(BondCal."Settlement Date"));
            EquityRec.CalcFields(EquityRec.Revaluations);
            //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);

            Temp.Get(UserId);
            JTemplate := Temp."Payment Journal Template";
            JBatch := Temp."Payment Journal Batch";
            if JTemplate = '' then begin
                Error('Ensure the PV Template is set up in Funds User Setup');
            end;
            if JBatch = '' then begin
                Error('Ensure the PV Batch is set up in the Funds User Setup')
            end;

            // DELETE ANY LINE ITEM THAT MAY BE PRESENT
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;

            //*********REVALUATION***********//
            //Reverse Previous

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);

            GenJnlLine.Amount := Property.Revaluations;
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
            //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");


            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := -(Property.Revaluations);
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //End the reversal

            //current Revaluation

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := -(BondCal."Net Amount Receivable" - Property.Cost);
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := BondCal."Net Amount Receivable" - Property.Cost;
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
            //GenJnlLine."No. Of Units":="No. Of Units";
            //GenJnlLine."Expected Receipt date":="Schedule Date";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");


            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //end current revaluation

            //*********END REVALUATION******************//

            /*
            //*********ACCRUED INTEREST***********/
            //Reverse Previous

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := 'GENERAL';
            GenJnlLine."Journal Batch Name" := 'JVS';
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Interest Receivable Account"
            else
                // Error('You must specify Investment Posting Group for Property %1',"System Bond No");

                GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            // GenJnlLine."Posting Date":="Settlement Date";
            // GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);

            GenJnlLine.Amount := -Property."Accrued Interest";
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Accrued interest Reversal';
            // GenJnlLine."Investment Code":="System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
            //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            //GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
            //GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Income Account"
            else
                //Error('You must specify Investment Posting Group for Property %1',"System Bond No");

                GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            // GenJnlLine."Posting Date":="Settlement Date";
            ///GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := Property."Accrued Interest";
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest Reversal';
            // GenJnlLine."Investment Code":="System Bond No";
            // GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::" ";
            // GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
            // GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
            // GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
            // GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //End the reversal

            //current accrued interest

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := 'GENERAL';
            GenJnlLine."Journal Batch Name" := 'JVS';
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Interest Receivable Account"
            else
                ///Error('You must specify Investment Posting Group for Property %1',"System Bond No");

                GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            // GenJnlLine."Posting Date":="Settlement Date";
            //GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
            //GenJnlLine."External Document No.":="Cheque No";
            //  GenJnlLine.Amount:="Accrued Interest 2";
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest';
            // GenJnlLine."Investment Code":="System Bond No";
            // GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Interest;
            // GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
            // GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");

            // GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
            // GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Income Account"
            else
                // Error('You must specify Investment Posting Group for Property %1',"System Bond No");

                GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            //GenJnlLine."Posting Date":="Settlement Date";
            //GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
            //GenJnlLine."External Document No.":="Cheque No";
            //GenJnlLine.Amount:=-"Accrued Interest 2";
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest';
            // GenJnlLine."Investment Code":="System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::" ";
            //GenJnlLine."No. Of Units":="No. Of Units";
            //GenJnlLine."Expected Receipt date":="Schedule Date";
            //GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");

            // GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");



            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //end accrued interest

            //*********END ACCRUED INTEREST******************//

            //*/
        end
        else
            Error('The Property has not been defined');
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        if GenJnlLine.Find('-') then
            repeat
            /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
            //GenJnline.MODIFY;

            until GenJnlLine.Next = 0;

        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);


        BondCal.Posted := true;
        BondCal."Revaluation Posted" := true;
        BondCal.Modify;

    end;


    procedure FnPostRevaluationandInt(BondCal: Record "Bond Calculator")
    var
        //BondReport: Report "Bondo Cash Flow to Excel";
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        InvestmentHistory: Record "Investment History";
        InstitutionAction: Record "Institutional Actions";
        Institution: Record Customer;
        Property: Record "Investment Asset";
        EquityRec: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        Calculator: Record "Bond Calculator";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Investment History";
        RevaluationGainLoss: Decimal;
        UnitCost: Decimal;
        FA: Record "Investment Asset";
        Purchase: Record Payments1;
        Sale: Record Receipts;
        GLsetup: Record "General Ledger Setup";
    begin

        //IF Posted THEN
        //ERROR('This Revaluation has been Posted');

        if Property.Get(BondCal."System Bond No") then begin

            Property.SetRange("Date Filter", 0D, BondCal."Settlement Date");
            Property.CalcFields("Current Value", "No.Of Units", Cost, Revaluations, "Accrued Interest");
            //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);

            EquityRec.Copy(Property);
            EquityRec.SetRange("Date Filter", 0D, EndYear(BondCal."Settlement Date"));
            EquityRec.CalcFields(EquityRec.Revaluations);
            //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);


            // DELETE ANY LINE ITEM THAT MAY BE PRESENT
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;

            //*********REVALUATION***********//
            //Reverse Previous

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);

            GenJnlLine.Amount := Property.Revaluations;
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
            //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := -(Property.Revaluations);
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //End the reversal

            //current Revaluation

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := -(BondCal."Net Amount Receivable" - Property.Cost);
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := BondCal."Net Amount Receivable" - Property.Cost;
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Revaluation';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
            //GenJnlLine."No. Of Units":="No. Of Units";
            //GenJnlLine."Expected Receipt date":="Schedule Date";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");


            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //end current revaluation

            //*********END REVALUATION******************//


            //*********ACCRUED INTEREST***********//
            //Reverse Previous

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Interest Receivable Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);

            GenJnlLine.Amount := -Property."Accrued Interest";
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'Accrued interest Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
            //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/


            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Income Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := Property."Accrued Interest";
            //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest Reversal';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::" ";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //End the reversal

            //current accrued interest

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Interest Receivable Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := BondCal."Accrued Interest 2";
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);


            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Income Account"
            else
                Error('You must specify Investment Posting Group for Property %1', BondCal."System Bond No");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := BondCal."Settlement Date";
            GenJnlLine."Document No." := CopyStr('JV-' + BondCal."System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := -BondCal."Accrued Interest 2";
            //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Property.Description + '' + 'accrued interest';
            GenJnlLine."Investment Code" := BondCal."System Bond No";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::" ";
            //GenJnlLine."No. Of Units":="No. Of Units";
            //GenJnlLine."Expected Receipt date":="Schedule Date";
            /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

            GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := Property."Fund Code";
            GenJnlLine."Custodian Code" := Property."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Property."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");


            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert(true);

            //end accrued interest

            //*********END ACCRUED INTEREST******************//


        end
        else
            Error('The Property has not been defined');
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        if GenJnlLine.Find('-') then
            repeat
            /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
            //GenJnline.MODIFY;

            until GenJnlLine.Next = 0;


        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);


        BondCal.Posted := true;
        BondCal."Interest Posted" := true;
        BondCal."Revaluation Posted" := true;
        BondCal.Modify;

    end;


    procedure FnProcessFDInterest(MMarket: Record "Investment Asset"; JTemp: Code[50]; JBatch: Code[50]; ReferenceDate: Date)
    var
        InvestmentPG: Record "Investment Posting Group";
        GenJnline: Record "Gen. Journal Line";
        InvestmentDate: Date;
        NoOfDays: Integer;
        UnearnedInterest: Decimal;
        EarnedInterest: Decimal;
        GenJnlLine: Record "Gen. Journal Line";
        PreviousInterest: Decimal;
        MoneyMarketCopy: Record "Investment Asset";
        LastRepricingDate: Date;
        ExpectedInterest: Record "Expected Interest1";
        InvestSetup: Record "Investment Setup";
        MoneyMarket: Record "Investment Asset";
        TaxWitheld: Decimal;
        InvestmentSetup: Record "Investment Setup";
    begin

        UnearnedInterest := 0;
        PreviousInterest := 0;
        NoOfDays := 0;
        InvestmentDate := 0D;
        EarnedInterest := 0;
        LastRepricingDate := 0D;
        TaxWitheld := 0;

        //MESSAGE('Gets here1');


        MMarket.SetRange(MMarket."Date Filter", 0D, ReferenceDate);
        MMarket.CalcFields(MMarket."Acquisition Cost");
        if MMarket."Investment Date" = 0D then
            Error('You must Specify Investment Date for %1 - %2', MMarket."No.", MMarket.Description);



        //REVERSAL OF PREVIOUS INTEREST

        MoneyMarketCopy.Copy(MMarket);
        MoneyMarketCopy.SetRange(MoneyMarketCopy."Date Filter", 0D, ReferenceDate - 1);
        MoneyMarketCopy.CalcFields(MoneyMarketCopy."Interest Received", MoneyMarketCopy."Accrued Interest");
        PreviousInterest := MoneyMarketCopy."Accrued Interest";


        //IF PreviousInterest=0 THEN
        //PreviousInterest:=MoneyMarketCopy."Opening Interest";

        //MESSAGE('Interest to be reversed=%1',MoneyMarketCopy."Interest Received");


        GenJnlLine.Init;
        GenJnlLine."Journal Template Name" := JTemp;
        GenJnlLine.Validate(GenJnlLine."Journal Template Name");
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
        if InvestmentPG.Get(MMarket."Investment Posting Group") then begin
            GenJnlLine."Account No." := InvestmentPG."Interest Receivable Account";
            GenJnlLine."Bal. Account No." := InvestmentPG."Investment Income Account";
        end
        else
            Error('Please specify the investment posting group for Investment no %1', MMarket."No.");
        // MESSAGE('first');
        GenJnlLine.Validate(GenJnlLine."Account No.");
        GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
        GenJnlLine.Validate(GenJnlLine."Account No.");
        GenJnlLine."Posting Date" := ReferenceDate;
        GenJnlLine."Document No." := 'ACCR-JV' + Format(ReferenceDate);
        //GenJnlLine."External Document No.":="Cheque No";
        GenJnlLine.Amount := -PreviousInterest;
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine.Description := StrSubstNo('Reversal of Previous Interest as at %1', ReferenceDate);
        GenJnlLine."Investment Code" := MMarket."No.";
        GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
        //GenJnlLine."No. Of Units":="No. Of Units";
        //GenJnlLine."Expected Receipt date":="Schedule Date";


        /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        
        GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

        GenJnlLine."Fund Code" := MMarket."Fund Code";
        GenJnlLine."Custodian Code" := MMarket."Custodian Code";
        GenJnlLine.Validate(GenJnlLine."Fund Code");
        GenJnlLine.Validate(GenJnlLine."Custodian Code");

        GenJnlLine."Dimension Set ID" := MMarket."Dimension Set ID";
        GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

        GenJnline."Bal. Account Type" := GenJnline."bal. account type"::"G/L Account";


        //IF InvestmentPG.GET("Fixed Asset"."Investment Posting Group") THEN
        //GenJnline."Bal. Account No.":=InvestmentPG."Investment Income Account";
        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
        /*
        GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/




        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert;



        //END ---REVERSAL





        if MMarket."Acquisition Cost" = 0 then
            exit;







        InvestmentDate := MMarket."Investment Date";
        NoOfDays := ReferenceDate - InvestmentDate;
        MMarket.CalcFields(MMarket."Acquisition Cost");





        //PRIVATE SECTOR DEPOSITS


        if MMarket."Investment Type" = '04' then begin
            //MESSAGE('Gets here');
            UnearnedInterest := ROUND(((CalcDate('CD+1D', ReferenceDate - 1) - MMarket."Investment Date") / 365) * (MMarket."Rate %" / 100) *
            MMarket."Acquisition Cost", 0.01);

            //MESSAGE('%1',UnearnedInterest);

            if MMarket."Deposit Type" <> MMarket."deposit type"::" " then begin
                UnearnedInterest := ROUND(((CalcDate('CD+1D', ReferenceDate - 1) - MMarket."Investment Date") / 365) * (MMarket."Rate %" / 100) *
                MMarket."Acquisition Cost", 0.01);

                //MESSAGE('%1',UnearnedInterest);

                InvestmentSetup.Get;
                TaxWitheld := ROUND((InvestmentSetup."Witholding Tax%-Fixed Deposits" / 100) * UnearnedInterest);

                //MESSAGE('%1',TaxWitheld);



                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemp;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                if InvestmentPG.Get(MMarket."Investment Posting Group") then begin
                    GenJnlLine."Account No." := InvestmentPG."Interest Receivable Account";
                    //GenJnlLine."Bal. Account No.":=InvestmentPG."Interest Receivable Account";
                    //
                end
                else
                    Error('Please specify the investment posting group for Investment no %1', MMarket."No.");

                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := ReferenceDate;
                GenJnlLine."Document No." := 'ACCR-JV' + Format(ReferenceDate);

                //GenJnlLine."External Document No.":="Cheque No";

                GenJnlLine.Amount := UnearnedInterest;

                //GenJnlLine.Amount:=UnearnedInterest-TaxWitheld;
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := StrSubstNo('Accrued Interest as at %1', ReferenceDate);
                GenJnlLine."Investment Code" := MMarket."No.";
                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;

                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";{
                /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

                GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                //MESSAGE('hapo');
                GenJnlLine."Fund Code" := MMarket."Fund Code";
                GenJnlLine."Custodian Code" := MMarket."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := MMarket."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");



                GenJnlLine."Bal. Account Type" := GenJnline."bal. account type"::"G/L Account";


                if InvestmentPG.Get(MMarket."Investment Posting Group") then
                    GenJnlLine."Bal. Account No." := InvestmentPG."Investment Income Account";
                //MESSAGE('%1',GenJnline."Bal. Account No.");
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*
                GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                 */

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

            end;

        end;

        //PRIVATE SECTOR DEPOSIT




        //T-BILLS

        if ((MMarket."Investment Type" = '05') or (MMarket."Investment Type" = '07')) then begin
            MMarket.CalcFields(MMarket."Interest Received", MMarket."Accrued Interest",
            MMarket."Acquisition Cost");

            EarnedInterest := MMarket."Interest Received";
            if EarnedInterest = 0 then
                EarnedInterest := MMarket."Interest at purchase";

            if MMarket."Maturity Date" = 0D then
                Error('You must specify the maturity date for %1', MMarket."No.");
            if MMarket."Maturity Period Days" = 0 then
                Error('You must specify maturity number of days for %1', MMarket."No.");

            UnearnedInterest := ROUND(((ReferenceDate + 1 - MMarket."Issue Date") /
            MMarket."Maturity Period Days") * (MMarket."Face Value" - MMarket."Acquisition Cost"), 0.01);




            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemp;
            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
            if InvestmentPG.Get(MMarket."Investment Posting Group") then begin
                GenJnlLine."Account No." := InvestmentPG."Interest Receivable Account";
                GenJnlLine."Bal. Account No." := InvestmentPG."Investment Income Account";
            end
            else
                Error('Please specify the investment posting group for Investment no %1', MMarket."No.");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := ReferenceDate;
            GenJnlLine."Document No." := JBatch + Format(ReferenceDate);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := UnearnedInterest;
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := StrSubstNo('Deferred interest as at %1', ReferenceDate);
            GenJnlLine."Investment Code" := MMarket."No.";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
            //GenJnlLine."No. Of Units":="No. Of Units";
            //GenJnlLine."Expected Receipt date":="Schedule Date";
            /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnline."Bal. Account Type":=GenJnline."Bal. Account Type"::"G/L Account";*/
            //IF InvestmentPG.GET("Fixed Asset"."Investment Posting Group") THEN
            //GenJnline."Bal. Account No.":=InvestmentPG."Investment Income Account";
            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
            /*GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
            GenJnlLine."Fund Code" := MMarket."Fund Code";
            GenJnlLine."Custodian Code" := MMarket."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := MMarket."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;




        end;


        //BONDS


        if MMarket."Investment Type" = '06' then begin
            ExpectedInterest.Reset;
            ExpectedInterest.SetRange(ExpectedInterest."Investment No", MMarket."No.");
            ExpectedInterest.SetFilter(ExpectedInterest."Expected Interest Date", '<%1', ReferenceDate);
            if ExpectedInterest.Find('+') then
                LastRepricingDate := ExpectedInterest."Expected Interest Date";

            if LastRepricingDate = 0D then
                LastRepricingDate := MMarket."Issue Date";


            //MESSAGE('Last Repricing Date=%1',LastRepricingDate);
            if LastRepricingDate = 0D then
                Error('You must define the schedule for Bond %1', MMarket."No.");


            InvestSetup.Get;
            MMarket.CalcFields(MMarket."Interest Received", MMarket."Acquisition Cost");
            UnearnedInterest := ROUND(((ReferenceDate - LastRepricingDate) / InvestSetup."CBK Year Days") *
           MMarket."Acquisition Cost" * (MMarket."Rate %" / 100), 0.01);
            //MESSAGE('Accrued Interest=%1 %2 No. of days %3',UnearnedInterest,MMarket."Rate %",ReferenceDate-LastRepricingDate);

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemp;
            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
            if InvestmentPG.Get(MMarket."Investment Posting Group") then begin
                GenJnlLine."Account No." := InvestmentPG."Investment Cost Account";
                GenJnlLine."Bal. Account No." := InvestmentPG."Investment Income Account";
            end
            else
                Error('Please specify the investment posting group for Investment no %1', MMarket."No.");

            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := ReferenceDate;
            GenJnlLine."Document No." := JBatch + Format(ReferenceDate);
            //GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine.Amount := UnearnedInterest;
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := StrSubstNo('Accrued interest as at %1', ReferenceDate);
            GenJnlLine."Investment Code" := MMarket."No.";
            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
            //GenJnlLine."No. Of Units":="No. Of Units";
            //GenJnlLine."Expected Receipt date":="Schedule Date";

            GenJnline."Bal. Account Type" := GenJnline."bal. account type"::"G/L Account";
            //IF InvestmentPG.GET("Fixed Asset"."Investment Posting Group") THEN
            //GenJnline."Bal. Account No.":=InvestmentPG."Investment Income Account";
            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
            /*
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

            GenJnlLine."Fund Code" := MMarket."Fund Code";
            GenJnlLine."Custodian Code" := MMarket."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := MMarket."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;




        end;






        //ERROR('PLEASE SPECIFY MATURITY DATE ON THE INVESTMENT NO %1',MMarket."No.");

    end;


    procedure FnPostEquityBuy(Payment: Record Payments1)
    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tarriff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        Payments: Record Payments1;
        InvestmentRec: Record "Investment Asset";
        InvestmentPG: Record "Investment Posting Group";
        PaymentLines: Record "Payments Line1";
        RBA: Record "RBA Compliance";
        "RBA Class": Code[10];
        Funds: Code[10];
        Dimensions: Record "Fund Code";
        FundsAvailable: Decimal;
        InvestRec: Record "Investment Asset";
        TotalInvestment: Decimal;
        TotalPerClass: Decimal;
        PerCentagePerClass: Decimal;
        RBARecomended: Decimal;
        BankAcc: Record "Bank Account";
        GAMOUNT: Decimal;
        RES: Decimal;
        ANS: Decimal;
    begin


        if Confirm('Are you sure you would like to POST this transaction?', false) = true then begin


            if Payment.Posted = true then
                Error('Transaction already posted!!');
            Payment.TestField(Date);

            TotalInvestment := 0;
            FundsAvailable := 0;
            InvestmentRec.Get(Payment."Investment No");
            "RBA Class" := InvestmentRec."RBA Class";
            Funds := InvestmentRec."Custodian Code";
            //MESSAGE('%1%2',"RBA Class",Funds);

            /*
            IF Dimensions.GET(Funds) THEN BEGIN
             Dimensions.SETRANGE(Dimensions."Date Filter",0D,Date);*/

            // Dimensions.CALCFIELDS(Dimensions.Inflow1,Dimensions.Outflow1);
            //FundsAvailable:=Dimensions.Inflow1-Dimensions.Outflow1;
            // MESSAGE('Total Funds Available=%1',FundsAvailable);
            //END;


            TotalPerClass := 0;
            InvestRec.Reset;
            InvestRec.SetRange(InvestRec."RBA Class", "RBA Class");
            InvestRec.SetRange(InvestRec."Date Filter", 0D, Payment.Date);

            InvestRec.SetRange(InvestRec."Custodian Code", Funds);
            if InvestRec.Find('-') then
                repeat
                    InvestRec.CalcFields(InvestRec."Acquisition Cost");
                    TotalPerClass := TotalPerClass + InvestRec."Acquisition Cost";
                until InvestRec.Next = 0;
            //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);

            TotalPerClass := TotalPerClass + Payment.Amount;
            //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);
            //IF TotalInvestment<>0 THEN
            //PerCentagePerClass:=(TotalPerClass/TotalInvestment)*100;

            /*
           //kugun
           IF FundsAvailable<>0 THEN
           PerCentagePerClass:=(TotalPerClass/FundsAvailable)*100;
           //MESSAGE(PerCentagePerClass);
           //MESSAGE('Percentage %1 =%2',"RBA Class",PerCentagePerClass);

           IF RBA.GET("RBA Class") THEN BEGIN
           //MESSAGE('Percentage %1 =%2',"RBA Class",RBA."% Recommended");
           RBARecomended:=RBA."% Recommended";
           IF PerCentagePerClass >RBARecomended THEN
            MESSAGE('You will exceed the RBA Limit for this Investment.Please check!!');
           END;
             */




            LineNo := 0;




            if Payment."Pay Mode" = 'CHEQUE' then begin
                Payment.TestField("Paying Bank Account");
            end;
            Payment.TestField("Transaction Name");
            Payment.TestField("Pay Mode");
            //TESTFIELD(Payee);
            Payment.TestField(Amount);
            Payment.TestField("VAT Code");
            Payment.TestField("Withholding Tax Code");
            //TESTFIELD("Global Dimension 1 Code");
            Payment.TestField("Fund Code");


            // DELETE ANY LINE ITEM THAT MAY BE PRESENT

            Temp.Get(UserId);
            JTemplate := Temp."Payment Journal Template";
            JBatch := Temp."Payment Journal Batch";
            if JTemplate = '' then begin
                Error('Ensure the PV Template is set up in Funds User Setup');
            end;
            if JBatch = '' then begin
                Error('Ensure the PV Batch is set up in the Funds User Setup')
            end;

            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;




            //BANK
            if Payment."Pay Mode" = 'CASH' then begin

                //CashierLinks.RESET;
                //CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                //IF CashierLinks.FIND('-') THEN BEGIN

                //CASH
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                GenJnlLine."Account No." := Payment."Paying Bank Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine.Amount := -(Payment.Amount);
                //MESSAGE('CASH =%1',GenJnlLine.Amount);
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name";
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*//GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                //GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");


                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                GenJnlLine."GL Code" := Payment."Control Ac";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                //END
                //ELSE BEGIN
                //ERROR('Please link the user/cashier to a collection account before proceeding.');
                //END;

            end;

            if Payment."Pay Mode" = 'EFT' then begin
                //EFT
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                GenJnlLine."Account No." := Payment."Paying Bank Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Bank Payment Type" := GenJnlLine."bank payment type"::" ";
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                GenJnlLine.Amount := -Payment.Amount;
                //MESSAGE('EFT =%1',GenJnlLine.Amount);
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name";
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");


                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                GenJnlLine."GL Code" := Payment."Control Ac";

                //GenJnlLine."Bank Payment Type"
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;


            if Payment."Pay Mode" = 'CHEQUE' then begin
                //CHEQUE
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                GenJnlLine."Account No." := Payment."Paying Bank Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Bank Payment Type" := GenJnlLine."bank payment type"::"Computer Check";
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                GenJnlLine.Amount := -Payment.Amount;
                //MESSAGE('CHEQUE =%1',GenJnlLine.Amount);
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name";
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                //GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                //GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine."GL Code" := Payment."Control Ac";
                GenJnlLine.Payee := Payment.Payee;
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;

            TarriffCodes.Reset;
            TarriffCodes.SetRange(TarriffCodes.Code, Payment."VAT Code");
            if TarriffCodes.Find('-') then begin
                TarriffCodes.TestField(TarriffCodes."G/L Account");
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Account No." := TarriffCodes."G/L Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                GenJnlLine.Amount := -Payment."VAT Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := 'VAT';
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                //GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                //GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";

                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/


                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                GenJnlLine."GL Code" := Payment."Control Ac";


                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;

            TarriffCodes.Reset;
            TarriffCodes.SetRange(TarriffCodes.Code, Payment."Withholding Tax Code");
            if TarriffCodes.Find('-') then begin
                TarriffCodes.TestField(TarriffCodes."G/L Account");
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Account No." := TarriffCodes."G/L Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                GenJnlLine.Amount := -Payment."Withholding Tax Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := 'Withholding Tax';
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                //GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine."GL Code" := Payment."Control Ac";
                GenJnlLine.Payee := Payment.Payee;
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;

            if Payment.Multiple = false then begin
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := Payment."Account Type";
                GenJnlLine."Account No." := Payment."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                InvestRec.Get(Payment."Investment No");
                if InvestRec."Investment Type" = '05' then begin
                    GenJnlLine.Amount := Payment."Gross Amount";

                end else begin
                    GenJnlLine.Amount := Payment.Amount;
                end;

                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name";
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;

                //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                //END;
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                //Interest Account
                LineNo := LineNo + 1000;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;

                GenJnlLine."Account Type" := Payment."Account Type";

                if InvestmentRec.Get(Payment."Investment No") then
                    if InvestmentPG.Get(InvestmentRec."Investment Posting Group") then
                        GenJnlLine."Account No." := InvestmentPG."Investment Income Account";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Payment.Date;
                GenJnlLine."Document No." := Payment.No;
                GenJnlLine."External Document No." := Payment."Cheque No";
                GenJnlLine."Currency Code" := Payment.Currency;
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                GenJnlLine.Amount := -Payment."Interest Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := Payment."Transaction Name";
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Custodian Code" := Payment."Custodian Code";
                GenJnlLine."Fund Code" := Payment."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Investment Code" := Payment."Investment No";
                GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Payment."No. Of Units";
                GenJnlLine.Payee := Payment.Payee;
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;
            end;


            if Payment.Multiple = true then begin
                //Insert Multiple Lines
                PaymentLines.Reset;
                PaymentLines.SetRange(PaymentLines."PV No", Payment.No);
                if PaymentLines.Find('-') then
                    repeat
                        //MESSAGE('%1',PaymentLines.Description);
                        LineNo := LineNo + 1000;
                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Account Type" := PaymentLines."Account Type";
                        GenJnlLine."Account No." := PaymentLines."Account No.";
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Payment.Date;
                        GenJnlLine."Document No." := Payment.No;
                        GenJnlLine."External Document No." := Payment."Cheque No";
                        GenJnlLine."Currency Code" := Payment.Currency;
                        GenJnlLine.Validate(GenJnlLine."Currency Code");
                        GenJnlLine.Amount := PaymentLines.Amount;
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.Description := PaymentLines.Description;
                        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                        /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                        GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                        GenJnlLine."Custodian Code" := Payment."Custodian Code";
                        GenJnlLine."Fund Code" := Payment."Fund Code";
                        GenJnlLine.Validate(GenJnlLine."Custodian Code");
                        GenJnlLine.Validate(GenJnlLine."Fund Code");

                        GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
                        GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                        GenJnlLine."Investment Code" := Payment."Investment No";
                        GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
                        GenJnlLine."No. Of Units" := Payment."No. Of Units";

                        //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                        GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                        GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
                        GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                        GenJnlLine."Applies-to ID" := Payment."Apply to ID";
                        //END;
                        GenJnlLine.Payee := Payment.Payee;
                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert;

                    until PaymentLines.Next = 0;

            end;




            LineNo := LineNo + 1000;
            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No." := LineNo;
            GenJnlLine."Account Type" := Payment."Account Type";
            GenJnlLine."Account No." := Payment."Account No.";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := Payment.Date;
            GenJnlLine."Document No." := Payment.No;
            GenJnlLine."Currency Code" := Payment.Currency;
            GenJnlLine.Validate(GenJnlLine."Currency Code");
            GenJnlLine.Amount := Payment."VAT Amount";
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
            GenJnlLine."Bal. Account No." := '';
            GenJnlLine.Description := 'VAT';
            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");

            /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
            GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN

            GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            GenJnlLine."Custodian Code" := Payment."Custodian Code";
            GenJnlLine."Fund Code" := Payment."Fund Code";
            GenJnlLine.Validate(GenJnlLine."Custodian Code");
            GenJnlLine.Validate(GenJnlLine."Fund Code");

            GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
            GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID" := Payment."Apply to ID";
            //END;
            GenJnlLine."Investment Code" := Payment."Investment No";
            GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
            GenJnlLine."No. Of Units" := Payment."No. Of Units";
            GenJnlLine.Payee := Payment.Payee;

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;

            LineNo := LineNo + 1000;
            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No." := LineNo;
            GenJnlLine."Account Type" := Payment."Account Type";
            GenJnlLine."Account No." := Payment."Account No.";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := Payment.Date;
            GenJnlLine."Document No." := Payment.No;
            GenJnlLine."Currency Code" := Payment.Currency;
            GenJnlLine.Validate(GenJnlLine."Currency Code");
            GenJnlLine.Amount := Payment."Withholding Tax Amount";
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
            GenJnlLine."Bal. Account No." := '';
            GenJnlLine.Description := 'Withholding Tax';
            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
            /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/

            GenJnlLine."Custodian Code" := Payment."Custodian Code";
            GenJnlLine."Fund Code" := Payment."Fund Code";
            GenJnlLine.Validate(GenJnlLine."Custodian Code");
            GenJnlLine.Validate(GenJnlLine."Fund Code");

            GenJnlLine."Dimension Set ID" := Payment."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
            GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
            GenJnlLine."Applies-to Doc. No." := Payment."Apply to";
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID" := Payment."Apply to ID";
            //END;

            GenJnlLine."Investment Code" := Payment."Investment No";
            GenJnlLine."Investment Transcation Type" := Payment."Investment Transcation Type";
            GenJnlLine."No. Of Units" := Payment."No. Of Units";
            GenJnlLine.Payee := Payment.Payee;
            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;





            /*



            IF Multiple=TRUE THEN
            BEGIN

            RESET;
            SETRANGE(Select,TRUE);
            SETRANGE(Status,Status::"2nd Approval");

            IF FIND('-') THEN BEGIN

              // DELETE ANY LINE ITEM THAT MAY BE PRESENT
              GenJnlLine.RESET;
              GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
              GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
              IF GenJnlLine.FIND('+') THEN BEGIN
              LineNo:=GenJnlLine."Line No."+1000;
              END
              ELSE BEGIN
              LineNo:=1000;
              END;

            REPEAT


            IF "Pay Mode"='CHEQUE' THEN BEGIN
            TESTFIELD("Paying Bank Account");
            END;
            TESTFIELD("Transaction Name");
            TESTFIELD("Pay Mode");
            //TESTFIELD(Payee);
            TESTFIELD(Amount);
            TESTFIELD("VAT Code");
            TESTFIELD("Withholding Tax Code");
            TESTFIELD("Global Dimension 1 Code");

            //BANK
            IF "Pay Mode"='CASH' THEN BEGIN

            CashierLinks.RESET;
            CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
            IF CashierLinks.FIND('-') THEN BEGIN

            //CASH
            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":=GenJnlLine."Account Type"::"Bank Account";
            GenJnlLine."Account No.":=CashierLinks."Bank Account No";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:=-"Net Amount";
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:="Transaction Name";
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 2 Code":="Branch Code";
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
            GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
            GenJnlLine."Applies-to Doc. No.":="Apply to";
            GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID":="Apply to ID";
            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine."No. Of Units":="No. Of Units";
            GenJnlLine.Payee:=Payee;
            GenJnlLine."GL Code":="Control Ac";

            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;

            END
            ELSE BEGIN
            //ERROR('Please link the user/cashier to a collection account before proceeding.');
            END;

            END;

            IF "Pay Mode"='EFT' THEN BEGIN
            //EFT
            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":=GenJnlLine."Account Type"::"Bank Account";
            GenJnlLine."Account No.":="Paying Bank Account";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Manual Check";
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:=-"Net Amount";
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:="Transaction Name";
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine."Shortcut Dimension 2 Code":="branch Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine."No. Of Units":="No. Of Units";
            GenJnlLine.Payee:=Payee;
            GenJnlLine."GL Code":="Control Ac";

            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;
            END;


            IF "Pay Mode"='CHEQUE' THEN BEGIN
            //CHEQUE
            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":=GenJnlLine."Account Type"::"Bank Account";
            GenJnlLine."Account No.":="Paying Bank Account";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Computer Check";
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:=-"Net Amount";
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:="Transaction Name";
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine."Shortcut Dimension 2 Code":="branch Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");

            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            //MESSAGE('%1',"Investment No");
            GenJnlLine."No. Of Units":="No. Of Units";
            GenJnlLine.Payee:=Payee;
            GenJnlLine."GL Code":="Control Ac";

            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;
            END;

            TarriffCodes.RESET;
            TarriffCodes.SETRANGE(TarriffCodes.Code,"VAT Code");
            IF TarriffCodes.FIND('-') THEN BEGIN
            TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
            GenJnlLine."Account No.":=TarriffCodes."G/L Account";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:=-"VAT Amount";
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:='VAT';
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."No. Of Units":="No. Of Units";
            GenJnlLine.Payee:=Payee;
            //MESSAGE('%1',"Investment No");
            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;
            END;

            TarriffCodes.RESET;
            TarriffCodes.SETRANGE(TarriffCodes.Code,"Withholding Tax Code");
            IF TarriffCodes.FIND('-') THEN BEGIN
            TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
            GenJnlLine."Account No.":=TarriffCodes."G/L Account";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:=-"Withholding Tax Amount";
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:='Withholding Tax';
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine."No. Of Units":="No. Of Units";
            GenJnlLine.Payee:=Payee;
            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;
            END;

            //Insert Multiple Lines
            PaymentLines.RESET;
            PaymentLines.SETRANGE(PaymentLines."PV No",No);
            IF PaymentLines.FIND('-') THEN
            REPEAT
            //MESSAGE('%1',PaymentLines.Description);
            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":=PaymentLines."Account Type";
            GenJnlLine."Account No.":=PaymentLines."Account No.";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."External Document No.":="Cheque No";
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:=PaymentLines.Amount;
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:=PaymentLines.Description;
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine."Shortcut Dimension 2 Code":="branch Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");

            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine."No. Of Units":="No. Of Units";

            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
            GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
            GenJnlLine."Applies-to Doc. No.":="Apply to";
            GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID":="Apply to ID";
            GenJnlLine.Payee:=Payee;
            //END;
            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;

            UNTIL PaymentLines.NEXT=0;


            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":="Account Type";
            GenJnlLine."Account No.":="Account No.";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:="VAT Amount";
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:='VAT';
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":="branch Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");

            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
            GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
            GenJnlLine."Applies-to Doc. No.":="Apply to";
            GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID":="Apply to ID";
            //END;
            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine."No. Of Units":="No. Of Units";
            GenJnlLine.Payee:=Payee;

            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;

            LineNo:=LineNo+1000;
            GenJnlLine.INIT;
            GenJnlLine."Journal Template Name":='PAYMENTS';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
            GenJnlLine."Journal Batch Name":='NONPRPAY';
            GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Account Type":="Account Type";
            GenJnlLine."Account No.":="Account No.";
            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
            GenJnlLine."Posting Date":=Date;
            GenJnlLine."Document No.":=No;
            GenJnlLine."Currency Code":=Currency;
            GenJnlLine.Amount:="Withholding Tax Amount";
            GenJnlLine.VALIDATE(GenJnlLine.Amount);
            GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
            GenJnlLine."Bal. Account No.":='';
            GenJnlLine.Description:='Withholding Tax';
            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
            GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code":="branch Code";
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");



            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
            GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
            GenJnlLine."Applies-to Doc. No.":="Apply to";
            GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID":="Apply to ID";
            //END;
            GenJnlLine."Investment Code":="Investment No";
            GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
            GenJnlLine."No. Of Units":="No. Of Units";
            GenJnlLine.Payee:=Payee;
            IF GenJnlLine.Amount<>0 THEN
            GenJnlLine.INSERT;



            "Date Posted":=TODAY;
            "Time Posted":=TIME;
            "Posted By":=USERID;
            MODIFY;




            Status:=Status::"Cheque Printing";
            MODIFY;
            UNTIL NEXT=0;
            END;


            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
            GenJnlLine.SETRANGE(GenJnlLine."Document No.",No);
            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);

            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
            IF GenJnlLine.FIND('-') THEN
            EXIT;


            //MESSAGE('Documents sent to cheque printing successfully.');

            END;


            */


            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.SetRange(GenJnlLine."Document No.", Payment.No);
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

            /*
            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
            GenJnlLine.SETRANGE(GenJnlLine."Document No.",No);
            IF GenJnlLine.FIND('-') THEN
            EXIT;
            */

            Payment.Posted := true;
            Payment."Date Posted" := Today;
            Payment."Time Posted" := Time;
            Payment."Posted By" := UserId;
            Payment.Modify;




            Payment.Status := Payment.Status::"Cheque Printing";
            Payment.Modify;

            //CurrPage.CLOSE;


        end;

        //MESSAGE('Documents sent to cheque printing successfully.');

    end;


    procedure FnPostEquitySale(Receipt: Record Receipts)
    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types";
        ExpectedInterest: Record "Expected Interest1";
        InvestmentRec: Record "Investment Asset";
        InvestmentPostingGroup: Record "Investment Posting Group";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
        "Sale Amount (LCY)": Decimal;
    begin

        if Confirm('Are you sure you would like to POST this transaction?', false) = true then begin





            if Receipt.Posted then
                Error('The transaction has already been posted.');
            Receipt.TestField(Date);
            if Receipt."Transaction Name" = '' then
                Error('Please enter the transaction description under transaction name.');

            if Receipt.Amount = 0 then
                Error('Please enter amount.');

            if Receipt.Amount < 0 then
                Error('Amount cannot be less than zero.');

            Receipt.TestField("Pay Mode");
            if GenSetup.Get then begin
                GenSetup."Posted Receipts No" := IncStr(GenSetup."Posted Receipts No");
                Receipt."Receipt No" := GenSetup."Posted Receipts No";

            end;


            if Receipt."Schedule Mandatory" then begin
                if Receipt."Schedule Date" = 0D then
                    Error('YOU MUST SPECIFY THE SCHEDULE DATE WHEN TRANSACTION TYPE IS %1', Receipt."Receipt Type");


            end;






            /*
            CashierLinks.RESET;
            CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
            IF CashierLinks.FIND('-') THEN BEGIN
            END
            ELSE BEGIN
            ERROR('Please link the user/cashier to a collection account before proceeding.');
            END;

            */

            if Receipt."Fund Code" = '' then
                Error('Please specify the branch code');

            if Receipt."Bank Code" = '' then
                Error('Please specify Receiving bank');


            Temp.Get(UserId);
            JTemplate := Temp."Payment Journal Template";
            JBatch := Temp."Payment Journal Batch";
            if JTemplate = '' then begin
                Error('Ensure the PV Template is set up in Funds User Setup');
            end;
            if JBatch = '' then begin
                Error('Ensure the PV Batch is set up in the Funds User Setup')
            end;

            // DELETE ANY LINE ITEM THAT MAY BE PRESENT
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;

            if DefaultBatch.Get(JTemplate, JBatch) then
                DefaultBatch.Delete;

            DefaultBatch.Reset;
            DefaultBatch."Journal Template Name" := JTemplate;
            DefaultBatch.Name := JBatch;
            DefaultBatch.Insert;

            if ((Receipt."Investment Type" <> Receipt."investment type"::Mortgage) and (Receipt."Investment Transcation Type" <> Receipt."investment transcation type"::Disposal))
             then begin
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 10000;
                GenJnlLine."Account Type" := Receipt."Account Type";
                GenJnlLine."Account No." := Receipt."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipt.Date;
                GenJnlLine."Document No." := Receipt."Receipt No";
                GenJnlLine."External Document No." := Receipt."Cheque No";
                if RecPayTypes.Get(Receipt."Receipt Type", RecPayTypes.Type::Receipt) then
                    if RecPayTypes."Calculate Withholding Tax" then
                        GenJnlLine.Amount := -Receipt."Gross Amount"
                    else
                        GenJnlLine.Amount := -Receipt.Amount;

                GenJnlLine."Currency Code" := Receipt.Currency;
                //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                GenJnlLine.Validate(GenJnlLine.Amount);
                if RecPayTypes.Get(Receipt."Receipt Type", RecPayTypes.Type::Receipt) then
                    if not RecPayTypes."Calculate Withholding Tax" then begin
                        GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"Bank Account";
                        GenJnlLine."Bal. Account No." := Receipt."Bank Code";
                    end;
                //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");

                GenJnlLine.Description := Receipt."Received From";
                if Receipt."Account Type" = Receipt."account type"::"Fixed Asset" then
                    GenJnlLine."FA Posting Type" := Receipt."FA Posting Type";

                GenJnlLine."Investment Code" := Receipt."Investment No";
                GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                GenJnlLine."Fund Code" := Receipt."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;


                if RecPayTypes.Get(Receipt."Receipt Type", RecPayTypes.Type::Receipt) then
                    if RecPayTypes."Calculate Withholding Tax" then begin

                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine."Line No." := 11000;
                        GenJnlLine."Account Type" := Receipt."account type"::"Bank Account";
                        GenJnlLine."Account No." := Receipt."Bank Code";
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Receipt.Date;
                        GenJnlLine."Document No." := Receipt."Receipt No";
                        GenJnlLine."External Document No." := Receipt."Cheque No";
                        GenJnlLine.Amount := Receipt.Amount;
                        GenJnlLine."Currency Code" := Receipt.Currency;
                        //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine.Description := Receipt."Received From";
                        GenJnlLine."Investment Code" := Receipt."Investment No";
                        GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                        GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                        GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                        /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                        GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                        GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                        GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                        GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                        GenJnlLine."Fund Code" := Receipt."Fund Code";
                        GenJnlLine.Validate(GenJnlLine."Custodian Code");
                        GenJnlLine.Validate(GenJnlLine."Fund Code");

                        GenJnlLine.Insert;
                    end;

            end;




            if Receipt."Investment Type" = Receipt."investment type"::Mortgage then begin

                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 10000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                GenJnlLine."Account No." := Receipt."Bank Code";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipt.Date;
                GenJnlLine."Document No." := Receipt."Receipt No";
                GenJnlLine."External Document No." := Receipt."Cheque No";
                GenJnlLine.Amount := Receipt.Amount;
                GenJnlLine."Currency Code" := Receipt.Currency;
                //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Receipt."Received From";
                GenJnlLine."Investment Code" := Receipt."Investment No";
                GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Receipt."No. Of Units";

                GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                GenJnlLine."Fund Code" := Receipt."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                //IF "Schedule Date"=0D THEN
                //ERROR('PLEASE SPECIFY THE SCHEDULE DATE ON THE RECEIPT');
                GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                GenJnlLine."Cheque Type" := Receipt."Cheque Type";
                GenJnlLine."Drawer Bank Name" := Receipt."Bank Codes";
                GenJnlLine."GL Code" := Receipt."Control Ac";


                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Account Type" := Receipt."Account Type";
                GenJnlLine."Account No." := Receipt."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No." := 20000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipt.Date;
                GenJnlLine."Document No." := Receipt."Receipt No";
                GenJnlLine."External Document No." := Receipt."Cheque No";
                GenJnlLine."Currency Code" := Receipt.Currency;
                //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                GenJnlLine.Amount := -Receipt."Capital Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Receipt."Received From";
                GenJnlLine."Investment Code" := Receipt."Investment No";
                GenJnlLine."Investment Transcation Type" := Receipt."investment transcation type"::Principal;
                GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                GenJnlLine."Fund Code" := Receipt."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Account Type" := Receipt."Account Type";

                GenJnlLine."Account No." := '1-950-01-003';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No." := 30000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipt.Date;
                GenJnlLine."Document No." := Receipt."Receipt No";
                GenJnlLine."External Document No." := Receipt."Cheque No";
                GenJnlLine."Currency Code" := Receipt.Currency;
                //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                GenJnlLine.Amount := -Receipt."Interest Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Receipt."Received From";
                GenJnlLine."Investment Code" := Receipt."Investment No";
                GenJnlLine."Investment Transcation Type" := Receipt."investment transcation type"::Interest;
                GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                GenJnlLine."Fund Code" := Receipt."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;


                //post Remainder on arrears

                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Account Type" := Receipt."Account Type";
                GenJnlLine."Account No." := '3-660-01-002';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No." := 120000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipt.Date;
                GenJnlLine."Document No." := Receipt."Receipt No";
                GenJnlLine."External Document No." := Receipt."Cheque No";
                GenJnlLine."Currency Code" := Receipt.Currency;
                //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                GenJnlLine.Amount := -Receipt."Repayment Arrears";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Receipt."Received From";
                GenJnlLine."Investment Code" := Receipt."Investment No";
                GenJnlLine."Investment Transcation Type" := Receipt."investment transcation type"::Principal;
                GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                GenJnlLine."Fund Code" := Receipt."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Account Type" := Receipt."Account Type";
                GenJnlLine."Account No." := '1-950-01-003';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No." := 130000;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipt.Date;
                GenJnlLine."Document No." := Receipt."Receipt No";
                GenJnlLine."External Document No." := Receipt."Cheque No";
                GenJnlLine."Currency Code" := Receipt.Currency;
                //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                GenJnlLine.Amount := -Receipt."Interest On Arrears";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description := Receipt."Received From";
                GenJnlLine."Investment Code" := Receipt."Investment No";
                GenJnlLine."Investment Transcation Type" := Receipt."investment transcation type"::Interest;
                GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                GenJnlLine."Fund Code" := Receipt."Fund Code";
                GenJnlLine.Validate(GenJnlLine."Custodian Code");
                GenJnlLine.Validate(GenJnlLine."Fund Code");

                GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                //


                ExpectedInterest.Init;
                ExpectedInterest."Investment No" := Receipt."Investment No";
                ExpectedInterest."Expected Interest Date" := Receipt.Date;
                ExpectedInterest."Expected Interest Amount" := Receipt."Interest Amount";
                ExpectedInterest."Principal Amount" := Receipt."Capital Amount";
                ExpectedInterest.Posted := true;
                if not ExpectedInterest.Get(ExpectedInterest."Investment No", ExpectedInterest."Expected Interest Date") then
                    ExpectedInterest.Insert;


                if Receipt."Interest Subsidy" <> 0 then begin

                    /*
                    Dr-Inter/departmental with subsidy amount (DA)
                    Cr-Mortgage Interest account (DA)

                    Cr-Interdepartmental (GD)
                    Dr-Mortgage Subsidy (GD)


                    */


                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Account Type" := Receipt."Account Type";
                    GenJnlLine."Account No." := '3-781-01-001';
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No." := 70000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt."Receipt No";
                    GenJnlLine."External Document No." := Receipt."Cheque No";
                    GenJnlLine."Currency Code" := Receipt.Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                    GenJnlLine.Amount := Receipt."Interest Subsidy";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."investment transcation type"::Interest;
                    GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                    GenJnlLine."Fund Code" := Receipt."Fund Code";

                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    GenJnlLine.Validate(GenJnlLine."Fund Code");

                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '1-950-01-003';
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;


                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Account Type" := Receipt."Account Type";
                    GenJnlLine."Account No." := '3-781-01-001';
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No." := 70000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt."Receipt No";
                    GenJnlLine."External Document No." := Receipt."Cheque No";
                    GenJnlLine."Currency Code" := Receipt.Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                    GenJnlLine.Amount := -Receipt."Interest Subsidy";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."investment transcation type"::Interest;
                    GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                    GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                    GenJnlLine."Fund Code" := Receipt."Fund Code";
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    GenJnlLine.Validate(GenJnlLine."Fund Code");

                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '2-600-01-012';
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;









                end;
            end;


            if (Receipt."Investment Transcation Type" = Receipt."investment transcation type"::Disposal) then begin

                if ((Receipt."Investment Type" = Receipt."investment type"::Equity) or (Receipt."Investment Type" = Receipt."investment type"::Property)) then begin
                    //Update bank /dr
                    // MESSAGE('Hello');
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 10000;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                    GenJnlLine."Account No." := Receipt."Bank Code";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt.No;
                    GenJnlLine."External Document No." := Receipt."Cheque No";
                    GenJnlLine."Currency Code" := Receipt.Currency;
                    GenJnlLine.Validate(GenJnlLine."Currency Code");

                    GenJnlLine.Amount := Receipt.Amount;
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    //get amount in LCY
                    "Sale Amount (LCY)" := GenJnlLine."Amount (LCY)";
                    //MESSAGE('%1',"Sale Amount (LCY)");
                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                    GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                    GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                    GenJnlLine."Fund Code" := Receipt."Fund Code";
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    GenJnlLine.Validate(GenJnlLine."Fund Code");

                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    GenJnlLine."Cheque Type" := Receipt."Cheque Type";
                    GenJnlLine."Drawer Bank Name" := Receipt."Bank Codes";
                    GenJnlLine."GL Code" := Receipt."Control Ac";

                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;

                    //Release cost


                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 20000;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                    if InvestmentRec.Get(Receipt."Investment No") then begin
                        if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Investment Cost Account";



                    end;


                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt.No;
                    GenJnlLine."External Document No." := Receipt."Cheque No";

                    GenJnlLine."Currency Code" := Receipt.Currency;
                    if GenJnlLine."Currency Code" = '' then begin

                        GenJnlLine.Validate(GenJnlLine."Currency Code");

                        GenJnlLine.Amount := -Receipt."Cost Reduced";
                        GenJnlLine.Validate(GenJnlLine.Amount);
                    end else begin
                        GenJnlLine.Amount := -Receipt."Cost Reduced";
                        //GenJnlLine.VALIDATE(GenJnlLine.Amount);
                        GenJnlLine."Amount (LCY)" := -Receipt."Cost Reduced LCY";
                        GenJnlLine.Validate(GenJnlLine."Amount (LCY)");
                    end;

                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                    GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                    GenJnlLine."Fund Code" := Receipt."Fund Code";
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    GenJnlLine.Validate(GenJnlLine."Fund Code");

                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;


                    //Gain/Loss

                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 30000;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                    if InvestmentRec.Get(Receipt."Investment No") then begin
                        if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Gain/Loss on Disposal Account";

                        //kugun
                        //GenJnlLine."GL Code":="Investment Transcation Type"::Acquisition;;



                    end;

                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt.No;
                    GenJnlLine."External Document No." := Receipt."Cheque No";
                    GenJnlLine."Currency Code" := Receipt.Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    if GenJnlLine."Currency Code" = '' then begin
                        GenJnlLine.Validate(GenJnlLine."Currency Code");

                        GenJnlLine.Amount := Receipt."Gain/(Loss) on Disposal";
                        GenJnlLine.Validate(GenJnlLine.Amount);

                    end else begin
                        GenJnlLine.Amount := Receipt."Gain/(Loss) on Disposal";
                        //GenJnlLine.VALIDATE(GenJnlLine.Amount);
                        GenJnlLine."Amount (LCY)" := Receipt."Cost Reduced LCY" - "Sale Amount (LCY)";
                        GenJnlLine.Validate(GenJnlLine."Amount (LCY)");

                    end;
                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                    GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                    GenJnlLine."Custodian Code" := Receipt."Custodian Code";
                    GenJnlLine."Fund Code" := Receipt."Fund Code";
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    GenJnlLine.Validate(GenJnlLine."Fund Code");

                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;




















                    //Revaluation Release entries

                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 40000;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                    if InvestmentRec.Get(Receipt."Investment No") then begin
                        if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Investment Revaluation Account";



                    end;

                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt.No;
                    GenJnlLine."External Document No." := Receipt."Cheque No";
                    GenJnlLine."Currency Code" := Receipt.Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    if GenJnlLine."Currency Code" = '' then begin
                        GenJnlLine.Validate(GenJnlLine."Currency Code");

                        GenJnlLine.Amount := Receipt."Revaluation Release Amount";
                        GenJnlLine.Validate(GenJnlLine.Amount);
                    end else begin
                        //MESSAGE('%1',"Revaluation Release Amount");
                        GenJnlLine.Amount := Receipt."Revaluation Release Amount";
                        //GenJnlLine.VALIDATE(GenJnlLine.Amount);
                        GenJnlLine."Amount (LCY)" := Receipt."Revaluation Release Amount LCY";
                        GenJnlLine.Validate(GenJnlLine."Amount (LCY)");
                    end;

                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."investment transcation type"::Revaluation;
                    GenJnlLine."No. Of Units" := 0;
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                    //IF InvestmentPostingGroup."Capital Reserve Account"<>'' THEN
                    //GenJnlLine."Bal. Account No.":=InvestmentPostingGroup."Capital Reserve Account"
                    //ELSE
                    GenJnlLine."Bal. Account No." := InvestmentPostingGroup."Investment Cost Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");

                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;




                end;
            end;// disposals

            //*********Redemption

            if Receipt."Investment Type" = Receipt."investment type"::"Money Market" then begin
                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
                GenJnlLine.DeleteAll;

                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 10000;
                GenJnlLine."Account Type" := Receipt."account type"::"Bank Account";
                GenJnlLine."Account No." := Receipt."Bank Code";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipt.Date;
                GenJnlLine."Document No." := Receipt.No;
                GenJnlLine."External Document No." := Receipt."Cheque No";
                GenJnlLine."Currency Code" := Receipt.Currency;
                //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                GenJnlLine.Amount := Receipt.Amount;
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
                //GenJnlLine."Bal. Account No.":="Bank Code";
                //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine.Description := Receipt."Received From";
                GenJnlLine."Investment Code" := Receipt."Investment No";
                GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                GenJnlLine."Cheque Type" := Receipt."Cheque Type";
                GenJnlLine."Drawer Bank Name" := Receipt."Bank Codes";
                GenJnlLine."GL Code" := Receipt."Control Ac";

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                if Receipt."Calculate Interest" then begin
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 20000;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                    if InvestmentRec.Get(Receipt."Investment No") then begin
                        if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Investment Cost Account";



                    end;


                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt.No;
                    GenJnlLine."External Document No." := Receipt."Cheque No";
                    GenJnlLine."Currency Code" := Receipt.Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                    GenJnlLine.Amount := -(Receipt.Amount - Receipt."Interest Amount");
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                    GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;


                    //Gain/Loss

                    if Receipt."Interest Amount" <> 0 then begin

                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine."Line No." := 30000;
                        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                        if InvestmentRec.Get(Receipt."Investment No") then begin
                            if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then
                                GenJnlLine."Account No." := InvestmentPostingGroup."Investment Income Account";


                        end;

                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Receipt.Date;
                        GenJnlLine."Document No." := Receipt.No;
                        GenJnlLine."External Document No." := Receipt."Cheque No";
                        GenJnlLine."Currency Code" := Receipt.Currency;
                        //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                        GenJnlLine.Amount := -Receipt."Interest Amount";
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine.Description := Receipt."Received From";
                        GenJnlLine."Investment Code" := Receipt."Investment No";
                        GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                        GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                        /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                        GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                        GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                        GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                        GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert;







                    end

                end
                else begin
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine."Line No." := 30000;
                    GenJnlLine."Account Type" := Receipt."Account Type";
                    GenJnlLine."Account No." := Receipt."Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipt.Date;
                    GenJnlLine."Document No." := Receipt.No;
                    GenJnlLine."External Document No." := Receipt."Cheque No";
                    GenJnlLine."Currency Code" := Receipt.Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

                    if RecPayTypes.Get(Receipt."Receipt Type", RecPayTypes.Type::Receipt) then
                        if RecPayTypes."Calculate Withholding Tax" then
                            GenJnlLine.Amount := -Receipt."Gross Amount"
                        else
                            GenJnlLine.Amount := -Receipt.Amount;

                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description := Receipt."Received From";
                    GenJnlLine."Investment Code" := Receipt."Investment No";
                    GenJnlLine."Investment Transcation Type" := Receipt."Investment Transcation Type";
                    GenJnlLine."No. Of Units" := Receipt."No. Of Units";
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID" := Receipt."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Expected Receipt date" := Receipt."Schedule Date";
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;





                end;

            end;
            //*************************




            /*

            //Withholding Tax

           GenJnlLine.INIT;
           GenJnlLine."Journal Template Name":=JTemplate;
           GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
           GenJnlLine."Line No.":=80000;
           GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
           IF InvestmentRec.GET("Investment No") THEN
           IF InvestmentPostingGroup.GET(InvestmentRec."Investment Posting Group") THEN
           GenJnlLine."Account No.":=InvestmentPostingGroup."Withholding Tax Account";
           GenJnlLine.VALIDATE(GenJnlLine."Account No.");
           GenJnlLine."Posting Date":=Date;
           GenJnlLine."Document No.":="Receipt No";
           GenJnlLine."External Document No.":="Cheque No";
           GenJnlLine.Amount:="Whtax Amount";
           GenJnlLine."Currency Code":=Currency;
           //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");

           GenJnlLine.VALIDATE(GenJnlLine.Amount);
           GenJnlLine.Description:="Received From"+ '-'+'Withholding Tax';
           GenJnlLine."Investment Code":="Investment No";
           GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
           GenJnlLine."No. Of Units":="No. Of Units";
           GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
           GenJnlLine."Shortcut Dimension 2 Code":="Branch Code";
           GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
           GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
           //IF "Schedule Date"=0D THEN
           //ERROR('PLEASE SPECIFY THE SCHEDULE DATE ON THE RECEIPT');
           GenJnlLine."Expected Receipt date":="Schedule Date";
           GenJnlLine."Cheque Type":="Cheque Type";
           GenJnlLine."Drawer Bank Name":="Bank Codes";
           GenJnlLine."GL Code":="Control Ac";
           GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
           //IF InvestmentRec.GET("Investment No") THEN
           //IF InvestmentPostingGroup.GET(InvestmentRec."Investment Posting Group") THEN
           //GenJnlLine."Bal. Account No.":="Account No.";

           IF GenJnlLine.Amount<>0 THEN
           GenJnlLine.INSERT;


              */





            /*

            //End

            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",JTemplate);
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",COPYSTR(No,7,10));
            IF GenJnlLine.FIND('-') THEN
            REPEAT
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");

            UNTIL GenJnlLine.NEXT=0;

            */









            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            if GenJnlLine.Find('-') then
                exit;

            Receipt.Posted := true;

            Receipt."Date Posted" := Today;
            Receipt."Time Posted" := Time;

            Receipt."Posted By" := UserId;
            Receipt.Modify;

            GenSetup.Modify;

        end;

    end;


    procedure FnPostDividendIncome(InstitutionalActions: Record "Institutional Actions")
    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        LineNo: Integer;
        DivSchedule: Record "Dividend Payment";
        BankAcc: Record "Bank Account";
        Custodian: Record "Custodian Code";
    begin

        if InstitutionalActions.Posted then
            Error('This transaction has already been posted.Please check!!');

        LineNo := 10000;

        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then begin
            Error('Ensure the PV Template is set up in Funds User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the PV Batch is set up in the Funds User Setup')
        end;

        GenJnline.Reset;
        GenJnline.SetRange(GenJnline."Journal Template Name", JTemplate);
        GenJnline.SetRange(GenJnline."Journal Batch Name", JBatch);
        GenJnline.DeleteAll;


        GenJnline.Init;
        GenJnline."Journal Template Name" := JTemplate;
        //IF Type=Type::Dividend THEN
        GenJnline."Journal Batch Name" := JBatch;


        Equities.Reset;
        Equities.SetRange(Equities.Institution, InstitutionalActions."Institution Code");
        Equities.SetFilter(Equities."Asset Type", '%1', Equities."asset type"::Equity);
        if Equities.Find('-') then begin
            repeat
                Equities.SetRange(Equities."Date Filter", 0D, InstitutionalActions."Books Closure Date");
                Equities.CalcFields(Equities."No.Of Units");
                //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                /*
               GenJnline.RESET;
               GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
               GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
               GenJnline.DELETEALL;


               GenJnline.INIT;
               GenJnline."Journal Template Name":='GENERAL';
               //IF Type=Type::Dividend THEN
               GenJnline."Journal Batch Name":='DIVIDEND';
               */
                //IF Type=Type::"Share Split" THEN
                //GenJnline."Journal Batch Name":='SPLIT';

                GenJnline."Line No." := LineNo;
                GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
                if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                    GenJnline."Account No." := InvestmentPostingGrp."Dividend Receivable AC"
                else
                    Error('You must specify Investment Posting Group for Equity %1', Equities."No.");
                GenJnline.Validate(GenJnline."Account No.");
                GenJnline."Posting Date" := InstitutionalActions."Books Closure Date";
                GenJnline."Document No." := CopyStr('JV-' + Equities."No." + '-' + Format(GenJnline."Posting Date"), 1, 20);
                GenJnline."Currency Code" := Equities."Currency Code";
                GenJnline.Validate(GenJnline."Currency Code");

                if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                    GenJnline.Amount := Equities."No.Of Units" * InstitutionalActions."Amount Per Share";
                if InstitutionalActions.Type = InstitutionalActions.Type::"Share Split" then
                    GenJnline.Amount := Equities."No.Of Units" * (InstitutionalActions."New Ratio" / InstitutionalActions."Old Ratio");
                GenJnline.Validate(GenJnline.Amount);
                GenJnline.Description := Equities.Description + ' ' + 'Dividend Income';
                GenJnline."Investment Code" := Equities."No.";
                GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;
                /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");*/

                GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
                GenJnline.Validate(GenJnline."Dimension Set ID");
                GenJnline."Fund Code" := Equities."Fund Code";
                GenJnline."Custodian Code" := Equities."Custodian Code";
                GenJnline.Validate(GenJnline."Fund Code");
                GenJnline.Validate(GenJnline."Custodian Code");

                GenJnline."Books Closure Date" := InstitutionalActions."Books Closure Date";
                GenJnline."Payment Date" := InstitutionalActions."Payment Date";
                if GenJnline.Amount <> 0 then
                    //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                    GenJnline.Insert(true);


                LineNo := LineNo + 10000;


                GenJnline.Init;
                GenJnline."Journal Template Name" := JTemplate;
                GenJnline."Journal Batch Name" := JBatch;
                GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
                if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                    GenJnline."Account No." := InvestmentPostingGrp."Dividend Income AC"
                else
                    Error('You must specify Investment Posting Group for Equity %1', Equities."No.");

                GenJnline.Validate(GenJnline."Account No.");
                GenJnline."Line No." := LineNo;
                GenJnline.Validate(GenJnline."Account No.");
                GenJnline."Posting Date" := InstitutionalActions."Books Closure Date";
                GenJnline."Document No." := CopyStr('JV-' + Equities."No." + '-' + Format(GenJnline."Posting Date"), 1, 20);
                //GenJnline."External Document No.":="Cheque No";
                GenJnline."Currency Code" := Equities."Currency Code";
                GenJnline.Validate(GenJnline."Currency Code");

                if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                    GenJnline.Amount := -Equities."No.Of Units" * InstitutionalActions."Amount Per Share";
                GenJnline.Validate(GenJnline.Amount);
                GenJnline.Description := Equities.Description + ' ' + 'Dividend Income';
                GenJnline."Investment Code" := Equities."No.";
                GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;
                /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");*/

                GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
                GenJnline.Validate(GenJnline."Dimension Set ID");
                GenJnline."Fund Code" := Equities."Fund Code";
                GenJnline."Custodian Code" := Equities."Custodian Code";
                GenJnline.Validate(GenJnline."Fund Code");
                GenJnline.Validate(GenJnline."Custodian Code");

                if GenJnline.Amount <> 0 then
                    GenJnline.Insert(true);
                LineNo := LineNo + 10000;

                //IF GenJnline.Amount<>0 THEN BEGIN
                //MESSAGE('%1',LineNo);
                DivSchedule.Init;
                DivSchedule."Investment No." := Equities."No.";
                DivSchedule."Books Closure Date" := InstitutionalActions."Books Closure Date";
                DivSchedule."Transaction Type" := 'Dividend';
                DivSchedule."Dividend Rate" := InstitutionalActions."Amount Per Share";
                DivSchedule.Validate("Dividend Rate");

                DivSchedule."Payment Date" := InstitutionalActions."Payment Date";
                if GenJnline.Amount <> 0 then
                    DivSchedule.Insert(true);

            //END;

            until Equities.Next = 0;

        end;




        GenJnline.Reset;
        GenJnline.SetRange(GenJnline."Journal Template Name", JTemplate);
        GenJnline.SetRange(GenJnline."Journal Batch Name", JBatch);
        if GenJnline.Find('-') then
            repeat
            /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
            GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");
            GenJnline.MODIFY;*/

            until GenJnline.Next = 0;

    end;


    procedure FnPostDividendPayment(InstitutionalActions: Record "Institutional Actns Amount")
    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        LineNo: Integer;
        DivSchedule: Record "Dividend Payment";
        BankAcc: Record "Bank Account";
        Custodian: Record "Custodian Code";
    begin

        if InstitutionalActions."Payment posted" then
            Error('This transaction has already been posted.Please check!!');

        LineNo := 10000;

        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then begin
            Error('Ensure the PV Template is set up in Funds User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the PV Batch is set up in the Funds User Setup')
        end;



        GenJnline.Init;
        GenJnline."Journal Template Name" := JTemplate;
        //IF Type=Type::Dividend THEN
        GenJnline."Journal Batch Name" := JBatch;


        Equities.Reset;
        Equities.SetRange(Equities."No.", InstitutionalActions."Investment Code");
        Equities.SetFilter(Equities."Asset Type", '%1', Equities."asset type"::Equity);
        if Equities.Find('-') then begin

            GenJnline."Line No." := FnGetLastLineNo(JTemplate, JBatch) + 1000;
            GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
            if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                GenJnline."Account No." := InvestmentPostingGrp."Dividend Receivable AC"
            else
                Error('You must specify Investment Posting Group for Equity %1', Equities."No.");
            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Posting Date" := InstitutionalActions."Payment Date";
            GenJnline."Document No." := InstitutionalActions."Document No";
            GenJnline."Currency Code" := Equities."Currency Code";
            GenJnline.Validate(GenJnline."Currency Code");

            if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                GenJnline.Amount := -InstitutionalActions.Amount;
            if InstitutionalActions.Type = InstitutionalActions.Type::"Share Split" then
                GenJnline.Amount := Equities."No.Of Units" * (InstitutionalActions."New Ratio" / InstitutionalActions."Old Ratio");
            GenJnline.Validate(GenJnline.Amount);
            GenJnline.Description := Equities.Description + ' ' + 'Dividend Payment';
            GenJnline."Investment Code" := Equities."No.";
            GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;
            /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
            GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");*/

            GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
            GenJnline.Validate(GenJnline."Dimension Set ID");
            GenJnline."Fund Code" := Equities."Fund Code";
            GenJnline."Custodian Code" := Equities."Custodian Code";
            GenJnline.Validate(GenJnline."Fund Code");
            GenJnline.Validate(GenJnline."Custodian Code");

            GenJnline."Books Closure Date" := InstitutionalActions."Books Closure Date";
            GenJnline."Payment Date" := InstitutionalActions."Payment Date";
            if GenJnline.Amount <> 0 then
                //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                GenJnline.Insert(true);


            LineNo := FnGetLastLineNo(JTemplate, JBatch) + 1000;


            GenJnline.Init;
            GenJnline."Journal Template Name" := JTemplate;
            GenJnline."Journal Batch Name" := JBatch;
            GenJnline."Account Type" := GenJnline."account type"::"Bank Account";

            //IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
            //GenJnline."Account No.":=InvestmentPostingGrp."Dividend Income AC"
            //ELSE
            //ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
            Custodian.Get(Equities."Custodian Code");
            BankAcc.Reset;
            BankAcc.SetRange(BankAcc."No.", Custodian."Bank Code");
            if BankAcc.FindFirst then
                GenJnline."Account No." := BankAcc."No."
            else
                Error('You must specify the custodian for Equity %1', Equities."No.");


            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Line No." := LineNo;
            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Posting Date" := InstitutionalActions."Payment Date";
            GenJnline."Document No." := InstitutionalActions."Document No";
            //GenJnline."External Document No.":="Cheque No";
            GenJnline."Currency Code" := Equities."Currency Code";
            GenJnline.Validate(GenJnline."Currency Code");

            if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                GenJnline.Amount := InstitutionalActions.Amount;
            GenJnline.Validate(GenJnline.Amount);
            GenJnline.Description := Equities.Description + ' ' + 'Dividend Payment';
            GenJnline."Investment Code" := Equities."No.";
            GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;
            /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
            GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");*/

            GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
            GenJnline.Validate(GenJnline."Dimension Set ID");
            GenJnline."Fund Code" := Equities."Fund Code";
            GenJnline."Custodian Code" := Equities."Custodian Code";
            GenJnline.Validate(GenJnline."Fund Code");
            GenJnline.Validate(GenJnline."Custodian Code");

            if GenJnline.Amount <> 0 then
                GenJnline.Insert(true);

            /*
           //IF GenJnline.Amount<>0 THEN BEGIN
           //MESSAGE('%1',LineNo);
            DivSchedule.INIT;
            DivSchedule."Investment No.":=Equities."No.";
            DivSchedule."Books Closure Date":="Books Closure Date";
            DivSchedule."Transaction Type":='Dividend';
            DivSchedule."Dividend Rate":="Amount Per Share";
            DivSchedule.VALIDATE("Dividend Rate");

            DivSchedule."Payment Date":="Payment Date";
            IF GenJnline.Amount<>0 THEN
            DivSchedule.INSERT(TRUE);

           //END;
            */

        end;

    end;


    procedure FnPostDividendIncomeAmt(InstitutionalActions: Record "Institutional Actns Amount")
    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        DivSchedule: Record "Dividend Payment";
        BankAcc: Record "Bank Account";
        Custodian: Record "Custodian Code";
        LineNo: Integer;
    begin

        if InstitutionalActions.Posted then
            Error('This transaction has already been posted.Please check!!');


        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then begin
            Error('Ensure the PV Template is set up in Funds User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the PV Batch is set up in the Funds User Setup')
        end;


        GenJnline.Init;
        GenJnline."Journal Template Name" := JTemplate;
        //IF Type=Type::Dividend THEN
        GenJnline."Journal Batch Name" := JBatch;


        Equities.Reset;
        Equities.SetRange(Equities."No.", InstitutionalActions."Investment Code");
        Equities.SetFilter(Equities."Asset Type", '%1', Equities."asset type"::Equity);
        if Equities.Find('-') then begin

            Equities.SetRange(Equities."Date Filter", 0D, InstitutionalActions."Books Closure Date");
            Equities.CalcFields(Equities."No.Of Units");

            LineNo := FnGetLastLineNo(JTemplate, JBatch) + 1000;
            GenJnline."Line No." := LineNo;
            GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
            if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                GenJnline."Account No." := InvestmentPostingGrp."Dividend Receivable AC"
            else
                Error('You must specify Investment Posting Group for Equity %1', Equities."No.");
            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Posting Date" := InstitutionalActions."Books Closure Date";
            GenJnline."Document No." := InstitutionalActions."Document No";
            GenJnline."Currency Code" := Equities."Currency Code";
            GenJnline.Validate(GenJnline."Currency Code");

            if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                GenJnline.Amount := InstitutionalActions.Amount;

            if InstitutionalActions.Type = InstitutionalActions.Type::"Share Split" then
                GenJnline.Amount := InstitutionalActions.Amount;
            GenJnline.Validate(GenJnline.Amount);
            GenJnline.Description := Equities.Description + ' ' + 'Dividend Income';
            GenJnline."Investment Code" := Equities."No.";
            GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;
            /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
            GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");*/

            GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
            GenJnline.Validate(GenJnline."Dimension Set ID");
            GenJnline."Fund Code" := Equities."Fund Code";
            GenJnline."Custodian Code" := Equities."Custodian Code";
            GenJnline.Validate(GenJnline."Fund Code");
            GenJnline.Validate(GenJnline."Custodian Code");

            GenJnline."Books Closure Date" := InstitutionalActions."Books Closure Date";
            GenJnline."Payment Date" := InstitutionalActions."Payment Date";
            if GenJnline.Amount <> 0 then
                //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                GenJnline.Insert(true);


            LineNo := FnGetLastLineNo(JTemplate, JBatch) + 1000;


            GenJnline.Init;
            GenJnline."Journal Template Name" := JTemplate;
            GenJnline."Journal Batch Name" := JBatch;
            GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
            if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                GenJnline."Account No." := InvestmentPostingGrp."Dividend Income AC"
            else
                Error('You must specify Investment Posting Group for Equity %1', Equities."No.");

            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Line No." := LineNo;
            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Posting Date" := InstitutionalActions."Books Closure Date";
            GenJnline."Document No." := InstitutionalActions."Document No";
            //GenJnline."External Document No.":="Cheque No";
            GenJnline."Currency Code" := Equities."Currency Code";
            GenJnline.Validate(GenJnline."Currency Code");

            if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                GenJnline.Amount := -InstitutionalActions.Amount;
            GenJnline.Validate(GenJnline.Amount);
            GenJnline.Description := Equities.Description + ' ' + 'Dividend Income';
            GenJnline."Investment Code" := Equities."No.";
            GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;

            GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
            GenJnline.Validate(GenJnline."Dimension Set ID");
            GenJnline."Fund Code" := Equities."Fund Code";
            GenJnline."Custodian Code" := Equities."Custodian Code";
            GenJnline.Validate(GenJnline."Fund Code");
            GenJnline.Validate(GenJnline."Custodian Code");

            if GenJnline.Amount <> 0 then
                GenJnline.Insert(true);

        end;


    end;


    procedure FnPostDividendPaymentAmt(InstitutionalActions: Record "Institutional Actns Amount"; LineNo: Integer)
    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        DivSchedule: Record "Dividend Payment";
        BankAcc: Record "Bank Account";
        Custodian: Record "Custodian Code";
    begin

        if InstitutionalActions."Payment posted" then
            Error('This transaction has already been posted.Please check!!');

        LineNo := 10000;

        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then begin
            Error('Ensure the PV Template is set up in Funds User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the PV Batch is set up in the Funds User Setup')
        end;


        GenJnline.Init;
        GenJnline."Journal Template Name" := JTemplate;
        //IF Type=Type::Dividend THEN
        GenJnline."Journal Batch Name" := JBatch;


        Equities.Reset;
        Equities.SetRange(Equities."No.", InstitutionalActions."Investment Code");
        Equities.SetFilter(Equities."Asset Type", '%1', Equities."asset type"::Equity);

        if Equities.Find('-') then begin

            Equities.SetRange(Equities."Date Filter", 0D, InstitutionalActions."Books Closure Date");
            Equities.CalcFields(Equities."No.Of Units");


            GenJnline."Line No." := FnGetLastLineNo(JTemplate, JBatch) + 1000;
            GenJnline."Account Type" := GenJnline."account type"::"G/L Account";
            if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                GenJnline."Account No." := InvestmentPostingGrp."Dividend Receivable AC"
            else
                Error('You must specify Investment Posting Group for Equity %1', Equities."No.");
            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Posting Date" := InstitutionalActions."Payment Date";
            GenJnline."Document No." := InstitutionalActions."Document No";
            GenJnline."Currency Code" := Equities."Currency Code";
            GenJnline.Validate(GenJnline."Currency Code");

            if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                GenJnline.Amount := -InstitutionalActions.Amount;
            if InstitutionalActions.Type = InstitutionalActions.Type::"Share Split" then
                GenJnline.Amount := Equities."No.Of Units" * (InstitutionalActions."New Ratio" / InstitutionalActions."Old Ratio");
            GenJnline.Validate(GenJnline.Amount);
            GenJnline.Description := Equities.Description + ' ' + 'Dividend Payment';
            GenJnline."Investment Code" := Equities."No.";
            GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;
            /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
            GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");*/

            GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
            GenJnline.Validate(GenJnline."Dimension Set ID");
            GenJnline."Fund Code" := Equities."Fund Code";
            GenJnline."Custodian Code" := Equities."Custodian Code";
            GenJnline.Validate(GenJnline."Fund Code");
            GenJnline.Validate(GenJnline."Custodian Code");

            GenJnline."Books Closure Date" := InstitutionalActions."Books Closure Date";
            GenJnline."Payment Date" := InstitutionalActions."Payment Date";
            if GenJnline.Amount <> 0 then
                //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                GenJnline.Insert(true);


            LineNo := FnGetLastLineNo(JTemplate, JBatch) + 10000;


            GenJnline.Init;
            GenJnline."Journal Template Name" := JTemplate;
            GenJnline."Journal Batch Name" := JBatch;
            GenJnline."Account Type" := GenJnline."account type"::"Bank Account";

            //IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
            //GenJnline."Account No.":=InvestmentPostingGrp."Dividend Income AC"
            //ELSE
            //ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
            Custodian.Get(Equities."Custodian Code");
            BankAcc.Reset;
            BankAcc.SetRange(BankAcc."No.", Custodian."Bank Code");
            if BankAcc.FindFirst then
                GenJnline."Account No." := BankAcc."No."
            else
                Error('You must specify the custodian for Equity %1', Equities."No.");


            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Line No." := LineNo;
            GenJnline.Validate(GenJnline."Account No.");
            GenJnline."Posting Date" := InstitutionalActions."Payment Date";
            GenJnline."Document No." := InstitutionalActions."Document No";
            //GenJnline."External Document No.":="Cheque No";
            GenJnline."Currency Code" := Equities."Currency Code";
            GenJnline.Validate(GenJnline."Currency Code");

            if InstitutionalActions.Type = InstitutionalActions.Type::Dividend then
                GenJnline.Amount := InstitutionalActions.Amount;
            GenJnline.Validate(GenJnline.Amount);
            GenJnline.Description := Equities.Description + ' ' + 'Dividend Payment';
            GenJnline."Investment Code" := Equities."No.";
            GenJnline."Investment Transcation Type" := GenJnline."investment transcation type"::Dividend;
            /*GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
            GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
            GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");*/

            GenJnline."Dimension Set ID" := Equities."Dimension Set ID";
            GenJnline.Validate(GenJnline."Dimension Set ID");
            GenJnline."Fund Code" := Equities."Fund Code";
            GenJnline."Custodian Code" := Equities."Custodian Code";
            GenJnline.Validate(GenJnline."Fund Code");
            GenJnline.Validate(GenJnline."Custodian Code");

            if GenJnline.Amount <> 0 then
                GenJnline.Insert(true);
            LineNo := LineNo + 10000;
            /*
           //IF GenJnline.Amount<>0 THEN BEGIN
           //MESSAGE('%1',LineNo);
            DivSchedule.INIT;
            DivSchedule."Investment No.":=Equities."No.";
            DivSchedule."Books Closure Date":="Books Closure Date";
            DivSchedule."Transaction Type":='Dividend';
            DivSchedule."Dividend Rate":="Amount Per Share";
            DivSchedule.VALIDATE("Dividend Rate");

            DivSchedule."Payment Date":="Payment Date";
            IF GenJnline.Amount<>0 THEN
            DivSchedule.INSERT(TRUE);

           //END;
            */

        end;

    end;


    procedure FnPostReemGainORLoss(Receipts: Record Receipts)
    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types";
        ExpectedInterest: Record "Expected Interest1";
        InvestmentRec: Record "Investment Asset";
        InvestmentPostingGroup: Record "Investment Posting Group";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
    begin

        if Receipts.Posted then
            Error('The transaction has already been posted.');

        if Receipts."Transaction Name" = '' then
            Error('Please enter the transaction description under transaction name.');

        if Receipts.Amount = 0 then
            Error('Please enter amount.');

        if Receipts.Amount < 0 then
            Error('Amount cannot be less than zero.');

        if GenSetup.Get then begin
            //GenSetup."Posted Receipts No":=INCSTR(GenSetup."Posted Receipts No");
            //"Receipt No":=GenSetup."Posted Receipts No";

        end;


        if Receipts."Schedule Mandatory" then begin
            if Receipts."Schedule Date" = 0D then
                Error('YOU MUST SPECIFY THE SCHEDULE DATE WHEN TRANSACTION TYPE IS %1', Receipts."Receipt Type");


        end;

        if Receipts."Fund Code" = '' then
            Error('Please specify the branch code');

        if Receipts."Bank Code" = '' then
            Error('Please specify Receiving bank');

        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then begin
            Error('Ensure the PV Template is set up in Funds User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the PV Batch is set up in the Funds User Setup')
        end;


        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        GenJnlLine.DeleteAll;

        if DefaultBatch.Get(JTemplate, JBatch) then
            DefaultBatch.Delete;

        DefaultBatch.Reset;
        DefaultBatch."Journal Template Name" := JTemplate;
        DefaultBatch.Name := JBatch;
        DefaultBatch.Insert;

        //*********Redemption

        if Receipts."Investment Type" = Receipts."investment type"::"Money Market" then begin
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Line No." := 10000;
            GenJnlLine."Account Type" := Receipts."account type"::"Bank Account";
            GenJnlLine."Account No." := Receipts."Bank Code";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := Receipts.Date;
            GenJnlLine."Document No." := Receipts.No;
            GenJnlLine."External Document No." := Receipts.No;
            GenJnlLine."Currency Code" := Receipts.Currency;
            GenJnlLine.Amount := Receipts.Amount;
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Receipts."Intitution Name";
            GenJnlLine."Investment Code" := Receipts."Investment No";
            GenJnlLine."Investment Transcation Type" := Receipts."Investment Transcation Type";
            GenJnlLine."No. Of Units" := Receipts."No. Of Units";
            GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";


            GenJnlLine."Fund Code" := Receipts."Fund Code";
            GenJnlLine."Custodian Code" := Receipts."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            GenJnlLine."Cheque Type" := Receipts."Cheque Type";
            GenJnlLine."Drawer Bank Name" := Receipts."Bank Codes";
            GenJnlLine."GL Code" := Receipts."Control Ac";

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;

            //IF "Calculate Interest" THEN
            //BEGIN

            if Receipts.Amount > 0 then begin
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 20000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Investment Transcation Type" := Receipts."Investment Transcation Type";

                if InvestmentRec.Get(Receipts."Investment No") then begin
                    if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then begin
                        if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Interest Receivable Account";
                        if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Investment Cost Account";
                        InvestmentRec.CalcFields("Acquisition Cost");//Added by Morris  ***to be done on a separate function
                    end;


                end;


                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipts.Date;
                GenJnlLine."Document No." := Receipts.No;
                GenJnlLine."External Document No." := Receipts.No;
                GenJnlLine."Currency Code" := Receipts.Currency;

                GenJnlLine.Amount := -1 * InvestmentRec."Acquisition Cost";
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine.Description:="Transaction Name";
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Interest';
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Redemption';

                GenJnlLine."Investment Code" := Receipts."Investment No";
                GenJnlLine."No. Of Units" := Receipts."No. Of Units";


                GenJnlLine."Fund Code" := Receipts."Fund Code";
                GenJnlLine."Custodian Code" := Receipts."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

            end;


            if Receipts."Revaluation Gain/(Loss)" <> 0 then begin
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 30000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;


                if InvestmentRec.Get(Receipts."Investment No") then begin
                    if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then begin
                        GenJnlLine."Account No." := InvestmentPostingGroup."Gain/Loss on Disposal Account";
                    end;
                end;


                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := Receipts.Date;
                GenJnlLine."Document No." := Receipts.No;
                GenJnlLine."External Document No." := Receipts.No;
                GenJnlLine."Currency Code" := Receipts.Currency;
                GenJnlLine.Amount := -1 * (Receipts."Revaluation Gain/(Loss)");
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine.Description:="Transaction Name";
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Interest then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Interest';
                if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                    GenJnlLine.Description := Receipts."Intitution Name" + '-Revaluation Redeption';

                GenJnlLine."Investment Code" := Receipts."Investment No";
                GenJnlLine."No. Of Units" := Receipts."No. Of Units";


                GenJnlLine."Fund Code" := Receipts."Fund Code";
                GenJnlLine."Custodian Code" := Receipts."Custodian Code";
                GenJnlLine.Validate(GenJnlLine."Fund Code");
                GenJnlLine.Validate(GenJnlLine."Custodian Code");

                GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
                GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

            end;


        end;

        //END;

        /*
       GenJnlLine.RESET;
       GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",JTemplate);
       GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",JBatch);
       CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);


       Receipts.Posted:=TRUE;

       Receipts."Date Posted":=TODAY;
       Receipts."Time Posted":=TIME;
       Receipts."Posted By":=USERID;
       Receipts.MODIFY;

       GenSetup.MODIFY;
       */

    end;


    procedure FnPostPartialSale(Receipts: Record Receipts)
    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types";
        ExpectedInterest: Record "Expected Interest1";
        InvestmentRec: Record "Investment Asset";
        InvestmentPostingGroup: Record "Investment Posting Group";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
        PartialRH: Record "Partial Redemption history";
        Interest: Record "Expected Interest1";
        NewFaceValue: Decimal;
        TBond: Record "Investment Asset";
    begin

        if Receipts.Posted then
            Error('The transaction has already been posted.');

        if Receipts."Transaction Name" = '' then
            Error('Please enter the transaction description under transaction name.');

        if Receipts.Amount = 0 then
            Error('Please enter amount.');

        if Receipts.Amount < 0 then
            Error('Amount cannot be less than zero.');

        if GenSetup.Get then begin
            //GenSetup."Posted Receipts No":=INCSTR(GenSetup."Posted Receipts No");
            //"Receipt No":=GenSetup."Posted Receipts No";

        end;


        if Receipts."Schedule Mandatory" then begin
            if Receipts."Schedule Date" = 0D then
                Error('YOU MUST SPECIFY THE SCHEDULE DATE WHEN TRANSACTION TYPE IS %1', Receipts."Receipt Type");


        end;


        if Receipts."Fund Code" = '' then
            Error('Please specify the branch code');

        if Receipts."Bank Code" = '' then
            Error('Please specify Receiving bank');

        Temp.Get(UserId);
        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";
        if JTemplate = '' then begin
            Error('Ensure the PV Template is set up in Funds User Setup');
        end;
        if JBatch = '' then begin
            Error('Ensure the PV Batch is set up in the Funds User Setup')
        end;


        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        GenJnlLine.DeleteAll;

        if DefaultBatch.Get(JTemplate, JBatch) then
            DefaultBatch.Delete;

        DefaultBatch.Reset;
        DefaultBatch."Journal Template Name" := JTemplate;
        DefaultBatch.Name := JBatch;
        DefaultBatch.Insert;

        //*********Redemption

        if Receipts."Investment Type" = Receipts."investment type"::"Money Market" then begin
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;

            GenJnlLine.Init;
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Line No." := 10000;
            GenJnlLine."Account Type" := Receipts."account type"::"Bank Account";
            GenJnlLine."Account No." := Receipts."Bank Code";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Posting Date" := Receipts.Date;
            GenJnlLine."Document No." := Receipts.No;
            GenJnlLine."External Document No." := Receipts.No;
            GenJnlLine."Currency Code" := Receipts.Currency;
            GenJnlLine.Amount := Receipts.Amount;
            GenJnlLine.Validate(GenJnlLine.Amount);
            GenJnlLine.Description := Receipts."Intitution Name";
            GenJnlLine."Investment Code" := Receipts."Investment No";
            GenJnlLine."Investment Transcation Type" := Receipts."Investment Transcation Type";
            GenJnlLine."No. Of Units" := Receipts."No. Of Units";
            GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";

            GenJnlLine."Fund Code" := Receipts."Fund Code";
            GenJnlLine."Custodian Code" := Receipts."Custodian Code";
            GenJnlLine.Validate(GenJnlLine."Fund Code");
            GenJnlLine.Validate(GenJnlLine."Custodian Code");

            GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
            GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

            GenJnlLine."Cheque Type" := Receipts."Cheque Type";
            GenJnlLine."Drawer Bank Name" := Receipts."Bank Codes";
            GenJnlLine."GL Code" := Receipts."Control Ac";

            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert;



            if Receipts.Amount > 0 then begin
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine."Line No." := 20000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                GenJnlLine."Investment Transcation Type" := Receipts."Investment Transcation Type";

                if InvestmentRec.Get(Receipts."Investment No") then begin
                    if InvestmentPostingGroup.Get(InvestmentRec."Investment Posting Group") then begin

                        if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                            GenJnlLine."Account No." := InvestmentPostingGroup."Investment Cost Account";
                        InvestmentRec.CalcFields("Acquisition Cost");//Added by Morris  ***to be done on a separate function
                    end;



                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Receipts.Date;
                    GenJnlLine."Document No." := Receipts.No;
                    GenJnlLine."External Document No." := Receipts.No;
                    GenJnlLine."Currency Code" := Receipts.Currency;

                    GenJnlLine.Amount := -(Receipts.Amount);
                    GenJnlLine.Validate(GenJnlLine.Amount);

                    if GenJnlLine."Investment Transcation Type" = Receipts."investment transcation type"::Disposal then
                        GenJnlLine.Description := Receipts."Intitution Name" + '-Partial Redemption';

                    GenJnlLine."Investment Code" := Receipts."Investment No";
                    GenJnlLine."No. Of Units" := Receipts."No. Of Units";

                    GenJnlLine."Fund Code" := Receipts."Fund Code";
                    GenJnlLine."Custodian Code" := Receipts."Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");

                    GenJnlLine."Dimension Set ID" := Receipts."Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");

                    GenJnlLine."Expected Receipt date" := Receipts."Schedule Date";
                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;

                end;


            end;
            //end Cater for Interest
        end;

        //END;

        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);


        Receipts.Posted := true;

        Receipts."Date Posted" := Today;
        Receipts."Time Posted" := Time;
        Receipts."Posted By" := UserId;
        Receipts.Modify;

        GenSetup.Modify;

        //Create redemption history
        NewFaceValue := 0;
        PartialRH.Init;
        PartialRH."TBond No" := Receipts."TBond No";
        PartialRH."Redemption Date" := Receipts.Date;
        PartialRH."Old Face Value" := Receipts."Face Value";
        PartialRH."Amount Redeemed" := Receipts.Amount;
        NewFaceValue := Receipts."Face Value" - Receipts.Amount;
        PartialRH."New Face Value" := NewFaceValue;
        PartialRH."Document No" := Receipts."Document No";
        PartialRH.Insert(true);
        //End Create redemption history

        //Update Interest
        Interest.Reset;
        Interest.SetRange("Investment No", Receipts."Document No");
        Interest.SetFilter("Expected Interest Date", '>%1', Receipts.Date);
        if Interest.Find('-') then begin
            repeat
                Interest."Expected Interest Amount" := NewFaceValue * (Interest."Rate %" / 100) * 0.5;
                Interest.Modify;
            until Interest.Next = 0;
        end;
        //End Update Interest

        //Lock Previous Interests
        Interest.Reset;
        Interest.SetRange("Investment No", Receipts."Document No");
        Interest.SetFilter("Expected Interest Date", '<=%1', Receipts.Date);
        if Interest.Find('-') then begin
            repeat
                Interest.Locked := true;
                Interest.Modify;
            until Interest.Next = 0;
        end;
        //End Lock Previous Interests

        //Update Face Value
        TBond.Reset;
        TBond.SetRange("No.", Receipts."Document No");
        if TBond.Find('-') then begin
            TBond."Face Value" := NewFaceValue;
            TBond.Modify;
        end;

        //End Update Face Value
        Message('Partial Bond Posted Successfully');
    end;
}

