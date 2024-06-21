#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 99502 "Workflow Event Handling1520"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Workflow Event Handling"(Codeunit 1520)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09012022D;
        //      Time=011121T;
        //      Modified=Yes;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Workflow Event Handling"(Codeunit 1520);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          AddEventToLibrary(
        //                                            RunWorkflowOnAfterInsertIncomingDocumentCode,DATABASE::"Incoming Document",IncDocCreatedEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(
        //                                          #4..98
        //                                            RunWorkflowOnAfterCreateGenJnlLineFromIncomingDocFailCode,DATABASE::"Incoming Document",
        //                                            CreateGenJnlLineFromIncDocFailsEventDescTxt,0,FALSE);
        //  
        //                                          OnAddWorkflowEventsToLibrary;
        //                                          OnAddWorkflowTableRelationsToLibrary;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..101
        //                                          //added by daudi on 09/05/2017
        //                                          AddEventToLibrary(RunWorkflowOnSendImpMemoForApprovalCode,DATABASE::"Imprest Memo",
        //                                            ImpMemoSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelImpMemoApprovalRequestCode,DATABASE::"Imprest Memo",
        //                                            ImpMemoApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseImpMemoCode,DATABASE::"Imprest Memo",
        //                                            ImpMemoReleasedEventDescTxt,0,FALSE);
        //  
        //                                          AddEventToLibrary(RunWorkflowOnSendPaymentsForApprovalCode,DATABASE::payments,
        //                                            PaymentsSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelPaymentsApprovalRequestCode,DATABASE::payments,
        //                                            PaymentsApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePaymentsCode,DATABASE::payments,
        //                                            PaymentsReleasedEventDescTxt,0,FALSE);
        //  
        //                                          AddEventToLibrary(RunWorkflowOnSendPayPeriodForApprovalCode,DATABASE::"Payroll PeriodX",
        //                                            PayPeriodSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelPayPeriodApprovalRequestCode,DATABASE::"Payroll PeriodX",
        //                                            PayPeriodApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePayPeriodCode,DATABASE::"Payroll PeriodX",
        //                                            PayPeriodReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///copyright registation
        //                                          AddEventToLibrary(RunWorkflowOnSendCopyRegForApprovalCode,DATABASE::"Copyright Registration Table",
        //                                            CopyRegSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelCopyRegApprovalRequestCode,DATABASE::"Copyright Registration Table",
        //                                            CopyRegApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseCopyRegCode,DATABASE::"Copyright Registration Table",
        //                                            CopyRegReleasedEventDescTxt,0,FALSE);
        //                                          //
        //                                          ///Overtime Application
        //                                          AddEventToLibrary(RunWorkflowOnSendOvertimeForApprovalCode,DATABASE::"Overtime Header",
        //                                            OvertimeSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelOvertimeApprovalRequestCode,DATABASE::"Overtime Header",
        //                                            OvertimeApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseOvertimeCode,DATABASE::"Overtime Header",
        //                                            OvertimeReleasedEventDescTxt,0,FALSE);
        //                                          //
        //                                          ///Training Application
        //                                          AddEventToLibrary(RunWorkflowOnSendTApplicationForApprovalCode,DATABASE::"Training Requests",
        //                                            TrainingAppSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelTApplicationApprovalRequestCode,DATABASE::"Training Requests",
        //                                            TrainingAPPApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseTApplicationCode,DATABASE::"Training Requests",
        //                                            TrainingAPPReleasedEventDescTxt,0,FALSE);
        //  
        //  
        //                                          ///Salary Voucher
        //                                          AddEventToLibrary(RunWorkflowOnSendSalaryForApprovalCode,DATABASE::"Payroll Header",
        //                                            SalarySendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelSalaryApprovalRequestCode,DATABASE::"Payroll Header",
        //                                            SalaryApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseSalaryCode,DATABASE::"Payroll Header",
        //                                            SalaryReleasedEventDescTxt,0,FALSE);
        //                                          //
        //  
        //                                          ///Temporary Employee Salary Voucher
        //                                          AddEventToLibrary(RunWorkflowOnSendTSalaryForApprovalCode,DATABASE::"Payroll HeaderT",
        //                                            TSalarySendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelTSalaryApprovalRequestCode,DATABASE::"Payroll HeaderT",
        //                                            TSalaryApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseTSalaryCode,DATABASE::"Payroll HeaderT",
        //                                            TSalaryReleasedEventDescTxt,0,FALSE);
        //                                          //
        //  
        //                                          ///HR Salary Increament Voucher
        //                                          AddEventToLibrary(RunWorkflowOnSendIncSalaryForApprovalCode,DATABASE::"HR Salary Increament Header",
        //                                            IncSalarySendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelIncSalaryApprovalRequestCode,DATABASE::"HR Salary Increament Header",
        //                                            IncSalaryApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseIncSalaryCode,DATABASE::"HR Salary Increament Header",
        //                                            IncSalaryReleasedEventDescTxt,0,FALSE);
        //                                          //
        //  
        //                                          ///Grant Funding Application
        //                                          AddEventToLibrary(RunWorkflowOnSendGFAForApprovalCode,DATABASE::"Grant Funding Application",
        //                                            GFASendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelGFAApprovalRequestCode,DATABASE::"Grant Funding Application",
        //                                            GFAApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseGFACode,DATABASE::"Grant Funding Application",
        //                                            GFAReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Project Contract
        //                                          AddEventToLibrary(RunWorkflowOnSendProjectContractForApprovalCode,DATABASE::"Project Contract Header",
        //                                            ProjectContractSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelProjectContractApprovalRequestCode,DATABASE::"Project Contract Header",
        //                                            ProjectContractApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseProjectContractCode,DATABASE::"Project Contract Header",
        //                                            ProjectContractReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Fleet Requisition
        //                                          AddEventToLibrary(RunWorkflowOnSendFleetForApprovalCode,DATABASE::"Transport Requisition",
        //                                            FleetSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelFleetApprovalRequestCode,DATABASE::"Transport Requisition",
        //                                            FleetApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseFleetCode,DATABASE::"Transport Requisition",
        //                                            FleetReleasedEventDescTxt,0,FALSE);
        //  
        //  
        //                                          ///Insurance Requisition
        //                                          AddEventToLibrary(RunWorkflowOnSendInsurancehHForApprovalCode,DATABASE::"Insurance Header",
        //                                            InsurancehHSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelInsuranceHApprovalRequestCode,DATABASE::"Insurance Header",
        //                                            InsuranceHCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseInsuranceHCode,DATABASE::"Insurance Header",
        //                                            InsuranceHReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Procurement Methods
        //                                          AddEventToLibrary(RunWorkflowOnSendProcDocForApprovalCode,DATABASE::"Procurement Request",
        //                                            ProcDocSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelProcDocApprovalRequestCode,DATABASE::"Procurement Request",
        //                                            ProcDocApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseProcDocCode,DATABASE::"Procurement Request",
        //                                            ProcDOcReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///File Movement
        //                                          AddEventToLibrary(RunWorkflowOnSendFileMovementForApprovalCode,DATABASE::"File Movement Header",
        //                                            FileMovementSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelFileMovementApprovalRequestCode,DATABASE::"File Movement Header",
        //                                            FileMovementApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseFileMovementCode,DATABASE::"File Movement Header",
        //                                            FileMovementReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Receipt Processing
        //                                          AddEventToLibrary(RunWorkflowOnSendReceiptForApprovalCode,DATABASE::"Receipts Header1",
        //                                            ReceiptSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelReceiptApprovalRequestCode,DATABASE::"Receipts Header1",
        //                                            ReceiptApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseReceiptCode,DATABASE::"Receipts Header1",
        //                                            ReceiptReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Request for Information
        //                                          AddEventToLibrary(RunWorkflowOnSendIFPForApprovalCode,DATABASE::"Request For Information",
        //                                            IFPSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelIFPApprovalRequestCode,DATABASE::"Request For Information",
        //                                            IFPApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseIFPCode,DATABASE::"Request For Information",
        //                                            IFPReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Vendor Debarment Voucher
        //                                          AddEventToLibrary(RunWorkflowOnSendVendDebarmentForApprovalCode,DATABASE::"Vendor Debarment Voucher",
        //                                            VendDebarmentSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelVendDebarmentApprovalRequestCode,DATABASE::"Vendor Debarment Voucher",
        //                                            VendDebarmentApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseVendDebarmentCode,DATABASE::"Vendor Debarment Voucher",
        //                                            VendDebarmentReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Procurement Methods
        //                                          AddEventToLibrary(RunWorkflowOnSendProcPlanForApprovalCode,DATABASE::"Procurement Plan",
        //                                            ProcPlanSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelProcPlanApprovalRequestCode,DATABASE::"Procurement Plan",
        //                                            ProcPlanApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseProcPlanCode,DATABASE::"Procurement Plan",
        //                                            ProcPlanReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Project Fundin Request
        //                                          AddEventToLibrary(RunWorkflowOnSendProjectReqForApprovalCode,DATABASE::"Project Funding Request Vouche",
        //                                            ProjectReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelProjectReqApprovalRequestCode,DATABASE::"Project Funding Request Vouche",
        //                                            ProjectReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseProjectReqCode,DATABASE::"Project Funding Request Vouche",
        //                                            ProjectReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //AIE Process
        //                                          AddEventToLibrary(RunWorkflowOnSendAIEReqForApprovalCode,DATABASE::"Inter Bank Transfer",
        //                                            AIEReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelAIEReqApprovalRequestCode,DATABASE::"Inter Bank Transfer",
        //                                            AIEReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseAIEReqCode,DATABASE::"Inter Bank Transfer",
        //                                           AIEReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //PCO
        //                                          AddEventToLibrary(RunWorkflowOnSendPCOReqForApprovalCode,DATABASE::"Project Commencement Order",
        //                                            PCOReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelPCOReqApprovalRequestCode,DATABASE::"Project Commencement Order",
        //                                            PCOReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePCOReqCode,DATABASE::"Project Commencement Order",
        //                                           PCOReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //WEP
        //                                          AddEventToLibrary(RunWorkflowOnSendWEPReqForApprovalCode,DATABASE::"Project Mobilization Header",
        //                                            WEPReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelWEPReqApprovalRequestCode,DATABASE::"Project Mobilization Header",
        //                                            WEPReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseWEPReqCode,DATABASE::"Project Mobilization Header",
        //                                           WEPReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Subcontracting
        //                                          AddEventToLibrary(RunWorkflowOnSendSubReqForApprovalCode,DATABASE::"Subcontracting Header",
        //                                            SubReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelSubReqApprovalRequestCode,DATABASE::"Subcontracting Header",
        //                                            SubReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseSubReqCode,DATABASE::"Subcontracting Header",
        //                                           SubReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //WEP Contractor Submission
        //                                          AddEventToLibrary(RunWorkflowOnSendWEPSubReqForApprovalCode,DATABASE::"WEP Contractor Submission",
        //                                            WEPSubReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelWEPSubReqApprovalRequestCode,DATABASE::"WEP Contractor Submission",
        //                                            WEPSubReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseWEPSubReqCode,DATABASE::"WEP Contractor Submission",
        //                                           WEPSubReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Site Instructions
        //                                          AddEventToLibrary(RunWorkflowOnSendSiteReqForApprovalCode,DATABASE::"Site Instructions Header",
        //                                            SiteReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelSiteReqApprovalRequestCode,DATABASE::"Site Instructions Header",
        //                                            SiteReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseSiteReqCode,DATABASE::"Site Instructions Header",
        //                                           SiteReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //RMP
        //                                          AddEventToLibrary(RunWorkflowOnSendRMPReqForApprovalCode,DATABASE::"Risk Management Plan",
        //                                            RMPReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelRMPReqApprovalRequestCode,DATABASE::"Risk Management Plan",
        //                                            RMPReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseRMPReqCode,DATABASE::"Risk Management Plan",
        //                                           RMPReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Temporary Supervision Requirement
        //                                          AddEventToLibrary(RunWorkflowOnSendTSRReqForApprovalCode,DATABASE::"Temporary Supervision Requirem",
        //                                            TSRReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelTSRReqApprovalRequestCode,DATABASE::"Temporary Supervision Requirem",
        //                                            TSRReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseTSRReqCode,DATABASE::"Temporary Supervision Requirem",
        //                                           TSRReqReleasedEventDescTxt,0,FALSE);
        //  
        //  
        //                                          //Insurance
        //                                          AddEventToLibrary(RunWorkflowOnSendInsuranceReqForApprovalCode,DATABASE::"Insurance/Guarantee Header",
        //                                            InsuranceReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelInsuranceReqApprovalRequestCode,DATABASE::"Insurance/Guarantee Header",
        //                                            InsuranceReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseInsuranceReqCode,DATABASE::"Insurance/Guarantee Header",
        //                                           InsuranceReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Project Meeting Register
        //                                          AddEventToLibrary(RunWorkflowOnSendPMRReqForApprovalCode,DATABASE::"Project Meeting Register",
        //                                            PMRReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelPMRReqApprovalRequestCode,DATABASE::"Project Meeting Register",
        //                                            PMRReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePMRReqCode,DATABASE::"Project Meeting Register",
        //                                           PMRReqReleasedEventDescTxt,0,FALSE);
        //                                           //Fred Alifika Hapa Leo 10/02/2022(1624hrs)
        //  
        //                                          //Daily Work Record
        //                                          AddEventToLibrary(RunWorkflowOnSendDWRReqForApprovalCode,DATABASE::"Daily Work Record",
        //                                            DWRReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelDWRReqApprovalRequestCode,DATABASE::"Daily Work Record",
        //                                            DWRReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseDWRReqCode,DATABASE::"Daily Work Record",
        //                                           DWRReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Project Variation Header
        //                                          AddEventToLibrary(RunWorkflowOnSendPVHReqForApprovalCode,DATABASE::"Project Variation Header",
        //                                            PVHReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelPVHReqApprovalRequestCode,DATABASE::"Project Variation Header",
        //                                            PVHReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePVHReqCode,DATABASE::"Project Variation Header",
        //                                           PVHReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Project Evaluation Header
        //                                          AddEventToLibrary(RunWorkflowOnSendPEHReqForApprovalCode,DATABASE::"Project Evaluation Header",
        //                                            PEHReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelPEHReqApprovalRequestCode,DATABASE::"Project Evaluation Header",
        //                                            PEHReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePEHReqCode,DATABASE::"Project Evaluation Header",
        //                                           PEHReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //QM Plan Header
        //                                          AddEventToLibrary(RunWorkflowOnSendQMPHReqForApprovalCode,DATABASE::"QM Plan Header",
        //                                            QMPHReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelQMPHReqApprovalRequestCode,DATABASE::"QM Plan Header",
        //                                            QMPHReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseQMPHReqCode,DATABASE::"QM Plan Header",
        //                                           QMPHReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Risk M&E Header
        //                                          AddEventToLibrary(RunWorkflowOnSendMEHReqForApprovalCode,DATABASE::"Risk M&E Header",
        //                                            MEHReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelMEHReqApprovalRequestCode,DATABASE::"Risk M&E Header",
        //                                            MEHReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseMEHReqCode,DATABASE::"Risk M&E Header",
        //                                           MEHReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Risk Incident Log
        //                                          AddEventToLibrary(RunWorkflowOnSendRILReqForApprovalCode,DATABASE::"Risk Incident Log",
        //                                            RILReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelRILReqApprovalRequestCode,DATABASE::"Risk Incident Log",
        //                                            RILReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseRILReqCode,DATABASE::"Risk Incident Log",
        //                                           RILReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Measurement & Payment Header
        //                                          AddEventToLibrary(RunWorkflowOnSendMPHReqForApprovalCode,DATABASE::"Measurement &  Payment Header",
        //                                            MPHReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelMPHReqApprovalRequestCode,DATABASE::"Measurement &  Payment Header",
        //                                            MPHReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseMPHReqCode,DATABASE::"Measurement &  Payment Header",
        //                                           MPHReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Inspection Header
        //                                          AddEventToLibrary(RunWorkflowOnSendIHReqForApprovalCode,DATABASE::"Inspection Headersss",
        //                                            IHReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelIHReqApprovalRequestCode,DATABASE::"Inspection Headersss",
        //                                            IHReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseIHReqCode,DATABASE::"Inspection Headersss",
        //                                           IHReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Final Account
        //                                          AddEventToLibrary(RunWorkflowOnSendFAReqForApprovalCode,DATABASE::"Final Account",
        //                                            FAReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelFAReqApprovalRequestCode,DATABASE::"Final Account",
        //                                            FAReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseFAReqCode,DATABASE::"Final Account",
        //                                           FAReqReleasedEventDescTxt,0,FALSE);
        //  
        //  
        //                                          //Driver out of Office
        //                                          AddEventToLibrary(RunWorkflowOnSendDriverReqForApprovalCode,DATABASE::"Driver Out of Office Req",
        //                                            DriverReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelDriverReqApprovalRequestCode,DATABASE::"Driver Out of Office Req",
        //                                            DriverReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseDriverReqCode,DATABASE::"Driver Out of Office Req",
        //                                           DriverReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Staff Appointment Vouchers
        //                                          AddEventToLibrary(RunWorkflowOnSendSAVReqForApprovalCode,DATABASE::"Project Staff Voucher",
        //                                            SAVReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelSAVReqApprovalRequestCode,DATABASE::"Project Staff Voucher",
        //                                            SAVReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseSAVReqCode,DATABASE::"Project Staff Voucher",
        //                                           SAVPReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //WEPPCO
        //                                          AddEventToLibrary(RunWorkflowOnSendWEPPCOReqForApprovalCode,DATABASE::"Project Mobilization Header",
        //                                            WEPPCOReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelWEPPCOReqApprovalRequestCode,DATABASE::"Project Mobilization Header",
        //                                            WEPPCOReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseWEPPCOReqCode,DATABASE::"Project Mobilization Header",
        //                                           WEPPCOPReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Bill Discounting
        //                                          AddEventToLibrary(RunWorkflowOnSendBDiscountReqForApprovalCode,DATABASE::"Bill Discounting Header",
        //                                            BDiscountReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelBDiscountReqApprovalRequestCode,DATABASE::"Bill Discounting Header",
        //                                            BDiscountReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBDiscountReqCode,DATABASE::"Bill Discounting Header",
        //                                           BDiscountPReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //KCB Batch Payment
        //                                          AddEventToLibrary(RunWorkflowOnSendBPaymentReqForApprovalCode,DATABASE::"Bank Payments Batching",
        //                                            BPaymentReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelBPaymentReqApprovalRequestCode,DATABASE::"Bank Payments Batching",
        //                                            BPaymentReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBPaymentReqCode,DATABASE::"Bank Payments Batching",
        //                                           BPaymentPReqReleasedEventDescTxt,0,FALSE);
        //  
        //  
        //                                          //Cash Request
        //                                          AddEventToLibrary(RunWorkflowOnSendCashReqForApprovalCode,DATABASE::"Cash Request Header",
        //                                            CashReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelCashReqApprovalRequestCode,DATABASE::"Cash Request Header",
        //                                            CashReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseCashReqCode,DATABASE::"Cash Request Header",
        //                                           CashPReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Road Work Program
        //                                          AddEventToLibrary(RunWorkflowOnSendRWPReqForApprovalCode,DATABASE::"Road Work Program",
        //                                            RWPReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelRWPReqApprovalRequestCode,DATABASE::"Road Work Program",
        //                                            RWPReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseRWPReqCode,DATABASE::"Road Work Program",
        //                                           RWPReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Asset Transfer
        //                                          AddEventToLibrary(RunWorkflowOnSendAssetTransferReqForApprovalCode,DATABASE::"HR Asset Transfer Header",
        //                                            AssetTransferReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelAssetTransferReqApprovalRequestCode,DATABASE::"HR Asset Transfer Header",
        //                                            AssetTransferReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseAIEReqCode,DATABASE::"HR Asset Transfer Header",
        //                                           AssetTransferReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Bank Recon
        //                                          AddEventToLibrary(RunWorkflowOnSendBankRecReqForApprovalCode,DATABASE::"Bank Acc. Reconciliation",
        //                                            BankRecReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelBankRecReqApprovalRequestCode,DATABASE::"Bank Acc. Reconciliation",
        //                                            BankRecReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBankRecReqCode,DATABASE::"Bank Acc. Reconciliation",
        //                                           BankRecReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                           //Training Plan
        //                                           AddEventToLibrary(RunWorkflowOnSendTPlanForApprovalCode,DATABASE::"Training Plan Header",
        //                                            TPlanSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelTPlanApprovalRequestCode,DATABASE::"Training Plan Header",
        //                                            TPlanApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseTPlanCode,DATABASE::"Training Plan Header",
        //                                           TPlanReleasedEventDescTxt,0,FALSE);
        //                                            ///Tender Committee
        //                                          AddEventToLibrary(RunWorkflowOnSendTenderCommitteForApprovalCode,DATABASE::"IFS Tender Committee",
        //                                            TenderCommitteSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelTenderCommitteApprovalRequestCode,DATABASE::"IFS Tender Committee",
        //                                            TenderCommitteApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseTenderCommitteCode,DATABASE::"IFS Tender Committee",
        //                                            TenderCommitteReleasedEventDescTxt,0,FALSE);
        //                                            ///Bid Evaluation
        //                                          AddEventToLibrary(RunWorkflowOnSendBidEvaluationForApprovalCode,DATABASE::"Bid Evaluation Register",
        //                                            BidEvaluationSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelBidEvaluationApprovalRequestCode,DATABASE::"Bid Evaluation Register",
        //                                            BidEvaluationApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBidEvaluationCode,DATABASE::"Bid Evaluation Register",
        //                                            BidEvaluationReleasedEventDescTxt,0,FALSE);
        //                                            ///Bid Opening
        //                                          AddEventToLibrary(RunWorkflowOnSendBidOpeningForApprovalCode,DATABASE::"Bid Opening Register",
        //                                            BidOpeningSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelBidOpeningApprovalRequestCode,DATABASE::"Bid Opening Register",
        //                                            BidOpeningApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBidOpeningCode,DATABASE::"Bid Opening Register",
        //                                            BidOpeningReleasedEventDescTxt,0,FALSE);
        //                                            ///Bid Tabulation
        //                                          AddEventToLibrary(RunWorkflowOnSendBidTabulationForApprovalCode,DATABASE::"Bid Tabulation Header",
        //                                            BidTabulationSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelBidTabulationApprovalRequestCode,DATABASE::"Bid Tabulation Header",
        //                                            BidTabulationApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBidTabulationCode,DATABASE::"Bid Tabulation Header",
        //                                            BidTabulationReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Invitation For Supply
        //                                          AddEventToLibrary(RunWorkflowOnSendIFSForApprovalCode,DATABASE::"Standard Purchase Code",
        //                                            IFSSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelIFSApprovalRequestCode,DATABASE::"Standard Purchase Code",
        //                                            IFSApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseIFSCode,DATABASE::"Standard Purchase Code",
        //                                            IFSReleasedEventDescTxt,0,FALSE);
        //                                          ///MAintenance
        //                                          AddEventToLibrary(RunWorkflowOnSendMaintenanceForApprovalCode,DATABASE::"Fuel & Maintenance Requisition",
        //                                            MaintenanceSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelMaintenanceApprovalRequestCode,DATABASE::"Fuel & Maintenance Requisition",
        //                                            MaintenanceApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseMaintenanceCode,DATABASE::"Fuel & Maintenance Requisition",
        //                                            MaintenanceReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Insurance H
        //                                          AddEventToLibrary(RunWorkflowOnSendInsuranceForApprovalCode,DATABASE::"Insurance Header",
        //                                            InsuranceSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelInsuranceApprovalRequestCode,DATABASE::"Insurance Header",
        //                                            InsuranceApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseInsuranceCode,DATABASE::"Insurance Header",
        //                                            InsuranceReleasedEventDescTxt,0,FALSE);
        //  
        //                                          ///Fuel Req
        //                                          AddEventToLibrary(RunWorkflowOnSendFuelReqForApprovalCode,DATABASE::"Fuel & Maintenance Requisition",
        //                                            FuelReqSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelFuelReqApprovalRequestCode,DATABASE::"Fuel & Maintenance Requisition",
        //                                            FuelReqApprReqCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseFuelReqCode,DATABASE::"Fuel & Maintenance Requisition",
        //                                            FuelReqReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //Start of Recruitment
        //  
        //                                           //Requisition
        //                                           AddEventToLibrary(RunWorkflowOnSendRecRequisitionqForApprovalCode,DATABASE::"Recruitment Requisition Header",
        //                                            RecRequisitionSendForApprovalEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnCancelRecRequisitionApprovalRequestCode,DATABASE::"Recruitment Requisition Header",
        //                                            RecRequisitionCancelledEventDescTxt,0,FALSE);
        //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseRecRequisitionCode,DATABASE::"Recruitment Requisition Header",
        //                                           RecRequisitionReleasedEventDescTxt,0,FALSE);
        //  
        //                                          //End of Recruitment
        //  
        //                                          WREvents.AddEventsToLib;
        //                                          OnAddWorkflowEventsToLibrary;
        //                                          OnAddWorkflowTableRelationsToLibrary;
        //                                        END;
        //  
        //                           Target=CreateEventsLibrary(PROCEDURE 13) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CASE EventFunctionName OF
        //                                            RunWorkflowOnAfterPostPurchaseDocCode:
        //                                              AddEventPredecessor(RunWorkflowOnAfterPostPurchaseDocCode,RunWorkflowOnAfterReleasePurchaseDocCode);
        //                                          #4..22
        //                                              AddEventPredecessor(RunWorkflowOnCustomerCreditLimitExceededCode,RunWorkflowOnSendSalesDocForApprovalCode);
        //                                            RunWorkflowOnCustomerCreditLimitNotExceededCode:
        //                                              AddEventPredecessor(RunWorkflowOnCustomerCreditLimitNotExceededCode,RunWorkflowOnSendSalesDocForApprovalCode);
        //                                            RunWorkflowOnApproveApprovalRequestCode:
        //                                              BEGIN
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIncomingDocForApprovalCode);
        //                                          #29..36
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnCustomerChangedCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnVendorChangedCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnItemChangedCode);
        //                                              END;
        //                                            RunWorkflowOnRejectApprovalRequestCode:
        //                                              BEGIN
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendIncomingDocForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendPurchaseDocForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendSalesDocForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendCustomerForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendVendorForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendItemForApprovalCode);
        //                                          #49..51
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnCustomerChangedCode);
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnVendorChangedCode);
        //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnItemChangedCode);
        //                                              END;
        //                                            RunWorkflowOnDelegateApprovalRequestCode:
        //                                              BEGIN
        //                                          #58..66
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnCustomerChangedCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnVendorChangedCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnItemChangedCode);
        //                                              END;
        //                                            RunWorkflowOnGeneralJournalBatchBalancedCode:
        //                                              AddEventPredecessor(RunWorkflowOnGeneralJournalBatchBalancedCode,RunWorkflowOnSendGeneralJournalBatchForApprovalCode);
        //                                            RunWorkflowOnGeneralJournalBatchNotBalancedCode:
        //                                              AddEventPredecessor(RunWorkflowOnGeneralJournalBatchNotBalancedCode,RunWorkflowOnSendGeneralJournalBatchForApprovalCode);
        //                                          END;
        //  
        //                                          OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..25
        //                                            //added by daudi on 09/05/2017
        //                                            RunWorkflowOnCancelImpMemoApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelImpMemoApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
        //                                            RunWorkflowOnCancelPaymentsApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelPaymentsApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
        //  
        //                                            //Receipt Processing
        //                                             RunWorkflowOnCancelPaymentsApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelReceiptApprovalRequestCode,RunWorkflowOnSendReceiptForApprovalCode);
        //                                            //Receipt Processing
        //                                             RunWorkflowOnCancelPayPeriodApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelPayPeriodApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
        //  
        //                                            //copyright registration
        //                                            RunWorkflowOnCancelCopyRegApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelCopyRegApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
        //  
        //                                            //
        //                                             RunWorkflowOnCancelOvertimeApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelOvertimeApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
        //                                             RunWorkflowOnCancelTApplicationApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelTApplicationApprovalRequestCode,RunWorkflowOnSendTApplicationForApprovalCode);
        //                                            RunWorkflowOnCancelSalaryApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelSalaryApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
        //                                            RunWorkflowOnCancelProcDocApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelProcDocApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
        //                                            RunWorkflowOnCancelFileMovementApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelFileMovementApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
        //                                            RunWorkflowOnCancelIFPApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelIFPApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
        //                                            RunWorkflowOnCancelVendDebarmentApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelVendDebarmentApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
        //                                            RunWorkflowOnCancelProcPlanApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelProcPlanApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
        //                                              //Project Fundin
        //                                            RunWorkflowOnCancelProjectReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelProjectReqApprovalRequestCode,RunWorkflowOnSendProjectReqForApprovalCode);
        //                                            //AIE Process
        //                                            RunWorkflowOnCancelAIEReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelAIEReqApprovalRequestCode,RunWorkflowOnSendAIEReqForApprovalCode);
        //  
        //                                            //PCO
        //                                            RunWorkflowOnCancelPCOReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelPCOReqApprovalRequestCode,RunWorkflowOnSendPCOReqForApprovalCode);
        //  
        //  
        //  
        //                                             //WEP
        //                                            RunWorkflowOnCancelWEPReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelWEPReqApprovalRequestCode,RunWorkflowOnSendWEPReqForApprovalCode);
        //  
        //                                            //Anzia Hapa Saasa Fred 11/02/2022 at 1320hrs
        //                                               //Subconracting Header
        //                                            RunWorkflowOnCancelSubReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelSubReqApprovalRequestCode,RunWorkflowOnSendSubReqForApprovalCode);
        //  
        //                                             //WEP Contractor Submission
        //                                            RunWorkflowOnCancelWEPSubReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelWEPSubReqApprovalRequestCode,RunWorkflowOnSendSubReqForApprovalCode);
        //                                            //Site Instructions
        //                                            RunWorkflowOnCancelSiteReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelSiteReqApprovalRequestCode,RunWorkflowOnSendSiteReqForApprovalCode);
        //  
        //                                            //RMP(Risk Management Plan)
        //                                            RunWorkflowOnCancelRMPReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelRMPReqApprovalRequestCode,RunWorkflowOnSendRMPReqForApprovalCode);
        //                                            //Temporary Supervision Requirement
        //                                            RunWorkflowOnCancelTSRReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelTSRReqApprovalRequestCode,RunWorkflowOnSendTSRReqForApprovalCode);
        //                                            //Insurance/Guarantee Header
        //                                            RunWorkflowOnCancelInsuranceReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelInsuranceReqApprovalRequestCode,RunWorkflowOnSendInsuranceReqForApprovalCode);
        //                                            //Project Meeting Register
        //                                            RunWorkflowOnCancelPMRReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelPMRReqApprovalRequestCode,RunWorkflowOnSendPMRReqForApprovalCode);
        //                                            //Daily Work Record
        //                                            RunWorkflowOnCancelDWRReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelDWRReqApprovalRequestCode,RunWorkflowOnSendDWRReqForApprovalCode);
        //  
        //                                             //Driver out of Office
        //                                            RunWorkflowOnCancelDriverReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelDriverReqApprovalRequestCode,RunWorkflowOnSendDriverReqForApprovalCode);
        //  
        //                                            //Project Variation Header
        //                                            RunWorkflowOnCancelPVHReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelPVHReqApprovalRequestCode,RunWorkflowOnSendPVHReqForApprovalCode);
        //  
        //                                            //Project Evaluation Header
        //                                            RunWorkflowOnCancelPEHReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelPEHReqApprovalRequestCode,RunWorkflowOnSendPEHReqForApprovalCode);
        //                                            //QM Plan Header
        //                                            RunWorkflowOnCancelQMPHReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelQMPHReqApprovalRequestCode,RunWorkflowOnSendQMPHReqForApprovalCode);
        //                                            //Risk M&E Header
        //                                            RunWorkflowOnCancelMEHReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelMEHReqApprovalRequestCode,RunWorkflowOnSendMEHReqForApprovalCode);
        //  
        //                                            //Risk Incident Log
        //                                            RunWorkflowOnCancelRILReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelRILReqApprovalRequestCode,RunWorkflowOnSendRILReqForApprovalCode);
        //  
        //                                            //Measurement & Payment Header
        //                                            RunWorkflowOnCancelMPHReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelMPHReqApprovalRequestCode,RunWorkflowOnSendMPHReqForApprovalCode);
        //  
        //                                            //Inspection Header
        //                                            RunWorkflowOnCancelIHReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelIHReqApprovalRequestCode,RunWorkflowOnSendIHReqForApprovalCode);
        //  
        //                                            //Final Account
        //                                            RunWorkflowOnCancelFAReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelFAReqApprovalRequestCode,RunWorkflowOnSendFAReqForApprovalCode);
        //  
        //                                            //Staff Appointment Voucher
        //                                            RunWorkflowOnCancelSAVReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelSAVReqApprovalRequestCode,RunWorkflowOnSendSAVReqForApprovalCode);
        //  
        //                                            //WEPPCO
        //                                            RunWorkflowOnCancelWEPPCOReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelWEPPCOReqApprovalRequestCode,RunWorkflowOnSendWEPPCOReqForApprovalCode);
        //  
        //                                            //Bill Discounting//....Fred Alifika hapa msee
        //                                            RunWorkflowOnCancelBDiscountReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelBDiscountReqApprovalRequestCode,RunWorkflowOnSendBDiscountReqForApprovalCode);
        //  
        //                                             //KCB Batch Payment
        //                                            RunWorkflowOnCancelBPaymentReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelBPaymentReqApprovalRequestCode,RunWorkflowOnSendBPaymentReqForApprovalCode);
        //  
        //                                             //Cash Request
        //                                            RunWorkflowOnCancelCashReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelCashReqApprovalRequestCode,RunWorkflowOnSendCashReqForApprovalCode);
        //  
        //                                            //Road Work Program
        //                                            RunWorkflowOnCancelRWPReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelRWPReqApprovalRequestCode,RunWorkflowOnSendRWPReqForApprovalCode);
        //  
        //                                            //Asset Transfer
        //                                            RunWorkflowOnCancelAssetTransferReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelAssetTransferReqApprovalRequestCode,RunWorkflowOnSendAssetTransferReqForApprovalCode);
        //                                             //Bank Recon
        //                                             RunWorkflowOnCancelBankRecReqApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelBankRecReqApprovalRequestCode,RunWorkflowOnSendBankRecReqForApprovalCode);
        //                                            //TrainingPlan
        //                                            RunWorkflowOnCancelTPlanApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelTPlanApprovalRequestCode,RunWorkflowOnSendTPlanForApprovalCode);
        //                                            //Tender Committe
        //                                            RunWorkflowOnCancelTenderCommitteApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelTenderCommitteApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
        //                                            RunWorkflowOnCancelBidEvaluationApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelBidEvaluationApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
        //                                            RunWorkflowOnCancelBidOpeningApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelBidOpeningApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
        //                                            RunWorkflowOnCancelBidTabulationApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelBidTabulationApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
        //                                            RunWorkflowOnCancelIFSApprovalRequestCode:
        //                                            AddEventPredecessor(RunWorkflowOnCancelIFSApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
        //                                            RunWorkflowOnApproveApprovalRequestCode:
        //                                              AddEventPredecessor(RunWorkflowOnCancelMaintenanceApprovalRequestCode,RunWorkflowOnSendMaintenanceForApprovalCode);
        //                                            //insurance H
        //                                                RunWorkflowOnCancelInsuranceApprovalRequestCode:
        //                                            AddEventPredecessor(RunWorkflowOnCancelInsuranceApprovalRequestCode,RunWorkflowOnSendInsuranceForApprovalCode);
        //                                            RunWorkflowOnApproveApprovalRequestCode:
        //                                               AddEventPredecessor(RunWorkflowOnCancelFuelReqApprovalRequestCode,RunWorkflowOnSendFuelReqForApprovalCode);
        //                                            //start recruitment
        //                                            //requisition
        //                                             RunWorkflowOnApproveApprovalRequestCode:
        //                                               AddEventPredecessor(RunWorkflowOnCancelRecRequisitionApprovalRequestCode,RunWorkflowOnSendRecRequisitionqForApprovalCode);
        //  
        //                                            //end recruitment
        //  
        //                                          #26..39
        //                                              //added by daudi on 09/05/2017
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
        //                                                //Rceipt Processing
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendReceiptForApprovalCode);
        //                                                //Rceipt Processing
        //                                                  AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
        //                                                //Rceipt Processing
        //                                              //Copyright Registration
        //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
        //                                                //
        //                                                 //Overtime Application
        //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
        //                                                //
        //  
        //                                              //Grant Funding Application
        //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendGFAForApprovalCode);
        //                                                //Project Contracts
        //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProjectContractForApprovalCode);
        //                                              //Fleet Requisition
        //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFleetForApprovalCode);
        //                                                //
        //                                                    //Insurance Requisition
        //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInsurancehHForApprovalCode);
        //                                              //
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTApplicationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
        //                                                //Project Fundin
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProjectReqForApprovalCode);
        //                                                //AIE Process
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendAIEReqForApprovalCode);
        //                                                //PCO
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPCOReqForApprovalCode);
        //                                                //WEP
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendWEPReqForApprovalCode);
        //                                                //SubContracting
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSubReqForApprovalCode);
        //                                                //WEP Contractor Submission
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendWEPSubReqForApprovalCode);
        //                                                //Site Instructions
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSiteReqForApprovalCode);
        //                                                //RMP
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRMPReqForApprovalCode);
        //                                                //Temporary Supervision Requirement
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTSRReqForApprovalCode);
        //                                                //Insurance
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInsuranceReqForApprovalCode);
        //                                                //Project Meeting Reg
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPMRReqForApprovalCode);
        //                                                //Daily Work Record
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendDWRReqForApprovalCode);
        //                                                //Project Variation Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPVHReqForApprovalCode);
        //                                                //Project Evaluation Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPEHReqForApprovalCode);
        //                                                //QM Plan Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendQMPHReqForApprovalCode);
        //                                                //Risk M&E Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendMEHReqForApprovalCode);
        //                                                //Risk Incident Log
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRILReqForApprovalCode);
        //                                                //Measurement & Payment Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendMPHReqForApprovalCode);
        //                                                //Inspection Header
        //                                                 AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIHReqForApprovalCode);
        //                                                 //Final Account
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFAReqForApprovalCode);
        //                                                //Driver out of office
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendDriverReqForApprovalCode);
        //                                                 //STaff Appointment Voucher
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSAVReqForApprovalCode);
        //  
        //                                               //WEPPCO
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendWEPPCOReqForApprovalCode);
        //  
        //                                                //Bill Discounting
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBDiscountReqForApprovalCode);
        //  
        //                                                //KCB Batch Payment
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBPaymentReqForApprovalCode);
        //                                               //Cash Request
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCashReqForApprovalCode);
        //                                                //Road Work Program
        //  
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRWPReqForApprovalCode);
        //                                                //Asset Transfer
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendAssetTransferReqForApprovalCode);
        //                                                //Bank Rec
        //                                                 AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBankRecReqForApprovalCode);
        //                                                //Training Plan
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTPlanForApprovalCode);
        //                                                //Tender Committe
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendMaintenanceForApprovalCode);
        //                                                //Insurance H
        //                                                   AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInsuranceForApprovalCode);
        //  
        //  
        //  
        //  
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFuelReqForApprovalCode);
        //                                                //start recruitment
        //                                                  //requisition
        //                                                 AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRecRequisitionqForApprovalCode);
        //  
        //                                                //end recruitment
        //  
        //                                          #40..45
        //  
        //                                          #46..54
        //                                              //added by daudi on 09/05/2017
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
        //                                                //Receipt Processing
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendReceiptForApprovalCode);
        //                                                //Receipt Processing
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
        //                                                //copyright registration
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
        //                                                //
        //                                                //Overtime Application
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
        //                                                //
        //                                                //Grant Funding Application
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendGFAForApprovalCode);
        //                                                //
        //                                                //Project Contracts
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProjectContractForApprovalCode);
        //                                                //Fleet Requisition
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFleetForApprovalCode);
        //                                                //
        //                                                //insurance Requisition
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInsurancehHForApprovalCode);
        //                                                //
        //  
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTApplicationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
        //                                                //Project Fundin
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProjectReqForApprovalCode);
        //  
        //                                                //AIE Process
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendAIEReqForApprovalCode);
        //                                                //PCO
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPCOReqForApprovalCode);
        //                                                //WEP
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendWEPReqForApprovalCode);
        //  
        //                                               //Subcontracting
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSubReqForApprovalCode);
        //  
        //                                                 //WEP Contractor Submission
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendWEPSubReqForApprovalCode);
        //                                                 //Site Instructions
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSiteReqForApprovalCode);
        //                                                 //RMP
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRMPReqForApprovalCode);
        //                                                 //Temporary Supervision
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTSRReqForApprovalCode);
        //                                                 //Insurance
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInsuranceReqForApprovalCode);
        //                                                 //Project Meeting Register
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPMRReqForApprovalCode);
        //                                                 //Daily Work Record
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendDWRReqForApprovalCode);
        //                                                 //Project Variation
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPVHReqForApprovalCode);
        //                                                 //Project Evaluation
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPEHReqForApprovalCode);
        //                                                 //QM Plan Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendQMPHReqForApprovalCode);
        //                                                 //Risk M&E Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendMEHReqForApprovalCode);
        //                                                 //Risk Incident Log
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRILReqForApprovalCode);
        //                                                 //Measurement & Payment Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendMPHReqForApprovalCode);
        //                                                 //Inspection Header
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIHReqForApprovalCode);
        //                                                 //Final Account
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFAReqForApprovalCode);
        //  
        //                                                //Driver out of office
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendDriverReqForApprovalCode);
        //                                                 //Project Staff Voucher
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSAVReqForApprovalCode);
        //                                                //WEPPCO
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendWEPPCOReqForApprovalCode);
        //                                                //Bill Discounting
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBDiscountReqForApprovalCode);
        //  
        //                                                //KCB Batch Payment
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBPaymentReqForApprovalCode);
        //  
        //                                                //Cash Request
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCashReqForApprovalCode);
        //                                                //Road Work Program
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRWPReqForApprovalCode);
        //                                                 //Asset Transfer
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendAssetTransferReqForApprovalCode);
        //                                                //Bank Rec
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBankRecReqForApprovalCode);
        //                                                //Training Plan
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTPlanForApprovalCode);
        //                                                //Tender Committee
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendMaintenanceForApprovalCode);
        //                                                 AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInsuranceForApprovalCode);
        //                                                 //INSURANCE H
        //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFuelReqForApprovalCode);
        //                                                //start recruitment
        //                                                 AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendRecRequisitionqForApprovalCode);
        //  
        //                                                //end recruitment
        //                                          #55..69
        //                                              //added by daudi on 09/05/2017
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
        //                                                //Copyright registation
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
        //                                                //
        //                                                //Overtime Application
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
        //                                                //
        //                                                //Grant Funding Application
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendGFAForApprovalCode);
        //                                                //Project Contract
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendProjectContractForApprovalCode);
        //                                                 //Fleet Requisition
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendFleetForApprovalCode);
        //                                                //
        //  
        //                                           //insurance Requisition
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendInsurancehHForApprovalCode);
        //                                                //
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendTApplicationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
        //                                                //Receipt Processing
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendReceiptForApprovalCode);
        //                                                //Receipt Processing
        //                                                //Project Fundin
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendProjectReqForApprovalCode);
        //                                                //AIE Process
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendAIEReqForApprovalCode);
        //                                                //PCO
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPCOReqForApprovalCode);
        //                                                 //Subcontracting
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendSubReqForApprovalCode);
        //                                                 //WEP Contractor Submission
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendWEPSubReqForApprovalCode);
        //                                                 //Site Instructions
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendSiteReqForApprovalCode);
        //                                                 //RMP
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendRMPReqForApprovalCode);
        //                                                 //Temporary Supervision Requirement
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendTSRReqForApprovalCode);
        //                                                 //Insurance
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendInsuranceReqForApprovalCode);
        //                                                 //Project Meeting Reg
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPMRReqForApprovalCode);
        //                                                 //Daily Work Record
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendDWRReqForApprovalCode);
        //                                                 //Project Variation Header
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPVHReqForApprovalCode);
        //                                                 //Project Evaluation Header
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPEHReqForApprovalCode);
        //                                                 //QM Plan Header
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendQMPHReqForApprovalCode);
        //                                                 //Risk M&E Header
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendMEHReqForApprovalCode);
        //                                                 //Risk Incident Log
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendRILReqForApprovalCode);
        //                                                 //Measurment & Payment Header
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendMPHReqForApprovalCode);
        //                                                 //Inspection
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendIHReqForApprovalCode);
        //                                                 //Final Account
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendFAReqForApprovalCode);
        //  
        //                                                  //Driver out of office
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendDriverReqForApprovalCode);
        //                                                 //Project Staff Voucher
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendSAVReqForApprovalCode);
        //                                                 //WEPPCO
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendWEPPCOReqForApprovalCode);
        //                                                 //Bill Discounting
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBDiscountReqForApprovalCode);
        //  
        //                                                 //KCB Batch Payment
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBPaymentReqForApprovalCode);
        //  
        //                                                 //Cash Request
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendCashReqForApprovalCode);
        //                                                 //Road Work Program
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendRWPReqForApprovalCode);
        //                                                 //Asset Transfer
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendAssetTransferReqForApprovalCode);
        //                                                //Bank Rec
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBankRecReqForApprovalCode);
        //                                                //Training Plan
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendTPlanForApprovalCode);
        //                                                //Tender Committe
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendMaintenanceForApprovalCode);
        //                                                    AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendInsuranceForApprovalCode);
        //                                                    //INSURANCE H
        //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendFuelReqForApprovalCode);
        //                                                //start recruitment
        //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendRecRequisitionqForApprovalCode);
        //  
        //                                                //end recruitment
        //  
        //                                          #70..75
        //                                          WREvents.AddEventsPredecessor;
        //                                          OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName);
        //                                        END;
        //  
        //                           Target=AddEventPredecessors(PROCEDURE 67) }
        //      { Insertion         ;InsertAfter=RunWorkflowOnAfterCreateGenJnlLineFromIncomingDocFail(PROCEDURE 72);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE ".........Daudi added......"@74();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendImpMemoForApprovalCode@1000000000() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendImpMemoForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelImpMemoApprovalRequestCode@1000000002() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelImpMemoApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseImpMemoCode@1000000001() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseImpMemo'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendImpMemoForApproval)]
        //                             PROCEDURE RunWorkflowOnSendImpMemoForApproval@1000000005(VAR ImprestMemo@1000 : Record "Imprest Memo");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendImpMemoForApprovalCode,ImprestMemo);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelImpMemoApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelImpMemoApprovalRequest@1000000004(VAR ImprestMemo@1000 : Record "Imprest Memo");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelImpMemoApprovalRequestCode,ImprestMemo);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57002,OnAfterReleaseImpMemo)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseImpMemoDoc@1000000003(VAR ImprestMemo@1000000000 : Record "Imprest Memo");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseImpMemoCode,ImprestMemo);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Payments-----------------------------------------"@1000000012();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendPaymentsForApprovalCode@1000000011() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendPaymentsForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelPaymentsApprovalRequestCode@1000000010() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelPaymentsApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleasePaymentsCode@1000000009() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePayments'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendPaymentsForApproval)]
        //                             PROCEDURE RunWorkflowOnSendPaymentsForApproval@1000000008(VAR Payments@1000 : Record payments);
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPaymentsForApprovalCode,Payments);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelPaymentsApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelPaymentsApprovalRequest@1000000007(VAR Payments@1000 : Record payments);
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPaymentsApprovalRequestCode,Payments);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
        //                             PROCEDURE RunWorkflowOnAfterReleasePaymentsDoc@1000000006(VAR Payments@1000000000 : Record payments);
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePaymentsCode,Payments);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for PayPeriods-----------------------------------------"@1000000019();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendPayPeriodForApprovalCode@1000000018() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendPayPeriodForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelPayPeriodApprovalRequestCode@1000000017() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelPayPeriodApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleasePayPeriodCode@1000000016() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePayPeriod'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendPayPeriodForApproval)]
        //                             PROCEDURE RunWorkflowOnSendPayPeriodForApproval@1000000015(VAR PayPeriod@1000000000 : Record "Payroll PeriodX");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPayPeriodForApprovalCode,PayPeriod);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelPayPeriodApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelPayPeriodApprovalRequest@1000000014(VAR PayPeriod@1000 : Record "Payroll PeriodX");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPayPeriodApprovalRequestCode,PayPeriod);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,69005,OnAfterReleasePayPeriod)]
        //                             PROCEDURE RunWorkflowOnAfterReleasePayPeriodDoc@1000000013(VAR PayPeriod@1000000000 : Record "Payroll PeriodX");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePayPeriodCode,PayPeriod);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Copyright registration-----------------------------------------"@97();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendCopyRegForApprovalCode@96() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendCopyRegForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelCopyRegApprovalRequestCode@95() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelCopyRegApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseCopyRegCode@94() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseCopyReg'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendCopyRegForApproval)]
        //                             PROCEDURE RunWorkflowOnSendCopyRegForApproval@93(VAR CopyReg@1000 : Record "Copyright Registration Table");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendCopyRegForApprovalCode,CopyReg);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelCopyRegApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelCopyRegApprovalRequest@91(VAR CopyReg@1000 : Record "Copyright Registration Table");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelCopyRegApprovalRequestCode,CopyReg);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseCopyRegDoc@76(VAR CopyReg@1000000000 : Record "Copyright Registration Table");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseCopyRegCode,CopyReg);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Overtime Application-----------------------------------------"@104();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendOvertimeForApprovalCode@103() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendOvertimeForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelOvertimeApprovalRequestCode@102() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelOvertimeApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseOvertimeCode@101() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseOvertime'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendOvertimeForApproval)]
        //                             PROCEDURE RunWorkflowOnSendOvertimeForApproval@100(VAR Overtime@1000 : Record "Overtime Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendOvertimeForApprovalCode,Overtime);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelOvertimeApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelOvertimeApprovalRequest@99(VAR Overtime@1000 : Record "Overtime Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelOvertimeApprovalRequestCode,Overtime);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseOvertimeDoc@98(VAR Overtime@1000 : Record "Overtime Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseOvertimeCode,Overtime);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Salary Vouchers-----------------------------------------"@1000000026();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendSalaryForApprovalCode@1000000025() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendSalaryForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelSalaryApprovalRequestCode@1000000024() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelSalaryApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseSalaryCode@1000000023() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseSalary'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendSalaryForApproval)]
        //                             PROCEDURE RunWorkflowOnSendSalaryForApproval@1000000022(VAR Salary@1000 : Record "Payroll Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendSalaryForApprovalCode,Salary);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelSalaryApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelSalaryApprovalRequest@1000000021(VAR Salary@1000 : Record "Payroll Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelSalaryApprovalRequestCode,Salary);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseSalaryDoc@1000000020(VAR Salary@1000000000 : Record "Payroll Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseSalaryCode,Salary);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Grant Funding Application-----------------------------------------"@120();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendGFAForApprovalCode@119() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendGFAForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelGFAApprovalRequestCode@118() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelGFAApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseGFACode@117() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseGFA'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendGFAForApproval)]
        //                             PROCEDURE RunWorkflowOnSendGFAForApproval@116(VAR GFA@1000 : Record "Grant Funding Application");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendGFAForApprovalCode,GFA);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelGFAApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelGFAApprovalRequest@115(VAR GFA@1000 : Record "Grant Funding Application");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelGFAApprovalRequestCode,GFA);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseGFA)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseGFADoc@114(VAR GFA@1000 : Record "Grant Funding Application");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseGFACode,GFA);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Project Contracts-----------------------------------------"@125();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendProjectContractForApprovalCode@124() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendProjectContractForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelProjectContractApprovalRequestCode@123() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelProjectContractApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseProjectContractCode@122() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseProjectContract'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendProjectContractForApproval)]
        //                             PROCEDURE RunWorkflowOnSendProjectContractForApproval@121(VAR ProjectContract@1000 : Record "Project Contract Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectContractForApprovalCode,ProjectContract);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelProjectContractApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelProjectContractApprovalRequest@113(VAR ProjectContract@1000 : Record "Project Contract Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectContractApprovalRequestCode,ProjectContract);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProjectContract)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseProjectContractDoc@112(VAR ProjectContract@1000 : Record "Project Contract Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseProjectContractCode,ProjectContract);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Fleet -----------------------------------------"@139();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendFleetForApprovalCode@138() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendFleetForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelFleetApprovalRequestCode@137() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelFleetApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseFleetCode@136() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseFleet'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendFleetForApproval)]
        //                             PROCEDURE RunWorkflowOnSendFleetForApproval@135(VAR Fleet@1000 : Record "Transport Requisition");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendFleetForApprovalCode,Fleet);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelFleetApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelFleetApprovalRequest@134(VAR Fleet@1000 : Record "Transport Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelFleetApprovalRequestCode,Fleet);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseFleet)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseFleetDoc@132(VAR Fleet@1000 : Record "Transport Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseFleetCode,Fleet);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Procuremnt methods............................"@126();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendProcDocForApprovalCode@133() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendProcDocForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelProcDocApprovalRequestCode@131() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelProcApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseProcDocCode@130() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseProc'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendProcDocForApproval)]
        //                             PROCEDURE RunWorkflowOnSendProcDocForApproval@129(VAR Procurement@1000 : Record "Procurement Request");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendProcDocForApprovalCode,Procurement);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelProcDocApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelProcDocApprovalRequest@128(VAR Procurement@1000 : Record "Procurement Request");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcDocApprovalRequestCode,Procurement);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProCDoc)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseProcDoc@127(VAR Procurement@1000 : Record "Procurement Request");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseProcDocCode,Procurement);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for FileMovement............................"@146();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendFileMovementForApprovalCode@145() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendFileMovementForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelFileMovementApprovalRequestCode@144() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelFileMovementApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseFileMovementCode@143() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseFileMovement'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendFileMovementForApproval)]
        //                             PROCEDURE RunWorkflowOnSendFileMovementForApproval@142(VAR FileMovement@1000 : Record "File Movement Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendFileMovementForApprovalCode,FileMovement);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelFileMovementApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelFileMovementApprovalRequest@141(VAR FileMovement@1000 : Record "File Movement Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelFileMovementApprovalRequestCode,FileMovement);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseFileMovement)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseFileMovement@140(VAR FileMovement@1000 : Record "File Movement Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseFileMovementCode,FileMovement);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "************Receipt Processing**************************"@153();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendReceiptForApprovalCode@152() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendReceiptForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelReceiptApprovalRequestCode@151() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelReceiptApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseReceiptCode@150() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseReceipt'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendReceiptForApproval)]
        //                             PROCEDURE RunWorkflowOnSendReceiptForApproval@149(VAR ReceiptsHeader1@1000 : Record "Receipts Header1");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendReceiptForApprovalCode,ReceiptsHeader1);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelReceiptApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelReceiptApprovalRequest@148(VAR ReceiptsHeader1@1000 : Record "Receipts Header1");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelReceiptApprovalRequestCode,ReceiptsHeader1);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseReceipt)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseReceipt@147(VAR ReceiptsHeader1@1000 : Record "Receipts Header1");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseReceiptCode,ReceiptsHeader1);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for RFI............................"@162();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendIFPForApprovalCode@159() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendIFPForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelIFPApprovalRequestCode@158() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelIFPApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseIFPCode@157() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseIFP'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendIFPForApproval)]
        //                             PROCEDURE RunWorkflowOnSendIFPForApproval@156(VAR IFP@1000 : Record "Request For Information");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendIFPForApprovalCode,IFP);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelIFPApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelIFPApprovalRequest@155(VAR IFP@1000 : Record "Request For Information");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFPApprovalRequestCode,IFP);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseIFP)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseIFP@154(VAR IFP@1000 : Record "Request For Information");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseIFPCode,IFP);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for VendDebarment............................"@169();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendVendDebarmentForApprovalCode@168() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendVendDebarmentForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelVendDebarmentApprovalRequestCode@167() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelVendDebarmentApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseVendDebarmentCode@166() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseVendDebarment'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendVendDebarmentForApproval)]
        //                             PROCEDURE RunWorkflowOnSendVendDebarmentForApproval@165(VAR VendDebarment@1000 : Record "Vendor Debarment Voucher");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendVendDebarmentForApprovalCode,VendDebarment);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelVendDebarmentApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelVendDebarmentApprovalRequest@164(VAR VendDebarment@1000 : Record "Vendor Debarment Voucher");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelVendDebarmentApprovalRequestCode,VendDebarment);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseVendDebarment)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseVendDebarment@163(VAR VendDebarment@1000 : Record "Vendor Debarment Voucher");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseVendDebarmentCode,VendDebarment);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for ProcPlan............................"@176();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendProcPlanForApprovalCode@175() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendProcPlanForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelProcPlanApprovalRequestCode@174() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelProcPlanApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseProcPlanCode@173() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseProcPlan'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendProcPlanForApproval)]
        //                             PROCEDURE RunWorkflowOnSendProcPlanForApproval@172(VAR ProcPlan@1000 : Record "Procurement Plan");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendProcPlanForApprovalCode,ProcPlan);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelProcPlanApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelProcPlanApprovalRequest@171(VAR ProcPlan@1000 : Record "Procurement Plan");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcPlanApprovalRequestCode,ProcPlan);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseProcPlan@170(VAR ProcPlan@1000 : Record "Procurement Plan");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseProcPlanCode,ProcPlan);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for ProjectFundinReq............................"@183();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendProjectReqForApprovalCode@182() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendProjectReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelProjectReqApprovalRequestCode@181() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelProjectReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseProjectReqCode@180() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseProjectReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendProjectReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendProjectReqForApproval@179(VAR ProjFundReq@1000 : Record "Project Funding Request Vouche");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectReqForApprovalCode,ProjFundReq);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelProjectReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelProjectReqApprovalRequest@178(VAR ProjFundReq@1000 : Record "Project Funding Request Vouche");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectReqApprovalRequestCode,ProjFundReq);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseProjectReq@177(VAR ProjFundReq@1000 : Record "Project Funding Request Vouche");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseProjectReqCode,ProjFundReq);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for Temp Salary Vouchers-----------------------------------------"@190();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendTSalaryForApprovalCode@189() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnTSendSalaryForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelTSalaryApprovalRequestCode@188() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelTSalaryApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseTSalaryCode@187() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseTSalary'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendTSalaryForApproval)]
        //                             PROCEDURE RunWorkflowOnSendTSalaryForApproval@186(VAR Salary@1000 : Record "Payroll HeaderT");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendTSalaryForApprovalCode,Salary);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelTSalaryApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelTSalaryApprovalRequest@185(VAR Salary@1000 : Record "Payroll HeaderT");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelTSalaryApprovalRequestCode,Salary);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseTSalaryDoc@184(VAR Salary@1000000000 : Record "Payroll HeaderT");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseTSalaryCode,Salary);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for AIE Process............................"@197();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendAIEReqForApprovalCode@196() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendAIEReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelAIEReqApprovalRequestCode@195() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelAIEReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseAIEReqCode@194() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseAIEReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendAIEReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendAIEReqForApproval@193(VAR InterBankTransfer@1000 : Record "Inter Bank Transfer");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendAIEReqForApprovalCode,InterBankTransfer);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelAIEReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelAIEReqApprovalRequest@192(VAR InterBankTransfer@1000 : Record "Inter Bank Transfer");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelAIEReqApprovalRequestCode,InterBankTransfer);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseAIEReq@191(VAR InterBankTransfer@1000 : Record "Inter Bank Transfer");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseAIEReqCode,InterBankTransfer);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for HR Salary Increament Vouchers-----------------------------------------"@211();
        //                             BEGIN
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnSendIncSalaryForApprovalCode@210() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnIncSendSalaryForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelIncSalaryApprovalRequestCode@209() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelIncSalaryApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseIncSalaryCode@208() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseIncSalary'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendIncSalaryForApproval)]
        //                             PROCEDURE RunWorkflowOnSendIncSalaryForApproval@207(VAR Salary@1000 : Record "HR Salary Increament Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendIncSalaryForApprovalCode,Salary);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelIncSalaryApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelIncSalaryApprovalRequest@206(VAR Salary@1000 : Record "HR Salary Increament Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelIncSalaryApprovalRequestCode,Salary);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseIncSalaryDoc@205(VAR Salary@1000000000 : Record "HR Salary Increament Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseIncSalaryCode,Salary);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "***********Training Plan***********************"@212();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendTPlanForApprovalCode@204() : Code[128];
        //                             BEGIN
        //  
        //                               EXIT(UPPERCASE('RunWorkflowOnSendTPlanForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelTPlanApprovalRequestCode@203() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelTPlanApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseTPlanCode@202() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseTPlan'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendTPlanForApproval)]
        //                             PROCEDURE RunWorkflowOnSendTPlanForApproval@201(VAR TrainingPlanHeader@1000 : Record "Training Plan Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendTPlanForApprovalCode,TrainingPlanHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelTPlanApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelTPlanApprovalRequest@200(VAR TrainingPlanHeader@1000 : Record "Training Plan Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelTPlanApprovalRequestCode,TrainingPlanHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseReceipt)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseTPlan@199(VAR Payments@1000 : Record payments);
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseTPlanCode,Payments);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "***********Training Application***********************"@111();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendTApplicationForApprovalCode@110() : Code[128];
        //                             BEGIN
        //  
        //                               EXIT(UPPERCASE('RunWorkflowOnSendTApplicationForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelTApplicationApprovalRequestCode@109() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelTApplicationApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseTApplicationCode@108() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseTApplication'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendTApplicationForApproval)]
        //                             PROCEDURE RunWorkflowOnSendTApplicationForApproval@107(VAR TrainingRequests@1000 : Record "Training Requests");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendTApplicationForApprovalCode,TrainingRequests);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelTApplicationApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelTApplicationApprovalRequest@106(VAR TrainingRequests@1000 : Record "Training Requests");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelTApplicationApprovalRequestCode,TrainingRequests);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseReceipt)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseTApplication@105(VAR Payments@1000 : Record payments);
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseTApplicationCode,Payments);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "................Bank Rec............................"@218();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendBankRecReqForApprovalCode@217() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendBankRecReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelBankRecReqApprovalRequestCode@216() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelBankRecReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseBankRecReqCode@215() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBankRecReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendBankRecReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendBankRecReqForApproval@214(VAR BankAccReconciliation@1000 : Record "Bank Acc. Reconciliation");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBankRecReqForApprovalCode,BankAccReconciliation);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelBankRecReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelBankRecReqApprovalRequest@213(VAR BankAccReconciliation@1000 : Record "Bank Acc. Reconciliation");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBankRecReqApprovalRequestCode,BankAccReconciliation);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseBankRecReq@198(VAR BankAccReconciliation@1000 : Record "Bank Acc. Reconciliation");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBankRecReqCode,BankAccReconciliation);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Asset Transfer............................"@225();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendAssetTransferReqForApprovalCode@224() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendAssetTransferReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelAssetTransferReqApprovalRequestCode@223() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelAssetTransferReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseAssetTransferReqCode@222() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseAssetTransferReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendAssetTransferReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendAssetTransferReqForApproval@221(VAR HRAssetTransferHeader@1000 : Record "HR Asset Transfer Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendAssetTransferReqForApprovalCode,HRAssetTransferHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelAssetTransferReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelAssetTransferReqApprovalRequest@220(VAR HRAssetTransferHeader@1000 : Record "HR Asset Transfer Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelAssetTransferReqApprovalRequestCode,HRAssetTransferHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseAssetTransferReq@219(VAR HRAssetTransferHeader@1000 : Record "HR Asset Transfer Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseAssetTransferReqCode,HRAssetTransferHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Tender Committe............................"@232();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendTenderCommitteForApprovalCode@231() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendTenderCommitteForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelTenderCommitteApprovalRequestCode@230() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelTenderCommitteApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseTenderCommitteCode@229() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseTenderCommitte'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendTenderCommitteForApproval)]
        //                             PROCEDURE RunWorkflowOnSendTenderCommitteForApproval@228(VAR TenderCommitte@1000 : Record "IFS Tender Committee");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendTenderCommitteForApprovalCode,TenderCommitte);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelTenderCommitteApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelTenderCommitteApprovalRequest@227(VAR TenderCommitte@1000 : Record "IFS Tender Committee");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelTenderCommitteApprovalRequestCode,TenderCommitte);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseTenderCommitte)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseTenderCommitte@226(VAR TenderCommitte@1000 : Record "IFS Tender Committee");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseTenderCommitteCode,TenderCommitte);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".......................Bid Evaluation............................"@239();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendBidEvaluationForApprovalCode@238() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendBidEvaluationForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelBidEvaluationApprovalRequestCode@237() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelBidEvaluationApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseBidEvaluationCode@236() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBidEvaluation'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendBidEvaluationForApproval)]
        //                             PROCEDURE RunWorkflowOnSendBidEvaluationForApproval@235(VAR BidEvaluation@1000 : Record "Bid Evaluation Register");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBidEvaluationForApprovalCode,BidEvaluation);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelBidEvaluationApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelBidEvaluationApprovalRequest@234(VAR BidEvaluation@1000 : Record "Bid Evaluation Register");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidEvaluationApprovalRequestCode,BidEvaluation);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseBidEvaluation)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseBidEvaluation@233(VAR BidEvaluation@1000 : Record "Bid Evaluation Register");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBidEvaluationCode,BidEvaluation);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".......................Bid Opening............................"@246();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendBidOpeningForApprovalCode@245() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendBidOpeningForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelBidOpeningApprovalRequestCode@244() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelBidOpeningApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseBidOpeningCode@243() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBidOpening'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendBidOpeningForApproval)]
        //                             PROCEDURE RunWorkflowOnSendBidOpeningForApproval@242(VAR BidOpening@1000 : Record "Bid Opening Register");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBidOpeningForApprovalCode,BidOpening);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelBidOpeningApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelBidOpeningApprovalRequest@241(VAR BidOpening@1000 : Record "Bid Opening Register");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidOpeningApprovalRequestCode,BidOpening);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseBidOpening)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseBidOpening@240(VAR BidOpening@1000 : Record "Bid Opening Register");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBidOpeningCode,BidOpening);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".......................Bid Tabulation............................"@253();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendBidTabulationForApprovalCode@252() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendBidTabulationForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelBidTabulationApprovalRequestCode@251() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelBidTabulationApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseBidTabulationCode@250() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBidTabulation'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendBidTabulationForApproval)]
        //                             PROCEDURE RunWorkflowOnSendBidTabulationForApproval@249(VAR BidTabulation@1000 : Record "Bid Tabulation Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBidTabulationForApprovalCode,BidTabulation);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelBidTabulationApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelBidTabulationApprovalRequest@248(VAR BidTabulation@1000 : Record "Bid Tabulation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidTabulationApprovalRequestCode,BidTabulation);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseBidTabulation)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseBidTabulation@247(VAR BidTabulation@1000 : Record "Bid Tabulation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBidTabulationCode,BidTabulation);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for IFS............................"@260();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendIFSForApprovalCode@259() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendIFSForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelIFSApprovalRequestCode@258() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelIFSApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseIFSCode@257() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseIFS'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendIFSForApproval)]
        //                             PROCEDURE RunWorkflowOnSendIFSForApproval@256(VAR IFS@1000 : Record "Standard Purchase Code");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendIFSForApprovalCode,IFS);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelIFSApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelIFSApprovalRequest@255(VAR IFS@1000 : Record "Standard Purchase Code");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFSApprovalRequestCode,IFS);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseIFS)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseIFS@254(VAR IFS@1000 : Record "Standard Purchase Code");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseIFSCode,IFS);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for RWP............................"@267();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendRWPReqForApprovalCode@266() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendRWPReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelRWPReqApprovalRequestCode@265() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelRWPReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseRWPReqCode@264() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseRWPReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendRWPReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendRWPReqForApproval@263(VAR RoadWorkProgram@1000 : Record "Road Work Program");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendRWPReqForApprovalCode,RoadWorkProgram);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelRWPReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelRWPReqApprovalRequest@262(VAR RoadWorkProgram@1000 : Record "Road Work Program");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelRWPReqApprovalRequestCode,RoadWorkProgram);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseRWPReq@261(VAR RoadWorkProgram@1000 : Record "Road Work Program");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseRWPReqCode,RoadWorkProgram);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for PCO............................"@274();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendPCOReqForApprovalCode@273() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendPCOReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelPCOReqApprovalRequestCode@272() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelPCOReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleasePCOReqCode@271() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePCOReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendPCOReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendPCOReqForApproval@270(VAR ProjectCommencementOrder@1000 : Record "Project Commencement Order");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPCOReqForApprovalCode,ProjectCommencementOrder);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelPCOReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelPCOReqApprovalRequest@269(VAR ProjectCommencementOrder@1000 : Record "Project Commencement Order");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPCOReqApprovalRequestCode,ProjectCommencementOrder);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleasePCOReq@268(VAR ProjectCommencementOrder@1000 : Record "Project Commencement Order");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePCOReqCode,ProjectCommencementOrder);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for WEP............................"@281();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendWEPReqForApprovalCode@280() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendWEPReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelWEPReqApprovalRequestCode@279() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelWEPReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseWEPReqCode@278() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseWEPReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendWEPReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendWEPReqForApproval@277(VAR ProjectMobilizationHeader@1000 : Record "Project Mobilization Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendWEPReqForApprovalCode,ProjectMobilizationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelWEPReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelWEPReqApprovalRequest@276(VAR ProjectMobilizationHeader@1000 : Record "Project Mobilization Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelWEPReqApprovalRequestCode,ProjectMobilizationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseWEPReq@275(VAR ProjectMobilizationHeader@1000 : Record "Project Mobilization Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseWEPReqCode,ProjectMobilizationHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Maintenance............................"@288();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendMaintenanceForApprovalCode@287() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendMaintenanceForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelMaintenanceApprovalRequestCode@286() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelMaintenanceApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseMaintenanceCode@285() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseMaintenance'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendMaintenaceForApproval)]
        //                             PROCEDURE RunWorkflowOnSendMaintenanceForApproval@284(VAR Maintenance@1000 : Record "Fuel & Maintenance Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendMaintenanceForApprovalCode,Maintenance);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelMaintenaceApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelMaintenanceApprovalRequest@283(VAR Maintenance@1000 : Record "Fuel & Maintenance Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelMaintenanceApprovalRequestCode,Maintenance);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseMaintenance)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseMaintenance@282(VAR Maintenance@1000 : Record "Fuel & Maintenance Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseMaintenanceCode,Maintenance);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for FuelReq............................"@295();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendFuelReqForApprovalCode@294() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendFuelReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelFuelReqApprovalRequestCode@293() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelFuelReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseFuelReqCode@292() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseFuelReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendFuelReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendFuelReqForApproval@291(VAR FuelReq@1000 : Record "Fuel & Maintenance Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendFuelReqForApprovalCode,FuelReq);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelFuelReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelFuelReqApprovalRequest@290(VAR FuelReq@1000 : Record "Fuel & Maintenance Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelFuelReqApprovalRequestCode,FuelReq);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseFuelReq)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseFuelReq@289(VAR FuelReq@1000 : Record "Fuel & Maintenance Requisition");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseFuelReqCode,FuelReq);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".............Additions for Staff Appointment Orders............"@302();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendSAVReqForApprovalCode@301() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendSAVReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelSAVReqApprovalRequestCode@300() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelSAVReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseSAVReqCode@299() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseSAVReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendSAVReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendSAVReqForApproval@298(VAR ProjectStaffVoucher@1000 : Record "Project Staff Voucher");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendSAVReqForApprovalCode,ProjectStaffVoucher);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelSAVReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelSAVReqApprovalRequest@297(VAR ProjectStaffVoucher@1000 : Record "Project Staff Voucher");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelSAVReqApprovalRequestCode,ProjectStaffVoucher);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseSAVReq@296(VAR ProjectStaffVoucher@1000 : Record "Project Staff Voucher");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseSAVReqCode,ProjectStaffVoucher);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".............Additions for WEPPCO............"@309();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendWEPPCOReqForApprovalCode@308() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendWEPPCOReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelWEPPCOReqApprovalRequestCode@307() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelWEPPCOReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseWEPPCOReqCode@306() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseWEPPCOReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendWEPPCOReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendWEPPCOReqForApproval@305(VAR ProjectMobilizationHeader@1000 : Record "Project Mobilization Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendWEPPCOReqForApprovalCode,ProjectMobilizationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelWEPPCOReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelWEPPCOReqApprovalRequest@304(VAR ProjectMobilizationHeader@1000 : Record "Project Mobilization Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelWEPPCOReqApprovalRequestCode,ProjectMobilizationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseWEPPCOReq@303(VAR ProjectMobilizationHeader@1000 : Record "Project Mobilization Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseWEPPCOReqCode,ProjectMobilizationHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".............Additions for Bill Discounting................"@316();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendBDiscountReqForApprovalCode@315() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendBDiscountReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelBDiscountReqApprovalRequestCode@314() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelBDiscountReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseBDiscountReqCode@313() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBDiscountReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendBDiscountReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendBDiscountReqForApproval@312(VAR BillDiscountingHeader@1000 : Record "Bill Discounting Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBDiscountReqForApprovalCode,BillDiscountingHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelBDiscountReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelBDiscountReqApprovalRequest@311(VAR BillDiscountingHeader@1000 : Record "Bill Discounting Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBDiscountReqApprovalRequestCode,BillDiscountingHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseBDiscountReq@310(VAR BillDiscountingHeader@1000 : Record "Bill Discounting Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBDiscountReqCode,BillDiscountingHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".............Additions for Cash Request................"@323();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendCashReqForApprovalCode@322() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendCashReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelCashReqApprovalRequestCode@321() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelCashReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseCashReqCode@320() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseCashReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendCashReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendCashReqForApproval@319(VAR CashRequestHeader@1000 : Record "Cash Request Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendCashReqForApprovalCode,CashRequestHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelCashReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelCashReqApprovalRequest@318(VAR CashRequestHeader@1000 : Record "Cash Request Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelCashReqApprovalRequestCode,CashRequestHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseCashReq@317(VAR CashRequestHeader@1000 : Record "Cash Request Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseCashReqCode,CashRequestHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE ".............Additions for KCB Payments ................"@331();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendBPaymentReqForApprovalCode@330() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendBPaymentReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelBPaymentReqApprovalRequestCode@329() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelBPaymentReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseBPaymentReqCode@328() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBPaymentReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendBPaymentReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendBPaymentReqForApproval@327(VAR BankPaymentsBatching@1000 : Record "Bank Payments Batching");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBPaymentReqForApprovalCode,BankPaymentsBatching);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelBPaymentReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelBPaymentReqApprovalRequest@326(VAR BankPaymentsBatching@1000 : Record "Bank Payments Batching");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBPaymentReqApprovalRequestCode,BankPaymentsBatching);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseBPaymentReq@325(VAR BankPaymentsBatching@1000 : Record "Bank Payments Batching");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBPaymentReqCode,BankPaymentsBatching);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "************Recruitment Requisition**********"@324();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendRecRequisitionqForApprovalCode@337() : Code[128];
        //                             BEGIN
        //  
        //                               EXIT(UPPERCASE('RunWorkflowOnSendRecRequisitionApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelRecRequisitionApprovalRequestCode@336() : Code[128];
        //                             BEGIN
        //  
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelRecRequisitionApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseRecRequisitionCode@335() : Code[128];
        //                             BEGIN
        //  
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseRecRequisition'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendRecruitmentHeaderForApproval)]
        //                             PROCEDURE RunWorkflowOnSendRecRequisitionApproval@334(VAR RecruitmentHeader@1000 : Record "Recruitment Requisition Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendRecRequisitionqForApprovalCode,RecruitmentHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelRecruitmentHeaderApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelRecRequisitionApprovalRequest@333(VAR RecruitmentHeader@1000 : Record "Recruitment Requisition Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecRequisitionApprovalRequestCode,RecruitmentHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseRecRequisition@332(VAR RecruitmentRequisition@1000 : Record "Recruitment Requisition Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseRecRequisitionCode,RecruitmentRequisition);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Driver Req............................"@344();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendDriverReqForApprovalCode@343() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendDriverReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelDriverReqApprovalRequestCode@342() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelDriverReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseDriverReqCode@341() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseDriverReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendWEPReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendDriverReqForApproval@340(VAR DriverOutofOfficeReq@1000 : Record "Driver Out of Office Req");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendDriverReqForApprovalCode,DriverOutofOfficeReq);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelWEPReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelDriverReqApprovalRequest@339(VAR DriverOutofOfficeReq@1000 : Record "Driver Out of Office Req");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelDriverReqApprovalRequestCode,DriverOutofOfficeReq);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseDriverReq@338(VAR DriverOutofOfficeReq@1000 : Record "Driver Out of Office Req");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseDriverReqCode,DriverOutofOfficeReq);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for SubContractor....................."@351();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendSubReqForApprovalCode@350() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendSubReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelSubReqApprovalRequestCode@349() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelSubReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseSubReqCode@348() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseSubReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendSubReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendSubReqForApproval@347(VAR SubcontractingHeader@1000 : Record "Subcontracting Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendSubReqForApprovalCode,SubcontractingHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelSubReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelSubReqApprovalRequest@346(VAR SubcontractingHeader@1000 : Record "Subcontracting Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelSubReqApprovalRequestCode,SubcontractingHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseSubReq@345(VAR SubcontractingHeader@1000 : Record "Subcontracting Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseSubReqCode,SubcontractingHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for WEP Contractor Sub............................"@358();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendWEPSubReqForApprovalCode@357() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendWEPSubReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelWEPSubReqApprovalRequestCode@356() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelWEPSubReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseWEPSubReqCode@355() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseWEPSubReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendWEPSubReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendWEPSubReqForApproval@354(VAR WEPContractorSubmission@1000 : Record "WEP Contractor Submission");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendWEPSubReqForApprovalCode,WEPContractorSubmission);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelWEPSubReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelWEPSubReqApprovalRequest@353(VAR WEPContractorSubmission@1000 : Record "WEP Contractor Submission");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelWEPSubReqApprovalRequestCode,WEPContractorSubmission);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseWEPSubReq@352(VAR WEPContractorSubmission@1000 : Record "WEP Contractor Submission");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseWEPSubReqCode,WEPContractorSubmission);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Site Instructions............................"@371();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendSiteReqForApprovalCode@370() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendSiteReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelSiteReqApprovalRequestCode@369() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelSiteReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseSiteReqCode@368() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseSiteReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendSiteReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendSiteReqForApproval@367(VAR SiteInstructionsHeader@1000 : Record "Site Instructions Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendSiteReqForApprovalCode,SiteInstructionsHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelSiteReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelSiteReqApprovalRequest@366(VAR SiteInstructionsHeader@1000 : Record "Site Instructions Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelSiteReqApprovalRequestCode,SiteInstructionsHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseSiteReq@365(VAR SiteInstructionsHeader@1000 : Record "Site Instructions Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseSiteReqCode,SiteInstructionsHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Temporary Supervision Reqiurement............................"@381();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendTSRReqForApprovalCode@380() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendTSRReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelTSRReqApprovalRequestCode@379() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelTSRReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseTSRReqCode@378() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseTSRReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendTSRReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendTSRReqForApproval@377(VAR TemporarySupervisionRequirem@1000 : Record "Temporary Supervision Requirem");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendTSRReqForApprovalCode,TemporarySupervisionRequirem);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelTSRReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelTSRReqApprovalRequest@376(VAR TemporarySupervisionRequirem@1000 : Record "Temporary Supervision Requirem");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelTSRReqApprovalRequestCode,TemporarySupervisionRequirem);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseTSRReq@375(VAR TemporarySupervisionRequirem@1000 : Record "Temporary Supervision Requirem");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseTSRReqCode,TemporarySupervisionRequirem);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for RMP......................"@393();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendRMPReqForApprovalCode@392() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendRMPReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelRMPReqApprovalRequestCode@391() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelRMPReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseRMPReqCode@390() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseRMPReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendRMPReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendRMPReqForApproval@389(VAR RiskManagementPlan@1000 : Record "Risk Management Plan");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendRMPReqForApprovalCode,RiskManagementPlan);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelRMPReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelRMPReqApprovalRequest@388(VAR RiskManagementPlan@1000 : Record "Risk Management Plan");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelRMPReqApprovalRequestCode,RiskManagementPlan);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseRMPReq@387(VAR RiskManagementPlan@1000 : Record "Risk Management Plan");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseRMPReqCode,RiskManagementPlan);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Insurance............................"@402();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendInsuranceReqForApprovalCode@401() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendInsuranceReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelInsuranceReqApprovalRequestCode@400() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelInsuranceReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseInsuranceReqCode@399() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasensuranceReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendInsuranceReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendInsuranceReqForApproval@398(VAR InsuranceGuaranteeHeader@1000 : Record "Insurance/Guarantee Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendInsuranceReqForApprovalCode,InsuranceGuaranteeHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelInsuranceReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelInsuranceReqApprovalRequest@397(VAR InsuranceGuaranteeHeader@1000 : Record "Insurance/Guarantee Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelInsuranceReqApprovalRequestCode,InsuranceGuaranteeHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseInsuranceReq@396(VAR InsuranceGuaranteeHeader@1000 : Record "Insurance/Guarantee Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseInsuranceReqCode,InsuranceGuaranteeHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Project Meeting Register............................"@411();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendPMRReqForApprovalCode@410() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendPMRReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelPMRReqApprovalRequestCode@409() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelPMRReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleasePMRReqCode@408() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePMRReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendPMRReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendPMRReqForApproval@407(VAR ProjectMeetingRegister@1000 : Record "Project Meeting Register");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPMRReqForApprovalCode,ProjectMeetingRegister);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelPMRReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelPMRReqApprovalRequest@406(VAR ProjectMeetingRegister@1000 : Record "Project Meeting Register");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPMRReqApprovalRequestCode,ProjectMeetingRegister);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleasePMRReq@405(VAR ProjectMeetingRegister@1000 : Record "Project Meeting Register");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePMRReqCode,ProjectMeetingRegister);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Daily Wor Record ......................"@421();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendDWRReqForApprovalCode@420() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendDWRReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelDWRReqApprovalRequestCode@419() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelDWRReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseDWRReqCode@418() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseDWRReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendWEPReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendDWRReqForApproval@417(VAR DailyWorkRecords@1000 : Record "Daily Work Records");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendDWRReqForApprovalCode,DailyWorkRecords);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelWEPReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelDWRReqApprovalRequest@416(VAR DailyWorkRecords@1000 : Record "Daily Work Records");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelDWRReqApprovalRequestCode,DailyWorkRecords);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseDWRReq@415(VAR DailyWorkRecords@1000 : Record "Daily Work Records");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseDWRReqCode,DailyWorkRecords);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Project Variation Header..........................."@430();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendPVHReqForApprovalCode@429() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendPVHReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelPVHReqApprovalRequestCode@428() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelPVHReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleasePVHReqCode@427() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePVHReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendPVHReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendPVHReqForApproval@426(VAR ProjectVariationHeader@1000 : Record "Project Variation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPVHReqForApprovalCode,ProjectVariationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelPVHReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelPVHReqApprovalRequest@425(VAR ProjectVariationHeader@1000 : Record "Project Variation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPVHReqApprovalRequestCode,ProjectVariationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleasePVHReq@424(VAR ProjectVariationHeader@1000 : Record "Project Variation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePVHReqCode,ProjectVariationHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Project eValuation Header........................"@440();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendPEHReqForApprovalCode@439() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendPEHReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelPEHReqApprovalRequestCode@438() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelPEHReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleasePEHReqCode@437() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePEHReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendPEHReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendPEHReqForApproval@436(VAR ProjectEvaluationHeader@1000 : Record "Project Evaluation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPEHReqForApprovalCode,ProjectEvaluationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelPEHReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelPEHReqApprovalRequest@435(VAR ProjectEvaluationHeader@1000 : Record "Project Evaluation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPEHReqApprovalRequestCode,ProjectEvaluationHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleasePEHReq@434(VAR ProjectEvaluationHeader@1000 : Record "Project Evaluation Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePEHReqCode,ProjectEvaluationHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for QM Plan Header............................"@451();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendQMPHReqForApprovalCode@450() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendQMPHReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelQMPHReqApprovalRequestCode@449() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelQMPHReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseQMPHReqCode@448() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseQMPHReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendQMPHReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendQMPHReqForApproval@447(VAR QMPlanHeader@1000 : Record "QM Plan Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendQMPHReqForApprovalCode,QMPlanHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelQMPHReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelQMPHReqApprovalRequest@446(VAR QMPlanHeader@1000 : Record "QM Plan Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelQMPHReqApprovalRequestCode,QMPlanHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseQMPHReq@445(VAR QMPlanHeader@1000 : Record "QM Plan Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseQMPHReqCode,QMPlanHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Risk M&E Header............................"@460();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendMEHReqForApprovalCode@459() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendMEHReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelMEHReqApprovalRequestCode@458() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelMEHReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseMEHReqCode@457() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseMEHReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendMEHReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendMEHReqForApproval@456(VAR RiskMEHeader@1000 : Record "Risk M&E Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendMEHReqForApprovalCode,RiskMEHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelMEHReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelMEHReqApprovalRequest@455(VAR RiskMEHeader@1000 : Record "Risk M&E Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelMEHReqApprovalRequestCode,RiskMEHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseMEHReq@454(VAR RiskMEHeader@1000 : Record "Risk M&E Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseMEHReqCode,RiskMEHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Risk Incident Log....................."@471();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendRILReqForApprovalCode@470() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendRILReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelRILReqApprovalRequestCode@469() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelRILReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseRILReqCode@468() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseRILReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendRILReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendRILReqForApproval@467(VAR RiskIncidentLog@1000 : Record "Risk Incident Log");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendRILReqForApprovalCode,RiskIncidentLog);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelRILReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelRILReqApprovalRequest@466(VAR RiskIncidentLog@1000 : Record "Risk Incident Log");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelRILReqApprovalRequestCode,RiskIncidentLog);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseRILReq@465(VAR RiskIncidentLog@1000 : Record "Risk Incident Log");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseRILReqCode,RiskIncidentLog);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Measuremnt & Payment Header............................"@480();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendMPHReqForApprovalCode@479() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendMPHReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelMPHReqApprovalRequestCode@478() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelMPHReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseMPHReqCode@477() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseMPHReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendMPHReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendMPHReqForApproval@476(VAR MeasurementPaymentHeader@1000 : Record "Measurement &  Payment Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendMPHReqForApprovalCode,MeasurementPaymentHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelMPHReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelMPHReqApprovalRequest@475(VAR MeasurementPaymentHeader@1000 : Record "Measurement &  Payment Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelMPHReqApprovalRequestCode,MeasurementPaymentHeader);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseMPHReq@474(VAR MeasurementPaymentHeader@1000 : Record "Measurement &  Payment Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseMPHReqCode,MeasurementPaymentHeader);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Inspection Header...................."@489();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendIHReqForApprovalCode@488() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendIHReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelIHReqApprovalRequestCode@487() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelIHReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseIHReqCode@486() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseIHReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendIHReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendIHReqForApproval@485(VAR InspectionHeadersss@1000 : Record "Inspection Headersss");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendIHReqForApprovalCode,InspectionHeadersss);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelIHReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelIHReqApprovalRequest@484(VAR InspectionHeadersss@1000 : Record "Inspection Headersss");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelIHReqApprovalRequestCode,InspectionHeadersss);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseIHReq@483(VAR InspectionHeadersss@1000 : Record "Inspection Headersss");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseIHReqCode,InspectionHeadersss);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Final Account............................"@498();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendFAReqForApprovalCode@497() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendFAReqForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelFAReqApprovalRequestCode@496() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelFAReqApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseFAReqCode@495() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseFAReq'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendFAReqForApproval)]
        //                             PROCEDURE RunWorkflowOnSendFAReqForApproval@494(VAR FinalAccount@1000 : Record "Final Account");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendFAReqForApprovalCode,FinalAccount);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelFAReqApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelFAReqApprovalRequest@493(VAR FinalAccount@1000 : Record "Final Account");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelFAReqApprovalRequestCode,FinalAccount);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseFAReq@492(VAR FinalAccount@1000 : Record "Final Account");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseFAReqCode,FinalAccount);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "........................Additions for Insurance H............................"@372();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendInsuranceForApprovalCode@364() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendInsuranceForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelInsuranceApprovalRequestCode@363() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelInsuranceApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseInsuranceCode@362() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseInsurance'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendInsuranceForApproval)]
        //                             PROCEDURE RunWorkflowOnSendInsuranceForApproval@361(VAR Insurance@1000 : Record "Insurance Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendInsuranceForApprovalCode,Insurance);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelMaintenaceApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelInsuranceApprovalRequest@360(VAR Insurance@1000 : Record "Insurance Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelInsuranceApprovalRequestCode,Insurance);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseMaintenance)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseInsurance@359(VAR Insurance@1000 : Record "Insurance Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseInsuranceCode,Insurance);
        //                             END;
        //  
        //                             LOCAL PROCEDURE "--------------additions for iNSURANCE rEQUISITION -----------------------------------------"@386();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE RunWorkflowOnSendInsurancehHForApprovalCode@385() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnSendInsurancehHForApproval'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnCancelInsuranceHApprovalRequestCode@384() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnCancelInsurancehHApprovalRequest'));
        //                             END;
        //  
        //                             PROCEDURE RunWorkflowOnAfterReleaseInsuranceHCode@383() : Code[128];
        //                             BEGIN
        //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseInsurance'));
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnSendInsurancehHForApproval)]
        //                             PROCEDURE RunWorkflowOnSendInsuranceHForApproval@382(VAR Fleet@1000 : Record "Insurance Header");
        //                             BEGIN
        //  
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendInsurancehHForApprovalCode,Fleet);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,1535,OnCancelInsuranceHApprovalRequest)]
        //                             PROCEDURE RunWorkflowOnCancelInsuranceHApprovalRequest@374(VAR Fleet@1000 : Record "Insurance Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelFleetApprovalRequestCode,Fleet);
        //                             END;
        //  
        //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseInsurance)]
        //                             PROCEDURE RunWorkflowOnAfterReleaseInsuranceHDoc@373(VAR Fleet@1000 : Record "Insurance Header");
        //                             BEGIN
        //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseFleetCode,Fleet);
        //                             END;
        //  
        //                           }
        //                            }
        //      { Insertion         ;InsertAfter=CreateGenJnlLineFromIncDocFailsEventDescTxt(Variable 1036);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             "....daudi added...."@1037 : TextConst;
        //                             ImpMemoSendForApprovalEventDescTxt@1052 : TextConst 'ENU=Approval of an Imprest Memo is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             ImpMemoApprReqCancelledEventDescTxt@1051 : TextConst 'ENU=An approval request for an Imprest Memo has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             ImpMemoReleasedEventDescTxt@1050 : TextConst 'ENU=An Imprest Memo has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             PaymentsSendForApprovalEventDescTxt@1049 : TextConst 'ENU=Approval of a payment is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             PaymentsApprReqCancelledEventDescTxt@1048 : TextConst 'ENU=An approval request for a payment has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             PaymentsReleasedEventDescTxt@1047 : TextConst 'ENU=A payment has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             PayPeriodSendForApprovalEventDescTxt@1046 : TextConst 'ENU=Approval of a Payroll Period is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             PayPeriodApprReqCancelledEventDescTxt@1039 : TextConst 'ENU=An approval request for a Payroll Period has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             PayPeriodReleasedEventDescTxt@1038 : TextConst 'ENU=A Payroll Period has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             WREvents@1053 : Codeunit "Dynasoft Workflow Events";
        //                             ".....Copyright registration...."@1054 : TextConst;
        //                             CopyRegSendForApprovalEventDescTxt@1057 : TextConst 'ENU=Approval of a Copyright Registration is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             CopyRegApprReqCancelledEventDescTxt@1056 : TextConst 'ENU=An approval request for a Copyright Registration has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             CopyRegReleasedEventDescTxt@1055 : TextConst 'ENU=A Copyright Registration has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             ".....Overtime Application...."@1061 : TextConst;
        //                             OvertimeSendForApprovalEventDescTxt@1060 : TextConst 'ENU=Approval of an Overtime Application is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             OvertimeApprReqCancelledEventDescTxt@1059 : TextConst 'ENU=An approval request for an Overtime Application has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             OvertimeReleasedEventDescTxt@1058 : TextConst 'ENU=An Overtime Application has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             ".....Training Application...."@1065 : TextConst;
        //                             TrainingAppSendForApprovalEventDescTxt@1064 : TextConst 'ENU=Approval of a Training Application is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             TrainingAPPApprReqCancelledEventDescTxt@1063 : TextConst 'ENU=An approval request for a Training Application has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             TrainingAPPReleasedEventDescTxt@1062 : TextConst 'ENU=A Training Application has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "......salary Voucher..."@1069 : TextConst 'ENU=..........................';
        //                             SalarySendForApprovalEventDescTxt@1068 : TextConst 'ENU=A Salary Approval Voucher is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             SalaryApprReqCancelledEventDescTxt@1067 : TextConst 'ENU=A Salary Voucher approval request has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             SalaryReleasedEventDescTxt@1066 : TextConst 'ENU=A Salary Voucher has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Grant Funding Application...."@1073 : TextConst;
        //                             GFASendForApprovalEventDescTxt@1072 : TextConst 'ENU=Approval of a Grant Funding Application is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             GFAApprReqCancelledEventDescTxt@1071 : TextConst 'ENU=An approval request for a  Grant Funding Application has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             GFAReleasedEventDescTxt@1070 : TextConst 'ENU=A  Grant Funding Application has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Project Contract...."@1077 : TextConst;
        //                             ProjectContractSendForApprovalEventDescTxt@1076 : TextConst 'ENU=Approval of a Project Contract  is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             ProjectContractApprReqCancelledEventDescTxt@1075 : TextConst 'ENU=An approval request for a  Project Contract has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             ProjectContractReleasedEventDescTxt@1074 : TextConst 'ENU=A  Project Contract has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Fleet Requsition...."@1085 : TextConst;
        //                             FleetSendForApprovalEventDescTxt@1084 : TextConst 'ENU=Approval of a Fleet requistion  is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             FleetApprReqCancelledEventDescTxt@1083 : TextConst 'ENU=An approval request for a  Fleet requistion  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             FleetReleasedEventDescTxt@1082 : TextConst 'ENU=A   Fleet requistion has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Procurement Methods....."@1078 : TextConst;
        //                             ProcDocSendForApprovalEventDescTxt@1081 : TextConst 'ENU=Approval of a Procurement method is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             ProcDocApprReqCancelledEventDescTxt@1080 : TextConst 'ENU=An approval request for a  Procurement method has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             ProcDOcReleasedEventDescTxt@1079 : TextConst 'ENU=A  Procurement method has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....File Movement....."@1089 : TextConst;
        //                             FileMovementSendForApprovalEventDescTxt@1088 : TextConst 'ENU=Approval of a File Movement is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             FileMovementApprReqCancelledEventDescTxt@1092 : TextConst 'ENU=An approval request for a  File Movement has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             FileMovementReleasedEventDescTxt@1090 : TextConst 'ENU=A  File Movement has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "***Receipt Processing***"@1094 : TextConst;
        //                             ReceiptSendForApprovalEventDescTxt@1093 : TextConst 'ENU=Approval of a  Receipt  is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             ReceiptApprReqCancelledEventDescTxt@1087 : TextConst 'ENU=An approval request for a receipt  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             ReceiptReleasedEventDescTxt@1086 : TextConst 'ENU=The receipt has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....RFI....."@1098 : TextConst;
        //                             IFPSendForApprovalEventDescTxt@1097 : TextConst 'ENU=Approval of a Request For Information is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             IFPApprReqCancelledEventDescTxt@1096 : TextConst 'ENU=An approval request for a Request For Information has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             IFPReleasedEventDescTxt@1095 : TextConst 'ENU=A Request For Information has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....VendDebarment....."@1102 : TextConst;
        //                             VendDebarmentSendForApprovalEventDescTxt@1101 : TextConst 'ENU=Approval of a Vendor Debarment/Reinstatement is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             VendDebarmentApprReqCancelledEventDescTxt@1100 : TextConst 'ENU=An approval request for a Vendor Debarment/Reinstatement has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             VendDebarmentReleasedEventDescTxt@1099 : TextConst 'ENU=A Vendor Debarment/Reinstatement  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....ProcPlan....."@1106 : TextConst;
        //                             ProcPlanSendForApprovalEventDescTxt@1105 : TextConst 'ENU=Approval of a Procuremnet Plan is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             ProcPlanApprReqCancelledEventDescTxt@1104 : TextConst 'ENU=An approval request for a Procurement Plan has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             ProcPlanReleasedEventDescTxt@1103 : TextConst 'ENU=A Procurement Plan  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Project Funding....."@1110 : TextConst;
        //                             ProjectReqSendForApprovalEventDescTxt@1109 : TextConst 'ENU=Approval of a Project Funding is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             ProjectReqApprReqCancelledEventDescTxt@1108 : TextConst 'ENU=An approval request for a Project Funding has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             ProjectReqReleasedEventDescTxt@1107 : TextConst 'ENU=A Project Funding Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "......salary Voucher temp..."@1114 : TextConst 'ENU=..........................';
        //                             TSalarySendForApprovalEventDescTxt@1113 : TextConst 'ENU=A Temporary Employee Salary Approval Voucher is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             TSalaryApprReqCancelledEventDescTxt@1112 : TextConst 'ENU=A Temporary Employee Salary Voucher approval request has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             TSalaryReleasedEventDescTxt@1111 : TextConst 'ENU=A Temporary Employee Salary Voucher has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....AIE Process....."@1118 : TextConst;
        //                             AIEReqSendForApprovalEventDescTxt@1117 : TextConst 'ENU=Approval of an AIE document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             AIEReqApprReqCancelledEventDescTxt@1116 : TextConst 'ENU=An approval request for a AIE Request has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             AIEReqReleasedEventDescTxt@1115 : TextConst 'ENU=A an AIE Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             ".....Training Plan....."@1119 : TextConst;
        //                             TPlanSendForApprovalEventDescTxt@1122 : TextConst 'ENU=Approval of a Training Plan is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             TPlanApprReqCancelledEventDescTxt@1121 : TextConst 'ENU=An approval request for a Training Plan has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             TPlanReleasedEventDescTxt@1120 : TextConst 'ENU=A Training Plan  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "......hr salary inc Voucher temp..."@1126 : TextConst 'ENU=..........................';
        //                             IncSalarySendForApprovalEventDescTxt@1125 : TextConst 'ENU=Approval of an HR Salary Increament Voucher is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             IncSalaryApprReqCancelledEventDescTxt@1124 : TextConst 'ENU=An approval request for an HR Salary Increament Voucher has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             IncSalaryReleasedEventDescTxt@1123 : TextConst 'ENU=An HR Salary Increament Voucher has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Bank Recon....."@1130 : TextConst;
        //                             BankRecReqSendForApprovalEventDescTxt@1129 : TextConst 'ENU=Approval of an Bank Reconcilliation  document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             BankRecReqApprReqCancelledEventDescTxt@1128 : TextConst 'ENU=An approval request for a Bank Reconcilliation Request has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             BankRecReqReleasedEventDescTxt@1127 : TextConst 'ENU=A Bank Reconcilliation Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Asset Transfer....."@1134 : TextConst;
        //                             AssetTransferReqSendForApprovalEventDescTxt@1133 : TextConst 'ENU=Approval of anAsset Transfer document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             AssetTransferReqApprReqCancelledEventDescTxt@1132 : TextConst 'ENU=An approval request for a Asset Transfer Request has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             AssetTransferReqReleasedEventDescTxt@1131 : TextConst 'ENU=A an Asset Transfer Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....TenderCommitte....."@1138 : TextConst;
        //                             TenderCommitteSendForApprovalEventDescTxt@1137 : TextConst 'ENU=Approval of a Tender Committe is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             TenderCommitteApprReqCancelledEventDescTxt@1136 : TextConst 'ENU=An approval request for a Tender Committe has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             TenderCommitteReleasedEventDescTxt@1135 : TextConst 'ENU=A Tender Committe  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Bid Evaluation....."@1142 : TextConst;
        //                             BidEvaluationSendForApprovalEventDescTxt@1141 : TextConst 'ENU=Approval of a Bid Evaluation is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             BidEvaluationApprReqCancelledEventDescTxt@1140 : TextConst 'ENU=An approval request for a Bid Evaluation has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             BidEvaluationReleasedEventDescTxt@1139 : TextConst 'ENU=A Bid Evaluation  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Bid Opening....."@1146 : TextConst;
        //                             BidOpeningSendForApprovalEventDescTxt@1145 : TextConst 'ENU=Approval of a Bid Opening is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             BidOpeningApprReqCancelledEventDescTxt@1144 : TextConst 'ENU=An approval request for a Bid Opening has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             BidOpeningReleasedEventDescTxt@1143 : TextConst 'ENU=A Bid Opening  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Bid Tabulation....."@1150 : TextConst;
        //                             BidTabulationSendForApprovalEventDescTxt@1149 : TextConst 'ENU=Approval of a Bid Tabulation is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             BidTabulationApprReqCancelledEventDescTxt@1148 : TextConst 'ENU=An approval request for a Bid Tabulation has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             BidTabulationReleasedEventDescTxt@1147 : TextConst 'ENU=A Bid Tabulation  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....IFS....."@1154 : TextConst;
        //                             IFSSendForApprovalEventDescTxt@1153 : TextConst 'ENU=Approval of an Invitation For Supply is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             IFSApprReqCancelledEventDescTxt@1152 : TextConst 'ENU=An approval request for an Invitation For Supplyhas been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             IFSReleasedEventDescTxt@1151 : TextConst 'ENU=An Invitation For Supply  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....RWP....."@1158 : TextConst;
        //                             RWPReqSendForApprovalEventDescTxt@1157 : TextConst 'ENU=Approval of an Road Work Program document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             RWPReqApprReqCancelledEventDescTxt@1156 : TextConst 'ENU=An approval request for a Road Work Program has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             RWPReqReleasedEventDescTxt@1155 : TextConst 'ENU=A an Road Work Program Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....PCO...."@1162 : TextConst;
        //                             PCOReqSendForApprovalEventDescTxt@1161 : TextConst 'ENU=Approval of a Project Commencement Order document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             PCOReqApprReqCancelledEventDescTxt@1160 : TextConst 'ENU=An approval request for a Project Commencement Order has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             PCOReqReleasedEventDescTxt@1159 : TextConst 'ENU=A  Project Commencement Order Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....WEP..."@1166 : TextConst;
        //                             WEPReqSendForApprovalEventDescTxt@1165 : TextConst 'ENU=Approval of a Program Of Works document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             WEPReqApprReqCancelledEventDescTxt@1164 : TextConst 'ENU=An approval request for a Program Of Works  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             WEPReqReleasedEventDescTxt@1163 : TextConst 'ENU=A  Program Of Works  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Maintenance..."@1170 : TextConst;
        //                             MaintenanceSendForApprovalEventDescTxt@1169 : TextConst 'ENU=Approval of a Maintenance Requisition is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             MaintenanceApprReqCancelledEventDescTxt@1168 : TextConst 'ENU=An approval request for a Maintenance Requisition  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             MaintenanceReleasedEventDescTxt@1167 : TextConst 'ENU=A  Maintenance Requisition  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....FuelReq..."@1174 : TextConst;
        //                             FuelReqSendForApprovalEventDescTxt@1173 : TextConst 'ENU=Approval of a Fuel Requisition is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             FuelReqApprReqCancelledEventDescTxt@1172 : TextConst 'ENU=An approval request for a Fuel Requisition  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             FuelReqReleasedEventDescTxt@1171 : TextConst 'ENU=A  Fuel Requisition  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Staff Appointment Voucher..."@1178 : TextConst;
        //                             SAVReqSendForApprovalEventDescTxt@1177 : TextConst 'ENU=Approval of a Project Staff Appointment Voucher is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             SAVReqApprReqCancelledEventDescTxt@1176 : TextConst 'ENU=An approval request for a Project Staff Appointment Voucher has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             SAVPReqReleasedEventDescTxt@1175 : TextConst 'ENU=A  Project Staff Appointment Voucher  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....WEPPCO..."@1182 : TextConst;
        //                             WEPPCOReqSendForApprovalEventDescTxt@1181 : TextConst 'ENU=Approval of a Project Mobilization Document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             WEPPCOReqApprReqCancelledEventDescTxt@1180 : TextConst 'ENU=An approval request for a Project Mobilization Document has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             WEPPCOPReqReleasedEventDescTxt@1179 : TextConst 'ENU=A  Project Mobilization Document  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Bill Dscounting.."@1186 : TextConst;
        //                             BDiscountReqSendForApprovalEventDescTxt@1185 : TextConst 'ENU=Approval of a Bill Discounting  Document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             BDiscountReqApprReqCancelledEventDescTxt@1184 : TextConst 'ENU=An approval request for a Bill Discounting Document has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             BDiscountPReqReleasedEventDescTxt@1183 : TextConst 'ENU=A Bill Discounting Document  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Cash Request......"@1190 : TextConst;
        //                             CashReqSendForApprovalEventDescTxt@1189 : TextConst 'ENU=Approval of a Cash Request  Document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             CashReqApprReqCancelledEventDescTxt@1188 : TextConst 'ENU=An approval request for a Cash Request  Document has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             CashPReqReleasedEventDescTxt@1187 : TextConst 'ENU=A Cash Request Document  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....KCB Batch Payment .."@1194 : TextConst;
        //                             BPaymentReqSendForApprovalEventDescTxt@1193 : TextConst 'ENU=Approval of a Batch Payment  Document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             BPaymentReqApprReqCancelledEventDescTxt@1192 : TextConst 'ENU=An approval request for a Batch PaymentDocument has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             BPaymentPReqReleasedEventDescTxt@1191 : TextConst 'ENU=A Batch Payment Document  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "****Recruitment****"@1195 : TextConst;
        //                             RecRequisitionSendForApprovalEventDescTxt@1198 : TextConst 'ENU=Approval of a Recruitment Requisition is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             RecRequisitionCancelledEventDescTxt@1197 : TextConst 'ENU=An approval request for a  Recruitment Requisition has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             RecRequisitionReleasedEventDescTxt@1196 : TextConst 'ENU=A Recruitment Requisition  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Driver out of office..."@1202 : TextConst;
        //                             DriverReqSendForApprovalEventDescTxt@1201 : TextConst 'ENU=Approval of a Driver out of office requisition is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             DriverReqApprReqCancelledEventDescTxt@1200 : TextConst 'ENU=An approval request for a Driver out of office requisition  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             DriverReqReleasedEventDescTxt@1199 : TextConst 'ENU=A  Driver out of office requisition  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Subcontracting..."@1206 : TextConst;
        //                             SubReqSendForApprovalEventDescTxt@1205 : TextConst 'ENU=Approval of a Subcontracting document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             SubReqApprReqCancelledEventDescTxt@1204 : TextConst 'ENU=An approval request for a Subcontracting document  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             SubReqReleasedEventDescTxt@1203 : TextConst 'ENU=A  Subcontracting  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Wep Submission..."@1210 : TextConst;
        //                             WEPSubReqSendForApprovalEventDescTxt@1209 : TextConst 'ENU=Approval of a WEP Contractor Submission document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             WEPSubReqApprReqCancelledEventDescTxt@1208 : TextConst 'ENU=An approval request for a WEP Contractor Submission   has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             WEPSubReqReleasedEventDescTxt@1207 : TextConst 'ENU=A  WEP Contractor Submission Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....SIte Instructions..."@1214 : TextConst;
        //                             SiteReqSendForApprovalEventDescTxt@1213 : TextConst 'ENU=Approval of a Site Instructions document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             SiteReqApprReqCancelledEventDescTxt@1212 : TextConst 'ENU=An approval request for a Site Instructions  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             SiteReqReleasedEventDescTxt@1211 : TextConst 'ENU=A  Site Instructions  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....RMP..."@1219 : TextConst;
        //                             RMPReqSendForApprovalEventDescTxt@1218 : TextConst 'ENU=Approval of a Risk Management Plan is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             RMPReqApprReqCancelledEventDescTxt@1217 : TextConst 'ENU=An approval request for a Risk Management Plan  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             RMPReqReleasedEventDescTxt@1216 : TextConst 'ENU=A  Risk Management Plan Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Temporary Supervision Req..."@1223 : TextConst;
        //                             TSRReqSendForApprovalEventDescTxt@1222 : TextConst 'ENU=Approval of a Tempoarary Supervision Requirement document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             TSRReqApprReqCancelledEventDescTxt@1221 : TextConst 'ENU=An approval request for aTemporary Supervision Requirement  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             TSRReqReleasedEventDescTxt@1220 : TextConst 'ENU=A  Temporary Supervision Requirement Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Insurance..."@1227 : TextConst;
        //                             InsuranceReqSendForApprovalEventDescTxt@1226 : TextConst 'ENU=Approval of a Insurance document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             InsuranceReqApprReqCancelledEventDescTxt@1225 : TextConst 'ENU=An approval request for an Insurance  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             InsuranceReqReleasedEventDescTxt@1224 : TextConst 'ENU=A  Insurance  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Project Meeting Register..."@1231 : TextConst;
        //                             PMRReqSendForApprovalEventDescTxt@1230 : TextConst 'ENU=Approval of Project Meeting Register document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             PMRReqApprReqCancelledEventDescTxt@1229 : TextConst 'ENU=An approval request for a Project Meeting Register  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             PMRReqReleasedEventDescTxt@1228 : TextConst 'ENU=A Project Meeting Register  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Daily Work Record..."@1234 : TextConst;
        //                             DWRReqSendForApprovalEventDescTxt@1233 : TextConst 'ENU=Approval of a Daily Wor Record document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             DWRReqApprReqCancelledEventDescTxt@1232 : TextConst 'ENU=An approval request for a Daily Work Record  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             DWRReqReleasedEventDescTxt@1215 : TextConst 'ENU=A  Daily Work Record Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Project Variation Header..."@1238 : TextConst;
        //                             PVHReqSendForApprovalEventDescTxt@1237 : TextConst 'ENU=Approval of a Project Variation Header document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             PVHReqApprReqCancelledEventDescTxt@1236 : TextConst 'ENU=An approval request for a Project Variation Header has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             PVHReqReleasedEventDescTxt@1235 : TextConst 'ENU=A  Project Variation Header Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Project Evaluation Header..."@1242 : TextConst;
        //                             PEHReqSendForApprovalEventDescTxt@1241 : TextConst 'ENU=Approval of a Project Evaluation document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             PEHReqApprReqCancelledEventDescTxt@1240 : TextConst 'ENU=An approval request for a Project Evaluation  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             PEHReqReleasedEventDescTxt@1239 : TextConst 'ENU=A  Project Evaluation  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....QM Plan Header.."@1246 : TextConst;
        //                             QMPHReqSendForApprovalEventDescTxt@1245 : TextConst 'ENU=Approval of a QM Plan document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             QMPHReqApprReqCancelledEventDescTxt@1244 : TextConst 'ENU=An approval request for a QM Plan  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             QMPHReqReleasedEventDescTxt@1243 : TextConst 'ENU=A  QM Plan  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Risk M&E Header..."@1250 : TextConst;
        //                             MEHReqSendForApprovalEventDescTxt@1249 : TextConst 'ENU=Approval of a Risk Monitoring & Evaluation  document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             MEHReqApprReqCancelledEventDescTxt@1248 : TextConst 'ENU=An approval request for a Risk Monitoring & Evaluation has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             MEHReqReleasedEventDescTxt@1247 : TextConst 'ENU=A  Risk Monitoring & Evaluation  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Risk Incident Log..."@1254 : TextConst;
        //                             RILReqSendForApprovalEventDescTxt@1253 : TextConst 'ENU=Approval of a Risk Incident Log document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             RILReqApprReqCancelledEventDescTxt@1252 : TextConst 'ENU=An approval request for a Risk Incident Log  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             RILReqReleasedEventDescTxt@1251 : TextConst 'ENU=A  Risk Incident Log  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Measurement & Payment Header..."@1258 : TextConst;
        //                             MPHReqSendForApprovalEventDescTxt@1257 : TextConst 'ENU=Approval of a Measurement  document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             MPHReqApprReqCancelledEventDescTxt@1256 : TextConst 'ENU=An approval request for a Measurement  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             MPHReqReleasedEventDescTxt@1255 : TextConst 'ENU=A  Measurement Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Inspection..."@1262 : TextConst;
        //                             IHReqSendForApprovalEventDescTxt@1261 : TextConst 'ENU=Approval of an Inspection document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             IHReqApprReqCancelledEventDescTxt@1260 : TextConst 'ENU=An approval request for an Inspection has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             IHReqReleasedEventDescTxt@1259 : TextConst 'ENU=An  Inspection  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Final Account..."@1266 : TextConst;
        //                             FAReqSendForApprovalEventDescTxt@1265 : TextConst 'ENU=Approval of a Final Account document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             FAReqApprReqCancelledEventDescTxt@1264 : TextConst 'ENU=An approval request for a Final Account  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             FAReqReleasedEventDescTxt@1263 : TextConst 'ENU=A  Final Acount Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....Insurance H..."@1270 : TextConst;
        //                             InsuranceSendForApprovalEventDescTxt@1269 : TextConst 'ENU=Approval of a Insurance Policy Document  is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             InsuranceApprReqCancelledEventDescTxt@1268 : TextConst 'ENU=An approval request for a Insurance Policy Document  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             InsuranceReleasedEventDescTxt@1267 : TextConst 'ENU=An Insurance Policy Document  Request  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
        //                             "....iNSURANCE  Requsition...."@1274 : TextConst;
        //                             InsurancehHSendForApprovalEventDescTxt@1273 : TextConst 'ENU=Approval of a Insurance requistion  is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
        //                             InsuranceHCancelledEventDescTxt@1272 : TextConst 'ENU=An approval request for a  Insurance requistion  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
        //                             InsuranceHReleasedEventDescTxt@1271 : TextConst 'ENU=A   Insurance Requisition has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
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

