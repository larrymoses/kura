
Report 50070 "Bank Account Reconciliation"
{
    DefaultLayout = RDLC;
   // RDLCLayout = './Layouts/Bank Account Reconciliation.rdlc';
    RDLCLayout = './Layouts/Bank Account Reconciliation.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Bank Account Statement"; "Bank Account Statement")
        {
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(ReportForNavId_1; 1)
            {
            }
            column(BankAccountNo_BankAccountStatement; "Bank Account Statement"."Bank Account No.")
            {
            }
            column(StatementNo_BankAccountStatement; "Bank Account Statement"."Statement No.")
            {
            }
            column(StatementEndingBalance_BankAccountStatement; "Bank Account Statement"."Statement Ending Balance")
            {

            }
            column(BalanceStatementStartMonth; BalanceasAtStatementMonthStartDate)
            {

            }
            column(CashbookBalanceAtStatementDate;CashbookBalanceAtStatementDate)
            {

            }
            column(StatementDate_BankAccountStatement; "Bank Account Statement"."Statement Date")
            {
            }
            column(BalanceLastStatement_BankAccountStatement; "Bank Account Statement"."Balance Last Statement")
            {
            }
            column(BankName; BankName)
            {
            }
            column(BankAccNo; BankAccNo)
            {
            }
            column(BalanceBF; BalanceBF)
            {
            }
            column(BalanceCF; BalanceCF)
            {
            }
            column(StartDate2; StartDate2)
            {
            }
            column(Receipts; Receipts)
            {
            }
            column(Payments; Payments)
            {
            }
            column(Unpresented; Unpresented)
            {
            }
            column(Uncredited; Uncredited)
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }
            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(CompanyName; UpperCase(COMPANYNAME))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(UserId; UserId)
            {
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("Bank Account No.");
                DataItemTableView = sorting("Bank Account No.", "Posting Date") order(ascending) where(Amount = filter(< 0), Reversed = filter(false));
                PrintOnlyIfDetail = false;
                column(ReportForNavId_16; 16)
                {
                }
                column(PostingDate_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Posting Date")
                {
                }
                column(DocumentNo_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Document No.")
                {
                }
                column(Description_BankAccountLedgerEntry; "Bank Account Ledger Entry".Description)
                {
                }
                column(Amount_BankAccountLedgerEntry; "Bank Account Ledger Entry".Amount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    // MESSAGE('%1',"Bank Account Ledger Entry"."Entry No.");
                end;

                trigger OnPreDataItem()
                begin
                    //Unpresented
                    //BankAccLedger.RESET;
                    //BankAccLedger.SETRANGE(BankAccLedger."Bank Account No.","Bank Account Statement"."Bank Account No.");
                    "Bank Account Ledger Entry".SetRange("Bank Account Ledger Entry"."Posting Date", 0D, EndDate);
                    //BankAccLedger.SETRANGE(BankAccLedger.Open,TRUE);
                    //"Bank Account Ledger Entry".SETFILTER("Bank Account Ledger Entry"."Statement No.",'>%1|=%2',StatementNo,'');
                    "Bank Account Ledger Entry".SetFilter("Bank Account Ledger Entry"."Statement Date", '>%1|=%2', StatementDate, 0D);

                    "Bank Account Ledger Entry".SetFilter("Bank Account Ledger Entry".Amount, '<%1', 0);

                    /*
                    IF BankAccLedger.FIND('-') THEN BEGIN
                    REPEAT
                    Unpresented:=Unpresented+BankAccLedger.Amount;
                    UNTIL BankAccLedger.NEXT=0;
                    END;
                    Unpresented:=-Unpresented;
                    
                    */

                end;
            }
            dataitem(BankAccountLedgerEntry2; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("Bank Account No.");
                DataItemTableView = sorting("Bank Account No.", "Posting Date") order(ascending) where(Amount = filter(> 0), Reversed = filter(false));
                PrintOnlyIfDetail = false;
                column(ReportForNavId_26; 26)
                {
                }
                column(PostingDate_BankAccountLedgerEntry2; "Bank Account Ledger Entry"."Posting Date")
                {
                }
                column(DocumentNo_BankAccountLedgerEntry2; "Bank Account Ledger Entry"."Document No.")
                {
                }
                column(Description_BankAccountLedgerEntry2; "Bank Account Ledger Entry".Description)
                {
                }
                column(AmountBankAccountLedgerEntry2; "Bank Account Ledger Entry".Amount)
                {
                }
                column(PostingDate; PostingDate)
                {
                }
                column(Description; Description)
                {
                }
                column(DocNo; DocNo)
                {
                }
                column(Reversed_BankAccountLedgerEntry2; BankAccountLedgerEntry2.Reversed)
                {
                }
                column(Amount; Amount)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    // MESSAGE('%1',BankAccountLedgerEntry2."Entry No.");
                    /*
                    PostingDate:=0D;
                    Description:='';
                    DocNo:='';
                    Amount:=0;
                    */
                    PostingDate := BankAccountLedgerEntry2."Posting Date";
                    Description := BankAccountLedgerEntry2.Description;
                    DocNo := BankAccountLedgerEntry2."Document No.";
                    Amount := BankAccountLedgerEntry2.Amount;
                    TotalAmount := TotalAmount + Amount;
                    //MESSAGE('%1',TotalAmount);

                end;

                trigger OnPreDataItem()
                begin
                    //Unpresented
                    //BankAccLedger.RESET;
                    //BankAccLedger.SETRANGE(BankAccLedger."Bank Account No.","Bank Account Statement"."Bank Account No.");
                    BankAccountLedgerEntry2.Reset;
                    BankAccountLedgerEntry2.SetRange(BankAccountLedgerEntry2."Bank Account No.", BankAcc);
                    BankAccountLedgerEntry2.SetRange(BankAccountLedgerEntry2."Posting Date", 0D, EndDate);
                    //BankAccLedger.SETRANGE(BankAccLedger.Open,TRUE);
                    //BankAccountLedgerEntry2.SETFILTER(BankAccountLedgerEntry2."Statement No.",'>%1|=%2',StatementNo,'');
                    BankAccountLedgerEntry2.SetFilter(BankAccountLedgerEntry2."Statement Date", '>%1|=%2', StatementDate, 0D);

                    BankAccountLedgerEntry2.SetFilter(BankAccountLedgerEntry2.Amount, '>%1', 0);
                    /*
                    IF BankAccLedger.FIND('-') THEN BEGIN
                    REPEAT
                    Unpresented:=Unpresented+BankAccLedger.Amount;
                    UNTIL BankAccLedger.NEXT=0;
                    END;
                    Unpresented:=-Unpresented;
                    
                    */

                end;
            }

            trigger OnAfterGetRecord()
            begin
                StartDate1 := CalcDate('CD+1D', "Bank Account Statement"."Statement Date");
                StartDate2 := CalcDate('CD-1M', StartDate1);
                StartDate3 := CalcDate('CD-1D', StartDate2);

                BalanceasAtStatementMonthStartDate := 0;
                CashbookBalanceAtStatementDate:=0;
                BankAccLedger2.Reset();
                BankAccLedger2.SetRange("Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankAccLedger2.SetFilter("Posting Date", '..%1',StartDate2);
                if BankAccLedger2.FindSet() then begin
                    BankAccLedger2.CalcSums(Amount);
                    BalanceasAtStatementMonthStartDate := BankAccLedger2.Amount;
                end;
                BankAccLedger2.Reset();
                BankAccLedger2.SetRange("Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankAccLedger2.SetFilter("Posting Date", '..%1',"Bank Account Statement"."Statement Date");
                if BankAccLedger2.FindSet() then begin
                    BankAccLedger2.CalcSums(Amount);
                    CashbookBalanceAtStatementDate := BankAccLedger2.Amount;
                end;

                EndDate := "Bank Account Statement"."Statement Date";
                StatementNo := "Bank Account Statement"."Statement No.";
                if BankStatement.Get("Bank Account Statement"."Bank Account No.", "Bank Account Statement"."Statement No.") then
                    StatementDate := BankStatement."Statement Date";


                if Banks.Get("Bank Account Statement"."Bank Account No.") then begin
                    BankName := Banks.Name;
                    BankAccNo := Banks."Bank Account No.";
                    BankAcc := Banks."No.";

                    CurrencyCode := Banks."Currency Code";

                    if CurrencyCode = '' then begin
                        GenLedgerSetup.Get;
                        CurrencyCode := GenLedgerSetup."LCY Code";
                    end;
                    if CompanyInfo.get() then begin
                        CompanyInfo.CalcFields(Picture);
                        if RespCenter.Get(Banks."Global Dimension 1 Code") then
                            FormatAddr.GetCompanyAddr(Banks."Global Dimension 1 Code", RespCenter, CompanyInfo, CompanyAddr)
                        else
                            FormatAddr.Company(CompanyAddr, CompanyInfo);
                    end;

                end;
                BankAccs.Reset();
                BankAccs.SetRange("No.", "Bank Account Statement"."Bank Account No.");
                BankAccs.SetRange("Date Filter", 0D, StartDate3);
                BankAccs.CalcFields(BankAccs.Balance);
                BalanceBF := BankAccs.Balance;

                BankAccs.Reset();
                BankAccs.SetRange("No.", "Bank Account Statement"."Bank Account No.");
                BankAccs.SetRange("Date Filter", 0D, "Bank Account Statement"."Statement Date");
                if BankAccs.FindSet() then begin
                    BankAccs.CalcFields(Balance);
                    BalanceCF := BankAccs.Balance;
                end;
               BalanceCF := CashbookBalanceAtStatementDate;


                //MESSAGE('%1',BalanceBF);
                //MESSAGE('%1',BalanceCF);


                //Receipts
                BankAccLedger.Reset;
                BankAccLedger.SetRange(BankAccLedger."Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetRange(BankAccLedger."Posting Date", StartDate2, "Bank Account Statement"."Statement Date");
                BankAccLedger.SetFilter(BankAccLedger.Amount, '>%1', 0);

                if BankAccLedger.Find('-') then begin
                    repeat
                        Receipts := Receipts + BankAccLedger.Amount;
                    until BankAccLedger.Next = 0;
                end;


                //Payments
                BankAccLedger.Reset;
                BankAccLedger.SetRange(BankAccLedger."Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetRange(BankAccLedger."Posting Date", StartDate2, "Bank Account Statement"."Statement Date");
                //BankAccLedger.SETRANGE(BankAccLedger."Posting Date",StartDate2);
                BankAccLedger.SetFilter(BankAccLedger.Amount, '<%1', 0);

                if BankAccLedger.Find('-') then begin
                    repeat
                        Payments := Payments + BankAccLedger.Amount;
                    until BankAccLedger.Next = 0;
                end;


                //Uncredited
                BankAccLedger.Reset;
                BankAccLedger.SetRange("Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetRange("Posting Date", 0D, "Bank Account Statement"."Statement Date");
                BankAccLedger.SetRange(Reversed, false);

                //BankAccLedger.SETRANGE(BankAccLedger.Open,TRUE);
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'>%1',FORMAT("Bank Account Statement"."Statement No."));
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'>%1|=%2',"Bank Account Statement"."Statement No.",'');
                BankAccLedger.SetFilter(BankAccLedger."Statement Date", '>%1|=%2', "Bank Account Statement"."Statement Date", 0D);
                BankAccLedger.SetFilter(BankAccLedger.Amount, '>%1', 0);

                if BankAccLedger.FindSet() then begin
                    repeat
                        Uncredited := Uncredited + BankAccLedger.Amount;
                    until BankAccLedger.Next = 0;
                end;
                Uncredited := -Uncredited;

                //Unpresented
                BankAccLedger.Reset;
                BankAccLedger.SetRange(BankAccLedger."Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetRange(BankAccLedger."Posting Date", 0D, "Bank Account Statement"."Statement Date");
                BankAccLedger.SetRange(BankAccLedger.Reversed, false);
                //BankAccLedger.SETRANGE(BankAccLedger.Open,TRUE);
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'<>%1',FORMAT("Bank Account Statement"."Statement No."));
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'>%1|=%2',"Bank Account Statement"."Statement No.",'');
                BankAccLedger.SetFilter(BankAccLedger."Statement Date", '>%1|=%2', "Bank Account Statement"."Statement Date", 0D);
                BankAccLedger.SetFilter(BankAccLedger.Amount, '<%1', 0);
                if BankAccLedger.FindSet() then begin
                    repeat
                        Unpresented := Unpresented + BankAccLedger.Amount;
                    until BankAccLedger.Next = 0;
                end;
                Unpresented := -Unpresented;

            end;
        }


    }
  


    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
     trigger OnPreReport()
    begin
        if CompanyInfo.get() then
            CompanyInfo.SetAutoCalcFields(Picture);
        if UserSetup.Get(UserId) then
            FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
    end;

    var
        BankName: Code[50];
        BankAccNo: Code[50];
        Banks: Record "Bank Account";
        BankAccs: Record "Bank Account";
        BalanceBF: Decimal;
        BalanceCF: Decimal;
        StartDate1: Date;
        StartDate2: Date;
        StartDate3: Date;
        BankAccLedger: Record "Bank Account Ledger Entry";
        BankAccLedger2: Record "Bank Account Ledger Entry";
        Receipts: Decimal;
        Payments: Decimal;
        Unpresented: Decimal;
        Uncredited: Decimal;
        EndDate: Date;
        StatementNo: Code[10];
        CurrencyCode: Code[10];
        GenLedgerSetup: Record "General Ledger Setup";
        BankAcc: Code[10];
        PostingDate: Date;
        Description: Text[100];
        DocNo: Code[20];
        Amount: Decimal;
        TotalAmount: Decimal;
        BankStatement: Record "Bank Account Statement";
        StatementDate: Date;
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        BankAccountStatement: Record "Bank Account Statement";
        BalanceasAtStatementMonthStartDate: Decimal;
        StartBalanceBankLedgerEntry: Record "Bank Account Ledger Entry";
        CashbookBalanceAtStatementDate: Decimal;
        UserSetup: Record "User Setup";
}

