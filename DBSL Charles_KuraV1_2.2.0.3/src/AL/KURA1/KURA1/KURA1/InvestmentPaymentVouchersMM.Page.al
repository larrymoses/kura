#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54056 "Investment Payment Vouchers_MM"
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
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Name";"Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
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
                field(Broker;Broker)
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
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
                    Editable = false;
                }
            }
            group("Purchase Details")
            {
                field("No. Of Units";"No. Of Units")
                {
                    ApplicationArea = Basic;
                }
                field("Face Value";"Gross Amount")
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
                field(Commision;"Broker Fees")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Date";Date)
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
                field("VAT Code";"VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Code";"Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount";"VAT Amount")
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
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    
                    InvestmentPost.FnPostBuy(Rec);
                    
                    //****************************************Commented By Morris*****************************//
                    /*
                    IF CONFIRM('Are you sure you would like to POST this transaction?',FALSE)= TRUE THEN BEGIN
                    
                    
                    IF Posted=TRUE THEN
                    ERROR('Transaction already posted!!');
                    
                    
                    TotalInvestment:=0;
                    FundsAvailable:=0;
                    InvestmentRec.GET("Investment No");
                    "RBA Class":=InvestmentRec."RBA Class";
                    Funds:="Fund Code";
                    //MESSAGE('%1%2',"RBA Class",Funds);
                    
                    
                    //IF Dimensions.GET('FUND',Funds) THEN BEGIN
                    // Dimensions.SETRANGE(Dimensions."Date Filter",0D,Date);
                    
                     ////Dimensions.CALCFIELDS(Dimensions.Inflow1,Dimensions.Outflow1);
                    // FundsAvailable:=Dimensions.Inflow1-Dimensions.Outflow1;
                    // MESSAGE('Total Funds Available=%1',FundsAvailable);
                    //END;
                    
                    
                    TotalPerClass:=0;
                    InvestRec.RESET;
                    InvestRec.SETRANGE(InvestRec."RBA Class","RBA Class");
                    InvestRec.SETRANGE(InvestRec."Date Filter",0D,Date);
                    
                    InvestRec.SETRANGE(InvestRec."Fund Code",Funds);
                    IF InvestRec.FIND('-') THEN
                    REPEAT
                    InvestRec.CALCFIELDS(InvestRec."Acquisition Cost");
                    TotalPerClass:=TotalPerClass+InvestRec."Acquisition Cost";
                    UNTIL InvestRec.NEXT=0;
                    //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);
                    
                    TotalPerClass:=TotalPerClass+Amount;
                    //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);
                    //IF TotalInvestment<>0 THEN
                    //PerCentagePerClass:=(TotalPerClass/TotalInvestment)*100;
                    
                    
                    //kugun
                    IF FundsAvailable<>0 THEN
                    PerCentagePerClass:=(TotalPerClass/FundsAvailable)*100;
                    //MESSAGE(PerCentagePerClass);
                    //MESSAGE('Percentage %1 =%2',"RBA Class",PerCentagePerClass);
                    
                    IF RBA.GET("RBA Class") THEN BEGIN
                    //MESSAGE('Percentage %1 =%2',"RBA Class",RBA."% Recommended");
                    RBARecomended:=RBA."% Recommended";
                    IF PerCentagePerClass >RBARecomended THEN
                     ERROR('You will exceed the RBA Limit for this Investment.Please check!!');
                    END;
                    
                    // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                      GenJnlLine.RESET;
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                      GenJnlLine.DELETEALL;
                    
                    
                    
                    
                    LineNo:=0;
                    
                    
                    
                    
                    IF "Pay Mode"='CHEQUE' THEN BEGIN
                    TESTFIELD("Paying Bank Account");
                    END;
                    TESTFIELD("Transaction Name");
                    TESTFIELD("Pay Mode");
                    //TESTFIELD(Payee);
                    TESTFIELD(Amount);
                    TESTFIELD("VAT Code");
                    TESTFIELD("Withholding Tax Code");
                    //TESTFIELD("Global Dimension 1 Code");
                    TESTFIELD("Fund Code");
                    
                    
                    //BANK
                    IF "Pay Mode"='CASH' THEN BEGIN
                    
                    //CashierLinks.RESET;
                    //CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                    //IF CashierLinks.FIND('-') THEN BEGIN
                    
                    //CASH
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
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=-(Amount);
                    //MESSAGE('CASH =%1',GenJnlLine.Amount);
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Transaction Name";
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    {GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    
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
                    
                    //END
                    //ELSE BEGIN
                    //ERROR('Please link the user/cashier to a collection account before proceeding.');
                    //END;
                    
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
                    //GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Manual Check";
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:=-Amount;
                    //MESSAGE('EFT =%1',GenJnlLine.Amount);
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Transaction Name";
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    {GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
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
                    GenJnlLine.Amount:=-Amount;
                    //MESSAGE('CHEQUE =%1',GenJnlLine.Amount);
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Transaction Name";
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    {GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";}
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    {GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine."GL Code":="Control Ac";
                    GenJnlLine.Payee:=Payee;
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
                    {GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";}
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    {GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    GenJnlLine."GL Code":="Control Ac";
                    
                    
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
                    {GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");}
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine."GL Code":="Control Ac";
                    GenJnlLine.Payee:=Payee;
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    END;
                    
                    IF Multiple=FALSE THEN
                    BEGIN
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
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    
                    InvestRec.GET("Investment No");
                    IF InvestRec."Investment Type"='05' THEN
                      GenJnlLine.Amount:=Amount;
                    IF InvestRec."Investment Type"='04' THEN
                      GenJnlLine.Amount:=Amount;
                    IF InvestRec."Investment Type"='07' THEN
                      GenJnlLine.Amount:=Amount;
                    
                    //END ELSE BEGIN
                    // GenJnlLine.Amount:=Amount;
                    //END;
                    IF InvestRec."Investment Type"='06' THEN
                      GenJnlLine.Amount:=Amount-"Cum-Interest Purchase";
                    
                    
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:="Investment No"+' '+"Transaction Name";
                    {GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    //END;
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    //Interest Account
                    LineNo:=LineNo+1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name":='NONPRPAY';
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Line No.":=LineNo;
                    
                    GenJnlLine."Account Type":="Account Type";
                    
                    IF InvestmentRec.GET("Investment No") THEN
                    IF InvestmentPG.GET(InvestmentRec."Investment Posting Group") THEN
                    GenJnlLine."Account No.":=InvestmentPG."Interest Receivable Account";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Amount:="Cum-Interest Purchase";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='Cum-Interest Purchase';
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    {GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Interest;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine.Payee:=Payee;
                    //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    END;
                    
                    
                    IF Multiple=TRUE THEN
                    BEGIN
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
                    {GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    GenJnlLine."Applies-to ID":="Apply to ID";
                    //END;
                    GenJnlLine.Payee:=Payee;
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    UNTIL PaymentLines.NEXT=0;
                    
                    END;
                    
                    
                    
                    
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
                    
                    {GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");}
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
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
                    {GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");}
                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                    
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
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
                    
                    {
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
                    }
                    
                    
                    
                    {
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    IF GenJnlLine.FIND('-') THEN
                    EXIT;
                    }
                    
                    //MESSAGE('Documents sent to cheque printing successfully.');
                    
                    //END;
                    //END;
                    
                    
                    
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                    GenJnlLine.SETRANGE(GenJnlLine."Document No.",No);
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                    
                    
                    IF InvestmentRec.GET("Investment No") THEN BEGIN
                    
                    InvestmentRec."Face Value":="Gross Amount";
                    InvestmentRec.MODIFY;
                    END;
                    
                    Posted:=TRUE;
                    "Date Posted":=TODAY;
                    "Time Posted":=TIME;
                    "Posted By":=USERID;
                    MODIFY;
                    
                    
                    
                    
                    Status:=Status::"Cheque Printing";
                    MODIFY;
                    
                    CurrPage.CLOSE;
                    
                    END;
                    */

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
        GAMOUNT: Decimal;
        RES: Decimal;
        ANS: Decimal;
        InvestmentPost: Codeunit "Investment Management";
}

