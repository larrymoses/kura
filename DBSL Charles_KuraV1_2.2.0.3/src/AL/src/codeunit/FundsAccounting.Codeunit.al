#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 57006 "Funds  Accounting"
{

    trigger OnRun()
    begin
    end;

    var
        InterfundLines: Record "Inter-Project Transfer Line";
        Temp: Record "Funds User Setup";
        JTemplate: Code[50];
        JBatch: Code[50];
        GenJournalLine: Record "Gen. Journal Line";
        FundMovementEntries: Record "Fund Movement Entry";


    procedure FnPostInterfundCredit(JournalTemplate: Text; JournalBatch: Text; LineNo: Integer; PostingDate: Date; DocumentType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund; DocumentNo: Code[30]; ExtDocumentNo: Code[30]; AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee,Member,Investor; AccountNo: Code[50]; GenPostingType: Option " ",Purchase,Sale,Settlement; VATProdPostingGroup: Code[50]; GenProdPostingGroup: Code[50]; CurrencyCode: Code[50]; JobNo: Code[50]; JobTaskNo: Code[50]; JobLineType: Option " ",Budget,Billable,"Both Budget and Billable"; JobQuantity: Decimal; Description: Text; Amount: Decimal; "Amount (LCY)": Decimal; DimensionSetID: Integer; ShortCutDim1: Code[50]; ShortCutDim2: Code[50])
    begin

        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := JournalTemplate;
        GenJournalLine."Journal Batch Name" := JournalBatch;
        GenJournalLine."Line No." := LineNo;
        GenJournalLine."Posting Date" := PostingDate;
        GenJournalLine."Document Type" := DocumentType;
        GenJournalLine."Document No." := DocumentNo;
        GenJournalLine."External Document No." := ExtDocumentNo;
        GenJournalLine."Account Type" := AccountType;
        GenJournalLine."Account No." := AccountNo;
        GenJournalLine.Validate(GenJournalLine."Account No.");
        GenJournalLine."Gen. Posting Type" := GenPostingType;
        /*GenJournalLine."VAT Prod. Posting Group":=VATProdPostingGroup;
        GenJournalLine.VALIDATE(GenJournalLine."VAT Prod. Posting Group");
        GenJournalLine."Gen. Prod. Posting Group":=GenProdPostingGroup;
        GenJournalLine.VALIDATE("Gen. Prod. Posting Group");*/
        GenJournalLine."Currency Code" := CurrencyCode;
        GenJournalLine.Validate(GenJournalLine."Currency Code");
        GenJournalLine."Job No." := JobNo;
        GenJournalLine."Job Task No." := JobTaskNo;
        GenJournalLine."Job Line Type" := JobLineType;
        GenJournalLine."Job Quantity" := JobQuantity;
        GenJournalLine.Description := Description;
        GenJournalLine.Amount := Amount;
        // GenJournalLine.VALIDATE(GenJournalLine.Amount);
        GenJournalLine."Amount (LCY)" := "Amount (LCY)";
        GenJournalLine."VAT Prod. Posting Group" := VATProdPostingGroup;
        GenJournalLine.Validate(GenJournalLine."VAT Prod. Posting Group");
        GenJournalLine."Gen. Prod. Posting Group" := GenProdPostingGroup;
        GenJournalLine.Validate("Gen. Prod. Posting Group");
        //GenJournalLine."Dimension Set ID":=DimensionSetID;
        GenJournalLine."Shortcut Dimension 1 Code" := ShortCutDim1;
        GenJournalLine."Shortcut Dimension 2 Code" := ShortCutDim2;
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
        GenJournalLine."Job Unit Cost" := 0;
        GenJournalLine."Job Unit Cost (LCY)" := 0;
        GenJournalLine."Job Total Cost" := 0;
        GenJournalLine."Job Total Cost (LCY)" := 0;
        GenJournalLine."Job Unit Price" := Amount;
        GenJournalLine.Validate("Job Unit Price");
        GenJournalLine."Job Unit Price (LCY)" := "Amount (LCY)";
        GenJournalLine."Job Total Price" := Amount;
        GenJournalLine.Validate(GenJournalLine."Job Total Price");
        GenJournalLine."Job Total Price (LCY)" := "Amount (LCY)";

        if GenJournalLine.Amount <> 0 then
            GenJournalLine.Insert(true);

    end;


    procedure FnPostInterfundDebit(JournalTemplate: Text; JournalBatch: Text; LineNo: Integer; PostingDate: Date; DocumentType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund; DocumentNo: Code[30]; ExtDocumentNo: Code[30]; AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee,Member,Investor; AccountNo: Code[50]; GenPostingType: Option " ",Purchase,Sale,Settlement; VATProdPostingGroup: Code[50]; GenProdPostingGroup: Code[50]; CurrencyCode: Code[50]; JobNo: Code[50]; JobTaskNo: Code[50]; JobLineType: Option " ",Budget,Billable,"Both Budget and Billable"; JobQuantity: Decimal; Description: Text; Amount: Decimal; "Amount (LCY)": Decimal; DimensionSetID: Integer; ShortCutDim1: Code[50]; ShortCutDim2: Code[50])
    begin

        GenJournalLine.Init;
        GenJournalLine."Journal Template Name" := JournalTemplate;
        GenJournalLine."Journal Batch Name" := JournalBatch;
        GenJournalLine."Line No." := LineNo;
        GenJournalLine."Posting Date" := PostingDate;
        GenJournalLine."Document Type" := DocumentType;
        GenJournalLine."Document No." := DocumentNo;
        GenJournalLine."External Document No." := ExtDocumentNo;
        GenJournalLine."Account Type" := AccountType;
        GenJournalLine."Account No." := AccountNo;
        GenJournalLine.Validate(GenJournalLine."Account No.");
        GenJournalLine."Gen. Posting Type" := GenPostingType;
        /*GenJournalLine."VAT Prod. Posting Group":=VATProdPostingGroup;
        GenJournalLine.VALIDATE(GenJournalLine."VAT Prod. Posting Group");
        GenJournalLine."Gen. Prod. Posting Group":=GenProdPostingGroup;
        GenJournalLine.VALIDATE("Gen. Prod. Posting Group");*/
        GenJournalLine."Currency Code" := CurrencyCode;
        GenJournalLine.Validate(GenJournalLine."Currency Code");
        GenJournalLine."Job No." := JobNo;
        GenJournalLine."Job Task No." := JobTaskNo;
        GenJournalLine."Job Line Type" := JobLineType;
        GenJournalLine."Job Quantity" := JobQuantity;
        GenJournalLine.Description := Description;
        GenJournalLine.Amount := Amount;
        // GenJournalLine.VALIDATE(GenJournalLine.Amount);
        GenJournalLine."Amount (LCY)" := "Amount (LCY)";
        GenJournalLine."VAT Prod. Posting Group" := VATProdPostingGroup;
        GenJournalLine.Validate(GenJournalLine."VAT Prod. Posting Group");
        GenJournalLine."Gen. Prod. Posting Group" := GenProdPostingGroup;
        GenJournalLine.Validate("Gen. Prod. Posting Group");
        //GenJournalLine."Dimension Set ID":=DimensionSetID;
        GenJournalLine."Shortcut Dimension 1 Code" := ShortCutDim1;
        GenJournalLine."Shortcut Dimension 2 Code" := ShortCutDim2;
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
        if GenJournalLine.Amount <> 0 then
            GenJournalLine.Insert(true);

    end;


    procedure FnPostJournal(JournalTemplate: Code[50]; JournalBatch: Code[50])
    begin
        GenJournalLine.Reset;
        GenJournalLine.SetRange("Journal Template Name", JournalTemplate);
        GenJournalLine.SetRange("Journal Batch Name", JournalBatch);
        if GenJournalLine.Find('-') then begin
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);
        end;
    end;


    procedure FnPostFundMovementEntries(EntryNumber: Integer; DocumentNo: Code[50]; PostingDate: Date; ExtDocumentNo: Code[50]; Description: Code[50]; BankAcct: Code[30]; Currency: Code[30]; ProjectFundID: Code[30]; Amount: Decimal; Amountlcy: Decimal; DimensionSetID: Integer; Reversed: Boolean)
    begin
        FundMovementEntries.Init;
        FundMovementEntries."Entry No" := EntryNumber;
        FundMovementEntries."Document No" := DocumentNo;
        FundMovementEntries."Posting Date" := PostingDate;
        FundMovementEntries."External Document No" := ExtDocumentNo;
        FundMovementEntries.Description := Description;
        FundMovementEntries."Bank A/C" := BankAcct;
        FundMovementEntries."Project Fund ID" := ProjectFundID;
        FundMovementEntries."Currency Code" := Currency;
        FundMovementEntries.Amount := Amount;
        FundMovementEntries."Amount LCY" := Amountlcy;
        FundMovementEntries."Dimension Set ID" := DimensionSetID;
        FundMovementEntries."Reversed?" := Reversed;
        FundMovementEntries.Insert(true);
    end;


    procedure FnGetlastentryNo() EntryNo: Integer
    var
        FundMovementEntries: Record "Fund Movement Entry";
    begin
        FundMovementEntries.Reset;
        FundMovementEntries.FindLast;
        EntryNo := FundMovementEntries."Entry No";
        exit(EntryNo);
    end;


    procedure FnChangeEntryToPositive(DocumentNo: Code[50]; JobNo: Code[50]; JobTaskNo: Code[50]; Amount: Decimal; AmountLCY: Decimal; PostingDate: Date)
    var
        JobLedgerEntry: Record "Job Ledger Entry";
    begin
        JobLedgerEntry.Reset;
        JobLedgerEntry.SetRange("Job No.", JobNo);
        JobLedgerEntry.SetRange("Job Task No.", JobTaskNo);
        JobLedgerEntry.SetRange("Document No.", DocumentNo);
        if JobLedgerEntry.FindSet then begin

            JobLedgerEntry."Entry Type" := JobLedgerEntry."entry type"::Sale;
            JobLedgerEntry.Validate(JobLedgerEntry."Entry Type");
            JobLedgerEntry."Line Amount" := Amount * -1;
            JobLedgerEntry."Line Amount (LCY)" := AmountLCY * -1;
            JobLedgerEntry."Unit Cost" := 0;
            JobLedgerEntry."Unit Cost (LCY)" := 0;
            JobLedgerEntry."Total Cost" := 0;
            JobLedgerEntry."Total Cost (LCY)" := 0;
            JobLedgerEntry.Modify(true);
        end;
    end;
}

