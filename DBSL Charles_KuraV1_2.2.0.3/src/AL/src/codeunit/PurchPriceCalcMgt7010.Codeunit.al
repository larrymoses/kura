#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70010 "Purch. Price Calc. Mgt.7010"
{

    // trigger OnRun()
    // begin

    //      OBJECT Modification "Purch. Price Calc. Mgt."(Codeunit 7010)
    //      {
    //        OBJECT-PROPERTIES
    //        {
    //          Date=06302020D;
    //          Time=115934T;
    //          Modified=Yes;
    //          Version List=NAVW114.00;
    //        }
    //        PROPERTIES
    //        {
    //          Target="Purch. Price Calc. Mgt."(Codeunit 7010);
    //        }
    //        CHANGES
    //        {
    //          { CodeModification  ;OriginalCode=BEGIN
    //      WITH PurchLine DO BEGIN
    //        SetCurrency(
    //          PurchHeader."Currency Code",PurchHeader."Currency Factor",PurchHeaderExchDate(PurchHeader));
    //      #4..11
    //        CASE Type OF
    //          Type::Item:
    //            BEGIN
    //              Item.GET("No.");
    //              Vend.GET("Pay-to Vendor No.");
    //              PriceInSKU := SKU.GET("Location Code","No.","Variant Code");
    //              PurchLinePriceExists(PurchHeader,PurchLine,FALSE);
    //              CalcBestDirectUnitCost(TempPurchPrice);
    //      #20..26
    //        END;
    //        OnAfterFindPurchLinePrice(PurchLine,PurchHeader,TempPurchPrice,CalledByFieldNo);
    //      END;
    //    END;

    //                               ModifiedCode=BEGIN
    //                                              #1..14
    //                                                      IF "No." <> '' THEN BEGIN
    //                                                      Item.GET("No.");
    //                                                      //kugun-Excempt stores &  purchase requistions.
    //                                                      IF ((PurchLine."Document Type"=PurchLine."Document Type"::"Store Requisition") OR (PurchLine."Document Type"=PurchLine."Document Type"::"Purchase Requisition")) THEN
    //                                                      //PurchLine.TESTFIELD(PurchLine."Line No.")
    //                                                        BEGIN
    //                                                          END
    //                                                          END
    //                                                      ELSE IF "Pay-to Vendor No." <> '' THEN
    //                                                      Vend.GET("Pay-to Vendor No.");

    //                                                      //end--kugun-Excempt stores &  purchase requistions.
    //                                              #17..29
    //                                            END;

    //                               Target=FindPurchLinePrice(PROCEDURE 2) }
    //        }
    //        CODE
    //        {

    //          BEGIN
    //          END.
    //        }
    //      }



    // end;
}

