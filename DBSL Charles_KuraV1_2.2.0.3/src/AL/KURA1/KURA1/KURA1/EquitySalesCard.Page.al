#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54005 "Equity Sales Card"
{
    PageType = Card;
    SourceTable = Receipts;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Sales Setup';
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Type"; "Receipt Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Name"; "Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Intitution Name"; "Intitution Name")
                {
                    ApplicationArea = Basic;
                }
                field("Investment No"; "Investment No")
                {
                    ApplicationArea = Basic;
                }
                field(Broker; Broker)
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No"; "Receipt No")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code"; "Custodian Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code"; "Fund Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Posted"; "Date Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Time Posted"; "Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Sales Details")
            {
                Caption = 'Sales Details';
                field("No. Of Units"; "No. Of Units")
                {
                    ApplicationArea = Basic;
                }
                field("Price Per Share"; "Price Per Share")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Amount"; "Gross Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Broker Fees"; "Broker Fees")
                {
                    ApplicationArea = Basic;
                }
                field("Other Charges"; "Other Charges")
                {
                    ApplicationArea = Basic;
                }
                field("Revenue Stamp Fees"; "Revenue Stamp Fees")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; "Pay Mode")
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

                trigger OnAction()
                begin
                    InvestPost.FnPostEquitySale(Rec);
                    /*
                    IF CONFIRM('Are you sure you would like to POST this transaction?',FALSE)= TRUE THEN BEGIN
                    
                    
                    
                    
                    
                    IF Posted THEN
                    ERROR('The transaction has already been posted.');
                    TESTFIELD(Date);
                    IF "Transaction Name"='' THEN
                    ERROR('Please enter the transaction description under transaction name.');
                    
                    IF Amount=0 THEN
                    ERROR('Please enter amount.');
                    
                    IF Amount<0 THEN
                    ERROR('Amount cannot be less than zero.');
                    
                    TESTFIELD("Pay Mode");
                    IF GenSetup.GET THEN
                    BEGIN
                    GenSetup."Posted Receipts No":=INCSTR(GenSetup."Posted Receipts No");
                    "Receipt No":=GenSetup."Posted Receipts No";
                    
                    END;
                    
                    
                    IF "Schedule Mandatory" THEN
                    BEGIN
                    IF "Schedule Date"=0D THEN
                    ERROR('YOU MUST SPECIFY THE SCHEDULE DATE WHEN TRANSACTION TYPE IS %1',"Receipt Type");
                    
                    
                    END;
                    
                    
                    
                    
                    
                    
                    {
                    CashierLinks.RESET;
                    CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                    IF CashierLinks.FIND('-') THEN BEGIN
                    END
                    ELSE BEGIN
                    ERROR('Please link the user/cashier to a collection account before proceeding.');
                    END;
                    
                    }
                    
                     IF "Fund Code"='' THEN
                     ERROR('Please specify the branch code');
                    
                    IF "Bank Code"='' THEN
                    ERROR('Please specify Receiving bank');
                    
                      // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                      GenJnlLine.RESET;
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PURCHASES');
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",COPYSTR(No,7,10));
                      GenJnlLine.DELETEALL;
                    
                      IF DefaultBatch.GET('PURCHASES',COPYSTR(No,7,10)) THEN
                       DefaultBatch.DELETE;
                    
                      DefaultBatch.RESET;
                      DefaultBatch."Journal Template Name":='PURCHASES';
                      DefaultBatch.Name:=COPYSTR(No,7,10);
                      DefaultBatch.INSERT;
                    
                    IF (("Investment Type"<>"Investment Type"::Mortgage) AND ("Investment Transcation Type"<>"Investment Transcation Type"::Disposal))
                     THEN
                    BEGIN
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=10000;
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    IF RecPayTypes.GET("Receipt Type",RecPayTypes.Type::Receipt) THEN
                    IF RecPayTypes."Calculate Withholding Tax" THEN
                    GenJnlLine.Amount:=-"Gross Amount"
                    ELSE
                    GenJnlLine.Amount:=-Amount;
                    
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    IF RecPayTypes.GET("Receipt Type",RecPayTypes.Type::Receipt) THEN
                    IF NOT RecPayTypes."Calculate Withholding Tax" THEN
                    BEGIN
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
                    GenJnlLine."Bal. Account No.":="Bank Code";
                    END;
                    //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    
                    GenJnlLine.Description:="Received From";
                    IF "Account Type"="Account Type"::"Fixed Asset" THEN
                    GenJnlLine."FA Posting Type":="FA Posting Type";
                    
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    IF RecPayTypes.GET("Receipt Type",RecPayTypes.Type::Receipt) THEN
                    IF RecPayTypes."Calculate Withholding Tax" THEN
                    BEGIN
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=11000;
                    GenJnlLine."Account Type":="Account Type"::"Bank Account";
                    GenJnlLine."Account No.":="Bank Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=Amount;
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine.INSERT;
                    END;
                    
                    END;
                    
                    
                    
                    
                    IF "Investment Type"="Investment Type"::Mortgage THEN
                    
                    BEGIN
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=10000;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"Bank Account";
                    GenJnlLine."Account No.":="Bank Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=Amount;
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    //IF "Schedule Date"=0D THEN
                    //ERROR('PLEASE SPECIFY THE SCHEDULE DATE ON THE RECEIPT');
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    GenJnlLine."Cheque Type":="Cheque Type";
                    GenJnlLine."Drawer Bank Name":="Bank Codes";
                    GenJnlLine."GL Code":="Control Ac";
                    
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=20000;
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-"Capital Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type"::Principal;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Account Type":="Account Type";
                    
                    GenJnlLine."Account No.":='1-950-01-003';
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=30000;
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-"Interest Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type"::Interest;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    //post Remainder on arrears
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":='3-660-01-002';
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=120000;
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-"Repayment Arrears";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type"::Principal;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":='1-950-01-003';
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=130000;
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-"Interest On Arrears";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type"::Interest;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //
                    
                    
                    ExpectedInterest.INIT;
                    ExpectedInterest."Investment No":="Investment No";
                    ExpectedInterest."Expected Interest Date":=Date;
                    ExpectedInterest."Expected Interest Amount":="Interest Amount";
                    ExpectedInterest."Principal Amount":="Capital Amount";
                    ExpectedInterest.Posted:=TRUE;
                    IF NOT ExpectedInterest.GET(ExpectedInterest."Investment No",ExpectedInterest."Expected Interest Date") THEN
                    ExpectedInterest.INSERT;
                    
                    
                    IF "Interest Subsidy"<>0 THEN
                    BEGIN
                    
                    {
                    Dr-Inter/departmental with subsidy amount (DA)
                    Cr-Mortgage Interest account (DA)
                    
                    Cr-Interdepartmental (GD)
                    Dr-Mortgage Subsidy (GD)
                    
                    
                    }
                    
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":='3-781-01-001';
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=70000;
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:="Interest Subsidy";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type"::Interest;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='1-950-01-003';
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":='3-781-01-001';
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=70000;
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-"Interest Subsidy";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type"::Interest;
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='2-600-01-012';
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    END;
                    END;
                    
                    
                    IF ("Investment Transcation Type"="Investment Transcation Type"::Disposal) THEN
                    BEGIN
                    
                    IF (("Investment Type"="Investment Type"::Equity) OR ("Investment Type"="Investment Type"::Property)) THEN
                    BEGIN
                    //Update bank /dr
                    // MESSAGE('Hello');
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=10000;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"Bank Account";
                    GenJnlLine."Account No.":="Bank Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":='sale';
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=Amount;
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    //get amount in LCY
                    "Sale Amount (LCY)":=GenJnlLine."Amount (LCY)";
                    //MESSAGE('%1',"Sale Amount (LCY)");
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    GenJnlLine."Cheque Type":="Cheque Type";
                    GenJnlLine."Drawer Bank Name":="Bank Codes";
                    GenJnlLine."GL Code":="Control Ac";
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    //Release cost
                    
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=20000;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                    IF InvestmentRec.GET("Investment No") THEN
                    BEGIN
                    IF InvestmentPostingGroup.GET(InvestmentRec."Investment Posting Group") THEN
                    GenJnlLine."Account No.":=InvestmentPostingGroup."Investment Cost Account";
                    
                    
                    
                    END;
                    
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":='sale';
                    GenJnlLine."External Document No.":="Cheque No";
                    
                    GenJnlLine."Currency Code":=Currency;
                     IF GenJnlLine."Currency Code"='' THEN BEGIN
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-"Cost Reduced";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    END ELSE BEGIN
                    GenJnlLine.Amount:=-"Cost Reduced";
                    //GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Amount (LCY)":=-"Cost Reduced LCY";
                     GenJnlLine.VALIDATE(GenJnlLine."Amount (LCY)");
                    END;
                    
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    //Gain/Loss
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=30000;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                    IF InvestmentRec.GET("Investment No") THEN
                    BEGIN
                    IF InvestmentPostingGroup.GET(InvestmentRec."Investment Posting Group") THEN
                    GenJnlLine."Account No.":=InvestmentPostingGroup."Gain/Loss on Disposal Account";
                    
                     //kugun
                    //GenJnlLine."GL Code":="Investment Transcation Type"::Acquisition;;
                    
                    
                    
                    END;
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":='sale';
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                     IF GenJnlLine."Currency Code"='' THEN BEGIN
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:="Gain/(Loss) on Disposal";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    
                    END ELSE BEGIN
                    GenJnlLine.Amount:="Gain/(Loss) on Disposal";
                    //GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Amount (LCY)":="Cost Reduced LCY"-"Sale Amount (LCY)";
                    GenJnlLine.VALIDATE(GenJnlLine."Amount (LCY)");
                    
                    END;
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    
                    GenJnlLine."Custodian Code":="Custodian Code";
                    GenJnlLine."Fund Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Custodian Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Fund Code");
                    
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //Revaluation Release entries
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=40000;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                    IF InvestmentRec.GET("Investment No") THEN
                    BEGIN
                    IF InvestmentPostingGroup.GET(InvestmentRec."Investment Posting Group") THEN
                    GenJnlLine."Account No.":=InvestmentPostingGroup."Investment Revaluation Account";
                    
                    
                    
                    END;
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":='Sale';
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                     IF GenJnlLine."Currency Code"='' THEN BEGIN
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:="Revaluation Release Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    END ELSE BEGIN
                    //MESSAGE('%1',"Revaluation Release Amount");
                    GenJnlLine.Amount:="Revaluation Release Amount";
                    //GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Amount (LCY)":="Revaluation Release Amount LCY";
                    GenJnlLine.VALIDATE(GenJnlLine."Amount (LCY)");
                    END;
                    
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type"::Revaluation;
                    GenJnlLine."No. Of Units":=0;
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    //IF InvestmentPostingGroup."Capital Reserve Account"<>'' THEN
                    //GenJnlLine."Bal. Account No.":=InvestmentPostingGroup."Capital Reserve Account"
                    //ELSE
                    GenJnlLine."Bal. Account No.":=InvestmentPostingGroup."Investment Cost Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    
                    
                    END;
                    END;// disposals
                    
                    //*********Redemption
                    
                    IF "Investment Type"="Investment Type"::"Money Market" THEN
                    BEGIN
                      GenJnlLine.RESET;
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PURCHASES');
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",COPYSTR(No,7,10));
                      GenJnlLine.DELETEALL;
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=10000;
                    GenJnlLine."Account Type":="Account Type"::"Bank Account";
                    GenJnlLine."Account No.":="Bank Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=Amount;
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
                    //GenJnlLine."Bal. Account No.":="Bank Code";
                    //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Cheque Type":="Cheque Type";
                    GenJnlLine."Drawer Bank Name":="Bank Codes";
                    GenJnlLine."GL Code":="Control Ac";
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    IF "Calculate Interest" THEN
                    BEGIN
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=20000;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                    IF InvestmentRec.GET("Investment No") THEN
                    BEGIN
                    IF InvestmentPostingGroup.GET(InvestmentRec."Investment Posting Group") THEN
                    GenJnlLine."Account No.":=InvestmentPostingGroup."Investment Cost Account";
                    
                    
                    
                    END;
                    
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-(Amount-"Interest Amount");
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    //Gain/Loss
                    
                    IF "Interest Amount"<>0 THEN
                    BEGIN
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=30000;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                    IF InvestmentRec.GET("Investment No") THEN
                    BEGIN
                    IF InvestmentPostingGroup.GET(InvestmentRec."Investment Posting Group") THEN
                    GenJnlLine."Account No.":=InvestmentPostingGroup."Investment Income Account";
                    
                    
                    END;
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    GenJnlLine.Amount:=-"Interest Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    
                    
                    
                    
                    
                    END
                    
                    END
                    ELSE
                    BEGIN
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
                    GenJnlLine."Journal Batch Name":=COPYSTR(No,7,10);
                    GenJnlLine."Line No.":=30000;
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":="Receipt No";
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Currency;
                    //GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    
                    IF RecPayTypes.GET("Receipt Type",RecPayTypes.Type::Receipt) THEN
                    IF RecPayTypes."Calculate Withholding Tax" THEN
                    GenJnlLine.Amount:=-"Gross Amount"
                    ELSE
                    GenJnlLine.Amount:=-Amount;
                    
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description:="Received From";
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":="Investment Transcation Type";
                    GenJnlLine."No. Of Units":="No. Of Units";
                    {GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");}
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.VALIDATE(GenJnlLine."Dimension Set ID");
                    GenJnlLine."Expected Receipt date":="Schedule Date";
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    
                    
                    
                    END;
                    
                    END;
                    //*************************
                    
                    
                    
                    
                     {
                    
                     //Withholding Tax
                    
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PURCHASES';
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
                    
                    
                       }
                    
                    
                    
                    
                    
                    {
                    
                    //End
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PURCHASES');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",COPYSTR(No,7,10));
                    IF GenJnlLine.FIND('-') THEN
                    REPEAT
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    
                    UNTIL GenJnlLine.NEXT=0;
                    
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PURCHASES');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",COPYSTR(No,7,10));
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PURCHASES');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",COPYSTR(No,7,10));
                    IF GenJnlLine.FIND('-') THEN
                    EXIT;
                    
                    Posted:=TRUE;
                    
                    "Date Posted":=TODAY;
                    "Time Posted":=TIME;
                    
                    "Posted By":=USERID;
                    MODIFY;
                    
                    GenSetup.MODIFY;
                    
                    CurrPage.CLOSE;
                    
                    
                    END;
                    */

                end;
            }
        }
    }

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
        InvestPost: Codeunit "Investment Management";
}

