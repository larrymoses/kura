#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54029 "Money Market Purchase"
{
    PageType = Card;
    SourceTable = Payments1;

    layout
    {
        area(content)
        {
            group("Purchase Setup")
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Payement Type";"Payement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Name";"Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Broker;Broker)
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Intitution Name";"Intitution Name")
                {
                    ApplicationArea = Basic;
                }
                field("Investment No";"Investment No")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code";"Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code";"Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Date Posted";"Date Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Time Posted";"Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field("VAT Code";"VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Amount";"Withholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Net Amount";"Net Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Purchase Details")
            {
                field("No. Of Units";"No. Of Units")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Amount";"Gross Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Dirty Price";"Dirty Price")
                {
                    ApplicationArea = Basic;
                }
                field("Clean Price";"Clean Price")
                {
                    ApplicationArea = Basic;
                }
                field("Cum-Interest Purchase";"Cum-Interest Purchase")
                {
                    ApplicationArea = Basic;
                }
                field("Broker Fees";"Broker Fees")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account";"Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode";"Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount";"VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Code";"Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Currency)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    
                    if Confirm('Are you sure you would like to POST this transaction?',false)= true then begin
                    
                    
                    if Posted=true then
                    Error('Transaction already posted!!');
                    
                    
                    TotalInvestment:=0;
                    FundsAvailable:=0;
                    InvestmentRec.Get("Investment No");
                    "RBA Class":=InvestmentRec."RBA Class";
                    Funds:=InvestmentRec."Custodian Code";
                    //MESSAGE('%1%2',"RBA Class",Funds);
                    
                    
                    /*IF Dimensions.GET('FUND',Funds) THEN BEGIN
                     Dimensions.SETRANGE(Dimensions."Date Filter",0D,Date);
                    
                     ////Dimensions.CALCFIELDS(Dimensions.Inflow1,Dimensions.Outflow1);
                    // FundsAvailable:=Dimensions.Inflow1-Dimensions.Outflow1;
                    // MESSAGE('Total Funds Available=%1',FundsAvailable);
                    END;*/
                    
                    
                    TotalPerClass:=0;
                    InvestRec.Reset;
                    InvestRec.SetRange(InvestRec."RBA Class","RBA Class");
                    InvestRec.SetRange(InvestRec."Date Filter",0D,Date);
                    
                    InvestRec.SetRange(InvestRec."Custodian Code",Funds);
                    if InvestRec.Find('-') then
                    repeat
                    InvestRec.CalcFields(InvestRec."Acquisition Cost");
                    TotalPerClass:=TotalPerClass+InvestRec."Acquisition Cost";
                    until InvestRec.Next=0;
                    //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);
                    
                    TotalPerClass:=TotalPerClass+Amount;
                    //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);
                    //IF TotalInvestment<>0 THEN
                    //PerCentagePerClass:=(TotalPerClass/TotalInvestment)*100;
                    
                    
                    //kugun
                    if FundsAvailable<>0 then
                    PerCentagePerClass:=(TotalPerClass/FundsAvailable)*100;
                    //MESSAGE(PerCentagePerClass);
                    //MESSAGE('Percentage %1 =%2',"RBA Class",PerCentagePerClass);
                    
                    if RBA.Get("RBA Class") then begin
                    //MESSAGE('Percentage %1 =%2',"RBA Class",RBA."% Recommended");
                    RBARecomended:=RBA."% Recommended";
                    if PerCentagePerClass >RBARecomended then
                     Error('You will exceed the RBA Limit for this Investment.Please check!!');
                    end;
                    
                    // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                      GenJnlLine.Reset;
                      GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'PAYMENTS');
                      GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'NONPRPAY');
                      GenJnlLine.DeleteAll;
                    
                    
                    
                    
                    LineNo:=0;
                    
                    
                    
                    
                    if "Pay Mode"='CHEQUE' then begin
                    TestField("Paying Bank Account");
                    end;
                    TestField("Transaction Name");
                    TestField("Pay Mode");
                    //TESTFIELD(Payee);
                    TestField(Amount);
                    TestField("VAT Code");
                    TestField("Withholding Tax Code");
                    //TESTFIELD("Global Dimension 1 Code");
                    TestField("Fund Code");
                    
                    
                    //BANK
                    if "Pay Mode"='CASH' then begin
                    
                    //CashierLinks.RESET;
                    //CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                    //IF CashierLinks.FIND('-') THEN BEGIN
                    
                    //CASH
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"Bank Account";
                    GenJnlLine."Account No.":="Paying Bank Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=-(Amount);
                    //MESSAGE('CASH =%1',GenJnlLine.Amount);
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Transaction Name";
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID":=0;
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Applies-to Doc. Type":=GenJnlLine."applies-to doc. type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    GenJnlLine."GL Code":="Control Ac";
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    //END
                    //ELSE BEGIN
                    //ERROR('Please link the user/cashier to a collection account before proceeding.');
                    //END;
                    
                    end;
                    
                    if "Pay Mode"='EFT' then begin
                    //EFT
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"Bank Account";
                    GenJnlLine."Account No.":="Paying Bank Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    //GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Manual Check";
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:=-Amount;
                    //MESSAGE('EFT =%1',GenJnlLine.Amount);
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Transaction Name";
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    GenJnlLine."GL Code":="Control Ac";
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    end;
                    
                    
                    if "Pay Mode"='CHEQUE' then begin
                    //CHEQUE
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"Bank Account";
                    GenJnlLine."Account No.":="Paying Bank Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Bank Payment Type":=GenJnlLine."bank payment type"::"Computer Check";
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:=-Amount;
                    //MESSAGE('CHEQUE =%1',GenJnlLine.Amount);
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Transaction Name";
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";*/
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine."GL Code":="Control Ac";
                    GenJnlLine.Payee:=Payee;
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    end;
                    
                    TarriffCodes.Reset;
                    TarriffCodes.SetRange(TarriffCodes.Code,"VAT Code");
                    if TarriffCodes.Find('-') then begin
                    TarriffCodes.TestField(TarriffCodes."G/L Account");
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    GenJnlLine."Account No.":=TarriffCodes."G/L Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:=-"VAT Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='VAT';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";*/
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    GenJnlLine."GL Code":="Control Ac";
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    end;
                    
                    TarriffCodes.Reset;
                    TarriffCodes.SetRange(TarriffCodes.Code,"Withholding Tax Code");
                    if TarriffCodes.Find('-') then begin
                    TarriffCodes.TestField(TarriffCodes."G/L Account");
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    GenJnlLine."Account No.":=TarriffCodes."G/L Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:=-"Withholding Tax Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='Withholding Tax';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine."GL Code":="Control Ac";
                    GenJnlLine.Payee:=Payee;
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    end;
                    
                    if Multiple=false then
                    begin
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    
                    InvestRec.Get("Investment No");
                    if InvestRec."Investment Type"='05' then
                      GenJnlLine.Amount:=Amount;
                    if InvestRec."Investment Type"='04' then
                      GenJnlLine.Amount:=Amount;
                    if InvestRec."Investment Type"='07' then
                      GenJnlLine.Amount:=Amount;
                    
                    //END ELSE BEGIN
                    // GenJnlLine.Amount:=Amount;
                    //END;
                    if InvestRec."Investment Type"='06' then
                      GenJnlLine.Amount:=Amount-"Cum-Interest Purchase";
                    
                    
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Investment No"+' '+"Transaction Name";
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    //END;
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    
                    //Interest Account
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    
                    GenJnlLine."Account Type":="Account Type";
                    
                    if InvestmentRec.Get("Investment No") then
                    if InvestmentPG.Get(InvestmentRec."Investment Posting Group") then
                    GenJnlLine."Account No.":=InvestmentPG."Interest Receivable Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:="Cum-Interest Purchase";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='Cum-Interest Purchase';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Interest;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    
                    end;
                    
                    
                    if Multiple=true then
                    begin
                    //Insert Multiple Lines
                    PaymentLines.Reset;
                    PaymentLines.SetRange(PaymentLines."PV No",No);
                    if PaymentLines.Find('-') then
                    repeat
                    //MESSAGE('%1',PaymentLines.Description);
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=PaymentLines."Account Type";
                    GenJnlLine."Account No.":=PaymentLines."Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:=PaymentLines.Amount;
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=PaymentLines.Description;
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    GenJnlLine."Applies-to Doc. Type":=GenJnlLine."applies-to doc. type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    //END;
                    GenJnlLine.Payee:=Payee;
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    until PaymentLines.Next=0;
                    
                    end;
                    
                    
                    
                    
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:="VAT Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='VAT';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    GenJnlLine."Applies-to Doc. Type":=GenJnlLine."applies-to doc. type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    //END;
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:="Withholding Tax Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='Withholding Tax';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                    GenJnlLine.Validate(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Applies-to Doc. Type":=GenJnlLine."applies-to doc. type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    //END;
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    /*
                    IF "Payment Type"="Payment Type"::"Petty Cash" THEN BEGIN
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    IF GenJnlLine.FIND('-') THEN
                    EXIT;
                    
                    END;
                    */
                    
                    
                    
                    /*
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    IF GenJnlLine.FIND('-') THEN
                    EXIT;
                    */
                    
                    //MESSAGE('Documents sent to cheque printing successfully.');
                    
                    //END;
                    //END;
                    
                    
                    
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    GenJnlLine.SetRange(GenJnlLine."Document No.",No);
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnlLine);
                    
                    
                    if InvestmentRec.Get("Investment No") then begin
                    
                    InvestmentRec."Face Value":="Gross Amount";
                    InvestmentRec.Modify;
                    end;
                    
                    Posted:=true;
                    "Date Posted":=Today;
                    "Time Posted":=Time;
                    "Posted By":=UserId;
                    Modify;
                    
                    
                    
                    
                    Status:=Status::"Cheque Printing";
                    Modify;
                    
                    CurrPage.Close;
                    
                    end;

                end;
            }
        }
    }

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
}

