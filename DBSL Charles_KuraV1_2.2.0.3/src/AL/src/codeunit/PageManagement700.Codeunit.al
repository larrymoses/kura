#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70700 "Page Management700"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Page Management"(Codeunit 700)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=08032021D;
        //      Time=121500T;
        //      Modified=Yes;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Page Management"(Codeunit 700);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CASE RecordRef.NUMBER OF
        //                                            DATABASE::"Gen. Journal Template":
        //                                              EXIT(PAGE::"General Journal Templates");
        //                                          #4..38
        //                                              EXIT(PAGE::"Text-to-Account Mapping Wksh.");
        //                                            DATABASE::"Cash Flow Setup":
        //                                              EXIT(PAGE::"Cash Flow Setup");
        //                                            DATABASE::"Production Order":
        //                                              EXIT(GetProductionOrderPageID(RecordRef));
        //                                          END;
        //                                          EXIT(0);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          {The code has been merged but contained errors that could prevent import
        //                                          and the code has been put in comments. Use Shift+Ctrl+O to Uncomment}
        //                                          #1..41
        //                                            DATABASE::Vendor:
        //                                              EXIT(PAGE::"Vendor Registration Card");
        //  
        //                                             DATABASE::"Imprest Memo":
        //                                              EXIT(GetImpMemoPageID(RecordRef));
        //                                             DATABASE::payments:
        //                                              EXIT(GetPaymentsPageID(RecordRef));
        //                                            DATABASE::"Payroll PeriodX":
        //                                              EXIT(GetPayPeriodPageID(RecordRef));
        //  
        //                                            DATABASE::"Production Order":
        //                                              EXIT(GetProductionOrderPageID(RecordRef));
        //                                            //Added for procurement documents
        //                                            DATABASE::"Procurement Request":
        //                                              EXIT(PAGE::Quotation);
        //  
        //                                            DATABASE::"File Movement Header":
        //                                              EXIT(PAGE::"File Movement Header");
        //  
        //  
        //                                            DATABASE::"Training Plan Header":
        //                                              EXIT(PAGE::"Training Plan Header");
        //  
        //                                            DATABASE::"Training Requests":
        //                                              EXIT(PAGE::"Training Requisition");
        //  
        //                                            DATABASE::"Fuel & Maintenance Requisition":
        //                                              EXIT(PAGE::"Fuel Requisition Card");
        //  
        //                                            DATABASE::"Case Plantiff-Defandants":
        //                                            EXIT(GetPlaintifsOrDependantsPageID(RecordRef));
        //  
        //                                            //RMS
        //                                            DATABASE::Job:
        //                                            EXIT(GetProjectsPageID(RecordRef));
        //  
        //                                            //RFI
        //                                            DATABASE::"Request For Information":
        //                                            EXIT(GetIFPPageID(RecordRef));
        //  
        //                                            //Payroll Header
        //                                            DATABASE::"Payroll Header":
        //                                              EXIT(GetPayrollHeaderPageID(RecordRef));
        //  
        //                                             //Procurementplan
        //                                           DATABASE::"Procurement Plan":
        //                                              EXIT(PAGE::"Dept Procurement Plan Card");
        //                                            //Vendor Debarment
        //                                            DATABASE::"Vendor Debarment Voucher":
        //                                            EXIT(PAGE::"Vendor Debarment card");
        //                                            //IFS
        //                                            DATABASE::"Standard Purchase Code":
        //                                            EXIT(PAGE::"Invitation To Tender");
        //  
        //                                          {<<<<<<<}
        //                                          END;
        //                                          EXIT(0);
        //                                        END;
        //  
        //                           Target=GetConditionalCardPageID(PROCEDURE 3) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          RecordRef.SETTABLE(PurchaseHeader);
        //                                          CASE PurchaseHeader."Document Type" OF
        //                                            PurchaseHeader."Document Type"::Quote:
        //                                          #4..11
        //                                              EXIT(PAGE::"Blanket Purchase Order");
        //                                            PurchaseHeader."Document Type"::"Return Order":
        //                                              EXIT(PAGE::"Purchase Return Order");
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..14
        //                                            //Kugun--Add store requisition
        //                                              PurchaseHeader."Document Type"::"Store Requisition":
        //                                              EXIT(PAGE::"Store Requisition");
        //                                            //end Kugun--store requisition
        //  
        //                                              //Kugun--Add Project Purchase Requisition
        //                                              PurchaseHeader."Document Type"::"Purchase Requisition":
        //                                              EXIT(PAGE::"Projects Works PRNs");
        //                                            //end Kugun--Project Purchase Requisition
        //                                            //Kugun--Add Leave application
        //                                            //end Kugun--store requsition
        //                                          END;
        //                                        END;
        //  
        //                           Target=GetPurchaseHeaderPageID(PROCEDURE 17) }
        //      { Insertion         ;InsertAfter=VerifyPageID(PROCEDURE 11);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE GetImpMemoPageID@1000000000(RecordRef@1000 : RecordRef) : Integer;
        //                             VAR
        //                               ImpMemo@1001 : Record "Imprest Memo";
        //                             BEGIN
        //                               RecordRef.SETTABLE(ImpMemo);
        //  
        //                               EXIT(PAGE::"Approver Imprest Memo");
        //                             END;
        //  
        //                             LOCAL PROCEDURE GetPlaintifsOrDependantsPageID@25(RecordRef@1000 : RecordRef) : Integer;
        //                             VAR
        //                               Payments@1001 : Record payments;
        //                               ObjPlaintifs@1002 : Record "Case Plantiff-Defandants";
        //                             BEGIN
        //                               RecordRef.SETTABLE(ObjPlaintifs);
        //                               CASE ObjPlaintifs.Type OF
        //                                ObjPlaintifs.Type::" ":
        //                                  EXIT(PAGE::"Case Plantiffs");
        //                                 ObjPlaintifs.Type::Plaintiff:
        //                                  EXIT(PAGE::"Case Defandants");
        //                                END;
        //                             END;
        //  
        //                             LOCAL PROCEDURE GetPaymentsPageID@1000000001(RecordRef@1000 : RecordRef) : Integer;
        //                             VAR
        //                               Payments@1001 : Record payments;
        //                             BEGIN
        //                               RecordRef.SETTABLE(Payments);
        //                               CASE Payments."Payment Type" OF
        //                                 Payments."Payment Type"::"Payment Voucher":
        //                                   EXIT(PAGE::"Payment Voucher");
        //                                 Payments."Payment Type"::Imprest:
        //                                   EXIT(PAGE::"Imprest Requisition");
        //                                 Payments."Payment Type"::"Staff Claim":
        //                                   EXIT(PAGE::"Staff Claim");
        //                                 Payments."Payment Type"::Surrender:
        //                                   EXIT(PAGE::"Imprest Surrender");
        //                                 Payments."Payment Type"::"Petty Cash":
        //                                   EXIT(PAGE::"Petty Cash Voucher");
        //                                 Payments."Payment Type"::"Petty Cash Surrender":
        //                                   EXIT(PAGE::"Petty Cash Surrender");
        //                                 Payments."Payment Type"::"Bank Transfer":
        //                                   EXIT(PAGE::"Bank Transfer");
        //                                 Payments."Payment Type"::"Standing Imprest":
        //                                   EXIT(PAGE::"Standing Imprest Requsition");
        //                                 Payments."Payment Type"::"Standing Imprest Surrender":
        //                                 EXIT(PAGE::"Standing Imprest Surrender");
        //                                 Payments."Payment Type"::"Salary Advance":
        //                                 EXIT(PAGE::"Salary Advance Card");
        //  
        //                               END;
        //                             END;
        //  
        //                             LOCAL PROCEDURE GetPayPeriodPageID@1000000002(RecordRef@1000 : RecordRef) : Integer;
        //                             VAR
        //                               PayPeriod@1001 : Record "Payroll PeriodX";
        //                             BEGIN
        //                               RecordRef.SETTABLE(PayPeriod);
        //  
        //                               EXIT(PAGE::"Pay Periods List");
        //                             END;
        //  
        //                           }
        //                            }
        //      { Insertion         ;InsertAfter=OnBeforeGetDefaultLookupPageID(PROCEDURE 24);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE GetProjectsPageID@29(RecordRef@1000 : RecordRef) : Integer;
        //                             VAR
        //                               Payments@1001 : Record payments;
        //                               ObjPlaintifs@1002 : Record "Case Plantiff-Defandants";
        //                               Job@1003 : Record Job;
        //                             BEGIN
        //                               RecordRef.SETTABLE(Job);
        //                               CASE Job."Road Project Type" OF
        //                                Job."Road Project Type"::Construction:
        //                                  EXIT(PAGE::"Road Construction Project Card");
        //                                 Job."Road Project Type"::Maintenance:
        //                                  EXIT(PAGE::"Road Maintenance Project Card");
        //                                 Job."Road Project Type"::Studies_Surveys_Designs:
        //                                   EXIT(PAGE::"Studies_Surveys_Designs Card");
        //                                END;
        //                             END;
        //  
        //                             LOCAL PROCEDURE "/////////////////RFI//////////"@30();
        //                             BEGIN
        //                             END;
        //  
        //                             LOCAL PROCEDURE GetIFPPageID@31(RecordRef@1000 : RecordRef) : Integer;
        //                             VAR
        //                               IFP@1001 : Record "Request For Information";
        //                             BEGIN
        //                               RecordRef.SETTABLE(IFP);
        //                               CASE IFP."Document Type" OF
        //                                 IFP."Document Type"::"Invitation For Prequalification":
        //                                   EXIT(PAGE::"IFP Card");
        //  
        //                               END;
        //                             END;
        //  
        //                             LOCAL PROCEDURE "======Payroll Header====="@35();
        //                             BEGIN
        //                             END;
        //  
        //                             LOCAL PROCEDURE GetPayrollHeaderPageID@34(RecordRef@1000 : RecordRef) : Integer;
        //                             VAR
        //                               PayrollHeader@1001 : Record "Payroll Header";
        //                             BEGIN
        //                               RecordRef.SETTABLE(PayrollHeader);
        //                               CASE PayrollHeader."Payroll Type" OF
        //                                 PayrollHeader."Payroll Type"::Director:
        //                                   EXIT(PAGE::"Director Payroll Header");
        //                                 PayrollHeader."Payroll Type"::Normal:
        //                                   EXIT(PAGE::"Payroll Header");
        //                                END;
        //                             END;
        //  
        //                           }
        //                            }
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

