#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50035 "tableextension50035" extends "Reversal Entry" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 11)".


        //Unsupported feature: Property Modification (Data type) on ""Account Name"(Field 23)".

    }

    //Unsupported feature: Code Modification on "CheckGLAcc(PROCEDURE 13)".

    //procedure CheckGLAcc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GLAcc.GET(GLEntry."G/L Account No.");
        CheckPostingDate(GLEntry."Posting Date",GLEntry.TABLECAPTION,GLEntry."Entry No.");
        GLAcc.TESTFIELD(Blocked,FALSE);
        GLEntry.TESTFIELD("Job No.",'');
        IF GLEntry.Reversed THEN
          AlreadyReversedEntry(GLEntry.TABLECAPTION,GLEntry."Entry No.");
        BalanceCheckAmount := BalanceCheckAmount + GLEntry.Amount;
        IF GLSetup."Additional Reporting Currency" <> '' THEN
          BalanceCheckAddCurrAmount := BalanceCheckAddCurrAmount + GLEntry."Additional-Currency Amount";

        OnAfterCheckGLAcc(GLAcc,GLEntry);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        //GLEntry.TESTFIELD("Job No.",'');
        #5..11
        */
    //end;


    //Unsupported feature: Code Modification on "InsertFromVendLedgEntry(PROCEDURE 35)".

    //procedure InsertFromVendLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DtldVendLedgEntry.SETCURRENTKEY("Transaction No.","Vendor No.","Entry Type");
        DtldVendLedgEntry.SETFILTER(
          "Entry Type",'<>%1',DtldVendLedgEntry."Entry Type"::"Initial Entry");
        IF VendLedgEntry.FINDSET THEN
          REPEAT
            DtldVendLedgEntry.SETRANGE("Transaction No.",VendLedgEntry."Transaction No.");
            DtldVendLedgEntry.SETRANGE("Vendor No.",VendLedgEntry."Vendor No.");
            IF (NOT DtldVendLedgEntry.ISEMPTY) AND (RevType = RevType::Register) THEN
              ERROR(PostedAndAppliedSameTransactionErr,Number);

        #11..14
            TempReversalEntry."Entry Type" := TempReversalEntry."Entry Type"::Vendor;
            Vend.GET(VendLedgEntry."Vendor No.");
            TempReversalEntry."Account No." := Vend."No.";
            TempReversalEntry."Account Name" := Vend.Name;
            TempReversalEntry.CopyFromVendLedgEntry(VendLedgEntry);
            TempReversalEntry."Line No." := NextLineNo;
        #21..27
              UNTIL DtldVendLedgEntry.NEXT = 0;
            DtldVendLedgEntry.SETRANGE(Unapplied);
          UNTIL VendLedgEntry.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DtldVendLedgEntry.SETCURRENTKEY("Transaction No.","Vendor No.","Entry Type","Document No.");//FRED
        #2..7
            DtldVendLedgEntry.SETRANGE("Document No.",VendLedgEntry."Document No.");//FRED
        #8..17
            TempReversalEntry."Document No.":=VendLedgEntry."Document No.";//Fred
        #18..30
        */
    //end;


    //Unsupported feature: Code Modification on "InsertFromBankAccLedgEntry(PROCEDURE 36)".

    //procedure InsertFromBankAccLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF BankAccLedgEntry.FINDSET THEN
          REPEAT
            CLEAR(TempReversalEntry);
            IF RevType = RevType::Register THEN
              TempReversalEntry."G/L Register No." := Number;
            TempReversalEntry."Reversal Type" := RevType;
            TempReversalEntry."Entry Type" := TempReversalEntry."Entry Type"::"Bank Account";
        #8..12
            NextLineNo := NextLineNo + 1;
            TempReversalEntry.INSERT;
          UNTIL BankAccLedgEntry.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4

        #5..15
        */
    //end;
}

