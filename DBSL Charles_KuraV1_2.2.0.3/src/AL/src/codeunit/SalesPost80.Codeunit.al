#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 99505 "Sales-Post80"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Sales-Post"(Codeunit 80)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=05032021D;
        //      Time=104450T;
        //      Modified=Yes;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Sales-Post"(Codeunit 80);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          SalesHeader.TESTFIELD("Sell-to IC Partner Code",'');
        //                                          SalesHeader.TESTFIELD("Bill-to IC Partner Code",'');
        //                                          SalesLine.TESTFIELD("IC Partner Ref. Type",SalesLine."IC Partner Ref. Type"::"G/L Account");
        //                                          #4..7
        //                                            InitNewLine(
        //                                              SalesHeader."Posting Date",SalesHeader."Document Date",SalesHeader."Posting Description",
        //                                              SalesLine."Shortcut Dimension 1 Code",SalesLine."Shortcut Dimension 2 Code",SalesLine."Dimension Set ID",
        //                                              SalesHeader."Reason Code");
        //                                            "Line No." := ICGenJnlLineNo;
        //  
        //                                            CopyDocumentFields(GenJnlLineDocType,GenJnlLineDocNo,GenJnlLineExtDocNo,SrcCode,SalesHeader."Posting No. Series");
        //                                          #15..68
        //                                            OnBeforeInsertICGenJnlLine(TempICGenJnlLine,SalesHeader,SalesLine,SuppressCommit);
        //                                            INSERT;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..10
        //                                              SalesHeader."Reason Code","Project No","Contractor No");
        //                                          #12..71
        //                                        END;
        //  
        //                           Target=InsertICGenJnlLine(PROCEDURE 150) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH GenJnlLine DO BEGIN
        //                                            InitNewLine(
        //                                              SalesHeader."Posting Date",SalesHeader."Document Date",SalesHeader."Posting Description",
        //                                              SalesHeader."Shortcut Dimension 1 Code",SalesHeader."Shortcut Dimension 2 Code",
        //                                              SalesHeader."Dimension Set ID",SalesHeader."Reason Code");
        //  
        //                                            CopyDocumentFields(DocType,DocNo,ExtDocNo,SourceCode,'');
        //                                            "Account Type" := "Account Type"::Customer;
        //                                          #9..25
        //                                            GenJnlPostLine.RunWithCheck(GenJnlLine);
        //                                            OnAfterPostCustomerEntry(GenJnlLine,SalesHeader,TotalSalesLine2,TotalSalesLineLCY2,SuppressCommit,GenJnlPostLine);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..4
        //                                              SalesHeader."Dimension Set ID",SalesHeader."Reason Code","Project No","Contractor No");
        //                                          #6..28
        //                                        END;
        //  
        //                           Target=PostCustomerEntry(PROCEDURE 101) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          FindCustLedgEntry(DocType,DocNo,CustLedgEntry);
        //  
        //                                          WITH GenJnlLine DO BEGIN
        //                                            InitNewLine(
        //                                              SalesHeader."Posting Date",SalesHeader."Document Date",SalesHeader."Posting Description",
        //                                              SalesHeader."Shortcut Dimension 1 Code",SalesHeader."Shortcut Dimension 2 Code",
        //                                              SalesHeader."Dimension Set ID",SalesHeader."Reason Code");
        //  
        //                                            CopyDocumentFields(0,DocNo,ExtDocNo,SourceCode,'');
        //                                            "Account Type" := "Account Type"::Customer;
        //                                          #11..33
        //                                            GenJnlPostLine.RunWithCheck(GenJnlLine);
        //                                            OnAfterPostBalancingEntry(GenJnlLine,SalesHeader,TotalSalesLine2,TotalSalesLineLCY2,SuppressCommit,GenJnlPostLine);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..6
        //                                              SalesHeader."Dimension Set ID",SalesHeader."Reason Code","Project No","Contractor No");
        //                                          #8..36
        //                                        END;
        //  
        //                           Target=PostBalancingEntry(PROCEDURE 63) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH GenJnlLine DO BEGIN
        //                                            InitNewLine(
        //                                              SalesHeader."Posting Date",SalesHeader."Document Date",SalesHeader."Posting Description",
        //                                              InvoicePostBuffer."Global Dimension 1 Code",InvoicePostBuffer."Global Dimension 2 Code",
        //                                              InvoicePostBuffer."Dimension Set ID",SalesHeader."Reason Code");
        //  
        //                                            CopyDocumentFields(GenJnlLineDocType,GenJnlLineDocNo,GenJnlLineExtDocNo,SrcCode,'');
        //  
        //                                          #9..19
        //                                            GLEntryNo := RunGenJnlPostLine(GenJnlLine);
        //                                            OnAfterPostInvPostBuffer(GenJnlLine,InvoicePostBuffer,SalesHeader,GLEntryNo,SuppressCommit,GenJnlPostLine);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..4
        //                                              InvoicePostBuffer."Dimension Set ID",SalesHeader."Reason Code","Project No","Contractor No");
        //                                          #6..22
        //                                        END;
        //  
        //                           Target=PostInvoicePostBufferLine(PROCEDURE 158) }
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

