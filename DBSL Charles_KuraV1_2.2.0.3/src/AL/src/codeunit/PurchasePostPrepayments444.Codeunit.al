#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70444 "Purchase-Post Prepayments444"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Purchase-Post Prepayments"(Codeunit 444)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=03242019D;
        //      Time=120000T;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Purchase-Post Prepayments"(Codeunit 444);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CASE DocumentType OF
        //                                            DocumentType::Invoice:
        //                                              BEGIN
        //                                                VendorLedgerEntry.SETRANGE("Document Type",VendorLedgerEntry."Document Type"::Invoice);
        //                                                VendorLedgerEntry.SETRANGE("Document No.",DocumentNo);
        //                                                VendorLedgerEntry.FINDFIRST;
        //                                                PurchInvHeader.GET(DocumentNo);
        //                                                PurchInvHeader."Vendor Ledger Entry No." := VendorLedgerEntry."Entry No.";
        //                                                PurchInvHeader.MODIFY;
        //                                              END;
        //                                            DocumentType::"Credit Memo":
        //                                              BEGIN
        //                                                VendorLedgerEntry.SETRANGE("Document Type",VendorLedgerEntry."Document Type"::"Credit Memo");
        //                                                VendorLedgerEntry.SETRANGE("Document No.",DocumentNo);
        //                                                VendorLedgerEntry.FINDFIRST;
        //                                                PurchCrMemoHdr.GET(DocumentNo);
        //                                                PurchCrMemoHdr."Vendor Ledger Entry No." := VendorLedgerEntry."Entry No.";
        //                                                PurchCrMemoHdr.MODIFY;
        //                                              END;
        //                                          END;
        //  
        //                                          OnAfterUpdatePostedPurchDocument(DocumentType,DocumentNo,SuppressCommit);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..3
        //                                                VendorLedgerEntry.SETRANGE("Document Type",VendorLedgerEntry."Document Type"::Payment);
        //                                          #5..12
        //                                          #4..6
        //                                          #16..22
        //                                        END;
        //  
        //                           Target=UpdatePostedPurchaseDocument(PROCEDURE 102) }
        //    }
        //    CODE
        //    {
        //  
        //      BEGIN
        //      END.
        //    }
        //  }
        //  
        //  

    end;
}

