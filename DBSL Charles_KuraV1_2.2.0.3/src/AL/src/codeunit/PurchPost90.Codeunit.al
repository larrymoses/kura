#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70090 "Purch.-Post90"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Purch.-Post"(Codeunit 90)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=08252021D;
        //      Time=111919T;
        //      Modified=Yes;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Purch.-Post"(Codeunit 90);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH GenJnlLine DO BEGIN
        //                                            InitNewLine(
        //                                              PurchHeader."Posting Date",PurchHeader."Document Date",PurchHeader."Posting Description",
        //                                              PurchHeader."Shortcut Dimension 1 Code",PurchHeader."Shortcut Dimension 2 Code",
        //                                              PurchHeader."Dimension Set ID",PurchHeader."Reason Code");
        //  
        //                                            CopyDocumentFields(DocType,DocNo,ExtDocNo,SourceCode,'');
        //                                            "Account Type" := "Account Type"::Vendor;
        //                                            "Account No." := PurchHeader."Pay-to Vendor No.";
        //                                            CopyFromPurchHeader(PurchHeader);
        //                                            SetCurrencyFactor(PurchHeader."Currency Code",PurchHeader."Currency Factor");
        //                                            "System-Created Entry" := TRUE;
        //  
        //                                            CopyFromPurchHeaderApplyTo(PurchHeader);
        //                                            CopyFromPurchHeaderPayment(PurchHeader);
        //                                          #16..19
        //                                            "Sales/Purch. (LCY)" := -TotalPurchLineLCY2.Amount;
        //                                            "Inv. Discount (LCY)" := -TotalPurchLineLCY2."Inv. Discount Amount";
        //  
        //                                            OnBeforePostVendorEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,PreviewMode,SuppressCommit);
        //                                            GenJnlPostLine.RunWithCheck(GenJnlLine);
        //                                            OnAfterPostVendorEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,SuppressCommit,GenJnlPostLine);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..4
        //                                              PurchHeader."Dimension Set ID",PurchHeader."Reason Code",PurchHeader."Project No",PurchHeader."Buy-from Vendor No.");
        //                                          #6..12
        //                                            //added by daudi for procurement
        //  
        //                                          #13..22
        //                                            //added by daudi for procurement
        //                                            "Procurement Plan":=TotalPurchLine2."Procurement Plan";
        //                                            "Procurement Plan Item":=TotalPurchLine2."Procurement Plan Item";
        //                                            "Responsibility Center":=TotalPurchLine2."Responsibility Center";
        //  
        //                                            //Added By Fred For KERRA  Payment Certificates
        //                                            "Project No":="Project No";
        //                                            //MESSAGE('Project No %1',"Project No");
        //                                            "Contractor No":=PurchHeader."Buy-from Vendor No.";
        //                                            //MESSAGE('Contractor No %1',"Contractor No");
        //  
        //                                          #23..26
        //                                        END;
        //  
        //                           Target=PostVendorEntry(PROCEDURE 68) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          FindVendorLedgerEntry(DocType,DocNo,VendLedgEntry);
        //  
        //                                          WITH GenJnlLine DO BEGIN
        //                                            InitNewLine(
        //                                              PurchHeader."Posting Date",PurchHeader."Document Date",PurchHeader."Posting Description",
        //                                              PurchHeader."Shortcut Dimension 1 Code",PurchHeader."Shortcut Dimension 2 Code",
        //                                              PurchHeader."Dimension Set ID",PurchHeader."Reason Code");
        //  
        //                                            CopyDocumentFields(0,DocNo,ExtDocNo,SourceCode,'');
        //                                            "Account Type" := "Account Type"::Vendor;
        //                                          #11..28
        //                                                TotalPurchLineLCY2."Amount Including VAT" +
        //                                                ROUND(VendLedgEntry."Remaining Pmt. Disc. Possible" / VendLedgEntry."Adjusted Currency Factor");
        //                                            "Allow Zero-Amount Posting" := TRUE;
        //  
        //                                            OnBeforePostBalancingEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,PreviewMode,SuppressCommit);
        //                                            GenJnlPostLine.RunWithCheck(GenJnlLine);
        //                                            OnAfterPostBalancingEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,SuppressCommit,GenJnlPostLine);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..4
        //                                              PurchHeader."Posting Date",PurchHeader."Document Date",TotalPurchLine2.Description,
        //                                              PurchHeader."Shortcut Dimension 1 Code",PurchHeader."Shortcut Dimension 2 Code",
        //                                              PurchHeader."Dimension Set ID",PurchHeader."Reason Code",TotalPurchLine2."Job No.",PurchHeader."Buy-from Vendor No.");
        //                                          #8..31
        //                                             //added by daudi for procurement
        //                                            "Procurement Plan":=TotalPurchLine2."Procurement Plan";
        //                                            "Procurement Plan Item":=TotalPurchLine2."Procurement Plan Item";
        //                                            "Responsibility Center":=TotalPurchLine2."Responsibility Center";
        //                                          #32..36
        //                                        END;
        //  
        //                           Target=PostBalancingEntry(PROCEDURE 149) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          PurchHeader.TESTFIELD("Buy-from IC Partner Code",'');
        //                                          PurchHeader.TESTFIELD("Pay-to IC Partner Code",'');
        //                                          PurchLine.TESTFIELD("IC Partner Ref. Type",PurchLine."IC Partner Ref. Type"::"G/L Account");
        //                                          #4..6
        //                                          WITH TempICGenJnlLine DO BEGIN
        //                                            InitNewLine(PurchHeader."Posting Date",PurchHeader."Document Date",PurchHeader."Posting Description",
        //                                              PurchLine."Shortcut Dimension 1 Code",PurchLine."Shortcut Dimension 2 Code",PurchLine."Dimension Set ID",
        //                                              PurchHeader."Reason Code");
        //                                            "Line No." := ICGenJnlLineNo;
        //  
        //                                            CopyDocumentFields(GenJnlLineDocType,GenJnlLineDocNo,GenJnlLineExtDocNo,SrcCode,PurchHeader."Posting No. Series");
        //                                          #14..66
        //                                            VALIDATE(Amount);
        //                                            INSERT;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..9
        //                                              PurchHeader."Reason Code",PurchLine."Job No.",PurchHeader."Buy-from Vendor No.");
        //                                          #11..69
        //                                        END;
        //  
        //                           Target=InsertICGenJnlLine(PROCEDURE 150) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH PurchHeader DO BEGIN
        //                                            PurchInvHeader.INIT;
        //                                            PurchInvHeader.TRANSFERFIELDS(PurchHeader);
        //                                          #4..15
        //                                            IF GUIALLOWED THEN
        //                                              Window.UPDATE(1,STRSUBSTNO(InvoiceNoMsg,"Document Type","No.",PurchInvHeader."No."));
        //                                            PurchInvHeader."Creditor No." := "Creditor No.";
        //                                            PurchInvHeader."Payment Reference" := "Payment Reference";
        //                                            PurchInvHeader."Payment Method Code" := "Payment Method Code";
        //                                            PurchInvHeader."Source Code" := SrcCode;
        //                                            PurchInvHeader."User ID" := USERID;
        //                                            PurchInvHeader."No. Printed" := 0;
        //                                            OnBeforePurchInvHeaderInsert(PurchInvHeader,PurchHeader,SuppressCommit);
        //                                            PurchInvHeader.INSERT(TRUE);
        //                                            OnAfterPurchInvHeaderInsert(PurchInvHeader,PurchHeader);
        //                                          #27..31
        //                                              RecordLinkManagement.CopyLinks(PurchHeader,PurchInvHeader);
        //                                            END;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..18
        //                                            PurchInvHeader."Payment Reference" := "Payment Reference(KSHS)";
        //                                          #20..23
        //                                            PurchInvHeader."Advance Recovery %" := "Advance Recovery %";
        //                                            PurchInvHeader."Retention %" := "Retention %";
        //                                          #24..34
        //                                        END;
        //  
        //                           Target=InsertInvoiceHeader(PROCEDURE 87) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH GenJnlLine DO BEGIN
        //                                            InitNewLine(
        //                                              PurchHeader."Posting Date",PurchHeader."Document Date",PurchHeader."Posting Description",
        //                                              InvoicePostBuffer."Global Dimension 1 Code",InvoicePostBuffer."Global Dimension 2 Code",
        //                                              InvoicePostBuffer."Dimension Set ID",PurchHeader."Reason Code");
        //  
        //                                            CopyDocumentFields(GenJnlLineDocType,GenJnlLineDocNo,GenJnlLineExtDocNo,SrcCode,'');
        //                                            CopyFromPurchHeader(PurchHeader);
        //                                          #9..25
        //                                            GLEntryNo := RunGenJnlPostLine(GenJnlLine);
        //                                            OnAfterPostInvPostBuffer(GenJnlLine,InvoicePostBuffer,PurchHeader,GLEntryNo,SuppressCommit,GenJnlPostLine);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..4
        //                                              InvoicePostBuffer."Dimension Set ID",PurchHeader."Reason Code",InvoicePostBuffer."Job No.",PurchHeader."Buy-from Vendor No.");
        //                                          #6..28
        //                                        END;
        //  
        //                           Target=PostInvoicePostBufferLine(PROCEDURE 92) }
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

