#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 99501 "Workflow Response Handling1521"





{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]

    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        CustomApproval: Codeunit "Custom Approvals Codeunit";
    begin
        CustomApproval.ReOpen(RecRef, true);
        Handled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        CustomApproval: Codeunit "Custom Approvals Codeunit";
    begin
        CustomApproval.Release(RecRef, Handled);
        Handled := true;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var iSHandled: Boolean)
    var
        CustomApproval: Codeunit "Custom Approvals Codeunit";
    begin

        CustomApproval.SetStatusToPending(RecRef, Variant, true);
        iSHandled := true;
    end;
}









//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//  OBJECT Modification "Workflow Response Handling"(Codeunit 1521)
//  {
//    OBJECT-PROPERTIES
//    {
//      Date=02122022D;
//      Time=150501T;
//      Modified=Yes;
//      Version List=NAVW114.00;
//    }
//    PROPERTIES
//    {
//      Target="Workflow Response Handling"(Codeunit 1521);
//    }
//    CHANGES
//    {
//      { CodeModification  ;OriginalCode=BEGIN
//                                          AddResponseToLibrary(DoNothingCode,0,DoNothingTxt,'GROUP 0');
//                                          AddResponseToLibrary(CreateNotificationEntryCode,0,CreateNotifEntryTxt,'GROUP 3');
//                                          AddResponseToLibrary(ReleaseDocumentCode,0,ReleaseDocumentTxt,'GROUP 0');
//                                          #4..35
//                                          AddResponseToLibrary(RevertValueForFieldCode,0,RevertRecordValueTxt,'GROUP 6');
//                                          AddResponseToLibrary(ApplyNewValuesCode,0,ApplyNewValuesTxt,'GROUP 7');
//                                          AddResponseToLibrary(DiscardNewValuesCode,0,DiscardNewValuesTxt,'GROUP 0');
//  
//                                          OnAddWorkflowResponsesToLibrary;
//                                        END;
//  
//                           ModifiedCode=BEGIN
//                                          #1..38
//                                          //Dynasoft
//                                           //Wresponse.AddResponsesToLib;
//                                          //End Dynasoft
//                                          OnAddWorkflowResponsesToLibrary;
//                                        END;
//  
//                           Target=CreateResponsesLibrary(PROCEDURE 25) }
//      { CodeModification  ;OriginalCode=BEGIN
//                                          CASE ResponseFunctionName OF
//                                            SetStatusToPendingApprovalCode:
//                                              BEGIN
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPurchaseDocForApprovalCode);
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSalesDocForApprovalCode);
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIncomingDocForApprovalCode);
//                                                AddResponsePredecessor(
//                                                  SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnCustomerCreditLimitNotExceededCode);
//                                              END;
//                                            CreateApprovalRequestsCode:
//                                              BEGIN
//                                          #12..22
//                                                AddResponsePredecessor(
//                                                  CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendGeneralJournalBatchForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnGeneralJournalBatchBalancedCode);
//                                              END;
//                                            SendApprovalRequestForApprovalCode:
//                                              BEGIN
//                                          #29..44
//                                                  SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnGeneralJournalBatchBalancedCode);
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode);
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode);
//                                              END;
//                                            ReleaseDocumentCode:
//                                              BEGIN
//                                          #51..63
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelItemApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalLineApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalBatchApprovalRequestCode);
//                                              END;
//                                            CancelAllApprovalRequestsCode:
//                                              BEGIN
//                                          #70..77
//                                                  WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalLineApprovalRequestCode);
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,
//                                                  WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalBatchApprovalRequestCode);
//                                              END;
//                                            RevertValueForFieldCode:
//                                              BEGIN
//                                          #84..118
//                                            GetSendToOCRAsyncCode:
//                                              AddResponsePredecessor(GetSendToOCRAsyncCode,WorkflowEventHandling.RunWorkflowOnAfterReadyForOCRIncomingDocCode);
//                                          END;
//                                          OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName);
//                                        END;
//  
//                           ModifiedCode=BEGIN
//                                          #1..8
//                                              //Added By Coremen on 28/11/2015
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendImpMemoForApprovalCode);
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPaymentsForApprovalCode);
//                                                //
//                                                //Added By Kugun on 01/05/2016
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPayPeriodForApprovalCode);
//                                                //
//                                                //Salaryvouchers
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSalaryForApprovalCode);
//                                                 //TSalaryvouchers
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTSalaryForApprovalCode);
//                                                 //IncSalaryvouchers
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIncSalaryForApprovalCode);
//                                                //copyright registration
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendCopyRegForApprovalCode);
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendOvertimeForApprovalCode);
//                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTApplicationForApprovalCode);
//                                                //Grant Funding Application
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendGFAForApprovalCode);
//                                                 //Fleet Requisition
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFleetForApprovalCode);
//                                                //Project Contracts
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProjectContractForApprovalCode);
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProcDocForApprovalCode);
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFileMovementForApprovalCode);
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIFPForApprovalCode);
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendVendDebarmentForApprovalCode);
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProcPlanForApprovalCode);
//                                                //Receipt Processing
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendReceiptForApprovalCode);
//                                                 //Project Fundin
//                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProjectReqForApprovalCode);
//                                                 //AIE Process
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendAIEReqForApprovalCode);
//                                                  //PCO
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPCOReqForApprovalCode);
//                                                   //WEP
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendWEPReqForApprovalCode);
//                                                  //SubContracting
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSubReqForApprovalCode);
//                                                  //WEP Contractor Sub
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendWEPSubReqForApprovalCode);
//                                                  //Site Instructions
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSiteReqForApprovalCode);
//                                                  //Temporary Supervision
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTSRReqForApprovalCode);
//                                                  //Insurance
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendInsuranceReqForApprovalCode);
//                                                  //Project Meeting Register
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPMRReqForApprovalCode);
//                                                  //Daily Work Record
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendDWRReqForApprovalCode);
//                                                  //Project Variation Header
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPVHReqForApprovalCode);
//                                                  //Project EValuation Header
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPEHReqForApprovalCode);
//                                                  //QM Plan Header
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendQMPHReqForApprovalCode);
//                                                  //Risk M&E Header
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendMEHReqForApprovalCode);
//                                                  //Risk Incident Log
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendRILReqForApprovalCode);
//                                                  //Measurement & Payment Header
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendMPHReqForApprovalCode);
//                                                  //Inspection Header
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIHReqForApprovalCode);
//                                                  //Final Account
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFAReqForApprovalCode);
//                                                  //Driver out of office
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendDriverReqForApprovalCode);
//                                                  //Project Staff Appointment Voucher
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSAVReqForApprovalCode);
//  
//                                                  //WEPPCO
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendWEPPCOReqForApprovalCode);
//                                                  //Bill Discounting
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBDiscountReqForApprovalCode);
//                                                  //Batch Payment
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBPaymentReqForApprovalCode);
//  
//                                                 //Cash Request
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendCashReqForApprovalCode);
//                                                  //Road Work Program
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendRWPReqForApprovalCode);
//                                                  //Asset Transfer
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendAssetTransferReqForApprovalCode);
//                                                  //Bank Rec
//                                                  AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBankRecReqForApprovalCode);
//                                                  //Training Plan
//  
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTPlanForApprovalCode);
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTenderCommitteForApprovalCode);
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBidEvaluationForApprovalCode);
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBidOpeningForApprovalCode);
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBidTabulationForApprovalCode);
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIFSForApprovalCode);
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendMaintenanceForApprovalCode);
//                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFuelReqForApprovalCode);
//                                                   //start recruitment
//                                                     AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendRecRequisitionqForApprovalCode);
//  
//                                                   //end recruitment
//  
//                                          #9..25
//                                              //Added by Coremen on 28/11/2015
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendImpMemoForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPaymentsForApprovalCode);
//                                                //
//                                                //Added by Kugun on 01/05/2016
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPayPeriodForApprovalCode);
//                                                //Salary Vouchers;
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSalaryForApprovalCode);
//                                                 //T Salary Vouchers;
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTSalaryForApprovalCode);
//                                                 //Inc Salary Vouchers;
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIncSalaryForApprovalCode);
//                                                //Copyright Registration
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendCopyRegForApprovalCode);
//                                                //Overtime Application
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendOvertimeForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTApplicationForApprovalCode);
//                                                //Grant Funding Application
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendGFAForApprovalCode);
//                                                //Fleet Requisition
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFleetForApprovalCode);
//                                                //Project Contract
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProjectContractForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcDocForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFileMovementForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFPForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendVendDebarmentForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcPlanForApprovalCode);
//                                                //Receipt Processing
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendReceiptForApprovalCode);
//                                                //Project Fundin
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProjectReqForApprovalCode);
//                                                //AIE Process
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendAIEReqForApprovalCode);
//                                                //PCO
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPCOReqForApprovalCode);
//                                                 //WEP
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendWEPReqForApprovalCode);
//                                                 //Subcontracting
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSubReqForApprovalCode);
//                                                 //WEP Contractor Submission
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendWEPSubReqForApprovalCode);
//                                                 //Site Instructions
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSiteReqForApprovalCode);
//                                                 //Temporary Supervision Requirement
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTSRReqForApprovalCode);
//                                                 //Insurance
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendInsuranceReqForApprovalCode);
//                                                 //Project Meeting Register
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPMRReqForApprovalCode);
//                                                 //Daily Work Record
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendDWRReqForApprovalCode);
//                                                 //Project Variation Header
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPVHReqForApprovalCode);
//                                                 //Project Evaluation Header
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPEHReqForApprovalCode);
//                                                 //QM Plan Header
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendQMPHReqForApprovalCode);
//                                                 //Risk M&E Header
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendMEHReqForApprovalCode);
//                                                 //Risk Incident Log
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendRILReqForApprovalCode);
//                                                 //Measurement & Payment Header
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendMPHReqForApprovalCode);
//                                                 //Inspection Header
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIHReqForApprovalCode);
//                                                 //Final Account
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFAReqForApprovalCode);
//                                                  //Driver out of office
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendDriverReqForApprovalCode);
//                                                 //Project Staff Vouchers
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSAVReqForApprovalCode);
//                                                 //WEPPCO
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendWEPPCOReqForApprovalCode);
//                                                 //Bill Discounting
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBDiscountReqForApprovalCode);
//                                                 //Batch Payment
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBPaymentReqForApprovalCode);
//  
//                                                //Cash Request
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendCashReqForApprovalCode);
//                                                //Road Work Program
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendRWPReqForApprovalCode);
//                                                //Asset Transfer
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendAssetTransferReqForApprovalCode);
//                                                //Bank Rec
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBankRecReqForApprovalCode);
//                                                //Training Plan
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTPlanForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTenderCommitteForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidEvaluationForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidOpeningForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidTabulationForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFSForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendMaintenanceForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFuelReqForApprovalCode);
//                                                //recruitment
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendRecRequisitionqForApprovalCode);
//  
//                                                //end recruitment
//                                          #26..47
//                                              //Added by Coremen on 28/11/2015
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendImpMemoForApprovalCode);
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPaymentsForApprovalCode);
//                                                //
//                                                //Added by Kugun on 01/05/2016
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPayPeriodForApprovalCode);
//                                                //Salary Voucher
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSalaryForApprovalCode);
//                                                //TSalary Voucher
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTSalaryForApprovalCode);
//                                                   //IncSalary Voucher
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIncSalaryForApprovalCode);
//                                                //Copyright registration
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendCopyRegForApprovalCode);
//                                                //Overtime Application
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendOvertimeForApprovalCode);
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTApplicationForApprovalCode);
//                                                //Grant Funding Application
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendGFAForApprovalCode);
//                                                //Fleet Requisition
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFleetForApprovalCode);
//                                                //Project Contracts
//                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProjectContractForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcDocForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFileMovementForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFPForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendVendDebarmentForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcPlanForApprovalCode);
//                                                //Receipt Processing
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendReceiptForApprovalCode);
//                                                //Project Fundin
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProjectReqForApprovalCode);
//                                                //AIE Process
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendAIEReqForApprovalCode);
//                                                //PCO
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPCOReqForApprovalCode);
//                                                //WEP
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendWEPReqForApprovalCode);
//                                                //Subcontracting
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSubReqForApprovalCode);
//                                                //WEP Contractor Submission
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendWEPSubReqForApprovalCode);
//                                                //Site Instructions
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSiteReqForApprovalCode);
//                                                //Temporary Supervision Requirement
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTSRReqForApprovalCode);
//                                                //Insurance
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendInsuranceReqForApprovalCode);
//                                                //Project Meeting Register
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPMRReqForApprovalCode);
//                                                //Daily Work Record
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendDWRReqForApprovalCode);
//                                                //Project Variation Header
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPVHReqForApprovalCode);
//                                                //Project Evaluation Header
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPEHReqForApprovalCode);
//                                                //QM Plan Header
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendQMPHReqForApprovalCode);
//                                                //Risk M&E Header
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendMEHReqForApprovalCode);
//                                                //Risk Incident Log
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendRILReqForApprovalCode);
//                                                //Measurement & Payment Header
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendMPHReqForApprovalCode);
//                                                //Inspection
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIHReqForApprovalCode);
//                                                //Final Account
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFAReqForApprovalCode);
//                                                //Driver out olf office
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendDriverReqForApprovalCode);
//                                                //Project STaff Voucher
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSAVReqForApprovalCode);
//                                                //WEPPCO
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendWEPPCOReqForApprovalCode);
//                                                //Bill Discounting
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBDiscountReqForApprovalCode);
//                                                 //Batch Payment
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBPaymentReqForApprovalCode);
//                                                //Cash Request
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendCashReqForApprovalCode);
//                                                //Road Wor Program
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendRWPReqForApprovalCode);
//                                                //Asset Transfer
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendAssetTransferReqForApprovalCode);
//                                                //Bank Rec
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBankRecReqForApprovalCode);
//                                                //Training Plan
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTPlanForApprovalCode);
//  
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTenderCommitteForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidEvaluationForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidOpeningForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidTabulationForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFSForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendImpMemoForApprovalCode);
//                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFuelReqForApprovalCode);
//                                                //recruitment
//                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendRecRequisitionqForApprovalCode);
//  
//                                                //end recruitment
//                                          #48..66
//                                              //Added by Coremen on 28/11/2015
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelImpMemoApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPaymentsApprovalRequestCode);
//                                                //
//                                                //Added by Kugun on 01/05/2016
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPayPeriodApprovalRequestCode);
//                                                //Salary Vouchers
//                                                 AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelSalaryApprovalRequestCode);
//                                                  //TSalary Vouchers
//                                                 AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelTSalaryApprovalRequestCode);
//                                                      //incSalary Vouchers
//                                                 AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelIncSalaryApprovalRequestCode);
//                                                //Copyright Registration
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelCopyRegApprovalRequestCode);
//                                                //Overtime application
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelOvertimeApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelTApplicationApprovalRequestCode);
//                                                 //Grant Funding Application
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelGFAApprovalRequestCode);
//                                                //Fleet Requisition
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelFleetApprovalRequestCode);
//                                                //Project Contracts
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelProjectContractApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelProcDocApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelFileMovementApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelIFPApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelVendDebarmentApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelProcPlanApprovalRequestCode);
//                                                //Receipt Processing
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelReceiptApprovalRequestCode);
//                                                //Project Fundin
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelProjectReqApprovalRequestCode);
//                                                //AIE Process
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelAIEReqApprovalRequestCode);
//                                                //PCO
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPCOReqApprovalRequestCode);
//                                                //WEP
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelWEPReqApprovalRequestCode);
//                                                //Driver out of office
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelDriverReqApprovalRequestCode);
//                                                //Project Staff Voucher
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelSAVReqApprovalRequestCode);
//                                                //WEPPCO
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelWEPPCOReqApprovalRequestCode);
//                                                //Bill Discount
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBDiscountReqApprovalRequestCode);
//  
//                                                //Bill Discount
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelCashReqApprovalRequestCode);
//                                                //Road Work Program
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelRWPReqApprovalRequestCode);
//                                                //Asset Transfer
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelAssetTransferReqApprovalRequestCode);
//                                                //BankRec
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBankRecReqApprovalRequestCode);
//                                                //training plan
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelTPlanApprovalRequestCode);
//  
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelTenderCommitteApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBidEvaluationApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBidOpeningApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBidTabulationApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelIFSApprovalRequestCode);
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelMaintenanceApprovalRequestCode);
//                                                 AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelFuelReqApprovalRequestCode);
//                                                 //recruitment
//                                                  AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelRecRequisitionApprovalRequestCode);
//  
//                                                 //end recruitment
//                                          #67..80
//                                               //Added by Coremen on 28/11/2015
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelImpMemoApprovalRequestCode);
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelPaymentsApprovalRequestCode);
//                                                //
//                                               //Added by Kugun on 01/05/2016
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelPayPeriodApprovalRequestCode);
//                                                //Salary Vouchers
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelSalaryApprovalRequestCode);
//                                                      //TSalary Vouchers
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelTSalaryApprovalRequestCode);
//                                                       //IncSalary Vouchers
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelIncSalaryApprovalRequestCode);
//                                                //Copyright reg
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelCopyRegApprovalRequestCode);
//                                                //Overtime Application
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelOvertimeApprovalRequestCode);
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelTApplicationApprovalRequestCode);
//                                                 //Grant Funding Application
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelGFAApprovalRequestCode);
//                                                 //Fleet Requisition
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelFleetApprovalRequestCode);
//                                                 //Project Contracts
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelProjectContractApprovalRequestCode);
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelProcDocApprovalRequestCode);
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelFileMovementApprovalRequestCode);
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelIFPApprovalRequestCode);
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelVendDebarmentApprovalRequestCode);
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelProcPlanApprovalRequestCode);
//                                                 //Receipt Processing
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelReceiptApprovalRequestCode);
//                                                 //Project Fundin
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelProjectReqApprovalRequestCode);
//                                                 //AIE Process
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelAIEReqApprovalRequestCode);
//                                                 //PCO
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelPCOReqApprovalRequestCode);
//                                                  //WEP
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelWEPReqApprovalRequestCode);
//                                                  //Subcontracting
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelSubReqApprovalRequestCode);
//                                                //WEP Contractor Submission
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelWEPSubReqApprovalRequestCode);
//                                                //Site Instructions
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelSiteReqApprovalRequestCode);
//                                                //Temporary
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelTSRReqApprovalRequestCode);
//                                                //Insurance
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelInsuranceReqApprovalRequestCode);
//                                                //Project Meeting Reg
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPMRReqApprovalRequestCode);
//                                                //Daily Work Record
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelDWRReqApprovalRequestCode);
//                                                //Project Variation Header
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPVHReqApprovalRequestCode);
//                                                //Project Evaluation Header
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPEHReqApprovalRequestCode);
//                                                //QM Plan Header
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelQMPHReqApprovalRequestCode);
//                                                //Risk M&E Header
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelMEHReqApprovalRequestCode);
//                                                //Risk Incident Log
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelRILReqApprovalRequestCode);
//                                                //Measurement & Payment Header
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelMPHReqApprovalRequestCode);
//                                                //Inspection
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelIHReqApprovalRequestCode);
//                                                //Final Account
//                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelFAReqApprovalRequestCode);
//                                                  //Driver out of office
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelDriverReqApprovalRequestCode);
//                                                  //Project Staff Voucher
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelSAVReqApprovalRequestCode);
//                                                  //WEPPCO
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelWEPPCOReqApprovalRequestCode);
//                                                  //Bill Discount
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBDiscountReqApprovalRequestCode);
//                                                  //Cash Request
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelCashReqApprovalRequestCode);
//                                                 //Road Work Program
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelRWPReqApprovalRequestCode);
//                                                 //Asset Transfer
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelAssetTransferReqApprovalRequestCode);
//                                                 //Bank Rec
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBankRecReqApprovalRequestCode);
//                                                 //Training Plan
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelTPlanApprovalRequestCode);
//  
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelTenderCommitteApprovalRequestCode);
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBidEvaluationApprovalRequestCode);
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBidOpeningApprovalRequestCode);
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBidTabulationApprovalRequestCode);
//                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelIFSApprovalRequestCode);
//                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelMaintenanceApprovalRequestCode);
//                                                  AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelFuelReqApprovalRequestCode);
//                                                  //recruitment
//                                                   AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelRecRequisitionApprovalRequestCode);
//  
//                                                  //end recruitment
//                                          #81..121
//                                          //Dynasoft
//                                          // Wresponse.AddResponsePredecessors;
//                                          //End Dynasoft
//                                          OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName);
//                                        END;
//  
//                           Target=AddResponsePredecessors(PROCEDURE 33) }
//      { PropertyModification;
//                           Target=ReleaseDocument(PROCEDURE 5).Handled(Variable 1002);
//                           Property=Id;
//                           OriginalValue=1002;
//                           ModifiedValue=1400 }
//      { Insertion         ;Target=ReleaseDocument(PROCEDURE 5);
//                           InsertAfter=TargetRecRef(Variable 1008);
//                           ChangedElements=VariableCollection
//                           {
//                             ReleaseImprestMemo@1300 : Codeunit "Imprest Memo";
//                             ReleasePayments@1455 : Codeunit Payments;
//                             ReleasePayPeriod@1002 : Codeunit "Release Payroll period";
//                             ReleaseDoc@1010 : Codeunit "Release Approval Document";
//                             LeaveApp@1011 : Record "HR Leave Applications";
//                           }
//                            }
//      { Insertion         ;Target=ReleaseDocument(PROCEDURE 5);
//                           InsertAfter=Handled(Variable 1002);
//                           ChangedElements=VariableCollection
//                           {
//                             Procurement@1003 : Record "Procurement Request";
//                             HRAssetTransferHeader@1012 : Record "HR Asset Transfer Header";
//                             PurchaseHeader@1013 : Record "Purchase Header";
//                             SubcontractingHeader@1014 : Record "Subcontracting Header";
//                             WEPContractorSubmission@1015 : Record "WEP Contractor Submission";
//                             SiteInstructionsHeader@1016 : Record "Site Instructions Header";
//                             TemporarySupervisionRequirem@1017 : Record "Temporary Supervision Requirem";
//                             InsuranceGuaranteeHeader@1018 : Record "Insurance/Guarantee Header";
//                             ProjectMeetingRegister@1019 : Record "Project Meeting Register";
//                             DailyWorkRecord@1020 : Record "Daily Work Record";
//                             ProjectVariationHeader@1021 : Record "Project Variation Header";
//                             ProjectEvaluationHeader@1022 : Record "Project Evaluation Header";
//                             QMPlanHeader@1023 : Record "QM Plan Header";
//                             RiskMEHeader@1024 : Record "Risk M&E Header";
//                             RiskIncidentLog@1025 : Record "Risk Incident Log";
//                             MeasurementPaymentHeader@1026 : Record "Measurement &  Payment Header";
//                             InspectionHeadersss@1027 : Record "Inspection Headersss";
//                             FinalAccount@1028 : Record "Final Account";
//                           }
//                            }
//      { CodeModification  ;OriginalCode=BEGIN
//                                          RecRef.GETTABLE(Variant);
//  
//                                          CASE RecRef.NUMBER OF
//                                            DATABASE::"Approval Entry":
//                                              BEGIN
//                                          #6..14
//                                                Variant := TargetRecRef;
//                                                ReleaseDocument(Variant);
//                                              END;
//                                            DATABASE::"Purchase Header":
//                                              ReleasePurchaseDocument.PerformManualCheckAndRelease(Variant);
//                                            DATABASE::"Sales Header":
//                                              ReleaseSalesDocument.PerformManualCheckAndRelease(Variant);
//                                            DATABASE::"Incoming Document":
//                                              ReleaseIncomingDocument.PerformManualRelease(Variant);
//                                            ELSE BEGIN
//                                              OnReleaseDocument(RecRef,Handled);
//                                              IF NOT Handled THEN
//                                                ERROR(UnsupportedRecordTypeErr,RecRef.CAPTION);
//                                            END;
//                                          END;
//                                        END;
//  
//                           ModifiedCode=BEGIN
//                                          {The code has been merged but contained errors that could prevent import
//                                          and the code has been put in comments. Use Shift+Ctrl+O to Uncomment}
//                                          RecRef.GETTABLE(Variant);
//                                          //MESSAGE('HERE WE ARE');
//                                          #3..17
//  
//                                              //Purchase Header
//                                              DATABASE::"Purchase Header":
//                                              ReleasePurchaseDocument.PerformManualCheckAndRelease(Variant);
//  
//                                          #20..23
//                                              DATABASE::Vendor:
//                                            ReleaseDoc.ReleaseVendor(Variant);
//  
//                                             //Added by Coremen on 28/11/2015
//                                            DATABASE::"Imprest Memo":
//                                              ReleaseDoc.ReleaseImprestMemoReq(Variant);
//                                            DATABASE::payments:
//                                              ReleasePayments.PerformManualRelease(Variant);
//                                            //
//                                             //Added by Kugun on 01/05/2016
//                                            DATABASE::"Payroll PeriodX":
//                                            ReleasePayPeriod.PerformManualRelease(Variant);
//                                            //Salary Vouchers
//                                             DATABASE::"Payroll Header":
//                                              ReleasePayments.PerformSalaryRelease(Variant);
//                                            //
//                                            //TSalary Vouchers
//                                             DATABASE::"Payroll HeaderT":
//                                              ReleasePayments.PerformTSalaryRelease(Variant);
//                                            //
//                                              //Inc Salary Vouchers
//                                             DATABASE::"HR Salary Increament Header":
//                                              ReleasePayments.PerformIncSalaryRelease(Variant);
//                                            //
//                                            DATABASE::"HR Leave Applications":
//                                            ReleaseDoc.ReleaseLeaveApp(Variant);
//  
//                                            DATABASE::"Copyright Registration Table":
//                                            ReleaseDoc.ReleaseCopyReg(Variant);
//                                            //overtime
//                                            DATABASE::"Overtime Header":
//                                            ReleaseDoc.ReleaseOvertime(Variant);
//                                            DATABASE::"Training Requests":
//                                            ReleaseDoc.ReleaseTrainingApp(Variant);
//  
//                                          //Grant Funding Application
//                                            DATABASE::"Grant Funding Application":
//                                            ReleaseDoc.ReleaseGFA(Variant);
//  
//                                          //Project Contract
//                                            DATABASE::"Project Contract Header":
//                                            ReleaseDoc.ReleaseProjectContract(Variant);
//  
//                                          //Fleet Requisition
//                                            DATABASE::"Transport Requisition":
//                                            ReleaseDoc.ReleaseFleet(Variant);
//  
//                                           //Procurement method
//                                            DATABASE::"Procurement Request":
//                                            ReleaseDoc.ReleaseProcDOc(Variant);
//  
//                                          //File Movement
//                                            DATABASE::"File Movement Header":
//                                            ReleaseDoc.ReleaseFileMovement(Variant);
//  
//                                            //Receipt Processing
//                                            DATABASE::"Receipts Header1":
//                                            ReleaseDoc.ReleaseReceipt(Variant);
//  
//                                            //RFI
//                                            DATABASE::"Request For Information":
//                                            ReleaseDoc.ReleaseIFP(Variant);
//                                            //Vendor Debarment Voucher
//                                            DATABASE::"Vendor Debarment Voucher":
//                                            ReleaseDoc.ReleaseVendDebarment(Variant);
//  
//                                          //Procurement Plan
//                                            DATABASE::"Procurement Plan":
//                                            ReleaseDoc.ReleaseProcPlan(Variant);
//  
//                                          //Project Fundin
//                                            DATABASE::"Project Funding Request Vouche":
//                                            ReleaseDoc.ReleaseProjectReq(Variant);
//  
//                                            //AIE Process
//                                            DATABASE::"Inter Bank Transfer":
//                                            ReleaseDoc.ReleaseAIEReq(Variant);
//  
//                                          //PCO
//                                            DATABASE::"Project Commencement Order":
//                                            ReleaseDoc.ReleasePCOReq(Variant);
//                                            //WEP
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReleaseWEPReq(Variant);
//  
//                                            //Subcontract
//                                            DATABASE::"Subcontracting Header":
//                                            ReleaseDoc.ReleaseSubReq(Variant);
//                                            //Wep Submission
//                                            DATABASE::"WEP Contractor Submission":
//                                            ReleaseDoc.ReleaseWEPSubReq(Variant);
//                                            //Site Instructions
//                                            DATABASE::"Site Instructions Header":
//                                            ReleaseDoc.ReleaseSiteReq(Variant);
//                                            //TSR
//                                            DATABASE::"Temporary Supervision Requirem":
//                                            ReleaseDoc.ReleaseTSRReq(Variant);
//                                            //Insurance
//                                            DATABASE::"Insurance/Guarantee Header":
//                                            ReleaseDoc.ReleaseInsuranceReq(Variant);
//                                            //Project Meeting Reg
//                                            DATABASE::"Project Meeting Register":
//                                            ReleaseDoc.ReleasePMRReq(Variant);
//                                            //DWR
//                                            DATABASE::"Daily Work Record":
//                                            ReleaseDoc.ReleaseDWRReq(Variant);
//                                            //PVH
//                                            DATABASE::"Project Variation Header":
//                                            ReleaseDoc.ReleasePVHReq(Variant);
//                                            //PEH
//                                            DATABASE::"Project Evaluation Header":
//                                            ReleaseDoc.ReleasePEHReq(Variant);
//                                            //QM PLAN HEADER
//                                            DATABASE::"QM Plan Header":
//                                            ReleaseDoc.ReleaseQMPHReq(Variant);
//                                            //MEH
//                                            DATABASE::"Risk M&E Header":
//                                            ReleaseDoc.ReleaseMEHReq(Variant);
//                                            //RIL
//                                            DATABASE::"Risk Incident Log":
//                                            ReleaseDoc.ReleaseRILReq(Variant);
//                                            //MPH
//                                            DATABASE::"Measurement &  Payment Header":
//                                            ReleaseDoc.ReleaseMPHReq(Variant);
//                                            //IH
//                                            DATABASE::"Inspection Headersss":
//                                            ReleaseDoc.ReleaseIHReq(Variant);
//                                            //FA
//                                            DATABASE::"Final Account":
//                                            ReleaseDoc.ReleaseFAReq(Variant);
//  
//  
//  
//                                            //Driver out of office
//                                            DATABASE::"Driver Out of Office Req":
//                                            ReleaseDoc.ReleaseDriverReq(Variant);
//  
//                                            //Project Staff Voucher
//                                            DATABASE::"Project Staff Voucher":
//                                            ReleaseDoc.ReleaseSAVReq(Variant);
//  
//                                            //WEPPCO
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReleaseWEPPCOReq(Variant);
//  
//                                            //Bill Discounting
//                                            DATABASE::"Bill Discounting Header":
//                                            ReleaseDoc.ReleaseBDiscountReq(Variant);
//  
//                                          //Batch Payment
//                                            DATABASE::"Bank Payments Batching":
//                                            ReleaseDoc.ReleaseBPaymentReq(Variant);
//  
//                                           //Cash Request
//                                            DATABASE::"Cash Request Header":
//                                            ReleaseDoc.ReleaseCashReq(Variant);
//  
//                                           //Road Work Program
//                                            DATABASE::"Road Work Program":
//                                            ReleaseDoc.ReleaseRWPReq(Variant);
//  
//                                          //Asset Transfer
//                                            DATABASE::"HR Asset Transfer Header":
//                                            ReleaseDoc.ReleaseAssetTransferReq(Variant);
//  
//                                            //Training Plan
//                                             DATABASE::"Training Plan Header":
//                                            ReleaseDoc.ReleaseTrainingPlan(Variant);
//                                             //Bank Rec
//                                            DATABASE::"Bank Acc. Reconciliation":
//                                            ReleaseDoc.ReleaseBankRecReq(Variant);
//                                            //Tender Committe
//                                            DATABASE::"IFS Tender Committee":
//                                            ReleaseDoc.ReleaseTenderCommitte(Variant);
//                                            //Bid Evaluation
//                                            DATABASE::"Bid Evaluation Register":
//                                            ReleaseDoc.ReleaseBidEvaluation(Variant);
//                                            //Bid Opening
//                                            DATABASE::"Bid Opening Register":
//                                            ReleaseDoc.ReleaseBidOpening(Variant);
//                                            //Bid Tabulation
//                                            DATABASE::"Bid Tabulation Header":
//                                            ReleaseDoc.ReleaseBidTabulation(Variant);
//                                            //IFS
//                                            DATABASE::"Standard Purchase Code":
//                                            ReleaseDoc.ReleaseITT(Variant);
//                                             //Maintenance
//                                            DATABASE::"Fuel & Maintenance Requisition":
//                                            ReleaseDoc.ReleaseMaintenace(Variant);
//                                             //fuel reg
//                                            DATABASE::"Fuel & Maintenance Requisition":
//                                            ReleaseDoc.ReleaseFuelReq(Variant);
//                                            //recruitment
//                                            DATABASE::"Recruitment Requisition Header":
//                                            ReleaseDoc.ReleaseRequisitionHeader(Variant);
//                                            //end recruitment
//                                          #24..28
//                                          {<<<<<<<}
//                                          END;
//                                        END;
//  
//                           Target=ReleaseDocument(PROCEDURE 5) }
//      { Insertion         ;Target=OpenDocument(PROCEDURE 6);
//                           InsertAfter=TargetRecRef(Variable 1007);
//                           ChangedElements=VariableCollection
//                           {
//                             ReleaseImprestMemo@1455 : Codeunit "Imprest Memo";
//                             ReleasePayments@1004 : Codeunit Payments;
//                             ReleasePayPeriod@1800 : Codeunit "Release Payroll period";
//                             ReleaseDoc@1010 : Codeunit "Release Approval Document";
//                           }
//                            }
//      { Insertion         ;Target=OpenDocument(PROCEDURE 6);
//                           InsertAfter=Handled(Variable 1003);
//                           ChangedElements=VariableCollection
//                           {
//                             SubcontractingHeader@1025 : Record "Subcontracting Header";
//                             WEPContractorSubmission@1024 : Record "WEP Contractor Submission";
//                             SiteInstructionsHeader@1023 : Record "Site Instructions Header";
//                             TemporarySupervisionRequirem@1022 : Record "Temporary Supervision Requirem";
//                             InsuranceGuaranteeHeader@1021 : Record "Insurance/Guarantee Header";
//                             ProjectMeetingRegister@1020 : Record "Project Meeting Register";
//                             DailyWorkRecord@1019 : Record "Daily Work Record";
//                             ProjectVariationHeader@1018 : Record "Project Variation Header";
//                             ProjectEvaluationHeader@1017 : Record "Project Evaluation Header";
//                             QMPlanHeader@1016 : Record "QM Plan Header";
//                             RiskMEHeader@1015 : Record "Risk M&E Header";
//                             RiskIncidentLog@1014 : Record "Risk Incident Log";
//                             MeasurementPaymentHeader@1013 : Record "Measurement &  Payment Header";
//                             InspectionHeadersss@1012 : Record "Inspection Headersss";
//                             FinalAccount@1011 : Record "Final Account";
//                           }
//                            }
//      { CodeModification  ;OriginalCode=BEGIN
//                                          RecRef.GETTABLE(Variant);
//  
//                                          CASE RecRef.NUMBER OF
//                                          #4..20
//                                              ReleaseSalesDocument.Reopen(Variant);
//                                            DATABASE::"Incoming Document":
//                                              ReleaseIncomingDocument.Reopen(Variant);
//                                            ELSE BEGIN
//                                              OnOpenDocument(RecRef,Handled);
//                                              IF NOT Handled THEN
//                                                ERROR(UnsupportedRecordTypeErr,RecRef.CAPTION);
//                                            END;
//                                          END;
//                                        END;
//  
//                           ModifiedCode=BEGIN
//                                          {The code has been merged but contained errors that could prevent import
//                                          and the code has been put in comments. Use Shift+Ctrl+O to Uncomment}
//                                          #1..23
//                                               DATABASE::Vendor:
//                                            ReleaseDoc.ReopenVendor(Variant);
//  
//                                            //added by daudi
//                                              DATABASE::"Imprest Memo":
//                                              ReleaseDoc.ReopenImprestMemoReq(Variant);
//                                            DATABASE::payments:
//                                              ReleasePayments.Reopen(Variant);
//                                            DATABASE::"Payroll PeriodX":
//                                            ReleasePayPeriod.Reopen(Variant);
//                                            DATABASE::"HR Leave Applications":
//                                            ReleaseDoc.ReopenLeaveApp(Variant);
//                                            DATABASE::"Copyright Registration Table":
//                                            ReleaseDoc.ReopenCopyReg(Variant);
//                                            DATABASE::"Overtime Header":
//                                            ReleaseDoc.ReopenOvertime(Variant);
//  
//                                            DATABASE::"Training Requests":
//                                            ReleaseDoc.ReopenTrainingApp(Variant);
//  
//                                             DATABASE::"Grant Funding Application":
//                                            ReleaseDoc.ReopenGFA(Variant);
//                                             DATABASE::"Project Contract Header":
//                                            ReleaseDoc.ReopenProjectContract(Variant);
//                                              DATABASE::"Transport Requisition":
//                                            ReleaseDoc.ReopenFleet(Variant);
//                                            DATABASE::"Payroll Header":
//                                            ReleasePayments.PerformSalaryReopen(Variant);
//                                            //TSalary Vouchers
//                                            DATABASE::"Payroll HeaderT":
//                                            ReleasePayments.PerformTSalaryReopen(Variant);
//                                             //IncSalary Vouchers
//                                            DATABASE::"HR Salary Increament Header":
//                                            ReleasePayments.PerformIncSalaryReopen(Variant);
//                                            DATABASE::"Procurement Request":
//                                            ReleaseDoc.ReopenProcDoc(Variant);
//                                            DATABASE::"File Movement Header":
//                                            ReleaseDoc.ReopenFileMovement(Variant);
//                                            //Receipt Processing
//                                            DATABASE::"Receipts Header1":
//                                            ReleaseDoc.ReopenReceipt(Variant);
//  
//                                            DATABASE::"Request For Information":
//                                            ReleaseDoc.ReopenIFP(Variant);
//  
//                                            DATABASE::"Vendor Debarment Voucher":
//                                            ReleaseDoc.ReopenVendDebarment(Variant);
//  
//                                            DATABASE::"Procurement Plan":
//                                            ReleaseDoc.ReopenProcPlan(Variant);
//  
//                                           //Project Fundin
//                                            DATABASE::"Project Funding Request Vouche":
//                                            ReleaseDoc.ReopenProjectReq(Variant);
//  
//                                            //AIE Process
//                                            DATABASE::"Inter Bank Transfer":
//                                            ReleaseDoc.ReopenAIEReq(Variant);
//  
//                                             //PCO
//                                            DATABASE::"Project Commencement Order":
//                                            ReleaseDoc.ReopenPCOReq(Variant);
//                                             //WEP
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenWEPReq(Variant);
//  
//                                             //Sub
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenSubReq(Variant);
//                                               //WEPSub
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenWEPSubReq(Variant);
//                                               //Site
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenSiteReq(Variant);
//                                               //TSR
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenTSRReq(Variant);
//                                               //Insurance
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenInsuranceReq(Variant);
//                                               //PMR
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenPMRReq(Variant);
//                                               //DWR
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenDWRReq(Variant);
//                                               //PVH
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenPVHReq(Variant);
//                                               //PEH
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenPEHReq(Variant);
//                                               //QMPH
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenQMPHReq(Variant);
//                                               //MEH
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenMEHReq(Variant);
//                                               //RIL
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenRILReq(Variant);
//                                               //MPH
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenMPHReq(Variant);
//                                               //IH
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenIHReq(Variant);
//                                               //FA
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenFAReq(Variant);
//                                              //Driver out of office
//                                            DATABASE::"Driver Out of Office Req":
//                                            ReleaseDoc.ReopenDriverReq(Variant);
//  
//                                           //Project Staff Voucher
//                                            DATABASE::"Project Staff Voucher":
//                                            ReleaseDoc.ReopenSAVReq(Variant);
//  
//                                          //WEPPCO
//                                            DATABASE::"Project Mobilization Header":
//                                            ReleaseDoc.ReopenWEPPCOReq(Variant);
//  
//                                            //Bill Discount
//                                            DATABASE::"Bill Discounting Header":
//                                            ReleaseDoc.ReopenBDiscountReq(Variant);
//  
//                                            //Batch Payment
//                                            DATABASE::"Bank Payments Batching":
//                                            ReleaseDoc.ReopenBPaymentReq(Variant);
//  
//                                          //Cash Request
//                                            DATABASE::"Cash Request Header":
//                                            ReleaseDoc.ReopenCashReq(Variant);
//  
//                                           //Road Wor Program
//                                            DATABASE::"Road Work Program":
//                                            ReleaseDoc.ReopenRWPReq(Variant);
//  
//                                           //Asset Transfer
//                                            DATABASE::"HR Asset Transfer Header":
//                                            ReleaseDoc.ReopenAssetTransferReq(Variant);
//                                            //Training Plan
//                                            DATABASE::"Training Plan Header":
//                                            ReleaseDoc.ReopenTrainingPlan(Variant);
//  
//                                           //Bank Rec
//                                            DATABASE::"Inter Bank Transfer":
//                                            ReleaseDoc.ReopenBankRecReq(Variant);
//  
//                                          //Tender Committe
//                                            DATABASE::"IFS Tender Committee":
//                                            ReleaseDoc.ReopenTenderCommitte(Variant);
//  
//                                            //Bid Evaluation
//                                            DATABASE::"Bid Evaluation Register":
//                                            ReleaseDoc.ReopenBidEvaluation(Variant);
//                                            //Bid Opening
//                                            DATABASE::"Bid Opening Register":
//                                            ReleaseDoc.ReopenBidOpening(Variant);
//                                            //Bid Tabulation
//                                            DATABASE::"Bid Tabulation Header":
//                                            ReleaseDoc.ReopenBidTabulation(Variant);
//                                            //IFS
//                                            DATABASE::"Standard Purchase Code":
//                                            ReleaseDoc.ReopenITT(Variant);
//                                             //Maintenance
//                                            DATABASE::"Fuel & Maintenance Requisition":
//                                            ReleaseDoc.ReopenMaintenace(Variant);
//                                             //Fuel Reg
//                                            DATABASE::"Fuel & Maintenance Requisition":
//                                            ReleaseDoc.ReopenFuelReq(Variant);
//                                             //recruitment
//                                            DATABASE::"Recruitment Requisition Header":
//                                            ReleaseDoc.ReopenRequisitionHeader(Variant);
//                                            //end recruitment
//                                          #24..28
//                                          {<<<<<<<}
//                                          END;
//                                        END;
//  
//                           Target=OpenDocument(PROCEDURE 6) }
//      { Insertion         ;InsertAfter=DiscardNewValuesTxt(Variable 1001);
//                           ChangedElements=VariableCollection
//                           {
//                             Wresponse@1048 : Codeunit "Dynasoft Workflow Responses";
//                             WorkflowManagement@1049 : Codeunit "Workflow Management";
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



