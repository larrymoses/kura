#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50127 "pageextension50127" extends "Vendor Statistics FactBox" 
{

    //Unsupported feature: Code Modification on "SetFilterLastPaymentDateEntry(PROCEDURE 3)".

    //procedure SetFilterLastPaymentDateEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        VendorLedgerEntry.SETCURRENTKEY("Document Type","Vendor No.","Posting Date","Currency Code");
        VendorLedgerEntry.SETRANGE("Vendor No.","No.");
        VendorLedgerEntry.SETRANGE("Document Type",VendorLedgerEntry."Document Type"::Payment);
        VendorLedgerEntry.SETRANGE(Reversed,FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        VendorLedgerEntry.SETCURRENTKEY("Document Type","Vendor No.","Posting Date","Currency Code");
        VendorLedgerEntry.SETRANGE("Vendor No.","No.");
        VendorLedgerEntry.SETRANGE("Document Type",VendorLedgerEntry."Document Type"::" ");
        VendorLedgerEntry.SETRANGE(Reversed,FALSE);
        */
    //end;
}

