#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70026 "Payment Tolerance Manag"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Payment Tolerance Management"(Codeunit 426)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=03242019D;
        //      Time=120000T;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Payment Tolerance Management"(Codeunit 426);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          BankAccReconciliationLine.TESTFIELD("Account Type",BankAccReconciliationLine."Account Type"::Vendor);
        //  
        //                                          IF IsVendBlockPmtTolerance(BankAccReconciliationLine."Account No.") THEN
        //                                          #4..8
        //                                          DelVendPmtTolAcc(NewVendLedgEntry,BankAccReconciliationLine.GetAppliesToID);
        //                                          NewVendLedgEntry.Amount := -BankAccReconciliationLine."Statement Amount";
        //                                          NewVendLedgEntry."Remaining Amount" := -BankAccReconciliationLine."Statement Amount";
        //                                          NewVendLedgEntry."Document Type" := NewVendLedgEntry."Document Type"::Payment;
        //  
        //                                          EXIT(
        //                                            PmtTolVendLedgEntry(
        //                                              NewVendLedgEntry,BankAccReconciliationLine."Account No.",BankAccReconciliationLine."Transaction Date",
        //                                              BankAccReconciliationLine."Statement No.",BankAccReconciliationLine.GetAppliesToID,'',
        //                                              ''));
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..11
        //                                          NewVendLedgEntry."Document Type" := NewVendLedgEntry."Document Type"::" ";
        //                                          #13..18
        //                                        END;
        //  
        //                           Target=PurchPmtTolPmtReconJnl(PROCEDURE 60) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF ((NewDocType = NewDocType::Payment) AND
        //                                              ((OldVendLedgEntry."Document Type" IN [OldVendLedgEntry."Document Type"::Invoice,
        //                                                                                     OldVendLedgEntry."Document Type"::"Credit Memo"]) AND
        //                                               (NewPostingdate > OldVendLedgEntry."Pmt. Discount Date") AND
        //                                               (NewPostingdate <= OldVendLedgEntry."Pmt. Disc. Tolerance Date"))) OR
        //                                             ((NewDocType = NewDocType::Refund) AND
        //                                          #7..12
        //                                            EXIT((ToleranceAmount >= 0) OR (ABS(MaxPmtTolAmount) >= ABS(ToleranceAmount)));
        //                                          END;
        //                                          EXIT(FALSE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          IF ((NewDocType = NewDocType::Payment) AND
        //  
        //                                              ((OldVendLedgEntry."Document Type" IN [OldVendLedgEntry."Document Type"::Payment,
        //                                                                                     OldVendLedgEntry."Document Type"::Invoice]) AND
        //  
        //                                          #4..15
        //                                        END;
        //  
        //                           Target=CheckPmtDiscTolVend(PROCEDURE 8) }
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

