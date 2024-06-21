Codeunit 59500 "Custom Approvals Codeunit"
{

    trigger OnRun()
    begin
    end;

    var
        RMSManagement: Codeunit "RMS Management";
        WorkflowManagement: Codeunit "Workflow Management";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'This record is not supported by related approval workflow.';

        //Leave
        OnSendLeaveApprovalRequestTxt: label 'Approval of a Leave Application is requested';
        RunWorkflowOnSendLeaveForApprovalCode: label 'RUNWORKFLOWONSENDLEAVEFORAPPROVAL';
        OnCancelLeaveApprovalRequestTxt: label 'An Approval of a Leave Application is canceled';
        RunWorkflowOnCancelLeaveForApprovalCode: label 'RUNWORKFLOWONCANCELLEAVEFORAPPROVAL';
        //AdvancedPayment
        OnSendAdvPayApprovalRequestTxt: label 'Approval of an Advanced Payment Application is requested';
        RunWorkflowOnSendAdvPayForApprovalCode: label 'RUNWORKFLOWONSENDADVPAYFORAPPROVAL';
        OnCancelAdvPayApprovalRequestTxt: label 'An Approval of an Advanced Payment Application is canceled';
        RunWorkflowOnCancelAdvPayForApprovalCode: label 'RUNWORKFLOWONCANCELADVPAYFORAPPROVAL';
        //pavement
        OnSendPavementApprovalRequestTxt: label 'Approval of a Pavement Lab Test is requested';
        RunWorkflowOnSendPavementForApprovalCode: label 'RUNWORKFLOWONSENDPAVEMENTFORAPPROVAL';
        OnCancelPavementApprovalRequestTxt: label 'An Approval of a Pavement Lab Test is canceled';
        RunWorkflowOnCancelPavementForApprovalCode: label 'RUNWORKFLOWONCANCELPAVEMENTFORAPPROVAL';
        //ifs tender
        OnSendCommApprovalRequestTxt: label 'Approval of a Tender Commitee is requested';
        RunWorkflowOnSendCommForApprovalCode: label 'RUNWORKFLOWONSENDCOMMFORAPPROVAL';
        OnCancelCommApprovalRequestTxt: label 'An Approval of a Tender Commitee is canceled';
        RunWorkflowOnCancelCommForApprovalCode: label 'RUNWORKFLOWONCANCELCOMMFORAPPROVAL';

        //proff
        OnSendProfApprovalRequestTxt: label 'Approval of a Bid Tabulation Header is requested';
        RunWorkflowOnSendProfForApprovalCode: label 'RUNWORKFLOWONSENDPROFFORAPPROVAL';
        OnCancelProfApprovalRequestTxt: label 'An Approval of a Bid Tabulation Header is canceled';
        RunWorkflowOnCancelProfForApprovalCode: label 'RUNWORKFLOWONCANCELPROFFORAPPROVAL';
        //Payroll
        OnSendPayrollApprovalRequestTxt: label 'Approval of a Payroll Voucher is requested';
        RunWorkflowOnSendPayrollForApprovalCode: label 'RUNWORKFLOWONSENDPAYROLLFORAPPROVAL';
        OnCancelPayrollApprovalRequestTxt: label 'An Approval of a Payroll Voucher is canceled';
        RunWorkflowOnCancelPayrollForApprovalCode: label 'RUNWORKFLOWONCANCELPAYROLLFORAPPROVAL';
        //Receipt
        OnSendReceiptApprovalRequestTxt: label 'Approval of a Receipt is requested';
        RunWorkflowOnSendReceiptForApprovalCode: label 'RUNWORKFLOWONSENDRECEIPTFORAPPROVAL';
        OnCancelReceiptApprovalRequestTxt: label 'An Approval of a Receipt is canceled';
        RunWorkflowOnCancelReceiptForApprovalCode: label 'RUNWORKFLOWONCANCELRECEIPTFORAPPROVAL';
        //fleet

        OnSendFleetApprovalRequestTxt: label 'Approval of a Fleet Requisition is requested';
        RunWorkflowOnSendFleetForApprovalCode: label 'RUNWORKFLOWONSENDFLEETFORAPPROVAL';
        OnCancelFleetApprovalRequestTxt: label 'An Approval of a Fleet Requisition is canceled';
        RunWorkflowOnCancelFleetForApprovalCode: label 'RUNWORKFLOWONCANCELFLEETFORAPPROVAL';

        //Corporate
        OnSendCorporateApprovalRequestTxt: label 'Approval of a Corporate Strategic Plan is requested';
        RunWorkflowOnSendCorporateForApprovalCode: label 'RUNWORKFLOWONSENDCORPORATEFORAPPROVAL';
        OnCancelCorporateApprovalRequestTxt: label 'An Approval of a Corporate Strategic Plan  is canceled';
        RunWorkflowOnCancelCorporateForApprovalCode: label 'RUNWORKFLOWONCANCELCORPORATEFORAPPROVAL';


        //Monitor
        OnSendMonitorApprovalRequestTxt: label 'Approval of a Monitoring is requested';
        RunWorkflowOnSendMonitorForApprovalCode: label 'RUNWORKFLOWONSENDMONITORFORAPPROVAL';
        OnCancelMonitorApprovalRequestTxt: label 'An Approval of a Monitoring  is canceled';
        RunWorkflowOnCancelMonitorForApprovalCode: label 'RUNWORKFLOWONCANCELMONITORFORAPPROVAL';

        //project variation
        OnSendVariationApprovalRequestTxt: label 'Approval of a Project Variation is requested';
        RunWorkflowOnSendVariationForApprovalCode: label 'RUNWORKFLOWONSENDVARIATIONFORAPPROVAL';
        OnCancelVariationApprovalRequestTxt: label 'An Approval of a PROJECT VARIATION  is canceled';
        RunWorkflowOnCancelVariationForApprovalCode: label 'RUNWORKFLOWONCANCELVARIATIONFORAPPROVAL';
        //Performance Contract
        OnSendPerfomApprovalRequestTxt: label 'Approval of a Annual Workplan Approval is requested';
        RunWorkflowOnSendPerformForApprovalCode: label 'RUNWORKFLOWONSENDPERFORMFORAPPROVAL';
        OnCancelPerformApprovalRequestTxt: label 'An Approval of a Annual Workplan Approval  is canceled';
        RunWorkflowOnCancelPerformForApprovalCode: label 'RUNWORKFLOWONCANCELPERFORMFORAPPROVAL';

        //Annual

        OnSendAnnualApprovalRequestTxt: label 'Approval of a Annual Workplan Plan is requested';
        RunWorkflowOnSendAnnualForApprovalCode: label 'RUNWORKFLOWONSENDANNUALFORAPPROVAL';
        OnCancelAnnualApprovalRequestTxt: label 'An Approval of a Annual Workplan Plan  is canceled';
        RunWorkflowOnCancelAnnualForApprovalCode: label 'RUNWORKFLOWONCANCELANNUALFORAPPROVAL';
        //Geval

        OnSendGevalApprovalRequestTxt: label 'Approval of a Group Appraisal is requested';
        RunWorkflowOnSendGevalForApprovalCode: label 'RUNWORKFLOWONSENDGEVALFORAPPROVAL';
        OnCancelGevalApprovalRequestTxt: label 'An Approval of a Group Appraisal is canceled';
        RunWorkflowOnCancelGevalForApprovalCode: label 'RUNWORKFLOWONCANCELGEVALFORAPPROVAL';


        //board
        OnSendBoardApprovalRequestTxt: label 'Approval of a Board/Executive PC is requested';
        RunWorkflowOnSendBoardForApprovalCode: label 'RUNWORKFLOWONSENDBOARDFORAPPROVAL';
        OnCancelBoardApprovalRequestTxt: label 'An Approval of Board/Executive PC  is canceled';
        RunWorkflowOnCancelBoardForApprovalCode: label 'RUNWORKFLOWONCANCELBOARDFORAPPROVAL';
        //Addend1
        OnSendAddendApprovalRequestTxt: label 'Approval of a Addendum is requested';
        RunWorkflowOnSendAddendForApprovalCode: label 'RUNWORKFLOWONSENDADDENDFORAPPROVAL';
        OnCancelAddendApprovalRequestTxt: label 'An Approval of An Addendum is canceled';
        RunWorkflowOnCancelAddendForApprovalCode: label 'RUNWORKFLOWONCANCELADDENDFORAPPROVAL';

        //Evaluation
        OnSendEvaApprovalRequestTxt: label 'Approval of a Bid Evaluation is requested';
        RunWorkflowOnSendEvaForApprovalCode: label 'RUNWORKFLOWONSENDEVAFORAPPROVAL';
        OnCancelEvaApprovalRequestTxt: label 'An Approval of a Bid Evaluation  is canceled';
        RunWorkflowOnCancelEvaForApprovalCode: label 'RUNWORKFLOWONCANCELEVAFORAPPROVAL';

        //Project Schedule
        OnSendScheduleApprovalRequestTxt: label 'Approval of a Project Schedule is requested';
        RunWorkflowOnSendScheduleForApprovalCode: label 'RUNWORKFLOWONSENDSCHEDULEFORAPPROVAL';
        OnCancelScheduleApprovalRequestTxt: label 'An Approval of a Project Schedule is canceled';
        RunWorkflowOnCancelScheduleForApprovalCode: label 'RUNWORKFLOWONCANCELSCHEDULEFORAPPROVAL';

        //purchase requisition
        OnSendPurchaseApprovalRequestTxt: label 'Approval of a Purchase Requisition is requested';
        RunWorkflowOnSendPurchaseForApprovalCode: label 'RUNWORKFLOWONSENDPURCHASEFORAPPROVAL';
        OnCancelPurchaseApprovalRequestTxt: label 'An Approval of a Purchase Requisition  is canceled';
        RunWorkflowOnCancelPurchaseForApprovalCode: label 'RUNWORKFLOWONCANCELPURCHASEFORAPPROVAL';

        //ifRcard
        OnSendIFRApprovalRequestTxt: label 'Approval of an IFR is requested';
        RunWorkflowOnSendIFRForApprovalCode: label 'RUNWORKFLOWONSENDIFRFORAPPROVAL';
        OnCancelIFRApprovalRequestTxt: label 'An Approval of An IFR is canceled';
        RunWorkflowOnCancelIFRForApprovalCode: label 'RUNWORKFLOWONCANCELIFRFORAPPROVAL';

        //DraftIFS
        OnSendDraftIFSApprovalRequestTxt: label 'Approval of DraftIFS is requested';
        RunWorkflowOnSendDraftIFSForApprovalCode: label 'RUNWORKFLOWONSENDDRAFTIFSFORAPPROVAL';
        OnCancelDraftIFSApprovalRequestTxt: label 'An Approval of DraftIFS is canceled';
        RunWorkflowOnCancelDraftIFSForApprovalCode: label 'RUNWORKFLOWONCANCELDRAFTIFSFORAPPROVAL';

        //RFQ
        OnSendRFQApprovalRequestTxt: label 'Approval of Tender Invitation is requested';
        RunWorkflowOnSendRFQForApprovalCode: label 'RUNWORKFLOWONRFQFORAPPROVAL';
        OnCancelRFQApprovalRequestTxt: label 'An Approval of Tender Invitation  is canceled';
        RunWorkflowOnCancelRFQForApprovalCode: label 'RUNWORKFLOWONCANCELRFQFORAPPROVAL';

        //Procurement Plan
        OnSendProcPlanApprovalRequestTxt: label 'Approval of Procurement Plan is requested';
        RunWorkflowOnSendProcPlanForApprovalCode: label 'RUNWORKFLOWONPROCPLANFORAPPROVAL';
        OnCancelProcPlanApprovalRequestTxt: label 'An Approval of Procurement Plan is canceled';
        RunWorkflowOnCancelProcPlanForApprovalCode: label 'RUNWORKFLOWONCANCELProcPlanFORAPPROVAL';
        //PV
        OnSendPVApprovalRequestTxt: label 'Approval of a payments document  is requested';
        RunWorkflowOnSendPVForApprovalCode: label 'RUNWORKFLOWONSENDPVFORAPPROVAL';
        OnCancelPVApprovalRequestTxt: label 'An Approval of a Payments Document is canceled';
        RunWorkflowOnCancelPVForApprovalCode: label 'RUNWORKFLOWONCANCELPVFORAPPROVAL';

        //Imprest Memo
        OnSendIMApprovalRequestTxt: label 'Approval of an Imprest Memo is requested';
        RunWorkflowOnSendIMForApprovalCode: label 'RUNWORKFLOWONSENDIMFORAPPROVAL';
        OnCancelIMApprovalRequestTxt: label 'An Approval of aN Imprest Memo is canceled';
        RunWorkflowOnCancelIMForApprovalCode: label 'RUNWORKFLOWONCANCELIMFORAPPROVAL';

        //Interbank Transfers
        OnSendITApprovalRequestTxt: label 'Approval of an Interbank Transfer is requested';
        RunWorkflowOnSendITForApprovalCode: label 'RUNWORKFLOWONSENDITFORAPPROVAL';
        OnCancelITApprovalRequestTxt: label 'An Approval of an Interbank Transfer is canceled';
        RunWorkflowOnCancelITForApprovalCode: label 'RUNWORKFLOWONCANCELITFORAPPROVAL';
        //SecurityIncidence
        OnSendSecurityIncidenceApprovalRequestTxt: label 'Approval of an Security Incidence is requested';
        RunWorkflowOnSendSecurityIncidenceForApprovalCode: label 'RUNWORKFLOWONSENDSECURITYINCIDENCEFORAPPROVAL';
        OnCancelSecurityIncidenceApprovalRequestTxt: label 'An Approval of an Security Incidence is canceled';
        RunWorkflowOnCancelSecurityIncidenceForApprovalCode: label 'RUNWORKFLOWONCANCELSECURITYINCIDENCEFORAPPROVAL';
        //ProjectStaffVoucher
        OnSendProjectStaffVoucherApprovalRequestTxt: label 'Approval of an Staff Appointement is requested';
        RunWorkflowOnSendProjectStaffVoucherForApprovalCode: label 'RUNWORKFLOWONSENDPROJECTSTAFFVOUCHERFORAPPROVAL';
        OnCancelProjectStaffVoucherApprovalRequestTxt: label 'An Approval of an Staff Appointment is canceled';
        RunWorkflowOnCancelProjectStaffVoucherForApprovalCode: label 'RUNWORKFLOWONCANCELPROJECTSTAFFVOUCHERFORAPPROVAL';
        //Fuel Requisition
        OnSendFuelRequisitionApprovalRequestTxt: label 'Approval of a Fuel and Maintenance Requisition is requested';
        RunWorkflowOnSendFuelRequisitionForApprovalCode: label 'RUNWORKFLOWONSENDFUELREQUISITIONFORAPPROVAL';
        OnCancelFuelRequisitionApprovalRequestTxt: label 'An Approval of a Fuel and Maintenance Requisition is canceled';
        RunWorkflowOnCancelFuelRequisitionForApprovalCode: label 'RUNWORKFLOWONCANCELFUELREQUISITIONFORAPPROVAL';
        //Request for PC sum Expensing
        OnSendPCSumExpensingApprovalRequestTxt: label 'Approval of a Request for PC Sum Expensing is requested';
        RunWorkflowOnSendPCSumExpensingForApprovalCode: label 'RUNWORKFLOWONSENDPCSUMEXPENSINGFORAPPROVAL';
        OnCancelPCSumExpensingApprovalRequestTxt: label 'An Approval of a Request for PC Sum Expensing is canceled';
        RunWorkflowOnCancelPCSumExpensingForApprovalCode: label 'RUNWORKFLOWONCANCELPCSUMEXPENSINGFORAPPROVAL';
        //Inspection header
        OnSendInspectionHeaderApprovalRequestTxt: label 'Approval of a Request for Inspection Header is requested';
        RunWorkflowOnSendInspectionHeaderForApprovalCode: label 'RUNWORKFLOWONSENDINSPECTIONHEADERFORAPPROVAL';
        OnCancelInspectionHeaderApprovalRequestTxt: label 'An Approval of a Request for Inspection Header is canceled';
        RunWorkflowOnCancelInspectionHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELINSPECTIONHEADERFORAPPROVAL';
        //Project Mobilization header
        OnSendProjectMobilizationHeaderApprovalRequestTxt: label 'Approval of a Request for Project Mobilization Header is requested';
        RunWorkflowOnSendProjectMobilizationHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPROJECTMOBILIZATIONHEADERFORAPPROVAL';
        OnCancelProjectMobilizationHeaderApprovalRequestTxt: label 'An Approval of a Request for Project Mobilization Header is canceled';
        RunWorkflowOnCancelProjectMobilizationHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPROJECTMOBILIZATIONHEADERFORAPPROVAL';
        //Project Evaluation header
        OnSendProjectEvaluationHeaderApprovalRequestTxt: label 'Approval of a Request for Project Evaluation Header is requested';
        RunWorkflowOnSendProjectEvaluationHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPROJECTEVALUATIONHEADERFORAPPROVAL';
        OnCancelProjectEvaluationHeaderApprovalRequestTxt: label 'An Approval of a Request for Project Evaluation Header is canceled';
        RunWorkflowOnCancelProjectEvaluationHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPROJECTEVALUATIONHEADERFORAPPROVAL';
        //Equipment Repair Tracking
        OnSendEquipmentRepairTrackingApprovalRequestTxt: label 'Approval of a Request for Equipment Repair Tracking is requested';
        RunWorkflowOnSendEquipmentRepairTrackingForApprovalCode: label 'RUNWORKFLOWONSENDEQUIPMENTREPAIRTRACKINGFORAPPROVAL';
        OnCancelEquipmentRepairTrackingApprovalRequestTxt: label 'An Approval of a Request for Equipment Repair Tracking is canceled';
        RunWorkflowOnCancelEquipmentRepairTrackingForApprovalCode: label 'RUNWORKFLOWONCANCELEQUIPMENTREPAIRTRACKINGFORAPPROVAL';
        //Insurance Guarantee
        OnSendInsuranceGuaranteeApprovalRequestTxt: label 'Approval of a Request for Insurance Guarantee is requested';
        RunWorkflowOnSendInsuranceGuaranteeForApprovalCode: label 'RUNWORKFLOWONSENDINSURANCEGUARANTEEFORAPPROVAL';
        OnCancelInsuranceGuaranteeApprovalRequestTxt: label 'An Approval of a Request for Insurance Guarantee is canceled';
        RunWorkflowOnCancelInsuranceGuaranteeForApprovalCode: label 'RUNWORKFLOWONCANCELINSURANCEGUARANTEEFORAPPROVAL';
        //Material Test Record
        OnSendMaterialTestRecordApprovalRequestTxt: label 'Approval of a Request for Material Test Record is requested';
        RunWorkflowOnSendMaterialTestRecordForApprovalCode: label 'RUNWORKFLOWONSENDMATERIALTESTRECORDFORAPPROVAL';
        OnCancelMaterialTestRecordApprovalRequestTxt: label 'An Approval of a Request for Material Test Record is canceled';
        RunWorkflowOnCancelMaterialTestRecordForApprovalCode: label 'RUNWORKFLOWONCANCELMATERIALTESTRECORDFORAPPROVAL';
        //Work plan header
        OnSendWorkPlanHeaderApprovalRequestTxt: label 'Approval of a Request for Work Plan Header is requested';
        RunWorkflowOnSendWorkPlanHeaderForApprovalCode: label 'RUNWORKFLOWONSENDWORKPLANHEADERFORAPPROVAL';
        OnCancelWorkPlanHeaderApprovalRequestTxt: label 'An Approval of a Request for Work Plan Header is canceled';
        RunWorkflowOnCancelWorkPlanHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELWORKPLANHEADERFORAPPROVAL';
        //"Risk M&E Header"
        OnSendRiskMEHeaderApprovalRequestTxt: label 'Approval of a Request for Risk M&E Header is requested';
        RunWorkflowOnSendRiskMEHeaderForApprovalCode: label 'RUNWORKFLOWONSENDRISKMEHEADERFORAPPROVAL';
        OnCancelRiskMEHeaderApprovalRequestTxt: label 'An Approval of a Request for Risk M&E Header is canceled';
        RunWorkflowOnCancelRiskMEHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELRISKMEHEADERFORAPPROVAL';
        //Site Instructions
        OnSendSiteInstructionsApprovalRequestTxt: label 'Approval of a Request for Site Instructions is requested';
        RunWorkflowOnSendSiteInstructionsForApprovalCode: label 'RUNWORKFLOWONSENDSITEINSTRUCTIONSFORAPPROVAL';
        OnCancelSiteInstructionsApprovalRequestTxt: label 'An Approval of a Request for Site Instructions is canceled';
        RunWorkflowOnCancelSiteInstructionsForApprovalCode: label 'RUNWORKFLOWONCANCELSITEINSTRUCTIONSFORAPPROVAL';
        //Project Meeting Register
        OnSendProjectMeetingRegisterApprovalRequestTxt: label 'Approval of a Request for Project Meeting Register is requested';
        RunWorkflowOnSendProjectMeetingRegisterForApprovalCode: label 'RUNWORKFLOWONSENDPROJECTMEETINGREGISTERFORAPPROVAL';
        OnCancelProjectMeetingRegisterApprovalRequestTxt: label 'An Approval of a Request for Project Meeting Register is canceled';
        RunWorkflowOnCancelProjectMeetingRegisterForApprovalCode: label 'RUNWORKFLOWONCANCELPROJECTMEETINGREGISTERFORAPPROVAL';
        //Repayment Schedule
        OnSendRepaymentScheduleApprovalRequestTxt: label 'Approval of a Request for Repayment Schedule is requested';
        RunWorkflowOnSendRepaymentScheduleForApprovalCode: label 'RUNWORKFLOWONSENDREPAYMENTSCHEDULEFORAPPROVAL';
        OnCancelRepaymentScheduleApprovalRequestTxt: label 'An Approval of a Request for Repayment Schedule is canceled';
        RunWorkflowOnCancelRepaymentScheduleForApprovalCode: label 'RUNWORKFLOWONCANCELREPAYMENTSCHEDULEFORAPPROVAL';
        //Risk Incident Log
        OnSendRiskIncidentLogApprovalRequestTxt: label 'Approval of a Request for Risk Incident Log is requested';
        RunWorkflowOnSendRiskIncidentLogForApprovalCode: label 'RUNWORKFLOWONSENDRISKINCIDENTLOGFORAPPROVAL';
        OnCancelRiskIncidentLogApprovalRequestTxt: label 'An Approval of a Request for Risk Incident Log is canceled';
        RunWorkflowOnCancelRiskIncidentLogForApprovalCode: label 'RUNWORKFLOWONCANCELRISKINCIDENTLOGFORAPPROVAL';
        //Risk Managemnt Plan
        OnSendRiskManagementPlanApprovalRequestTxt: label 'Approval of a Request for Risk Management Plan is requested';
        RunWorkflowOnSendRiskManagementPlanForApprovalCode: label 'RUNWORKFLOWONSENDRISKMANAGEMENTPLANFORAPPROVAL';
        OnCancelRiskManagementPlanApprovalRequestTxt: label 'An Approval of a Request for Risk Management Plan is canceled';
        RunWorkflowOnCancelRiskManagementPlanForApprovalCode: label 'RUNWORKFLOWONCANCELRISKMANAGEMENTPLANFORAPPROVAL';
        //WEP Contractor Submission
        OnSendWEPContractorSubmissionApprovalRequestTxt: label 'Approval of a Request for WEP Contractor Submission is requested';
        RunWorkflowOnSendWEPContractorSubmissionForApprovalCode: label 'RUNWORKFLOWONSENDWEPCONTRACTORSUBMISSIONFORAPPROVAL';
        OnCancelWEPContractorSubmissionApprovalRequestTxt: label 'An Approval of a Request for WEP Contractor Submission is canceled';
        RunWorkflowOnCancelWEPContractorSubmissionForApprovalCode: label 'RUNWORKFLOWONCANCELWEPCONTRACTORSUBMISSIONFORAPPROVAL';
        //Survey Quality Check Header
        OnSendSurveyQualityCheckHeaderApprovalRequestTxt: label 'Approval of a Request for Survey Quality Header is requested';
        RunWorkflowOnSendSurveyQualityCheckHeaderForApprovalCode: label 'RUNWORKFLOWONSENDSURVEYQUALITYHEADERFORAPPROVAL';
        OnCancelSurveyQualityCheckHeaderApprovalRequestTxt: label 'An Approval of a Request for Survey Quality Header is canceled';
        RunWorkflowOnCancelSurveyQualityCheckHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELSURVEYQUALITYHEADERFORAPPROVAL';
        //Temporary Supervision Requirem
        OnSendTemporarySupervisionRequiremApprovalRequestTxt: label 'Approval of a Request for Temporary Supervision Requirement is requested';
        RunWorkflowOnSendTemporarySupervisionRequiremForApprovalCode: label 'RUNWORKFLOWONSENDTEMPORARYSUPERVISIONREQUIREMFORAPPROVAL';
        OnCancelTemporarySupervisionRequiremApprovalRequestTxt: label 'An Approval of a Request for Temporary Supervision Requirement is canceled';
        RunWorkflowOnCancelTemporarySupervisionRequiremForApprovalCode: label 'RUNWORKFLOWONCANCELTEMPORARYSUPERVISIONREQUIREMFORAPPROVAL';
        //Communication Plan Header
        OnSendCommunicationPlanHeaderApprovalRequestTxt: label 'Approval of a Request for Communication plan is requested';
        RunWorkflowOnSendCommunicationPlanHeaderForApprovalCode: label 'RUNWORKFLOWONSENDCOMMUNICATIONPLANFORAPPROVAL';
        OnCancelCommunicationPlanHeaderApprovalRequestTxt: label 'An Approval of a Request for Communication plan is canceled';
        RunWorkflowOnCancelCommunicationPlanHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELCOMMUNICATIONPLANFORAPPROVAL';
        //Daily Work Record
        OnSendDailyWorkRecordApprovalRequestTxt: label 'Approval of a Request for Daily Work Record is requested';
        RunWorkflowOnSendDailyWorkRecordForApprovalCode: label 'RUNWORKFLOWONSENDDAILYWORKRECORDFORAPPROVAL';
        OnCancelDailyWorkRecordApprovalRequestTxt: label 'An Approval of a Request for Daily Work Record is canceled';
        RunWorkflowOnCancelDailyWorkRecordForApprovalCode: label 'RUNWORKFLOWONCANCELDAILYWORKRECORDFORAPPROVAL';
        //RAM Workplan
        OnSendRAMWorkPlanApprovalRequestTxt: label 'Approval of a Request for RAM Work Plan is requested';
        RunWorkflowOnSendRAMWorkPlanForApprovalCode: label 'RUNWORKFLOWONSENDRAMWORKPLANHEADERFORAPPROVAL';
        OnCancelRAMWorkPlanApprovalRequestTxt: label 'An Approval of a Request for RAM Work Plan is canceled';
        RunWorkflowOnCancelRAMWorkPlanForApprovalCode: label 'RUNWORKFLOWONCANCELRAMWORKPLANHEADERFORAPPROVAL';
        //Leave Recall
        OnSendLeaveRecallApprovalRequestTxt: label 'Approval of a Request for Leave Recall is requested';
        RunWorkflowOnSendLeaveRecallForApprovalCode: label 'RUNWORKFLOWONSENDLEAVERECALLFORAPPROVAL';
        OnCancelLeaveRecallApprovalRequestTxt: label 'An Approval of a Request for Leave Recall is canceled';
        RunWorkflowOnCancelLeaveRecallForApprovalCode: label 'RUNWORKFLOWONCANCELLEAVERECALLFORAPPROVAL';
        //RoadWorksBudgetCeiling
        OnSendRoadWorksBudgetCeilingApprovalRequestTxt: label 'Approval of a Request for RoadWorks Budget Ceiling is requested';
        RunWorkflowOnSendRoadWorksBudgetCeilingForApprovalCode: label 'RUNWORKFLOWONSENDROADWORKSBUDGETCEILINGFORAPPROVAL';
        OnCancelRoadWorksBudgetCeilingApprovalRequestTxt: label 'An Approval of a Request for RoadWorks Budget Ceiling is canceled';
        RunWorkflowOnCancelRoadWorksBudgetCeilingForApprovalCode: label 'RUNWORKFLOWONCANCELROADWORKSBUDGETCEILINGFORAPPROVAL';
        //FuelTopup
        OnSendFuelTopupApprovalRequestTxt: label 'Approval of a Fuel Topup Request is requested';
        RunWorkflowOnSendFuelTopupRequestForApprovalCode: label 'RUNWORKFLOWONSENDFUELTOPUPREQUESTFORAPPROVAL';
        OnCancelFuelTopupRequestApprovalRequestTxt: label 'An Approval of a Fuel Topup Request is canceled';
        RunWorkflowOnCancelFuelTopupRequestForApprovalCode: label 'RUNWORKFLOWONCANCELFUELTOPUPREQUESTFORAPPROVAL';
        //Vehicle Fuel Card Lines
        OnSendVehicleFuelCardLinesApprovalRequestTxt: label 'Approval of a Fuel Card expense is requested';
        RunWorkflowOnSendVehicleFuelCardLinesForApprovalCode: label 'RUNWORKFLOWONSENDFUELCARDEXPENSEFORAPPROVAL';
        OnCancelVehicleFuelCardLinesApprovalRequestTxt: label 'An Approval of a Fuel Card Expense is canceled';
        RunWorkflowOnCancelVehicleFuelCardLinesForApprovalCode: label 'RUNWORKFLOWONCANCELFUELCARDEXPENSEFORAPPROVAL';
        //Road inventory condition survey
        OnSendRICSApprovalRequestTxt: label 'Approval of a Road Inventory Condition Survey is requested';
        RunWorkflowOnSendRICSForApprovalCode: label 'RUNWORKFLOWONSENDRICSFORAPPROVAL';
        OnCancelRICSApprovalRequestTxt: label 'An Approval of a Road Inventory Condition Survey is canceled';
        RunWorkflowOnCancelRICSForApprovalCode: label 'RUNWORKFLOWONCANCELRICSFORAPPROVAL';
        //Recruitment Requisitions
        OnSendRecruitmentRequisitionsApprovalRequestTxt: label 'Approval of a Recruitment Requisition is requested';
        RunWorkflowOnSendRecruitmentRequisitionsForApprovalCode: label 'RUNWORKFLOWONSENDRECRUITMENTREQUISITIONSFORAPPROVAL';
        OnCancelRecruitmentRequisitionsApprovalRequestTxt: label 'An Approval of a Recruitment Requisition is canceled';
        RunWorkflowOnCancelRecruitmentRequisitionsForApprovalCode: label 'RUNWORKFLOWONCANCELRECRUITMENTREQUISITIONSFORAPPROVAL';
             //Leave Plan
        OnSendLeavePlanApprovalRequestTxt: label 'Approval of a Leave Plan is requested';
        RunWorkflowOnSendLeavePlanForApprovalCode: label 'RUNWORKFLOWONSENDLEAVEPLANFORAPPROVAL';
        OnCancelLeavePlanApprovalRequestTxt: label 'An Approval of a Leave Plan is canceled';
        RunWorkflowOnCancelLeavePlanForApprovalCode: label 'RUNWORKFLOWONCANCELLEAVEPLANFORAPPROVAL';
        //File Movement Header
        OnSendFileMovementHeaderApprovalRequestTxt: label 'Approval of a File Movement Header is requested';
        RunWorkflowOnSendFileMovementHeaderForApprovalCode: label 'RUNWORKFLOWONSENDFILEMOVEMENTHEADERFORAPPROVAL';
        OnCancelFileMovementHeaderApprovalRequestTxt: label 'An Approval of a File Movement Header is canceled';
        RunWorkflowOnCancelFileMovementHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELFILEMOVEMENTHEADERFORAPPROVAL';
        //Membership Fees Requisitions
        OnSendMembershipFeesRequisitionsApprovalRequestTxt: label 'Approval of a Membership Fees Req. is requested';
        RunWorkflowOnSendMembershipFeesRequisitionsForApprovalCode: label 'RUNWORKFLOWONSENDMEMBERSHIPFEESREQUISITIONSFORAPPROVAL';
        OnCancelMembershipFeesRequisitionsApprovalRequestTxt: label 'An Approval of a Membership Fees Req. is canceled';
        RunWorkflowOnCancelMembershipFeesRequisitionsForApprovalCode: label 'RUNWORKFLOWONCANCELMEMBERSHIPFEESREQUISITIONSFORAPPROVAL';
        //Fuel Allocations
        OnSendFuelAllocationsApprovalRequestTxt: label 'Approval of a Fuel Allocation is requested';
        RunWorkflowOnSendFuelAllocationsForApprovalCode: label 'RUNWORKFLOWONSENDFUELALLOCATIONSFORAPPROVAL';
        OnCancelFuelAllocationsApprovalRequestTxt: label 'An Approval of a Fuel Allocation is canceled';
        RunWorkflowOnCancelFuelAllocationsForApprovalCode: label 'RUNWORKFLOWONCANCELFUELALLOCATIONSFORAPPROVAL';

        //Training Needs Header
        OnSendTrainingNeedsHeaderApprovalRequestTxt: label 'Approval of a Training Needs Header is requested';
        RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode: label 'RUNWORKFLOWONSENDTRAININGNEEDSHEADERFORAPPROVAL';
        OnCancelTrainingNeedsHeaderApprovalRequestTxt: label 'An Approval of a Training Needs Header is canceled';
        RunWorkflowOnCancelTrainingNeedsHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGNEEDSHEADERFORAPPROVAL';
        //"Payroll HeaderT"

        OnSendTempSalaryVoucherApprovalRequestTxt: label 'Approval of a Temporary Salary Voucher is requested';
        RunWorkflowOnSendTempSalaryVoucherForApprovalCode: label 'RUNWORKFLOWONSENDTEMPORARYSALARYVOUCHERFORAPPROVAL';
        OnCancelTempSalaryVoucherApprovalRequestTxt: label 'An Approval of a Temporary Salary Voucher is canceled';
        RunWorkflowOnCancelTempSalaryVoucherForApprovalCode: label 'RUNWORKFLOWONCANCELTEMPORARYSALARYVOUCHERFORAPPROVAL';
        //Vendor Appraisal Voucher

        OnSendVendAppraisalVoucherApprovalRequestTxt: label 'Approval of a Vendor Appraisal Voucher is requested';
        RunWorkflowOnSendVendAppraisalVoucherForApprovalCode: label 'RUNWORKFLOWONSENDVENDORAPPRAISALVOUCHERFORAPPROVAL';
        OnCancelVendAppraisalVoucherApprovalRequestTxt: label 'An Approval of a Vendor Appraisal Voucher is canceled';
        RunWorkflowOnCancelVendAppraisalVoucherForApprovalCode: label 'RUNWORKFLOWONCANCELVENDORAPPRAISALVOUCHERFORAPPROVAL';
        //Contract Termination

        OnSendContractTerminationApprovalRequestTxt: label 'Approval of a Contract Termination Request is requested';
        RunWorkflowOnSendContractTerminationForApprovalCode: label 'RUNWORKFLOWONSENDCONTRACTTERMINATIONFORAPPROVAL';
        OnCancelContractTerminationApprovalRequestTxt: label 'An Approval of a Contract Termination Request is canceled';
        RunWorkflowOnCancelContractTerminationForApprovalCode: label 'RUNWORKFLOWONCANCELCONTRACTTERMINATIONFORAPPROVAL';
    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            //pavement
            Database::"Pavement Test Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPavementForApprovalCode));
            //ifs tender
            Database::"IFS Tender Committee":
                exit(CheckApprovalsWorkflowEnabledCode(Variant,
                 RunWorkflowOnSendCommForApprovalCode));
            //paYROLL
            Database::"PaYROLL Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPayrollForApprovalCode));
            //proff

            Database::"Bid Tabulation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPROFForApprovalCode));
            //Receipt
            Database::"Receipts Header1":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendReceiptForApprovalCode));
            //Leave
            Database::"HR Leave Applications":
            begin
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeaveForApprovalCode));
            end;
                
            //AdvancedPayment
            Database::"Measurement &  Payment Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAdvPayForApprovalCode));


            //Fleet
            Database::"Transport Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFleetForApprovalCode));
            //CORPORATE
            Database::"Corporate Strategic Plans":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCorporateForApprovalCode));
            //Monitor
            Database::"Monitoring Card Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMonitorForApprovalCode));
            //Project Variation
            Database::"Project Variation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendVariationForApprovalCode));
            //Performance Contract
            Database::"Perfomance Contract Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPerformForApprovalCode));
            //Geval
            Database::"Perfomance Evaluation":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendGevalForApprovalCode));
            //Board
            Database::"Project Contract Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBoardForApprovalCode));
            //Annual
            Database::"Annual Strategy Workplan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAnnualForApprovalCode));
            //ADDEND2
            Database::"Tender Addendum Notice":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAddendForApprovalCode));
            //Evaluation
            Database::"Bid Scoring Template":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEvaForApprovalCode));
            //pROJECT SCHEDULE
            Database::"Road Work Program":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendScheduleForApprovalCode));

            //pURCHASE
            Database::"Purchase Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPurchaseForApprovalCode));
            //IFRCARD
            Database::"Request For Information":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIFRForApprovalCode));
            //DraftIFS

            //procurement Plan
            Database::"Procurement Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProcPlanForApprovalCode));
            //RFQ
            Database::"Standard Purchase Code":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRFQForApprovalCode));
            //PV
            Database::"payments":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPVForApprovalCode));
            //Imprest Memo
            Database::"Imprest Memo":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIMForApprovalCode));

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendITForApprovalCode));

            Database::"Security Incidences":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSecurityIncidenceForApprovalCode));
            Database::"Project Staff Voucher":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProjectStaffVoucherForApprovalCode));
            Database::"Fuel & Maintenance Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFuelRequisitionForApprovalCode));
            Database::"Request for PC sum Expensing":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPCSumExpensingForApprovalCode));
            //Inspecvtion Header
            Database::"Inspection Header1":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInspectionHeaderForApprovalCode));
            //Project mobilization Header
            Database::"Project Mobilization Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProjectMobilizationHeaderForApprovalCode));
            //Project Evaluation Header
            Database::"Project Evaluation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProjectEvaluationHeaderForApprovalCode));
            //Equipment Repair Tracking
            Database::"Equipment Repair Tracking":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEquipmentRepairTrackingForApprovalCode));
            //Insurance Guarantee 
            Database::"Insurance/Guarantee Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInsuranceGuaranteeForApprovalCode));
            //Material Test Record
            Database::"Material Test Record":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMaterialTestRecordForApprovalCode));
            //Work plan header
            Database::"Work Plan Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendWorkPlanHeaderForApprovalCode));
            //Risk M&E Header
            Database::"Risk M&E Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRiskMEHeaderForApprovalCode));
            //Site Instructions
            Database::"Site Instructions Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSiteInstructionsForApprovalCode));
            //Project Meeting Register
            Database::"Project Meeting Register":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProjectMeetingRegisterForApprovalCode));
            //Repayment Schedule
            Database::"RE Payment Schedule Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRepaymentScheduleForApprovalCode));
            //Risk incident log
            Database::"Risk Incident Log":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRiskIncidentLogForApprovalCode));
            //Risk Management Plan
            Database::"Risk Management Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRiskManagementPlanForApprovalCode));
            //WEP Contractor submission
            Database::"WEP Contractor Submission":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendWEPContractorSubmissionForApprovalCode));
            //Survey Quality Check Header
            Database::"Survey Quality Check Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSurveyQualityCheckHeaderForApprovalCode));
            //Temporary Supervision Requirem
            Database::"Temporary Supervision Requirem":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTemporarySupervisionRequiremForApprovalCode));
            //Communication Plan Header
            Database::"Communication Plan Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCommunicationPlanHeaderForApprovalCode));
            //Daily Work Record
            Database::"Daily Work Record":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDailyWorkRecordForApprovalCode));
            //RAM work plan
            Database::"RAM Workplan Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRAMWorkPlanForApprovalCode));
            //lEAVE Recall
            Database::"Leave Recall":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeaveRecallForApprovalCode));
            //RoadWorksBudgetCeiling
            Database::"Road Works Budget Ceilings":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRoadWorksBudgetCeilingForApprovalCode));
            //FuelTopupRequest
            Database::"Fuel Topup Request":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFuelTopupRequestForApprovalCode));
            //VehicleFuelCardLines
            Database::"Vehicle Fuel Card Lines":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendVehicleFuelCardLinesForApprovalCode));
            //RICS
            Database::"Road Inv. Condition Survey":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRICSForApprovalCode));
            //Recruitment Requisitions
            Database::"Recruitment Requisition Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, 
                RunWorkflowOnSendRecruitmentRequisitionsForApprovalCode));
            Database::"HR Leave Planner Header":
            exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeavePlanForApprovalCode));
            //Membership Fees Requisitions
            Database::"Membership Fees Requisitions":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMembershipFeesRequisitionsForApprovalCode));
            //Fuel Allocations
            Database::"Fuel Allocations":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFuelAllocationsForApprovalCode));
            Database::"Payroll HeaderT":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTempSalaryVoucherForApprovalCode));
            //Training Needs Header
            Database::"Training Needs Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode));
            //Vendor Appraisal Voucher
            Database::"Vendor Appraisal Voucher":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendVendAppraisalVoucherForApprovalCode));
            //Contract termination
            Database::"Contract Termination":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendContractTerminationForApprovalCode));
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelDocApprovalRequest(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin
        //IFS TENDER

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCommForApprovalCode, Database::"ifs tender committee", OnSendCommApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCommForApprovalCode, Database::"ifs tender committee", OnCancelCommApprovalRequestTxt, 0, false);

        //Pavement
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPavementForApprovalCode, Database::"Pavement Test Header", OnSendPavementApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPavementForApprovalCode, Database::"Pavement Test Header", OnCancelPavementApprovalRequestTxt, 0, false);

        //procurement plan
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendProcPlanForApprovalCode, Database::"Procurement Plan", OnSendProcPlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProcPlanForApprovalCode, Database::"Procurement Plan", OnCancelProcPlanApprovalRequestTxt, 0, false);

        //Payroll
        WorkFlowEventHandling.AddEventToLibrary(
               ////////////////////////////////////////;

               RunWorkflowOnSendPayrollForApprovalCode, Database::"Payroll Header", OnSendPayrollApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPayrollForApprovalCode, Database::"Payroll Header", OnCancelPayrollApprovalRequestTxt, 0, false);

        //PROFF
        WorkFlowEventHandling.AddEventToLibrary(
               ////////////////////////////////////////;

               RunWorkflowOnSendPROFForApprovalCode, Database::"Bid Tabulation Header", OnSendProfApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProfForApprovalCode, Database::"Bid Tabulation Header", OnCancelProfApprovalRequestTxt, 0, false);
        //Leave
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLeaveForApprovalCode, Database::"HR Leave Applications", OnSendLeaveApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLeaveForApprovalCode, Database::"HR Leave Applications", OnCancelLeaveApprovalRequestTxt, 0, false);
        //AdvancedPayment
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAdvpayForApprovalCode, Database::"Measurement &  Payment Header", OnSendAdvPayApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAdvPayForApprovalCode, Database::"Measurement &  Payment Header", OnCancelAdvPayApprovalRequestTxt, 0, false);
        //Receipts
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendReceiptForApprovalCode, Database::"Receipts Header1", OnSendReceiptApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelReceiptForApprovalCode, Database::"Receipts Header1", OnCancelReceiptApprovalRequestTxt, 0, false);
        //Fleet
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFleetForApprovalCode, Database::"Transport Requisition", OnSendFleetApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFleetForApprovalCode, Database::"Transport Requisition", OnCancelFleetApprovalRequestTxt, 0, false);

        //Corporate
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendCorporateForApprovalCode, Database::"Corporate Strategic Plans", OnSendCorporateApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCorporateForApprovalCode, Database::"Corporate Strategic Plans", OnCancelCorporateApprovalRequestTxt, 0, false);

        //Monitor
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendMonitorForApprovalCode, Database::"Monitoring Card Header",//////////////////OnSendMonitorApprovalRequestTxt, 0, false);
        OnSendMonitorApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMonitorForApprovalCode, Database::"Monitoring Card Header", OnCancelMonitorApprovalRequestTxt, 0, false);
        //Project Variation
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendVariationForApprovalCode, Database::"Project Variation Header", OnSendVariationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelVariationForApprovalCode, Database::"Project Variation Header", OnCancelVariationApprovalRequestTxt, 0, false);
        //Permance Contract
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendPerformForApprovalCode, Database::"Perfomance Contract Header", OnSendPerfomApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPerformForApprovalCode, Database::"Perfomance Contract Header", OnCancelPerformApprovalRequestTxt, 0, false);
        //board
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendBoardForApprovalCode, Database::"Project Contract Header", OnSendBoardApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBoardForApprovalCode, Database::"Project Contract Header", OnCancelBoardApprovalRequestTxt, 0, false);
        //AnnualP

        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendAnnualForApprovalCode, Database::"Annual Strategy Workplan", OnSendAnnualApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAnnualForApprovalCode, Database::"Annual Strategy Workplan", OnCancelAnnualApprovalRequestTxt, 0, false);

        //Geval

        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendGevalForApprovalCode, Database::"Perfomance Evaluation", OnSendGevalApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
      RunWorkflowOnCancelGevalForApprovalCode, Database::"Perfomance Evaluation", OnCancelGevalApprovalRequestTxt, 0, false);


        //Addend3
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendAddendForApprovalCode, Database::"Tender Addendum Notice", OnSendAddendApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAddendForApprovalCode, Database::"Tender Addendum Notice", OnCancelAddendApprovalRequestTxt, 0, false);

        //Evaluation
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendEvaForApprovalCode, Database::"Bid Scoring Template", OnSendEvaApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEvaForApprovalCode, Database::"Bid Scoring Template", OnCancelEvaApprovalRequestTxt, 0, false);

        //project schedule
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendScheduleForApprovalCode, Database::"Road Work Program", OnSendScheduleApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelScheduleForApprovalCode, Database::"Road Work Program", OnCancelScheduleApprovalRequestTxt, 0, false);
        //Purchase
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPurchaseForApprovalCode, Database::"Purchase Header", OnSendPurchaseApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPurchaseForApprovalCode, Database::"Purchase Header", OnCancelPurchaseApprovalRequestTxt, 0, false);
        //IFPCARD
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendIFRForApprovalCode, Database::"Request For Information", OnSendIFRApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelIFRForApprovalCode, Database::"Request For Information", OnCancelIFRApprovalRequestTxt, 0, false);

        //RFQ
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRFQForApprovalCode, Database::"Standard Purchase Code", OnSendRFQApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRFQForApprovalCode, Database::"Standard Purchase Code", OnCancelRFQApprovalRequestTxt, 0, false);

        //PV
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPVForApprovalCode, Database::"Payments", OnSendPVApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPVForApprovalCode, Database::"Payments", OnCancelPVApprovalRequestTxt, 0, false);

        //Imprest Memo
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendIMForApprovalCode, Database::"Imprest Memo", OnSendIMApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelIMForApprovalCode, Database::"Imprest Memo", OnCancelIMApprovalRequestTxt, 0, false);

        //Interbank Transfer
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendITForApprovalCode, Database::"Inter Bank Transfer", OnSendITApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelITForApprovalCode, Database::"Inter Bank Transfer", OnCancelITApprovalRequestTxt, 0, false);
        //SecurityIncidence
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSecurityIncidenceForApprovalCode, Database::"Security Incidences", OnSendSecurityIncidenceApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSecurityIncidenceForApprovalCode, Database::"Security Incidences", OnCancelSecurityIncidenceApprovalRequestTxt, 0, false);
        //Project Staff Voucher
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendProjectStaffVoucherForApprovalCode, Database::"Project Staff Voucher", OnSendProjectStaffVoucherApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProjectStaffVoucherForApprovalCode, Database::"Project Staff Voucher", OnCancelProjectStaffVoucherApprovalRequestTxt, 0, false);
        //Fuel Requisition
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFuelRequisitionForApprovalCode, Database::"Fuel & Maintenance Requisition", OnSendFuelRequisitionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFuelRequisitionForApprovalCode, Database::"Fuel & Maintenance Requisition", OnCancelFuelRequisitionApprovalRequestTxt, 0, false);
        //PC Sum expensing
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPCSumExpensingForApprovalCode, Database::"Request For PC Sum Expensing", OnSendPCSumExpensingApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPCSumExpensingForApprovalCode, Database::"Request For PC Sum Expensing", OnCancelPCSumExpensingApprovalRequestTxt, 0, false);
        //"Inspection Header1"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendInspectionHeaderForApprovalCode, Database::"Inspection Header1", OnSendInspectionHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelInspectionHeaderForApprovalCode, Database::"Inspection Header1", OnCancelInspectionHeaderApprovalRequestTxt, 0, false);
        //Project Mobilization Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendProjectMobilizationHeaderForApprovalCode, Database::"Project Mobilization Header", OnSendProjectMobilizationHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProjectMobilizationHeaderForApprovalCode, Database::"Project Mobilization Header", OnCancelProjectMobilizationHeaderApprovalRequestTxt, 0, false);
        //Project Evaluation Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendProjectEvaluationHeaderForApprovalCode, Database::"Project Evaluation Header", OnSendProjectEvaluationHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProjectEvaluationHeaderForApprovalCode, Database::"Project Evaluation Header", OnCancelProjectEvaluationHeaderApprovalRequestTxt, 0, false);
        //Equipment Repair Tracking
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEquipmentRepairTrackingForApprovalCode, Database::"Equipment Repair Tracking", OnSendEquipmentRepairTrackingApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEquipmentRepairTrackingForApprovalCode, Database::"Equipment Repair Tracking", OnCancelEquipmentRepairTrackingApprovalRequestTxt, 0, false);
        //Insurance Guarantee
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendInsuranceGuaranteeForApprovalCode, Database::"Insurance/Guarantee Header", OnSendInsuranceGuaranteeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelInsuranceGuaranteeForApprovalCode, Database::"Insurance/Guarantee Header", OnCancelInsuranceGuaranteeApprovalRequestTxt, 0, false);
        //Material Test Record
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMaterialTestRecordForApprovalCode, Database::"Material Test Record", OnSendMaterialTestRecordApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMaterialTestRecordForApprovalCode, Database::"Material Test Record", OnCancelMaterialTestRecordApprovalRequestTxt, 0, false);
        //Work Plan Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendWorkPlanHeaderForApprovalCode, Database::"Work Plan Header", OnSendWorkPlanHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelWorkPlanHeaderForApprovalCode, Database::"Work Plan Header", OnCancelWorkPlanHeaderApprovalRequestTxt, 0, false);
        //Risk M&E Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRiskMEHeaderForApprovalCode, Database::"Risk M&E Header", OnSendRiskMEHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRiskMEHeaderForApprovalCode, Database::"Risk M&E Header", OnCancelRiskMEHeaderApprovalRequestTxt, 0, false);
        //Site instructions
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSiteInstructionsForApprovalCode, Database::"Site Instructions Header", OnSendSiteInstructionsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSiteInstructionsForApprovalCode, Database::"Site Instructions Header", OnCancelSiteInstructionsApprovalRequestTxt, 0, false);
        //Project meeting register
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendProjectMeetingRegisterForApprovalCode, Database::"Project Meeting Register", OnSendProjectMeetingRegisterApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProjectMeetingRegisterForApprovalCode, Database::"Project Meeting Register", OnCancelProjectMeetingRegisterApprovalRequestTxt, 0, false);
        //RepRepaymentSchedule
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRepaymentScheduleForApprovalCode, Database::"RE Payment Schedule Header", OnSendRepaymentScheduleApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRepaymentScheduleForApprovalCode, Database::"RE Payment Schedule Header", OnCancelRepaymentScheduleApprovalRequestTxt, 0, false);
        //Risk incident log
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRiskIncidentLogForApprovalCode, Database::"Risk Incident Log", OnSendRiskIncidentLogApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRiskIncidentLogForApprovalCode, Database::"Risk Incident Log", OnCancelRiskIncidentLogApprovalRequestTxt, 0, false);
        //Risk ManaManagement Plan
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRiskManagementPlanForApprovalCode, Database::"Risk Management Plan", OnSendRiskManagementPlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRiskManagementPlanForApprovalCode, Database::"Risk Management Plan", OnCancelRiskManagementPlanApprovalRequestTxt, 0, false);
        //WEP Contractor Submission
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendWEPContractorSubmissionForApprovalCode, Database::"WEP Contractor Submission", OnSendWEPContractorSubmissionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelWEPContractorSubmissionForApprovalCode, Database::"WEP Contractor Submission", OnCancelWEPContractorSubmissionApprovalRequestTxt, 0, false);
        //Survey Quality Check Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSurveyQualityCheckHeaderForApprovalCode, Database::"Survey Quality Check Header", OnSendSurveyQualityCheckHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSurveyQualityCheckHeaderForApprovalCode, Database::"Survey Quality Check Header", OnCancelSurveyQualityCheckHeaderApprovalRequestTxt, 0, false);
        //Temporary Supervision Requirem
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTemporarySupervisionRequiremForApprovalCode, Database::"Temporary Supervision Requirem", OnSendTemporarySupervisionRequiremApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTemporarySupervisionRequiremForApprovalCode, Database::"Temporary Supervision Requirem", OnCancelTemporarySupervisionRequiremApprovalRequestTxt, 0, false);
        //Communication Plan Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCommunicationPlanHeaderForApprovalCode, Database::"Communication Plan Header", OnSendCommunicationPlanHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCommunicationPlanHeaderForApprovalCode, Database::"Communication Plan Header", OnCancelCommunicationPlanHeaderApprovalRequestTxt, 0, false);
        //Daily work Record
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDailyWorkRecordForApprovalCode, Database::"Daily Work Record", OnSendDailyWorkRecordApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDailyWorkRecordForApprovalCode, Database::"Daily Work Record", OnCancelDailyWorkRecordApprovalRequestTxt, 0, false);
        //RAM Workplan 
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRAMWorkPlanForApprovalCode, Database::"RAM Workplan Header", OnSendRAMWorkPlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRAMWorkPlanForApprovalCode, Database::"RAM Workplan Header", OnCancelRAMWorkPlanApprovalRequestTxt, 0, false);
        //Leave Recall
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLeaveRecallForApprovalCode, Database::"Leave Recall", OnSendLeaveRecallApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLeaveRecallForApprovalCode, Database::"Leave Recall", OnCancelLeaveRecallApprovalRequestTxt, 0, false);
        //Road Works Budget Ceilings
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRoadWorksBudgetCeilingForApprovalCode, Database::"Road Works Budget Ceilings", OnSendRoadWorksBudgetCeilingApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRoadWorksBudgetCeilingForApprovalCode, Database::"Road Works Budget Ceilings", OnCancelRoadWorksBudgetCeilingApprovalRequestTxt, 0, false);
        //Fuel Topup Request
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFuelTopupRequestForApprovalCode, Database::"Fuel Topup Request", OnSendFuelTopupApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFuelTopupRequestForApprovalCode, Database::"Fuel Topup Request", OnCancelFuelTopupRequestApprovalRequestTxt, 0, false);
        //Vehicle Fuel Card Lines
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendVehicleFuelCardLinesForApprovalCode, Database::"Vehicle Fuel Card Lines", OnSendVehicleFuelCardLinesApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelVehicleFuelCardLinesForApprovalCode, Database::"Vehicle Fuel Card Lines", OnCancelVehicleFuelCardLinesApprovalRequestTxt, 0, false);
        //RICS
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRICSForApprovalCode, Database::"Road Inv. Condition Survey", OnSendRICSApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRICSForApprovalCode, Database::"Road Inv. Condition Survey", OnCancelRICSApprovalRequestTxt, 0, false);
        //Recruitment Requisitions
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRecruitmentRequisitionsForApprovalCode, Database::"Recruitment Requisition Header", OnSendRecruitmentRequisitionsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRecruitmentRequisitionsForApprovalCode, Database::"Recruitment Requisition Header", OnCancelRecruitmentRequisitionsApprovalRequestTxt, 0, false);
         //Leave Plan
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLeavePlanForApprovalCode, Database::"HR Leave Planner Header", OnSendLeavePlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLeavePlanForApprovalCode, Database::"HR Leave Planner Header", OnCancelLeavePlanApprovalRequestTxt, 0, false);
        //Membership Fees Requisitions
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMembershipFeesRequisitionsForApprovalCode, Database::"Membership Fees Requisitions", OnSendMembershipFeesRequisitionsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMembershipFeesRequisitionsForApprovalCode, Database::"Membership Fees Requisitions", OnCancelMembershipFeesRequisitionsApprovalRequestTxt, 0, false);
        //Fuel Allocations
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFuelAllocationsForApprovalCode, Database::"Fuel Allocations", OnSendFuelAllocationsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFuelAllocationsForApprovalCode, Database::"Fuel Allocations", OnCancelFuelAllocationsApprovalRequestTxt, 0, false);
        //Temporary salary voucher
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTempSalaryVoucherForApprovalCode, Database::"Payroll HeaderT", OnSendTempSalaryVoucherApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTempSalaryVoucherForApprovalCode, Database::"Payroll HeaderT", OnCancelTempSalaryVoucherApprovalRequestTxt, 0, false);
        //Training Needs Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode, Database::"Training Needs Header", OnSendTrainingNeedsHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTrainingNeedsHeaderForApprovalCode, Database::"Training Needs Header", OnCancelTrainingNeedsHeaderApprovalRequestTxt, 0, false);
          //Vendor Appraisal voucher
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendVendAppraisalVoucherForApprovalCode, Database::"Vendor Appraisal Voucher", OnSendVendAppraisalVoucherApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelVendAppraisalVoucherForApprovalCode, Database::"Vendor Appraisal Voucher", OnCancelVendAppraisalVoucherApprovalRequestTxt, 0, false);
                 //Contract Termination
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendContractTerminationForApprovalCode, Database::"Contract Termination", OnSendContractTerminationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelContractTerminationForApprovalCode, Database::"Contract Termination", OnCancelContractTerminationApprovalRequestTxt, 0, false);
    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnSendDocForApproval', '', false, false)]
    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            //Pavement
            Database::"Pavement Test Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPavementForApprovalCode, Variant);

            //Ifs Tender
            Database::"IFS Tender Committee":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCommForApprovalCode, Variant);

            //Receipts
            Database::"Receipts Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendReceiptForApprovalCode, Variant);
            //Fleet
            Database::"Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFleetForApprovalCode, Variant);
            //AdvancedPayment
            Database::"Measurement &  Payment Header":

                WorkflowManagement.HandleEvent(RunWorkflowOnSendAdvPayForApprovalCode, Variant);

            //Payroll
            Database::"Payroll Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPayrollForApprovalCode, Variant);
            //Proff
            Database::"Bid Tabulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProfForApprovalCode, Variant);
            //Leave
            Database::"HR Leave Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveForApprovalCode, Variant);
            //Corporate
            Database::"Corporate Strategic Plans":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCorporateForApprovalCode, Variant);
            //Monitor
            Database::"Monitoring Card Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMonitorForApprovalCode, Variant);
            //Project Variation
            Database::"Project Variation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendVariationForApprovalCode, Variant);
            //Performance contract
            Database::"Perfomance Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPerformForApprovalCode, Variant);
            //Board
            Database::"Project Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBoardForApprovalCode, Variant);
            //Annual
            Database::"Annual Strategy Workplan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAnnualForApprovalCode, Variant);
            //Geval
            Database::"Perfomance Evaluation":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendGevalForApprovalCode, Variant);
            //Addend4
            Database::"Tender Addendum Notice":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAddendForApprovalCode, Variant);
            //Evaluation
            Database::"Bid Scoring Template":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEvaForApprovalCode, Variant);
            //Project schedule
            Database::"Road Work Program":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendScheduleForApprovalCode, Variant);

            //Purchase
            Database::"Purchase Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPurchaseForApprovalCode, Variant);

            //IFRCARD
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIFRForApprovalCode, Variant);
            //Procurement Plan
            Database::"Procurement Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProcPlanForApprovalCode, Variant);
            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRFQForApprovalCode, Variant);
            //PV
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPVForApprovalCode, Variant);

            //Imprest Memo
            Database::"Imprest Memo":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIMForApprovalCode, Variant);

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendITForApprovalCode, Variant);
            //SecurityIncidence
            Database::"Security Incidences":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSecurityIncidenceForApprovalCode, Variant);
            //Project Staff Voucher
            Database::"Project Staff Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectStaffVoucherForApprovalCode, Variant);
            //Fuel Requisition
            Database::"Fuel & Maintenance Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFuelRequisitionForApprovalCode, Variant);
            //Request For PC Sum Expensing
            Database::"Request For PC Sum Expensing":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPCSumExpensingForApprovalCode, Variant);
            //Inspection header
            Database::"Inspection Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInspectionHeaderForApprovalCode, Variant);
            //Project mobilization header
            Database::"Project Mobilization Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectMobilizationHeaderForApprovalCode, Variant);
            //Project Evaluation header
            Database::"Project Evaluation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectEvaluationHeaderForApprovalCode, Variant);
            //Equipment Repair Tracking
            Database::"Equipment Repair Tracking":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEquipmentRepairTrackingForApprovalCode, Variant);
            // /Insurance Guarantee header
            Database::"Insurance/Guarantee Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInsuranceGuaranteeForApprovalCode, Variant);
            //Material test record
            Database::"Material Test Record":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMaterialTestRecordForApprovalCode, Variant);
            //Work plan header
            Database::"Work Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendWorkPlanHeaderForApprovalCode, Variant);
            //RISK m&e Header
            Database::"Risk M&E Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRiskMEHeaderForApprovalCode, Variant);
            //Site instructions
            Database::"Site Instructions Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSiteInstructionsForApprovalCode, Variant);
            //Project meeting register
            Database::"Project Meeting Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectMeetingRegisterForApprovalCode, Variant);
            //Repayment Schedule
            Database::"RE Payment Schedule Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRepaymentScheduleForApprovalCode, Variant);
            //Risk Incident Log
            Database::"Risk Incident Log":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRiskIncidentLogForApprovalCode, Variant);
            //Risk Management Plan
            Database::"Risk Management Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRiskManagementPlanForApprovalCode, Variant);
            //WEP Contractor Submission
            Database::"WEP Contractor Submission":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendWEPContractorSubmissionForApprovalCode, Variant);
            //Survey Quality Check Header
            Database::"Survey Quality Check Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSurveyQualityCheckHeaderForApprovalCode, Variant);
            //Temporary Supervision Requirem
            Database::"Temporary Supervision Requirem":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTemporarySupervisionRequiremForApprovalCode, Variant);
            //Communication Plan Header
            Database::"Communication Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCommunicationPlanHeaderForApprovalCode, Variant);
            //Daily Work Record
            Database::"Daily Work Record":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDailyWorkRecordForApprovalCode, Variant);
            //RAM work plan
            Database::"RAM Workplan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRAMWorkPlanForApprovalCode, Variant);
            //Leave Recall
            Database::"Leave Recall":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveRecallForApprovalCode, Variant);
            //RoadWorksBudgetCeilings
            Database::"Road Works Budget Ceilings":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRoadWorksBudgetCeilingForApprovalCode, Variant);
            //FuelTopupRequest
            Database::"Fuel Topup Request":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFuelTopupRequestForApprovalCode, Variant);
            //Fuel card expense
            Database::"Vehicle Fuel Card Lines":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendVehicleFuelCardLinesForApprovalCode, Variant);
            //RICS
            Database::"Road Inv. Condition Survey":
               WorkflowManagement.HandleEvent(RunWorkflowOnSendRICSForApprovalCode, Variant);
            //Recruitment Requisitions
            Database::"Recruitment Requisition Header":
               WorkflowManagement.HandleEvent(RunWorkflowOnSendRecruitmentRequisitionsForApprovalCode, Variant);
        
            Database::"HR Leave Planner Header":
               WorkflowManagement.HandleEvent(RunWorkflowOnSendLeavePlanForApprovalCode, Variant);
            //Membership Fees Requisitions
            Database::"Membership Fees Requisitions":
               WorkflowManagement.HandleEvent(RunWorkflowOnSendMembershipFeesRequisitionsForApprovalCode, Variant);
            //Fuel Allocations
            Database::"Fuel Allocations":
               WorkflowManagement.HandleEvent(RunWorkflowOnSendFuelAllocationsForApprovalCode, Variant);
            Database::"Payroll HeaderT":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTempSalaryVoucherForApprovalCode, Variant);
            //Training Needs Header
            Database::"Training Needs Header":
               WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode, Variant);
               //Vendor Appraisal voucher
                 Database::"Vendor Appraisal Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendVendAppraisalVoucherForApprovalCode, Variant);
                //Contract Termination
                Database::"Contract Termination":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendContractTerminationForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnCancelDocApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            //pavement
            Database::"Pavement Test Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPavementForApprovalCode, Variant);
            //Ifs Tender
            Database::"Ifs Tender Committee":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCommForApprovalCode, Variant);

            //payroll
            Database::"Payroll Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPayrollForApprovalCode, Variant);
            //proff
            Database::"Bid Tabulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProfForApprovalCode, Variant);
            //Receipts
            Database::"Receipts Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelReceiptForApprovalCode, Variant);
            //Leave
            Database::"HR Leave Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLeaveForApprovalCode, Variant);
            //AdvancePayment
            Database::"Measurement &  Payment Header":
                ///////////
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAdvPayForApprovalCode, Variant);
            //fleet
            Database::"Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFleetForApprovalCode, Variant);
            //Corporate
            Database::"Corporate Strategic Plans":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCorporateForApprovalCode, Variant);
            //Monitor
            Database::"Monitoring Card Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMonitorForApprovalCode, Variant);
            //Project Variation
            Database::"Project Variation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelVariationForApprovalCode, Variant);
            //Performance Contract
            Database::"Perfomance Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPerformForApprovalCode, Variant);
            //Board
            Database::"Project Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBoardForApprovalCode, Variant);
            //Annual
            Database::"Annual Strategy Workplan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAnnualForApprovalCode, Variant);
            //Geval
            Database::"Perfomance Evaluation":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelGevalForApprovalCode, Variant);
            //Addend5
            Database::"Tender Addendum Notice":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAddendForApprovalCode, Variant);
            //Evaluation
            Database::"Bid Scoring Template":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEvaForApprovalCode, Variant);
            //project Schedule
            Database::"Road Work Program":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelScheduleForApprovalCode, Variant);
            //purchase
            Database::"Purchase Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPurchaseForApprovalCode, Variant);
            //IFRCARD
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFRForApprovalCode, Variant);
            //procurement plan
            Database::"procurement plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcPlanForApprovalCode, Variant);

            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRFQForApprovalCode, Variant);
            //pv
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPVForApprovalCode, Variant);

            //Imprest Memo
            Database::"Imprest Memo":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIMForApprovalCode, Variant);

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelITForApprovalCode, Variant);
            //Security Incidence
            Database::"Security Incidences":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSecurityIncidenceForApprovalCode, Variant);
            //Project Staff Voucher
            Database::"Project Staff Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectStaffVoucherForApprovalCode, Variant);
            //Fuel Requisition
            Database::"Fuel & Maintenance Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFuelRequisitionForApprovalCode, Variant);
            //PC Sum expensing
            Database::"Request For PC Sum Expensing":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPCSumExpensingForApprovalCode, Variant);
            //Inspection Header 1
            Database::"Inspection Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInspectionHeaderForApprovalCode, Variant);
            //Project Mobilization Header
            Database::"Project Mobilization Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectMobilizationHeaderForApprovalCode, Variant);
            //Project Evaluation Header
            Database::"Project Evaluation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectEvaluationHeaderForApprovalCode, Variant);
            //Equipment Repair Tracking
            Database::"Equipment Repair Tracking":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEquipmentRepairTrackingForApprovalCode, Variant);
            //Insurance Guarantee Header
            Database::"Insurance/Guarantee Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInsuranceGuaranteeForApprovalCode, Variant);
            //Material Test Record
            Database::"Material Test Record":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMaterialTestRecordForApprovalCode, Variant);
            //Work plan header
            Database::"Work Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelWorkPlanHeaderForApprovalCode, Variant);
            //Risk M&E Header
            Database::"Risk M&E Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRiskMEHeaderForApprovalCode, Variant);
            //Site Instructions
            Database::"Site Instructions Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSiteInstructionsForApprovalCode, Variant);
            //Project Meeting Register
            Database::"Project Meeting Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectMeetingRegisterForApprovalCode, Variant);
            //Repayment Schedule
            Database::"RE Payment Schedule Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRepaymentScheduleForApprovalCode, Variant);
            //Repayment Schedule
            Database::"Risk Incident Log":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRiskIncidentLogForApprovalCode, Variant);
            //Risk Management Plan
            Database::"Risk Management Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRiskManagementPlanForApprovalCode, Variant);
            //WEP Contractor Submission
            Database::"WEP Contractor Submission":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelWEPContractorSubmissionForApprovalCode, Variant);
            //Survey Quality Check Header
            Database::"Survey Quality Check Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSurveyQualityCheckHeaderForApprovalCode, Variant);
            //Temporary Supervision Requirem
            Database::"Temporary Supervision Requirem":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTemporarySupervisionRequiremForApprovalCode, Variant);
            //Communication plan header
            Database::"Communication Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCommunicationPlanHeaderForApprovalCode, Variant);
            //Daily Work Record
            Database::"Daily Work Record":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDailyWorkRecordForApprovalCode, Variant);
            //Ram work Plan
            Database::"RAM Workplan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRAMWorkPlanForApprovalCode, Variant);
            //Leave Recall
            Database::"Leave Recall":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLeaveRecallForApprovalCode, Variant);
            Database::"Road Works Budget Ceilings":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRoadWorksBudgetCeilingForApprovalCode, Variant);
            //FuelTopupRequest
            Database::"Fuel Topup Request":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFuelTopupRequestForApprovalCode, Variant);
            //Fuel card expense
            Database::"Vehicle Fuel Card Lines":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelVehicleFuelCardLinesForApprovalCode, Variant);
            //RICS
            Database::"Road Inv. Condition Survey":
            WorkflowManagement.HandleEvent(RunWorkflowOnCancelRICSForApprovalCode, Variant);
            //Recruitment Requisitions
            Database::"Recruitment Requisition Header":
            WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecruitmentRequisitionsForApprovalCode, Variant);
                       //Leave Plan
            Database::"HR Leave Planner Header":
            WorkflowManagement.HandleEvent(RunWorkflowOnCancelLeavePlanForApprovalCode, Variant);
            //Membership Fees Requisitions
            Database::"Membership Fees Requisitions":
            WorkflowManagement.HandleEvent(RunWorkflowOnCancelMembershipFeesRequisitionsForApprovalCode, Variant);
            //Fuel Allocations
            Database::"Fuel Allocations":
            WorkflowManagement.HandleEvent(RunWorkflowOnCancelFuelAllocationsForApprovalCode, Variant);
            //"Payroll HeaderT"
            Database::"Payroll HeaderT":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTempSalaryVoucherForApprovalCode, Variant);
            //Training Needs Header
            Database::"Training Needs Header":
            WorkflowManagement.HandleEvent(RunWorkflowOnCancelTrainingNeedsHeaderForApprovalCode, Variant);
                     //Vendor Appraisal
            Database::"Vendor Appraisal Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelVendAppraisalVoucherForApprovalCode, Variant);
                //Contract Termination
                Database::"Contract Termination":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelContractTerminationForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;

    end;

    procedure ReOpen(var RecRef: RecordRef; Handled: Boolean)
    var
        Variant: Variant;

        //pavement
        PavementTestHeader: Record "Pavement Test Header";
        //IFS tENDER
        Comm: Record "IFS Tender Committee";
        //payroll
        PayrollHeader: Record "Payroll Header";
        //proff
        Prof: Record "Bid Tabulation Header";
        //Receipts
        Receipts: Record "Receipts Header1";
        //leave
        leave: Record "HR Leave Applications";
        //advancedpayment
        Advpay: record "Measurement &  Payment Header";
        //Fleet
        Fleet: Record "Transport Requisition";
        //corporate
        corporate: Record "Corporate Strategic Plans";
        //Monitor
        Monitor: Record "Monitoring Card Header";
        //project variation
        ProjectVariation: Record "Project Variation Header";

        //performance contract
        perform: Record "Perfomance Contract Header";
        //Board
        board: Record "Project Contract Header";
        //Annual
        Annual: Record "Annual Strategy Workplan";
        //Geval
        Geval: Record "Perfomance Evaluation";
        //Addend6
        Addend: Record "Tender Addendum Notice";

        //Evaluation
        Eva: Record "Bid Scoring Template";

        //project Schedule
        RoadWorkPlan: Record "Road Work Program";
        //purchase
        PurchaseHeader: Record "Purchase Header";

        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";

        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //PV
        Payments: Record payments;

        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //Inter Bank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        //Security Incidence
        SecurityIncidence: Record "Security Incidences";
        //ProjectStaff voucher
        ProjectStaffVoucher: Record "Project Staff Voucher";
        FuelRequisition: Record "Fuel & Maintenance Requisition";
        PCSumExpensing: Record "Request For PC Sum Expensing";
        InspectionHeader: Record "Inspection Header1";
        MobilizationHeader: Record "Project Mobilization Header";
        ProjectEvaluationHeader: Record "Project Evaluation Header";
        EquipmentRepairTracking: Record "Equipment Repair Tracking";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        MaterialTestRecord: Record "Material Test Record";
        WorkPlanHeader: Record "Work Plan Header";
        RiskMEHeader: Record "Risk M&E Header";
        SiteInstructions: Record "Site Instructions Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        RepaymentScheduleHeader: Record "RE Payment Schedule Header";
        RiskIncidentLog: Record "Risk Incident Log";
        RiskManagementPlan: Record "Risk Management Plan";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        SurveyQualityCheckHeader: Record "Survey Quality Check Header";
        TemporarySupervisionRequirem: Record "Temporary Supervision Requirem";
        CommunicationPlanHeader: Record "Communication Plan Header";
        DailyWorkRecord: Record "Daily Work Record";
        RAMWorkplan: Record "RAM Workplan Header";
        LeaveRecall: Record "Leave Recall";
        RoadWorkBudgetCeiling: Record "Road Works Budget Ceilings";
        FuelTopupRequest: Record "Fuel Topup Request";
        VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
        RICS: Record "Road Inv. Condition Survey";
        RecruitmentRequisitions: Record "Recruitment Requisition Header";
        LeavePlan:Record "HR Leave Planner Header";
        MembershipFeesRequisitions: Record "Membership Fees Requisitions";
        FuelAllocations: Record "Fuel Allocations";
        TempSalaryVoucher: Record "Payroll HeaderT";
        TrainingNeedsHeader: Record "Training Needs Header";
        VendorAppraisalVoucher: Record "Vendor Appraisal Voucher";
        ContractTermination: Record "Contract Termination";
    begin
        case RecRef.Number of

            //pavement
            Database::"Pavement Test Header":
                begin
                    RecRef.SetTable(PavementTestHeader);
                    PavementTestHeader.Validate(Status, PavementTestHeader.Status::Open);
                    PavementTestHeader.Modify;
                    Variant := PavementTestHeader;
                    Handled := true;
                end;

            //Ifs Tender
            Database::"IFS TENDER COMMITTEE":
                begin
                    RecRef.SetTable(COMM);
                    COMM.Validate("Approval Status", COMM."Approval Status"::Open);
                    COMM.Modify;
                    Variant := COMM;
                    Handled := true;
                end;
            //payroll
            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::Open);
                    PayrollHeader.Modify;
                    Variant := PayrollHeader;
                    Handled := true;
                end;
            //proff
            Database::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(Prof);
                    Prof.Validate("Approval Status", Prof."Approval Status"::Open);
                    Prof.Modify;
                    Variant := Prof;
                    Handled := true;
                end;


            //fleet
            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(fleet);
                    fleet.Validate(Status, fleet.Status::Open);
                    fleet.Modify;
                    Variant := fleet;
                    Handled := true;
                end;
            //receipts

            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipts);
                    Receipts.Validate(Status, Receipts.Status::Open);
                    Receipts.Modify;
                    Variant := Receipts;
                    Handled := true;
                end;

            //leave

            Database::"HR Leave Applications":
                begin
                    RecRef.SetTable(leave);
                    leave.Validate(Status, leave.Status::Open);
                    leave.Modify;
                    Variant := leave;
                    Handled := true;
                end;
            //AdvancePayment

            Database::"Measurement &  Payment Header":
                begin
                    RecRef.SetTable(Advpay);
                    Advpay.Validate(Status, Advpay.Status::Open);
                    Advpay.Modify;
                    Variant := Advpay;
                    Handled := true;
                end;
            //Corporate
            Database::"Corporate Strategic Plans":
                begin
                    RecRef.SetTable(corporate);
                    corporate.Validate("Approval Status", corporate."Approval Status"::Open);
                    corporate.Modify;
                    Variant := corporate;
                    Handled := true;
                end;

            //Monitor
            Database::"Monitoring Card Header":
                begin
                    RecRef.SetTable(Monitor);
                    Monitor.Validate("Status", Monitor."Status"::Open);
                    Monitor.Modify;
                    Variant := Monitor;
                    Handled := true;
                end;
            //project variation
            Database::"Project Variation Header":
                begin
                    RecRef.SetTable(ProjectVariation);
                    ;
                    ProjectVariation.Validate("Status", ProjectVariation."Status"::Open);
                    ProjectVariation.Modify;
                    Variant := ProjectVariation;
                    Handled := true;
                end;
            //Performance contract
            Database::"Perfomance Contract Header":
                begin
                    RecRef.SetTable(perform);
                    perform.Validate("Approval Status", perform."Approval Status"::Open);
                    perform.Modify;
                    Variant := perform;
                    Handled := true;
                end;
            //Board
            Database::"Project Contract Header":
                begin
                    RecRef.SetTable(board);
                    board.Validate("Approval Status", corporate."Approval Status"::Open);
                    board.Modify;
                    Variant := board;
                    Handled := true;
                end;

            //annual
            Database::"Annual Strategy Workplan":
                begin
                    RecRef.SetTable(Annual);
                    Annual.Validate("Approval Status", Annual."Approval Status"::Open);
                    Annual.Modify;
                    Variant := Annual;
                    Handled := true;
                end;
            //Geval
            Database::"Perfomance Evaluation":
                begin
                    RecRef.SetTable(Geval);
                    Geval.Validate("Approval Status", Geval."Approval Status"::Open);
                    Geval.Modify;
                    Variant := Geval;
                    Handled := true;
                end;

            //Addend7
            Database::"Tender Addendum Notice":
                begin
                    RecRef.SetTable(Addend);
                    Addend.Validate(Status, Addend."Status"::Open);
                    Addend.Modify;
                    Variant := Addend;
                    Handled := true;
                end;

            //Evalu
            Database::"Bid Scoring Template":
                begin
                    RecRef.SetTable(Eva);
                    eva.Validate(status, Eva."Status"::Open);
                    corporate.Modify;
                    Variant := Eva;
                    Handled := true;
                end;
            //project Schedule
            Database::"Road Work Program":
                begin
                    RecRef.SetTable(RoadWorkPlan);
                    RoadWorkPlan.Validate("Approval Status", RoadWorkPlan."Approval Status"::Open);
                    RoadWorkPlan.Modify;
                    Variant := RoadWorkPlan;
                    Handled := true;
                end;

            //purchase
            Database::"Purchase Header":
                begin
                    RecRef.SetTable(PurchaseHeader);
                    // PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
                    PurchaseHeader.Validate(Status, PurchaseHeader.Status::Open);
                    PurchaseHeader.Modify;
                    Variant := PurchaseHeader;
                    Handled := true;
                end;


            //IFRCARD
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::Open);
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    Handled := true;
                end;

            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Open);
                    procurementplan.Modify;
                    Variant := procurementplan;
                    Handled := true;
                end;
            //RFQ
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Open);
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    Handled := true;
                end;
            //pv
            Database::"payments":
                begin
                    RecRef.SetTable(payments);
                    payments.Validate(Status, payments.Status::Open);
                    payments.Modify;
                    Variant := payments;
                    Handled := true;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::Open);
                    //ImprestMemo.Modify;
                    Variant := ImprestMemo;
                    Handled := true;
                end;

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                begin
                    RecRef.SetTable(InterBankTransfer);
                    InterBankTransfer.Validate("Approval Status", "Approval Status"::Open);
                    InterBankTransfer.Modify;
                    Variant := InterBankTransfer;
                    Handled := true;
                end;
            Database::"Security Incidences":
                begin
                    RecRef.SetTable(SecurityIncidence);
                    SecurityIncidence.Validate("Approval Status", SecurityIncidence."Approval Status"::Open);
                    SecurityIncidence.modify;
                    Variant := SecurityIncidence;
                    Handled := true;
                end;
            Database::"Project Staff Voucher":
                begin
                    RecRef.SetTable(ProjectStaffVoucher);
                    ProjectStaffVoucher.Validate(Status, ProjectStaffVoucher.Status::Open);
                    ProjectStaffVoucher.modify;
                    Variant := ProjectStaffVoucher;
                    Handled := true;
                end;
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.Settable(FuelRequisition);
                    FuelRequisition.Validate(Status, FuelRequisition.Status::Open);
                    FuelRequisition.modify;
                    Variant := FuelRequisition;
                    Handled := true;
                end;
            Database::"Request For PC Sum Expensing":
                begin

                    RecRef.Settable(PCSumExpensing);
                    PCSumExpensing.Validate(Status, PCSumExpensing.Status::Open);
                    PCSumExpensing.modify;
                    Variant := PCSumExpensing;
                    Handled := true;
                end;
            Database::"Inspection Header1":
                begin
                    RecRef.settable(InspectionHeader);
                    InspectionHeader.Validate(Status, InspectionHeader.Status::Open);
                    InspectionHeader.modify;
                    Variant := InspectionHeader;
                    Handled := true;
                end;
            Database::"Project Mobilization Header":
                begin
                    RecRef.setTable(MobilizationHeader);
                    MobilizationHeader.Validate(Status, MobilizationHeader.Status::Open);
                    MobilizationHeader.Modify();
                    Variant := MobilizationHeader;
                    Handled := true;
                end;
            Database::"Project Evaluation Header":
                begin
                    RecRef.setTable(ProjectEvaluationHeader);
                    ProjectEvaluationHeader.Validate(Status, ProjectEvaluationHeader.Status::Open);
                    ProjectEvaluationHeader.Modify();
                    Variant := ProjectEvaluationHeader;
                    Handled := true;
                end;
            Database::"Equipment Repair Tracking":
                begin
                    RecRef.setTable(EquipmentRepairTracking);
                    EquipmentRepairTracking.Validate(Status, EquipmentRepairTracking.Status::Open);
                    EquipmentRepairTracking.Modify();
                    Variant := EquipmentRepairTracking;
                    Handled := true;
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    RecRef.settable(InsuranceGuarantee);
                    InsuranceGuarantee.Validate(Status, InsuranceGuarantee.Status::Open);
                    InsuranceGuarantee.Modify();
                    Variant := InsuranceGuarantee;
                    Handled := true;
                end;
            Database::"Material Test Record":
                begin
                    RecRef.settable(MaterialTestRecord);
                    MaterialTestRecord.Validate(Status, MaterialTestRecord.Status::Open);
                    MaterialTestRecord.Modify();
                    Variant := MaterialTestRecord;
                    Handled := true;
                end;
            Database::"Work Plan Header":
                begin
                    RecRef.settable(WorkPlanHeader);
                    WorkPlanHeader.Validate(Status, WorkPlanHeader.Status::Open);
                    WorkPlanHeader.Modify();
                    Variant := WorkPlanHeader;
                    Handled := true;
                end;
            Database::"Risk M&E Header":
                begin
                    RecRef.settable(RiskMEHeader);
                    RiskMEHeader.Validate(Status, RiskMEHeader.Status::Open);
                    RiskMEHeader.Modify();
                    Variant := RiskMEHeader;
                    Handled := true;
                end;
            Database::"Site Instructions Header":
                begin
                    RecRef.settable(SiteInstructions);
                    SiteInstructions.Validate(Status, SiteInstructions.Status::Open);
                    SiteInstructions.Modify();
                    Variant := SiteInstructions;
                    Handled := true;
                end;
            Database::"Project Meeting Register":
                begin
                    RecRef.settable(ProjectMeetingRegister);
                    ProjectMeetingRegister.Validate(Status, ProjectMeetingRegister.Status::Open);
                    ProjectMeetingRegister.Modify();
                    Variant := ProjectMeetingRegister;
                    Handled := true;
                end;
            Database::"RE Payment Schedule Header":
                begin
                    RecRef.settable(RepaymentScheduleHeader);
                    RepaymentScheduleHeader.Validate(Status, RepaymentScheduleHeader.Status::Open);
                    RepaymentScheduleHeader.Modify();
                    Variant := RepaymentScheduleHeader;
                    Handled := true;
                end;
            Database::"Risk Incident Log":
                begin
                    RecRef.settable(RiskIncidentLog);
                    RiskIncidentLog.Validate(Status, RiskIncidentLog.Status::Open);
                    RiskIncidentLog.Modify();
                    Variant := RiskIncidentLog;
                    Handled := true;
                end;
            Database::"Risk Management Plan":
                begin
                    RecRef.settable(RiskManagementPlan);
                    RiskManagementPlan.Validate(Status, RiskManagementPlan.Status::Open);
                    RiskManagementPlan.Modify();
                    Variant := RiskManagementPlan;
                    Handled := true;
                end;
            Database::"WEP Contractor Submission":
                begin
                    RecRef.settable(WEPContractorSubmission);
                    WEPContractorSubmission.Validate(Status, WEPContractorSubmission.Status::Open);
                    WEPContractorSubmission.Modify();
                    Variant := WEPContractorSubmission;
                    Handled := true;
                end;
            Database::"Survey Quality Check Header":
                begin
                    RecRef.settable(SurveyQualityCheckHeader);
                    SurveyQualityCheckHeader.Validate(Status, SurveyQualityCheckHeader.Status::Open);
                    SurveyQualityCheckHeader.Modify();
                    Variant := SurveyQualityCheckHeader;
                    Handled := true;
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    RecRef.settable(TemporarySupervisionRequirem);
                    TemporarySupervisionRequirem.Validate(Status, TemporarySupervisionRequirem.Status::Open);
                    TemporarySupervisionRequirem.Modify();
                    Variant := TemporarySupervisionRequirem;
                    Handled := true;
                end;
            Database::"Communication Plan Header":
                begin
                    RecRef.settable(CommunicationPlanHeader);
                    CommunicationPlanHeader.Validate(Status, CommunicationPlanHeader.Status::Open);
                    CommunicationPlanHeader.Modify();
                    Variant := CommunicationPlanHeader;
                    Handled := true;
                end;
            Database::"Daily Work Record":
                begin
                    RecRef.settable(DailyWorkRecord);
                    DailyWorkRecord.Validate(Status, DailyWorkRecord.Status::Open);
                    DailyWorkRecord.Modify();
                    Variant := DailyWorkRecord;
                    Handled := true;
                end;
            Database::"RAM Workplan Header":
                begin
                    RecRef.settable(RAMWorkplan);
                    RAMWorkplan.Validate(Status, RAMWorkplan.Status::Open);
                    RAMWorkplan.Modify();
                    Variant := RAMWorkplan;
                    Handled := true;
                end;
            Database::"Leave Recall":
                begin
                    RecRef.settable(LeaveRecall);
                    LeaveRecall.Validate("Approval Status", LeaveRecall."Approval Status"::Open);
                    LeaveRecall.Modify();
                    Variant := LeaveRecall;
                    Handled := true;
                end;
            Database::"Road Works Budget Ceilings":
                begin
                    RecRef.settable(RoadWorkBudgetCeiling);
                    RoadWorkBudgetCeiling.Validate(Status, RoadWorkBudgetCeiling.Status::Open);
                    RoadWorkBudgetCeiling.Modify();
                    Variant := RoadWorkBudgetCeiling;
                    Handled := true;
                end;
            //FuelTopupRequest
            Database::"Fuel Topup Request":
                begin
                    RecRef.settable(FuelTopupRequest);
                    FuelTopupRequest.Validate(Status, FuelTopupRequest.Status::Open);
                    FuelTopupRequest.Modify();
                    Variant := FuelTopupRequest;
                    Handled := true;
                end;
            //Fuel card expense
            Database::"Vehicle Fuel Card Lines":
                begin
                    RecRef.settable(VehicleFuelCardLines);
                    VehicleFuelCardLines.Validate("Approval Status", VehicleFuelCardLines."Approval Status"::Open);
                    VehicleFuelCardLines.Modify();
                    Variant := VehicleFuelCardLines;
                    Handled := true;
                end;
                   Database::"Road Inv. Condition Survey":
                begin
                    RecRef.Settable(RICS);
                    RICS.Validate("Approval Status", RICS."Approval Status"::Open);
                    RICS.modify();
                    Variant := RICS;
                Handled := true;
                end;
                Database::"Recruitment Requisition Header":
                begin
                    RecRef.Settable(RecruitmentRequisitions);
                    RecruitmentRequisitions.Validate("Approval Status", RecruitmentRequisitions."Approval Status"::Open);
                    RecruitmentRequisitions.modify();
                    Variant := RecruitmentRequisitions;
                    Handled := true;
                end;
                Database::"HR Leave Planner Header":
                begin
                    RecRef.Settable(LeavePlan);
                    LeavePlan.Validate("Approval Status", LeavePlan."Approval Status"::Open);
                    LeavePlan.modify();
                    Variant := LeavePlan;
                    Handled := true;
                end;
                Database::"Membership Fees Requisitions":
                begin
                    RecRef.Settable(MembershipFeesRequisitions);
                    MembershipFeesRequisitions.Validate(Status, MembershipFeesRequisitions.Status::Open);
                    MembershipFeesRequisitions.modify();
                    Variant := MembershipFeesRequisitions;
                Handled := true;
                end;
                Database::"Fuel Allocations":
                begin
                    RecRef.Settable(FuelAllocations);
                    FuelAllocations.Validate(Status, FuelAllocations.Status::Open);
                    FuelAllocations.modify();
                    Variant := FuelAllocations;
                            Handled := true;
                end;
            Database::"Payroll HeaderT":
                begin
                    RecRef.Settable(TempSalaryVoucher);
                    TempSalaryVoucher.Validate(Status, TempSalaryVoucher.Status::Open);
                    TempSalaryVoucher.modify();
                    Variant := TempSalaryVoucher;
                    Handled := true;
                end;
                Database::"Training Needs Header":
                begin
                    RecRef.Settable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::Open);
                    TrainingNeedsHeader.modify();
                    Variant := TrainingNeedsHeader;
                    Handled := true;
                end;
                Database::"Vendor Appraisal Voucher":
                begin
                    RecRef.SetTable(VendorAppraisalVoucher);
                    VendorAppraisalVoucher.Validate("Approval Status", VendorAppraisalVoucher."Approval Status"::Open);
                    VendorAppraisalVoucher.modify();
                    Variant := VendorAppraisalVoucher;
                    Handled := true;
                end;
                //Contract termination
                Database::"Contract Termination":
                begin
                    RecRef.SetTable(ContractTermination);
                    ContractTermination.Validate("Approval Status",ContractTermination."Approval Status"::Open);
                    ContractTermination.Modify();
                    Variant :=ContractTermination;
                    Handled :=true;
                end;
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end

    end;

    procedure Release(RecRef: RecordRef; var Handled: Boolean)
    var

        Variant: Variant;

        //pavement
        PavementTestHeader: Record "Pavement Test Header";
        //IFS tENDER
        Comm: Record "IFS Tender Committee";
        //payroll
        PayrollHeader: Record "Payroll Header";
        //proff
        Prof: Record "Bid Tabulation Header";
        //Receipt
        Receipts: Record "Receipts Header1";
        //Leave
        Leave: Record "HR Leave Applications";
        //advancedpayment
        advpay: Record "Measurement &  Payment Header";
        //Fleet
        Fleet: Record "Transport Requisition";
        //purchase
        purchaseheader: Record "Purchase Header";

        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //corporate
        corporate: Record "Corporate Strategic Plans";
        //Monitor
        Monitor: Record "Monitoring Card Header";
        //project variation
        projectvariation: Record "Project Variation Header";
        //performance contract
        perform: Record "Perfomance Contract Header";
        //Board
        board: Record "Project Contract Header";
        //annual
        Annual: Record "Annual Strategy Workplan";
        //Geval
        Geval: Record "Perfomance Evaluation";
        //addend8
        addend: Record "Tender Addendum Notice";
        //eval
        eva: Record "Bid Scoring Template";
        //project schedule
        roadworkplan: Record "Road Work Program";

        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //pv
        Payments: record payments;
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";

        //Interbank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        //Security Incidences
        SecurityIncidence: Record "Security Incidences";
        //Project Staff Voucher
        ProjectStaffVoucher: Record "Project Staff Voucher";
        FuelRequisition: Record "Fuel & Maintenance Requisition";
        PCSumExpensing: Record "Request For PC Sum Expensing";
        InspectionHeader: Record "Inspection Header1";
        MobilizationHeader: Record "Project Mobilization Header";
        ProjectEvaluationHeader: Record "Project Evaluation Header";
        EquipmentRepairTracking: Record "Equipment Repair Tracking";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        MaterialTestRecord: Record "Material Test Record";
        WorkPlanHeader: Record "Work Plan Header";
        RiskMEHeader: Record "Risk M&E Header";
        SiteInstructions: Record "Site Instructions Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        RepaymentScheduleHeader: Record "RE Payment Schedule Header";
        RiskIncidentLog: Record "Risk Incident Log";
        RiskManagementPlan: Record "Risk Management Plan";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        SurveyQualityCheckHeader: Record "Survey Quality Check Header";
        TemporarySupervisionRequirem: Record "Temporary Supervision Requirem";
        CommunicationPlanHeader: Record "Communication Plan Header";
        DailyWorkRecord: Record "Daily Work Record";
        RAMWorkPlan: Record "RAM Workplan Header";
        LeaveRecall: Record "Leave Recall";
        RoadWorkBudgetCeiling: Record "Road Works Budget Ceilings";
        FuelTopupRequest: Record "Fuel Topup Request";
        VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
        RICS: Record "Road Inv. Condition Survey";
        RecruitmentRequisitions: Record "Recruitment Requisition Header";
        LeavePlan:Record "HR Leave Planner Header";
        Procurement: Codeunit "Procurement Processing";
        MembershipFeesRequisitions: Record "Membership Fees Requisitions";
        FuelAllocations: Record "Fuel Allocations";
        TempSalaryVoucher: Record "Payroll HeaderT";
        TrainingNeedsHeader: Record "Training Needs Header";
        VendorAppraisalVoucher:Record "Vendor Appraisal Voucher";
        ContractTermination: Record "Contract Termination";
    begin
        Handled := true;
        case RecRef.Number of

            //pavement
            Database::"Pavement Test Header":
                begin
                    RecRef.SetTable(PavementTestHeader);
                    PavementTestHeader.Validate(Status, PavementTestHeader.Status::Released);
                    PavementTestHeader.Modify;
                    Variant := PavementTestHeader;
                end;
            //IFS TENDER
            Database::"Ifs Tender Committee":
                begin
                    RecRef.SetTable(Comm);
                    Comm.Validate("Approval Status", comm."Approval Status"::Approved);
                    if comm.Modify then begin
                        Procurement.FnSendTenderCommitteNotification(Comm);
                    end;
                    Variant := comm;
                end;
            //payroll
            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::Released);
                    ////// PayrollHeader.Validate(Status, PayrollHeader.Status::Released);
                    PayrollHeader.Modify;
                    Variant := PayrollHeader;
                end;
            //prof
            Database::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(Prof);
                    Prof.Validate("Approval Status", Prof."Approval Status"::Released);
                    ////// PayrollHeader.Validate(Status, PayrollHeader.Status::Released);
                    Prof.Modify;
                    Variant := Prof;
                end;

            //Leave
            Database::"HR Leave Applications":
                begin
                    RecRef.SetTable(leave);
                    leave.Status := Leave.Status::Released;
                    if leave.Modify then
                        PostLeave(Leave);
                    Variant := leave;
                    //
                end;

            //advancedpayment
            Database::"Measurement &  Payment Header":
                begin
                    RecRef.SetTable(advpay);
                    advpay.Validate(Status, advpay.Status::Released);
                    // leavet.Modify
                    advpay.Modify;

                    Variant := advpay;
                end;
            //receipts
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipts);
                    receipts.Validate(Status, receipts.Status::Released);
                    // leave.Modify;
                    receipts.Modify;
                    Variant := Receipts;
                end;
            //Fleet
            Database::"Transport requisition":
                begin
                    RecRef.SetTable(Fleet);
                    Fleet.Validate(Status, Fleet.Status::Approved);
                    Fleet.Modify;
                    Variant := Fleet;
                end;

            //Corporate
            Database::"Corporate Strategic Plans":
                begin
                    RecRef.SetTable(corporate);
                    corporate.Validate("Approval Status", corporate."Approval Status"::Released);
                    corporate.Modify;
                    Variant := corporate;
                end;
            //Monitor
            Database::"Monitoring Card Header":
                begin
                    RecRef.SetTable(Monitor);
                    Monitor.Validate("Status", Monitor."Status"::Released);
                    Monitor.Modify;
                    Variant := Monitor;
                end;
            //project variation
            Database::"Project Variation Header":
                begin
                    RecRef.SetTable(projectvariation);
                    projectvariation.Validate("Status", projectvariation."Status"::Released);
                    projectvariation.Modify;
                    Variant := projectvariation;
                end;
            //Performance
            Database::"Perfomance Contract Header":
                begin
                    RecRef.SetTable(perform);
                    perform.Validate("Approval Status", perform."Approval Status"::Released);
                    perform.Modify;
                    Variant := perform;
                end;
            //board
            Database::"Project Contract Header":
                begin
                    RecRef.SetTable(board);
                    board.Validate("Approval Status", corporate."Approval Status"::Released);
                    board.Modify;
                    Variant := board;
                end;
            //Annual
            Database::"Annual Strategy Workplan":
                begin
                    RecRef.SetTable(Annual);
                    Annual.Validate("Approval Status", Annual."Approval Status"::Released);
                    Annual.Modify;
                    Variant := Annual;
                end;

            //geval
            Database::"Perfomance Evaluation":
                begin
                    RecRef.SetTable(Geval);
                    Geval.Validate("Approval Status", Geval."Approval Status"::Released);
                    Geval.Modify;
                    Variant := Geval;
                end;

            //Addend9
            Database::"Tender Addendum Notice":
                begin
                    RecRef.SetTable(addend);
                    addend.Validate("Status", addend."Status"::Released);
                    addend.Modify;
                    Variant := addend;
                end;
            //Evaluation
            Database::"Bid Scoring Template":
                begin
                    RecRef.SetTable(eva);
                    eva.Validate("Status", eva."Status"::Approved);
                    eva.Modify;
                    Variant := eva;
                end;
            //project schedule
            Database::"Road Work Program":
                begin
                    RecRef.SetTable(roadworkplan);
                    roadworkplan.Validate("Approval Status", roadworkplan."Approval Status"::Released);
                    roadworkplan.Modify;
                    Variant := roadworkplan
                    ;
                end;
            //purchase
            Database::"Purchase Header":
                begin
                    RecRef.SetTable(purchaseheader);
                    PurchaseHeader.Validate(Status, purchaseheader.Status::Released);
                    PurchaseHeader.Modify;
                    Variant := PurchaseHeader;
                end;
            //IFRCARD
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::Released);
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                end;
            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Released);
                    procurementplan.Modify;
                    Variant := procurementplan;
                end;

            //rfq
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Released);
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                end;


            //pv
            Database::"Payments":
                begin
                    RecRef.SetTable(Payments);
                    payments.Validate(Status, payments.Status::Released);
                    payments.Modify;
                    Variant := payments;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::Released);
                    //  ImprestMemo.Modify;
                    Variant := ImprestMemo;
                end;

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                begin
                    RecRef.SetTable(InterBankTransfer);
                    InterBankTransfer.Validate("Approval Status", InterBankTransfer."Approval Status"::Released);
                    InterBankTransfer.Modify;
                    Variant := InterBankTransfer;
                end;
            Database::"Security Incidences":
                begin
                    RecRef.setTable(SecurityIncidence);
                    SecurityIncidence.Validate("Approval Status", SecurityIncidence."Approval Status"::Released);
                    SecurityIncidence.modify();
                    Variant := SecurityIncidence;
                end;
            Database::"Project Staff Voucher":
                begin
                    RecRef.SetTable(ProjectStaffVoucher);
                    ProjectStaffVoucher.Validate(Status, ProjectStaffVoucher.Status::Released);
                    ProjectStaffVoucher.modify();
                    Variant := ProjectStaffVoucher;
                end;
            //Fuel Requisition
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.Settable(FuelRequisition);
                    FuelRequisition.Validate(Status, FuelRequisition.Status::Approved);
                    FuelRequisition.modify();
                    Variant := FuelRequisition;
                end;
            Database::"Request For PC Sum Expensing":
                begin
                    RecRef.Settable(PCSumExpensing);
                    PCSumExpensing.Validate(Status, PCSumExpensing.Status::Approved);
                    PCSumExpensing.modify();
                    Variant := PCSumExpensing;
                end;
            Database::"Inspection Header1":
                begin
                    RecRef.SetTable(InspectionHeader);
                    InspectionHeader.Validate(Status, InspectionHeader.Status::Released);
                    InspectionHeader.Modify();
                    Variant := InspectionHeader;
                end;
            Database::"Project Mobilization Header":
                begin
                    RecRef.setTable(MobilizationHeader);
                    MobilizationHeader.Validate(Status, MobilizationHeader.Status::Released);
                    MobilizationHeader.Modify();
                    Variant := MobilizationHeader;
                end;
            Database::"Project Evaluation Header":
                begin
                    RecRef.setTable(ProjectEvaluationHeader);
                    ProjectEvaluationHeader.Validate(Status, ProjectEvaluationHeader.Status::Released);
                    ProjectEvaluationHeader.Modify();
                    Variant := ProjectEvaluationHeader;
                    Handled := true;
                end;
            Database::"Equipment Repair Tracking":
                begin
                    RecRef.setTable(EquipmentRepairTracking);
                    EquipmentRepairTracking.Validate(Status, EquipmentRepairTracking.Status::Released);
                    EquipmentRepairTracking.Modify();
                    Variant := EquipmentRepairTracking;
                    Handled := true;
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    RecRef.settable(InsuranceGuarantee);
                    InsuranceGuarantee.Validate(Status, InsuranceGuarantee.Status::Approved);
                    InsuranceGuarantee.Modify();
                    Variant := InsuranceGuarantee;
                    Handled := true;
                end;
            Database::"Material Test Record":
                begin
                    RecRef.settable(MaterialTestRecord);
                    MaterialTestRecord.Validate(Status, MaterialTestRecord.Status::Released);
                    MaterialTestRecord.Modify();
                    Variant := MaterialTestRecord;
                    Handled := true;
                end;
            Database::"Work Plan Header":
                begin
                    RecRef.settable(WorkPlanHeader);
                    WorkPlanHeader.Validate(Status, WorkPlanHeader.Status::Approved);
                    WorkPlanHeader.Modify();
                    Variant := WorkPlanHeader;
                    Handled := true;
                end;
            Database::"Risk M&E Header":
                begin
                    RecRef.settable(RiskMEHeader);
                    RiskMEHeader.Validate(Status, RiskMEHeader.Status::Released);
                    RiskMEHeader.Modify();
                    Variant := RiskMEHeader;
                    Handled := true;
                end;
            Database::"Site Instructions Header":
                begin
                    RecRef.settable(SiteInstructions);
                    SiteInstructions.Validate(Status, SiteInstructions.Status::Appoved);
                    SiteInstructions.Modify();
                    Variant := SiteInstructions;
                    Handled := true;
                end;
            Database::"Project Meeting Register":
                begin
                    RecRef.settable(ProjectMeetingRegister);
                    ProjectMeetingRegister.Validate(Status, ProjectMeetingRegister.Status::Approved);
                    ProjectMeetingRegister.Modify();
                    Variant := ProjectMeetingRegister;
                    Handled := true;
                end;
            Database::"RE Payment Schedule Header":
                begin
                    RecRef.settable(RepaymentScheduleHeader);
                    RepaymentScheduleHeader.Validate(Status, RepaymentScheduleHeader.Status::Released);
                    RepaymentScheduleHeader.Modify();
                    Variant := RepaymentScheduleHeader;
                    Handled := true;
                end;
            Database::"Risk Incident Log":
                begin
                    RecRef.settable(RiskIncidentLog);
                    RiskIncidentLog.Validate(Status, RiskIncidentLog.Status::Released);
                    RiskIncidentLog.Modify();
                    Variant := RiskIncidentLog;
                    Handled := true;
                end;
            Database::"Risk Management Plan":
                begin
                    RecRef.settable(RiskManagementPlan);
                    RiskManagementPlan.Validate(Status, RiskManagementPlan.Status::Released);
                    RiskManagementPlan.Modify();
                    Variant := RiskManagementPlan;
                    Handled := true;
                end;
            Database::"WEP Contractor Submission":
                begin
                    RecRef.settable(WEPContractorSubmission);
                    WEPContractorSubmission.Validate(Status, WEPContractorSubmission.Status::Released);
                    WEPContractorSubmission.Modify();
                    Variant := WEPContractorSubmission;
                    Handled := true;
                end;
            Database::"Survey Quality Check Header":
                begin
                    RecRef.settable(SurveyQualityCheckHeader);
                    SurveyQualityCheckHeader.Validate(Status, SurveyQualityCheckHeader.Status::Released);
                    SurveyQualityCheckHeader.Modify();
                    Variant := SurveyQualityCheckHeader;
                    Handled := true;
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    RecRef.settable(TemporarySupervisionRequirem);
                    TemporarySupervisionRequirem.Validate(Status, TemporarySupervisionRequirem.Status::Released);
                    TemporarySupervisionRequirem.Modify();
                    Variant := TemporarySupervisionRequirem;
                    Handled := true;
                end;
            Database::"Communication Plan Header":
                begin
                    RecRef.settable(CommunicationPlanHeader);
                    CommunicationPlanHeader.Validate(Status, CommunicationPlanHeader.Status::Released);
                    CommunicationPlanHeader.Modify();
                    Variant := CommunicationPlanHeader;
                    Handled := true;
                end;
            Database::"Daily Work Record":
                begin
                    RecRef.settable(DailyWorkRecord);
                    DailyWorkRecord.Validate(Status, DailyWorkRecord.Status::Released);
                    DailyWorkRecord.Modify();
                    Variant := DailyWorkRecord;
                    Handled := true;
                end;
            Database::"RAM Workplan Header":
                begin
                    RecRef.settable(RAMWorkPlan);
                    RAMWorkPlan.Validate(Status, RAMWorkPlan.Status::Approved);
                    RAMWorkPlan."Submission Status" := RAMWorkPlan."Submission Status"::Submitted;
                    RAMWorkPlan.Modify();
                    //RMSManagement.FnConsolidateRAMWorkplans(RAMWorkPlan);
                    Variant := RAMWorkPlan;
                    Handled := true;
                end;
            Database::"Leave Recall":
                begin
                    RecRef.settable(LeaveRecall);
                    LeaveRecall.Validate("Approval Status", LeaveRecall."Approval Status"::Approved);
                    LeaveRecall.Modify();
                    Variant := LeaveRecall;
                    Handled := true;
                end;
            Database::"Road Works Budget Ceilings":
                begin
                    RecRef.settable(RoadWorkBudgetCeiling);
                    RoadWorkBudgetCeiling.Validate(Status, RoadWorkBudgetCeiling.Status::Approved);
                    RoadWorkBudgetCeiling.Modify();
                    Variant := RoadWorkBudgetCeiling;
                    Handled := true;
                end;
            //FuelTopupRequest
            Database::"Fuel Topup Request":
                begin
                    RecRef.settable(FuelTopupRequest);
                    FuelTopupRequest.Validate(Status, FuelTopupRequest.Status::Approved);
                    FuelTopupRequest.Modify();
                    Variant := FuelTopupRequest;
                    Handled := true;
                end;
            //Fuel card expense
            Database::"Vehicle Fuel Card Lines":
                begin
                    RecRef.settable(VehicleFuelCardLines);
                    VehicleFuelCardLines.Validate("Approval Status", VehicleFuelCardLines."Approval Status"::Approved);
                    VehicleFuelCardLines.Modify();
                    Variant := VehicleFuelCardLines;
                    VehicleFuelCardLines.PostFuelCardExpense(VehicleFuelCardLines);
                    Handled := true;
                end;
                  Database::"Road Inv. Condition Survey":
                begin
                    RecRef.Settable(RICS);
                    RICS.Validate("Approval Status", RICS."Approval Status"::Approved);
                    RICS.modify();
                    Variant := RICS;
                Handled := true;
                end;
                Database::"Recruitment Requisition Header":
                begin
                    RecRef.Settable(RecruitmentRequisitions);
                    RecruitmentRequisitions.Validate("Approval Status", RecruitmentRequisitions."Approval Status"::Released);
                    RecruitmentRequisitions.modify();
                    Variant := RecruitmentRequisitions;
                Handled := true;
                end;
                Database::"HR Leave Planner Header":
                begin
                      RecRef.Settable(LeavePlan);
                    LeavePlan.Validate("Approval Status", LeavePlan."Approval Status"::Approved);
                    LeavePlan.modify();
                    Variant := LeavePlan;
                Handled := true;
                end;
                //Membership Fees Requisitions
                Database::"Membership Fees Requisitions":
                begin
                    RecRef.Settable(MembershipFeesRequisitions);
                    MembershipFeesRequisitions.Validate(Status, MembershipFeesRequisitions.Status::Approved);
                    MembershipFeesRequisitions.modify();
                    Variant := MembershipFeesRequisitions;
                    Handled := true;
                end;
                //Fuel Allocations
                Database::"Fuel Allocations":
                begin
                    RecRef.Settable(FuelAllocations);
                    FuelAllocations.Validate(Status, FuelAllocations.Status::Approved);
                    ReleaseFuelAllocations(FuelAllocations);
                    FuelAllocations.Modify;
                    Variant := FuelAllocations;
                    Handled := true;
                end;
            Database::"Payroll HeaderT":
                begin
                    RecRef.Settable(TempSalaryVoucher);
                    TempSalaryVoucher.Validate(Status, TempSalaryVoucher.Status::Released);
                    TempSalaryVoucher.modify();
                    Variant := TempSalaryVoucher;
                    Handled := true;
                end;
                // Training Needs Header
                Database::"Training Needs Header":
                begin
                    RecRef.Settable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::Approved);
                    TrainingNeedsHeader.modify();
                    Variant := TrainingNeedsHeader;
                    Handled := true;
                end;
                 Database::"Vendor Appraisal Voucher":
                begin
                    RecRef.SetTable(VendorAppraisalVoucher);
                    VendorAppraisalVoucher.Validate("Approval Status", VendorAppraisalVoucher."Approval Status"::Approved);
                    VendorAppraisalVoucher.modify();
                    Variant := VendorAppraisalVoucher;
                    Handled := true;
                end;
                   //Contract termination
                Database::"Contract Termination":
                begin
                    RecRef.SetTable(ContractTermination);
                    ContractTermination.Validate("Approval Status",ContractTermination."Approval Status"::Approved);
                    if ContractTermination.Modify() then
                    TerminateContract(ContractTermination);
                    Variant :=ContractTermination;
                    Handled :=true;
                end;
            else
                Handled := false;
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end

    end;
    Local procedure TerminateContract(ContractTermination: Record "Contract Termination")
    var
    PurchaseHeader:Record "Purchase Header";
    begin
                PurchaseHeader.Reset();
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::"Blanket Order");
                PurchaseHeader.SetRange("No.", ContractTermination."Contract No.");
                if PurchaseHeader.FindFirst() then begin
                    PurchaseHeader."Termination Date" := ContractTermination."Termination Date";
                    PurchaseHeader."Contract Status" := PurchaseHeader."Contract Status"::Cancelled;
                    PurchaseHeader.Modify();
                end;
    end;

    Procedure PostLeave(Leaveapp: Record "HR Leave Applications")
    var
        SenderEmail: Text;
        SenderName: Text;
        PayrollPeriod: Record "Payroll PeriodX";
        NextPayDate: Date;
        LeaveApplicationX: Record "HR Leave Applications";
        HumanResSetup: Record "Human Resources Setup";
        UserSetup: Record "User Setup";
        HREmp: Record Employee;
        HRLeaveTypes: Record "HR Leave Types";
        AssignMatrixX: Record "Assignment Matrix-X";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        GeneralOptions: Record "Company Information";
        HRSetup: Record "Human Resources Setup";
        CummDays: Integer;
        dTaken: Decimal;
        HRLeaveApp: Record "HR Leave Applications";
        LeavePost: Codeunit "HR Leave Jnl.-Post";
        Leaveapp2: Record "HR Leave Applications";
    begin
        LeavePost.CreateLeaveLedgerEntries(Leaveapp);
        Leaveapp.posted := true;
        Leaveapp.modify();
        HumanResSetup.Get();
        // if Leaveapp.Status = Leaveapp.Status::Released then begin
        Leaveapp.Posted := false;
        HRLeaveApp.Reset;
        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Leaveapp."Application Code");
        if HRLeaveApp.Findfirst() then begin

            dTaken := 0;
            if HREmp.Get(HRLeaveApp."Employee No") then begin
                HREmp.CalcFields(HREmp."Total Leave Taken");
                dTaken := HREmp."Total Leave Taken";
            end;
            CummDays := Leaveapp."Days Applied" + Abs(dTaken);
            PayrollPeriod.Reset;
            PayrollPeriod.SetRange(PayrollPeriod.Closed, false);
            if PayrollPeriod.FindFirst then
                NextPayDate := PayrollPeriod."Starting Date";
            if Leaveapp."Leave Type" = 'ANNUAL' then begin
                HRSetup.Get();
                HRSetup.TestField("Leave Allowance Threshold");
                HRSetup.TestField("Leave Posting Period[FROM]");
                HRSetup.TestField("Leave Posting Period[TO]");
                AssignMatrixX.Reset;
                AssignMatrixX.SetRange(AssignMatrixX."Employee No", HRLeaveApp."Employee No");
                AssignMatrixX.SetRange(AssignMatrixX.Code, HRSetup."Leave Allowance Code");
                AssignMatrixX.SetRange(AssignMatrixX."Payroll Period", HRSetup."Leave Posting Period[FROM]", HRSetup."Leave Posting Period[TO]");
                if not AssignMatrixX.FindSet then begin
                    if CummDays >= HRSetup."Leave Allowance Threshold" then begin
                        AssignmentMatrixX.Init;
                        AssignmentMatrixX.Code := HRSetup."Leave Allowance Code";
                        AssignmentMatrixX."Employee No" := HRLeaveApp."Employee No";
                        AssignmentMatrixX.Validate(AssignmentMatrixX.Code);
                        AssignmentMatrixX.Frequency := AssignmentMatrixX.Frequency::"Non-recurring";
                        if Date2dmy(Today, 1) >= HumanResSetup."Leave Approval Days" then begin
                            AssignmentMatrixX."Payroll Period" := CalcDate('CM+1D', NextPayDate);//CALCDATE('<CM+1D>', TODAY);
                        end else
                            AssignmentMatrixX."Payroll Period" := NextPayDate;
                        if AssignmentMatrixX.Insert(true) then;
                    end;
                end;
            end;
        end;
        //end;
        // Leaveapp.Status := Leaveapp.Status::Released;
        // Leaveapp.Posted := true;
        // Leaveapp.Modify(true);
        //if not Leaveapp.modify() then begin


        if Leaveapp.Status <> Leaveapp.Status::Released then begin
            Leaveapp2.Reset();
            Leaveapp2.Setrange("Application Code", Leaveapp."Application Code");
            if Leaveapp2.FindFirst() then begin
                Leaveapp2.Status := Leaveapp2.Status::Released;
                Leaveapp2.Posted := true;
                Leaveapp2.modify();
            end;
        end;
       // end;
    end;

    procedure ReleaseFuelAllocations(FuelAlloc: Record "Fuel Allocations")
    var
        FuelAllocLines: Record "Fuel Allocation Lines";
    begin
        FuelAllocLines.Reset();
        FuelAllocLines.Setrange("Document No.", FuelAlloc."No.");
        if FuelAllocLines.FindSet() then
            FuelAllocLines.Closed := true;
            FuelAllocLines.modify;

        FuelAlloc.Closed := true;
        FuelAlloc.modify;
    end;

    procedure SetStatusToPending(RecRef: RecordRef; var Variant: Variant; IsHandled: Boolean)
    var
        //pavement
        PavementTestHeader: Record "Pavement Test Header";
        //IFS tENDER
        Comm: Record "IFS Tender Committee";
        //payroll
        PayrollHeader: Record "Payroll Header";
        //proff
        Prof: Record "Bid Tabulation Header";
        //Receipts
        Receipts: Record "Receipts Header1";
        //leave
        leave: Record "HR Leave Applications";
        //advancedpayments
        advpay: Record "Measurement &  Payment Header";


        //Fleet
        Fleet: Record "Transport Requisition";
        //corporate
        corporate: Record "Corporate Strategic Plans";
        //Monitor
        Monitor: Record "Monitoring Card Header";
        //project variation
        projectvariation: Record "Project Variation Header";
        //performance contract
        perform: Record "Perfomance Contract Header";
        //board
        board: Record "Project Contract Header";
        //Annual
        Annual: Record "Annual Strategy Workplan";
        //Geval
        Geval: Record "Perfomance Evaluation";
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //addend10
        addend: Record "Tender Addendum Notice";
        //eval
        eva: Record "Bid Scoring Template";
        //schedule projects
        roadworkprogram: Record "Road Work Program";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQs
        StandardPurchaseCode: Record "Standard Purchase Code";
        //pv
        payments: Record payments;
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        ImprestMemo2: Record "Imprest Memo";
        //Interbank Transfer
        InterBankTransfer: Record "Inter Bank Transfer";
        //SecurityIncidence
        SecurityIncidence: Record "Security Incidences";
        //Project Staff Voucher
        ProjectStaffVoucher: Record "Project Staff Voucher";
        //Fuel Requisition
        FuelRequisition: Record "Fuel & Maintenance Requisition";
        PCSumExpensing: Record "Request For PC Sum Expensing";
        InspectionHeader: Record "Inspection Header1";
        MobilizationHeader: Record "Project Mobilization Header";
        EquipmentRepairTracking: Record "Equipment Repair Tracking";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        ProjectEvaluationHeader: Record "Project Evaluation Header";
        MaterialTestRecord: Record "Material Test Record";
        WorkPlanHeader: Record "Work Plan Header";
        RiskMEHeader: Record "Risk M&E Header";
        SiteInstructions: Record "Site Instructions Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        RepaymentScheduleHeader: Record "RE Payment Schedule Header";
        RiskIncidentLog: Record "Risk Incident Log";
        RiskManagementPlan: Record "Risk Management Plan";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        SurveyQualityCheckHeader: Record "Survey Quality Check Header";
        TemporarySupervisionRequirem: Record "Temporary Supervision Requirem";
        CommunicationPlanHeader: Record "Communication Plan Header";
        DailyWorkRecord: Record "Daily Work Record";
        RAMWorkPlan: Record "RAM Workplan Header";
        LeaveRecall: Record "Leave Recall";
        RoadWorkBudgetCeiling: Record "Road Works Budget Ceilings";
        FuelTopupRequest: Record "Fuel Topup Request";
        VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
        RICS: Record "Road Inv. Condition Survey";
        RecruitmentRequisitions: Record "Recruitment Requisition Header";
        LeavePlan: Record "HR Leave Planner Header";
        MembershipFeesRequisitions: Record "Membership Fees Requisitions";
        FuelAllocations: Record "Fuel Allocations";
        TempSalaryVoucher: Record "Payroll HeaderT";
        TrainingNeedsHeader: Record "Training Needs Header";
        VendorAppraisalVoucher:Record "Vendor Appraisal Voucher";
        ContractTermination: Record "Contract Termination";
    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of
            //pavement
            Database::"Pavement Test Header":
                begin
                    RecRef.SetTable(PavementTestHeader);
                    PavementTestHeader.Validate(Status, PavementTestHeader.Status::"Pending Approval");
                    PavementTestHeader.Modify;
                    Variant := PavementTestHeader;
                    IsHandled := true;
                end;
            //ifs tender
            Database::"Ifs Tender Committee":

                begin
                    RecRef.SetTable(comm);
                    comm.Validate("Approval Status", comm."Approval Status"::"Pending Approval");
                    comm.Modify;
                    Variant := comm;
                    IsHandled := true;
                end;



            //payroll

            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::"Pending Approval");
                    PayrollHeader.Modify;
                    Variant := PayrollHeader;
                    IsHandled := true;
                end;
            //proff

            Database::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(Prof);
                    Prof.Validate("Approval Status", Prof."Approval Status"::"Pending Approval");
                    Prof.Modify;
                    Variant := Prof;
                    IsHandled := true;
                end;
            //receipts

            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipts);
                    Receipts.Validate(Status, Receipts.Status::"Pending Approval");
                    Receipts.Modify;
                    Variant := Receipts;
                    IsHandled := true;
                end;

            //leave

            Database::"HR Leave Applications":
                begin
                    RecRef.SetTable(leave);
                    leave.Validate(Status, leave.Status::"Pending Approval");
                    leave.Modify;
                    Variant := leave;
                    IsHandled := true;
                end;

            //advancedpayment

            Database::"Measurement &  Payment Header":
                begin
                    RecRef.SetTable(advpay);
                    advpay.Validate(Status, advpay.Status::"Pending Approval");
                    advpay.Modify;
                    Variant := advpay;
                    IsHandled := true;
                end;

            //fleet

            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(Fleet);
                    Fleet.Validate(Status, Fleet.Status::"Pending Approval");
                    Fleet.Modify;
                    Variant := Fleet;
                    IsHandled := true;
                end;
            //Corporate

            Database::"Corporate Strategic Plans":
                begin
                    RecRef.SetTable(corporate)
                    ;
                    corporate.Validate("Approval Status", corporate."Approval Status"::"Pending Approval");
                    corporate.Modify;
                    Variant := corporate;
                    IsHandled := true;
                end;
            //Monitor

            Database::"Monitoring Card Header":
                begin
                    RecRef.SetTable(Monitor)
                    ;
                    /////
                    Monitor.Validate("Status", Monitor."Status"::"Pending Approval");

                    Monitor.Modify;
                    Variant := Monitor;
                    IsHandled := true;
                end;

            //project variation
            Database::"Project Variation Header":
                begin
                    RecRef.SetTable(projectvariation)
                    ;
                    projectvariation.Validate("Status", projectvariation."status"::"Pending Approval");
                    projectvariation.Modify;
                    Variant := projectvariation;
                    IsHandled := true;
                end;
            //Performance Contract

            Database::"Perfomance Contract Header":
                begin
                    RecRef.SetTable(perform)
                    ;
                    perform.Validate("Approval Status", perform."Approval Status"::"Pending Approval");
                    perform.Modify;
                    Variant := perform;
                    IsHandled := true;
                end;
            //board

            Database::"Project Contract Header":
                begin
                    RecRef.SetTable(board)
                    ;
                    board.Validate("Approval Status", board."Approval Status"::"Pending Approval");
                    board.Modify;
                    Variant := board;
                    IsHandled := true;
                end;

            //Annual

            Database::"Annual Strategy Workplan":
                begin
                    RecRef.SetTable(Annual)
                    ;
                    Annual.Validate("Approval Status", Annual."Approval Status"::"Pending Approval");
                    Annual.Modify;
                    Variant := Annual;
                    IsHandled := true;
                end;
            //Geval

            Database::"Perfomance Evaluation":
                begin
                    RecRef.SetTable(Geval)
                    ;
                    Geval.Validate("Approval Status", Geval."Approval Status"::"Pending Approval");
                    Geval.Modify;
                    Variant := Geval;
                    IsHandled := true;
                end;
            //  addend11
            Database::"Tender Addendum Notice":
                begin
                    RecRef.SetTable(addend)
                    ;
                    addend.Validate("Status", addend."Status"::"Pending Approval");
                    addend.Modify;
                    Variant := addend;
                    IsHandled := true;
                end;

            //evaluation

            Database::"Bid Scoring Template":
                begin
                    RecRef.SetTable(eva)
                    ;
                    eva.Validate("Status", eva."Status"::"Pending Approval");
                    eva.Modify;
                    Variant := eva;
                    IsHandled := true;
                end;
            //project schedule

            Database::"Road Work Program":
                begin
                    RecRef.SetTable(roadworkprogram)
                    ;
                    roadworkprogram.Validate("Approval Status", roadworkprogram."Approval Status"::"Pending Approval");
                    roadworkprogram.Modify;
                    Variant := roadworkprogram;
                    IsHandled := true;
                end;
            //purchase

            Database::"Purchase Header":
                begin
                    RecRef.SetTable(PurchaseHeader);
                    // PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
                    PurchaseHeader.Validate(Status, PurchaseHeader.Status::"Pending Approval");
                    PurchaseHeader.Modify;
                    Variant := PurchaseHeader;
                    IsHandled := true;
                end;
            //IFRCARD

            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::"Pending Approval");
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    IsHandled := true;
                end;

            //procurement plan

            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::"Pending Approval");
                    procurementplan.Modify;
                    Variant := procurementplan;
                    IsHandled := true;
                end;
            //rfq

            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::"Pending Approval");
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    IsHandled := true;
                end;
            //pv
            Database::"Payments":
                begin
                    RecRef.SetTable(Payments);
                    payments.Validate(Status, payments.Status::"Pending Approval");
                    payments.Modify;
                    Variant := payments;
                    IsHandled := true;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo2.Reset();
                    ImprestMemo2.SetRange("No.", ImprestMemo."No.");
                    if ImprestMemo2.FindFirst() then begin
                        ImprestMemo2.Status := ImprestMemo2.Status::"Pending Approval";
                        ImprestMemo2.Modify();
                    end;
                    Variant := ImprestMemo;
                    IsHandled := true;
                end;

            //Interbank Transfer
            Database::"Inter Bank Transfer":
                begin
                    RecRef.SetTable(InterBankTransfer);
                    InterBankTransfer.Validate("Approval Status", InterBankTransfer."Approval Status"::"Pending Approval");
                    InterBankTransfer.Modify;
                    Variant := InterBankTransfer;
                    IsHandled := true;
                end;
            Database::"Security Incidences":
                begin
                    RecRef.SetTable(SecurityIncidence);
                    SecurityIncidence.Validate("Approval Status", SecurityIncidence."Approval Status"::"Pending Approval");
                    SecurityIncidence.modify();
                    Variant := SecurityIncidence;
                    IsHandled := true;
                end;
            Database::"Project Staff Voucher":
                begin
                    RecRef.setTable(ProjectStaffVoucher);
                    ProjectStaffVoucher.Validate(Status, ProjectStaffVoucher.Status::"Pending Approval");
                    ProjectStaffVoucher.modify();
                    Variant := ProjectStaffVoucher;
                    Ishandled := true;
                end;
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.setTable(FuelRequisition);
                    FuelRequisition.Validate(Status, FuelRequisition.Status::"Pending Approval");
                    FuelRequisition.modify();
                    Variant := FuelRequisition;
                    Ishandled := true;
                end;
            Database::"Request For PC Sum Expensing":
                begin
                    RecRef.setTable(PCSumExpensing);
                    PCSumExpensing.Validate(Status, PCSumExpensing.Status::"Pending Approval");
                    PCSumExpensing.modify();
                    Variant := PCSumExpensing;
                    Ishandled := true;
                end;
            Database::"Inspection Header1":
                begin
                    RecRef.setTable(InspectionHeader);
                    InspectionHeader.Validate(Status, InspectionHeader.Status::"Pending Approval");
                    InspectionHeader.Modify();
                    Variant := InspectionHeader;
                    IsHandled := true;
                end;
            Database::"Project Mobilization Header":
                begin
                    RecRef.setTable(MobilizationHeader);
                    MobilizationHeader.Validate(Status, MobilizationHeader.Status::"Pending Approval");
                    MobilizationHeader.Modify();
                    Variant := MobilizationHeader;
                    IsHandled := true;
                end;
            Database::"Project Evaluation Header":
                begin
                    RecRef.setTable(ProjectEvaluationHeader);
                    ProjectEvaluationHeader.Validate(Status, ProjectEvaluationHeader.Status::"Pending Approval");
                    ProjectEvaluationHeader.Modify();
                    Variant := ProjectEvaluationHeader;
                    IsHandled := true;
                end;
            Database::"Equipment Repair Tracking":
                begin
                    RecRef.setTable(EquipmentRepairTracking);
                    EquipmentRepairTracking.Validate(Status, EquipmentRepairTracking.Status::"Pending Approval");
                    EquipmentRepairTracking.Modify();
                    Variant := EquipmentRepairTracking;
                    IsHandled := true;
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    RecRef.settable(InsuranceGuarantee);
                    InsuranceGuarantee.Validate(Status, InsuranceGuarantee.Status::"Pending Approval");
                    InsuranceGuarantee.Modify();
                    Variant := InsuranceGuarantee;
                    IsHandled := true;
                end;
            Database::"Material Test Record":
                begin
                    RecRef.settable(MaterialTestRecord);
                    MaterialTestRecord.Validate(Status, MaterialTestRecord.Status::"Pending Approval");
                    MaterialTestRecord.Modify();
                    Variant := MaterialTestRecord;
                    IsHandled := true;
                end;
            Database::"Work Plan Header":
                begin
                    RecRef.settable(WorkPlanHeader);
                    WorkPlanHeader.Validate(Status, WorkPlanHeader.Status::"Pending Approval");
                    WorkPlanHeader.Modify();
                    Variant := WorkPlanHeader;
                    IsHandled := true;
                end;
            Database::"Risk M&E Header":
                begin
                    RecRef.settable(RiskMEHeader);
                    RiskMEHeader.Validate(Status, RiskMEHeader.Status::"Pending Approval");
                    RiskMEHeader.Modify();
                    Variant := RiskMEHeader;
                    IsHandled := true;
                end;
            Database::"Site Instructions Header":
                begin
                    RecRef.settable(SiteInstructions);
                    SiteInstructions.Validate(Status, SiteInstructions.Status::"Pending Approval");
                    SiteInstructions.Modify();
                    Variant := SiteInstructions;
                    IsHandled := true;
                end;
            Database::"Project Meeting Register":
                begin
                    RecRef.settable(ProjectMeetingRegister);
                    ProjectMeetingRegister.Validate(Status, ProjectMeetingRegister.Status::"Pending Approval");
                    ProjectMeetingRegister.Modify();
                    Variant := ProjectMeetingRegister;
                    IsHandled := true;
                end;
            Database::"RE Payment Schedule Header":
                begin
                    RecRef.settable(RepaymentScheduleHeader);
                    RepaymentScheduleHeader.Validate(Status, RepaymentScheduleHeader.Status::"Pending Approval");
                    RepaymentScheduleHeader.Modify();
                    Variant := RepaymentScheduleHeader;
                    IsHandled := true;
                end;
            Database::"Risk Incident Log":
                begin
                    RecRef.settable(RiskIncidentLog);
                    RiskIncidentLog.Validate(Status, RiskIncidentLog.Status::"Pending Approval");
                    RiskIncidentLog.Modify();
                    Variant := RiskIncidentLog;
                    IsHandled := true;
                end;
            Database::"Risk Management Plan":
                begin
                    RecRef.settable(RiskManagementPlan);
                    RiskManagementPlan.Validate(Status, RiskManagementPlan.Status::"Pending Approval");
                    RiskManagementPlan.Modify();
                    Variant := RiskManagementPlan;
                    IsHandled := true;
                end;
            Database::"WEP Contractor Submission":
                begin
                    RecRef.settable(WEPContractorSubmission);
                    WEPContractorSubmission.Validate(Status, WEPContractorSubmission.Status::"Pending Approval");
                    WEPContractorSubmission.Modify();
                    Variant := WEPContractorSubmission;
                    IsHandled := true;
                end;
            Database::"Survey Quality Check Header":
                begin
                    RecRef.settable(SurveyQualityCheckHeader);
                    SurveyQualityCheckHeader.Validate(Status, SurveyQualityCheckHeader.Status::"Pending Approval");
                    SurveyQualityCheckHeader.Modify();
                    Variant := SurveyQualityCheckHeader;
                    IsHandled := true;
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    RecRef.settable(TemporarySupervisionRequirem);
                    TemporarySupervisionRequirem.Validate(Status, TemporarySupervisionRequirem.Status::"Pending Approval");
                    TemporarySupervisionRequirem.Modify();
                    Variant := TemporarySupervisionRequirem;
                    IsHandled := true;
                end;
            Database::"Communication Plan Header":
                begin
                    RecRef.settable(CommunicationPlanHeader);
                    CommunicationPlanHeader.Validate(Status, CommunicationPlanHeader.Status::"Pending Approval");
                    CommunicationPlanHeader.Modify();
                    Variant := CommunicationPlanHeader;
                    IsHandled := true;
                end;
            Database::"Daily Work Record":
                begin
                    RecRef.settable(DailyWorkRecord);
                    DailyWorkRecord.Validate(Status, DailyWorkRecord.Status::"Pending Approval");
                    DailyWorkRecord.Modify();
                    Variant := DailyWorkRecord;
                    IsHandled := true;
                end;
            Database::"RAM Workplan Header":
                begin
                    RecRef.settable(RAMWorkPlan);
                    RAMWorkPlan.Validate(Status, RAMWorkPlan.Status::"Pending Approval");
                    RAMWorkPlan.Modify();
                    Variant := RAMWorkPlan;
                    IsHandled := true;
                end;
            Database::"Leave Recall":
                begin
                    RecRef.settable(LeaveRecall);
                    LeaveRecall.Validate("Approval Status", LeaveRecall."Approval Status"::"Pending Approval");
                    LeaveRecall.Modify();
                    LeaveRecall.PostToLedgerEntries(LeaveRecall);
                    Variant := LeaveRecall;
                    IsHandled := true;
                end;
            Database::"Road Works Budget Ceilings":
                begin
                    RecRef.settable(RoadWorkBudgetCeiling);
                    RoadWorkBudgetCeiling.Validate(Status, RoadWorkBudgetCeiling.Status::"Pending Approval");
                    RoadWorkBudgetCeiling.Modify();
                    Variant := RoadWorkBudgetCeiling;
                    IsHandled := true;
                end;
            //FuelTopupRequest
            Database::"Fuel Topup Request":
                begin
                    RecRef.settable(FuelTopupRequest);
                    FuelTopupRequest.Validate(Status, FuelTopupRequest.Status::"Pending Approval");
                    FuelTopupRequest.Modify();
                    Variant := FuelTopupRequest;
                    IsHandled := true;
                end;
            //Vehicle Fuel Card Lines
            Database::"Vehicle Fuel Card Lines":
                begin
                    RecRef.settable(VehicleFuelCardLines);
                    VehicleFuelCardLines.Validate("Approval Status", VehicleFuelCardLines."Approval Status"::"Pending Approval");
                    VehicleFuelCardLines.Modify();
                    Variant := VehicleFuelCardLines;
                    IsHandled := true;
                end;
            Database::"Road Inv. Condition Survey":
                begin
                    RecRef.Settable(RICS);
                    RICS.Validate("Approval Status", RICS."Approval Status"::"Pending Approval");
                    RICS.modify();
                    Variant := RICS;
                    IsHandled := true;
                end;
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.Settable(RecruitmentRequisitions);
                    RecruitmentRequisitions.Validate("Approval Status", RecruitmentRequisitions."Approval Status"::"Pending Approval");
                    RecruitmentRequisitions.modify();
                    Variant := RecruitmentRequisitions;
                    IsHandled := true;
                end;
                Database::"HR Leave Planner Header":
                begin
                     RecRef.Settable(LeavePlan);
                    LeavePlan.Validate("Approval Status", LeavePlan."Approval Status"::"Pending Approval");
                    LeavePlan.modify();
                    Variant := LeavePlan;
                    IsHandled := true;
                end;
                Database::"Membership Fees Requisitions":
                begin
                     RecRef.Settable(MembershipFeesRequisitions);
                    MembershipFeesRequisitions.Validate(Status, MembershipFeesRequisitions.Status::"Pending Approval");
                    MembershipFeesRequisitions.modify();
                    Variant := MembershipFeesRequisitions;
                    IsHandled := true;
                end;
            Database::"Payroll HeaderT":
                begin
                    RecRef.Settable(TempSalaryVoucher);
                    TempSalaryVoucher.Validate(Status, TempSalaryVoucher.Status::"Pending Approval");
                    TempSalaryVoucher.modify();
                    Variant := TempSalaryVoucher;
                    IsHandled := true;
                end;
                Database::"Fuel Allocations":
                begin
                    RecRef.Settable(FuelAllocations);
                    FuelAllocations.Validate(Status, FuelAllocations.Status::"Pending Approval");
                    FuelAllocations.modify();
                    Variant := FuelAllocations;
                    IsHandled := true;
                end;
                //Training Needs Header
                Database::"Training Needs Header":
                begin
                    RecRef.Settable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::"Pending Approval");
                    TrainingNeedsHeader.modify();
                    Variant := TrainingNeedsHeader;
                    IsHandled := true;
                end;
                  Database::"Vendor Appraisal Voucher":
                begin
                    RecRef.SetTable(VendorAppraisalVoucher);
                    VendorAppraisalVoucher.Validate("Approval Status", VendorAppraisalVoucher."Approval Status"::"Pending Approval");
                    VendorAppraisalVoucher.modify();
                    Variant := VendorAppraisalVoucher;
                    IsHandled := true;
                end;
                   //Contract termination
                Database::"Contract Termination":
                begin
                    RecRef.SetTable(ContractTermination);
                    ContractTermination.Validate("Approval Status",ContractTermination."Approval Status"::"Pending Approval");
                    ContractTermination.Modify();
                    Variant :=ContractTermination;
                    IsHandled :=true;
                end;
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end;

    end;
    ///////////////////////event subscribers


    [IntegrationEvent(false, false)]
    procedure OnSendDocForApproval(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateNo', '', false, false)]
    local procedure
    Table39_No_OnBeforeValidateNo(CurrentFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Purchase Requisition" then begin
                IsHandled := true;
            end;
            if "Document Type" = "Document Type"::"Store Requisition" then begin
                IsHandled := true;
            end;

        end;
    end;

    [EventSubscriber(ObjectType::table, 39, 'OnBeforeTestStatusOpen', '', false, false)]
    local procedure
Table39_No_OnBeforeTestStatusOpen(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Purchase Requisition" then begin
                IsHandled := true;
            end;
            if "Document Type" = "Document Type"::"Store Requisition" then begin
                IsHandled := true;
            end;

        end;
    end;

    [EventSubscriber(ObjectType::table, Database::"Purchase Header", 'OnBeforeValidateBuyFromVendorNo', '', false, false)]
    local procedure
   Table38_No_OnBeforeValidateBuyfromVendorNo(CallingFieldNo: Integer; var PurchaseHeader: Record "Purchase Header"; var SkipBuyFromContact: Boolean; xPurchaseHeader: Record "Purchase Header")
    begin
        case PurchaseHeader."Document Type" of
        PurchaseHeader."Document Type"::"Purchase Requisition",
        PurchaseHeader."Document Type"::"Store Requisition":
        begin
          PurchaseHeader."Buy-from Vendor No." := 'VEND01186';
          PurchaseHeader.Modify();
        end;
        end;
        
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnBeforeRunWorkflowOnSendPurchaseDocForApproval', '', false,false)]
     local procedure OnBeforeRunWorkflowOnSendPurchaseDocForApproval(var PurchaseHeader: Record "Purchase Header")
    begin
        case PurchaseHeader."Document Type" of 
        PurchaseHeader."Document Type"::"Purchase Requisition":
        begin
            if PurchaseHeader."Buy-from Vendor No." = '' then begin
            PurchaseHeader."Buy-from Vendor No." := 'VEND01186';
            PurchaseHeader.modify();
            end;
        end;
        PurchaseHeader."Document Type"::"Store Requisition":
        begin
             if PurchaseHeader."Buy-from Vendor No." = '' then begin
            PurchaseHeader."Buy-from Vendor No." := 'VEND01186';
            PurchaseHeader.modify();
        end;
        end;
        end;
    end;

    [EventSubscriber(ObjectType::table, Database::"Purchase Header", 'OnBeforeValidateBuyFromVendorNo', '', false, false)]
    local procedure
    Table38_No_OnBeforeValidateBuyfromVendorNoStores(CallingFieldNo: Integer; var PurchaseHeader: Record "Purchase Header"; var SkipBuyFromContact: Boolean; xPurchaseHeader: Record "Purchase Header")
    begin

        if (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition") then begin
            PurchaseHeader."Buy-from Vendor No." := 'VEND01186';
        end;


    end;


    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateNo', '', false, false)]
    local procedure Table39_No_OnBeforeValidateNo2(CurrentFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        if PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Store Requisition" then begin
            IsHandled := true;
        end;
    end;
    //CC
    [EventSubscriber(ObjectType::table, 81, 'OnBeforeLookUpAppliesToDocVend', '', false, false)]
    local procedure
  Table81_No_OnAppliesToDocNoOnValidateOnBeforeUpdAmtToEntries(AccNo: Code[20]; var GenJournalLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    VAR
        VendLedgEntry: Record "Vendor Ledger Entry";
        ApplyVendEntries: Page "Apply Vendor Entries";
    begin

        Clear(VendLedgEntry);
        VendLedgEntry.SetCurrentKey("Vendor No.", Open, Positive, "Due Date");
        if AccNo <> '' then
            VendLedgEntry.SetRange("Vendor No.", AccNo);
        VendLedgEntry.SetRange(Open, true);
        if GenJournalLine."Applies-to Doc. No." <> '' then begin
            VendLedgEntry.SetRange("Document No.", GenJournalLine."Applies-to Doc. No.");
            if VendLedgEntry.IsEmpty() then begin
                VendLedgEntry.SetRange("Document No.");
            end;
        end;
        if GenJournalLine."Applies-to Doc. No." <> '' then begin
            VendLedgEntry.SetRange("Applies-to ID", GenJournalLine."Applies-to ID");
            if VendLedgEntry.IsEmpty() then
                VendLedgEntry.SetRange("Applies-to ID");
        end;
        if GenJournalLine."Applies-to Doc. No." <> '' then begin
            VendLedgEntry.SetRange("Document No.", GenJournalLine."Applies-to Doc. No.");
            if VendLedgEntry.IsEmpty() then
                VendLedgEntry.SetRange("Document No.");
        end;
        if GenJournalLine.Amount <> 0 then begin
            VendLedgEntry.SetRange(Positive, GenJournalLine.Amount < 0);
            if VendLedgEntry.IsEmpty() then;
            VendLedgEntry.SetRange(Positive);
        end;
        IsHandled := true;

    end;

    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    local procedure Table39_No_OnBeforeValidateQuantityBase(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        if PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Purchase Requisition" then begin
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    local procedure Table39_No_OnBeforeValidateQuantityBase2(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        if PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Store Requisition" then begin
            IsHandled := true;
        end;
    end;



    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    local procedure Table39_No_OnBeforeValidateQuantityBase21(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Purchase Requisition" then begin
                IsHandled := true;
            end;

        end;
    end;




    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Enum Assignment Management", 'OnGetPurchApprovalDocumentType', '', false, false)]
    local procedure Codeunit_500_OnGetPurchApprovalDocumentType(PurchDocumentType: Enum "Purchase Document Type"; var ApprovalDocumentType: Enum "Approval Document Type"; var IsHandled: Boolean)
    begin
        if PurchDocumentType = PurchDocumentType::"Purchase Requisition" then begin
            IsHandled := true;
        end;

        if PurchDocumentType = PurchDocumentType::"Store Requisition" then begin
            IsHandled := true;
        end;


    end;

    //
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeCheckPurchaseApprovalPossible', '', false, false)]
    local procedure Codeunit_1535_OnBeforeCheckPurchaseApprovalPossible(PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean; var Result: Boolean)
    begin
        if Purchaseheader."Document Type" = Purchaseheader."Document Type"::"Store Requisition" then
            IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCheckPurchaseApprovalPossibleOnAfterCalcShowNothingToApproveError', '', false, false)]
    local procedure Codeunit_1535_OnCheckPurchaseApprovalPossibleOnAfterCalcShowNothingToApproveError(var PurchaseHeader: Record "Purchase Header"; var ShowNothingToApproveError: Boolean)
    begin
        with Purchaseheader do begin
            if "Document Type" = "Document Type"::"Store Requisition" then
                ShowNothingToApproveError := true;
        end
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Price Calc. Mgt.", 'OnBeforeFindPurchLinePrice', '', false, false)]
    local procedure Codeunit_7010_OnBeforeFindPurchLinePrice(CalledByFieldNo: Integer; var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line")
    begin
        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Purchase Requisition" then
                IsHandled := true;
            if "Document Type" = "Document Type"::"Store Requisition" then
                IsHandled := true;

            IsHandled := true;
        end
    end;



    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
        LineNo: Integer;
    begin
        case RecRef.Number of
            DATABASE::"Payment Terms":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            DATABASE::"Purchase Header":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            DATABASE::"Purchase Line":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Measurement &  Payment Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Site Instructions Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Project Staff Voucher":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Project Mobilization Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Project Meeting Register":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"WEP Contractor Submission":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Work Plan Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Contractor Inspection Request":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Daily Work Records":
                begin
                    FieldRef := RecRef.Field(9);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Survey Quality Check Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Material Test Record":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Inspection Headersss":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Inspection Header1":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::Job:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Road Works Budget Ceilings":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"RAM Workplan Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Request for PC sum Expensing":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            DATABASE::"Fuel Topup Request":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::Payments:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Payroll Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Perfomance Evaluation":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"HR Leave Applications":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Job Applications":
                begin
                    FieldRef := RecRef.Field(48);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
                Database::"HR Leave Planner Header":
                begin
                       FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Standard Purchase Code":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"IFS Tender Committee":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
                   Database::"Standard Purchase Line":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                     FieldRef := RecRef.Field(2);
                     LineNo := FieldRef.Value;
                    DocumentAttachment.SetRange("Line No.", LineNo);
                end;
                Database::"Payroll HeaderT":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
                Database::"Transport Requisition":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
                Database::"Membership Fees Requisitions":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
                Database::"HR Disciplinary Cases":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
                    Database::"Contract Termination":
                begin
                     FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;  
                
        end;
    end;
    //cc
    [EventSubscriber(ObjectType::table, 179, 'OnCheckGLAccOnBeforeTestFields', '', false, false)]
    local procedure Table179_No_OnCheckGLAccOnBeforeTestFields(GLAcc: Record "G/L Account"; GLEntry: Record "G/L Entry"; var IsHandled: Boolean)
    begin

        if GLEntry."job No." <> '' then begin
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        DocType: Option "Quote","Order","Invoice","Credit Memo","Blanket Order","Return Order","Purchase Requisition";
        RecNo: Code[20];
         LineNo: Integer;
    begin
        case RecRef.Number of
            DATABASE::"Payment Terms":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            DATABASE::"Payments":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"Receipts Header1":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            DATABASE::"Imprest Memo":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"Purchase header":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Measurement &  Payment Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Site Instructions Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo)
                end;
            Database::"Project Staff Voucher":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo)
                end;
            Database::"Project Mobilization Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Project Meeting Register":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"WEP Contractor Submission":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Work Plan Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Contractor Inspection Request":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Daily Work Records":
                begin
                    FieldRef := RecRef.Field(9);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Survey Quality Check Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Material Test Record":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Inspection Headersss":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::Job:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Inspection Header1":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Road Works Budget Ceilings":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"RAM Workplan Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Request for PC sum Expensing":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Fuel Topup Request":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::Payments:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Payroll Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Perfomance Evaluation":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
             DATABASE::"HR Leave applications":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"Job applications":
                begin
                    FieldRef := RecRef.Field(48);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
                Database::"HR Leave Planner Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Standard Purchase Code":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"IFS Tender Committee":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Standard Purchase Line":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                     FieldRef := RecRef.Field(2);
                     LineNo := FieldRef.Value;
                    DocumentAttachment.Validate("Line No.", LineNo);
                end;
                 Database::"Payroll HeaderT":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
                Database::"Transport Requisition":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
                Database::"Membership Fees Requisitions":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end; 
                Database::"Contract Termination":
                begin
                     FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
                Database::"HR Disciplinary Cases":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        PaymentTerms: Record "Payments";
        PayTerms: Record "Payment Terms";
        PHeader: Record "Purchase Header";
        Receipts: record "Receipts Header1";
        imemo: record "Imprest Memo";
        Measurements: Record "Measurement &  Payment Header";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        SiteInstructionsHeader: Record "Site Instructions Header";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        TemporarySupervisionReq: Record "Temporary Supervision Requirem";
        WeeklyWorkPlan: Record "Work Plan Header";
        ContractorInspectionRequest: Record "Contractor Inspection Request";
        DailyWorkRecord: Record "Daily Work Records";
        SurveyQualityCheckH: Record "Survey Quality Check Header";
        MaterialTestRecord: Record "Material Test Record";
        InspectionHeader: Record "Inspection Headersss";
        InspectionHeader1: Record "Inspection Header1";
        Jobs: Record Job;
        RoadworksBudgetCeiling: Record "Road Works Budget Ceilings";
        RAMWorkplan: Record "RAM Workplan Header";
        RequestForPCSumExpensing: Record "Request For PC Sum Expensing";
        FuelTopUpRequest: Record "Fuel Topup Request";
        DirectorPayroll: Record "Payroll Header";
        PerformanceEvaluation: Record "Perfomance Evaluation";
        HRLeaveApplications: Record "HR Leave Applications";
        JobApplications: Record "Job Applications";
        LeavePlan: Record "HR Leave Planner Header";
        StandardPurchaseCode: Record "Standard Purchase Code";
        IFSTenderCommitte: Record "IFS Tender Committee";
        StandardPurchaseLine: Record "Standard Purchase Line";
        SalaryVoucherTemp: Record "Payroll HeaderT";
        TransportRequisition: Record "Transport Requisition";
        MembershipFeesRequisitions:Record "Membership Fees Requisitions";
        DisciplinaryCases: Record "HR Disciplinary Cases";
        ContractTermination: Record "Contract Termination";
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"Payments":
                begin
                    RecRef.Open(DATABASE::"Payments");
                    if PaymentTerms.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PaymentTerms);
                end;
            DATABASE::"HR Leave Applications":
                begin
                    RecRef.Open(DATABASE::"HR Leave Applications");
                    if HRLeaveApplications.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(HRLeaveApplications);
                end;
            DATABASE::"Imprest Memo":
                begin
                    RecRef.Open(DATABASE::"Imprest Memo");
                    if imemo.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(imemo);
                end;
            DATABASE::"Payment Terms":
                begin
                    RecRef.Open(DATABASE::"Payment Terms");
                    if PayTerms.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PayTerms);
                end;
            DATABASE::"Receipts Header1":
                begin
                    RecRef.Open(DATABASE::"Receipts Header1");
                    if Receipts.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(receipts);
                end;
            DATABASE::"Purchase Header":
                begin
                    RecRef.Open(DATABASE::"Purchase Header");
                    PHeader.Reset();
                    PHeader.SetRange("No.", DocumentAttachment."No.");
                    if PHeader.FindFirst() then
                        RecRef.GetTable(PHeader);
                end;
            Database::"Measurement &  Payment Header":
                begin
                    RecRef.Open(Database::"Measurement &  Payment Header");
                    Measurements.Reset();
                    Measurements.SetRange("Document No.", DocumentAttachment."No.");
                    if Measurements.findfirst() then
                        RecRef.GetTable(Measurements);
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    RecRef.Open(Database::"Insurance/Guarantee Header");
                    InsuranceGuarantee.Reset();
                    InsuranceGuarantee.SetRange("Document No.", DocumentAttachment."No.");
                    if InsuranceGuarantee.findfirst() then
                        RecRef.GetTable(InsuranceGuarantee);
                end;
            Database::"Site Instructions Header":
                begin
                    RecRef.Open(Database::"Site Instructions Header");
                    SiteInstructionsHeader.Reset();
                    SiteInstructionsHeader.SetRange("Document No.", DocumentAttachment."No.");
                    if SiteInstructionsHeader.FindFirst() then
                        RecRef.GetTable(SiteInstructionsHeader);
                end;
            Database::"Project Staff Voucher":
                begin
                    RecRef.Open(Database::"Project Staff Voucher");
                    ProjectStaffVoucher.Reset();
                    ProjectStaffVoucher.SetRange("Document No.", DocumentAttachment."No.");
                    if ProjectStaffVoucher.findfirst() then
                        RecRef.GetTable(ProjectStaffVoucher);
                end;
            Database::"Project Mobilization Header":
                begin
                    RecRef.Open(Database::"Project Mobilization Header");
                    ProjectMobilization.Reset();
                    ProjectMobilization.SetRange("Document No.", DocumentAttachment."No.");
                    if ProjectMobilization.findfirst() then
                        RecRef.GetTable(ProjectMobilization);
                end;
            Database::"Project Meeting Register":
                begin
                    RecRef.Open(Database::"Project Meeting Register");
                    ProjectMeetingRegister.Reset();
                    ProjectMeetingRegister.SetRange("Meeting ID", DocumentAttachment."No.");
                    if ProjectMeetingRegister.findfirst() then
                        RecRef.GetTable(ProjectMeetingRegister);
                end;
            Database::"WEP Contractor Submission":
                begin
                    RecRef.Open(Database::"WEP Contractor Submission");
                    WEPContractorSubmission.Reset();
                    WEPContractorSubmission.SetRange("Document No", DocumentAttachment."No.");
                    if WEPContractorSubmission.findfirst() then
                        RecRef.GetTable(WEPContractorSubmission);
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    RecRef.Open(Database::"Temporary Supervision Requirem");
                    TemporarySupervisionReq.Reset();
                    TemporarySupervisionReq.SetRange("Document No", DocumentAttachment."No.");
                    if TemporarySupervisionReq.findfirst() then
                        RecRef.GetTable(TemporarySupervisionReq);
                end;
            Database::"Work Plan Header":
                begin
                    RecRef.Open(Database::"Work Plan Header");
                    WeeklyWorkPlan.Reset();
                    WeeklyWorkPlan.SetRange("Document No.", DocumentAttachment."No.");
                    if WeeklyWorkPlan.findfirst() then
                        RecRef.GetTable(WeeklyWorkPlan);
                end;
            Database::"Contractor Inspection Request":
                begin
                    RecRef.Open(Database::"Contractor Inspection Request");
                    ContractorInspectionRequest.Reset();
                    ContractorInspectionRequest.SetRange("Document No.", DocumentAttachment."No.");
                    if ContractorInspectionRequest.findfirst() then
                        RecRef.GetTable(ContractorInspectionRequest);
                end;
            Database::"Daily Work Records":
                begin
                    RecRef.Open(Database::"Daily Work Records");
                    DailyWorkRecord.Reset();
                    DailyWorkRecord.SetRange("Daily Work No", DocumentAttachment."No.");
                    if DailyWorkRecord.findfirst() then
                        RecRef.GetTable(DailyWorkRecord);
                end;
            Database::"Survey Quality Check Header":
                begin
                    RecRef.Open(Database::"Survey Quality Check Header");
                    SurveyQualityCheckH.Reset();
                    SurveyQualityCheckH.SetRange("Document No", DocumentAttachment."No.");
                    if SurveyQualityCheckH.findfirst() then
                        RecRef.GetTable(SurveyQualityCheckH);
                end;
            Database::"Material Test Record":
                begin
                    RecRef.Open(Database::"Material Test Record");
                    MaterialTestRecord.Reset();
                    MaterialTestRecord.SetRange(Code, DocumentAttachment."No.");
                    if MaterialTestRecord.findfirst() then
                        RecRef.GetTable(MaterialTestRecord);
                end;
            Database::"Inspection Headersss":
                begin
                    RecRef.Open(Database::"Inspection Headersss");
                    InspectionHeader.Reset();
                    InspectionHeader.SetRange("Inspection No", DocumentAttachment."No.");
                    if InspectionHeader.findfirst() then
                        RecRef.GetTable(InspectionHeader);
                end;
            Database::"Inspection Header1":
                begin
                    RecRef.Open(Database::"Inspection Header1");
                    InspectionHeader1.Reset();
                    InspectionHeader1.SetRange("Inspection No", DocumentAttachment."No.");
                    if InspectionHeader1.findfirst() then
                        RecRef.GetTable(InspectionHeader1);
                end;
            Database::Job:
                begin
                    RecRef.Open(Database::Job);
                    Jobs.Reset();
                    Jobs.SetRange("No.", DocumentAttachment."No.");
                    if Jobs.findfirst() then
                        RecRef.GetTable(Jobs);
                end;
            Database::"Road Works Budget Ceilings":
                begin
                    RecRef.Open(Database::"Road Works Budget Ceilings");
                    RoadworksBudgetCeiling.Reset();
                    RoadworksBudgetCeiling.SetRange("Document No", DocumentAttachment."No.");
                    if RoadworksBudgetCeiling.findfirst() then
                        RecRef.GetTable(RoadworksBudgetCeiling);
                end;
            Database::"RAM Workplan Header":
                begin
                    RecRef.Open(Database::"RAM Workplan Header");
                    RAMWorkplan.Reset();
                    RAMWorkplan.SetRange("Document No", DocumentAttachment."No.");
                    if RAMWorkplan.findfirst() then
                        RecRef.GetTable(RAMWorkplan);
                end;
            Database::"Request for PC sum Expensing":
                begin
                    RecRef.Open(Database::"Request for PC sum Expensing");
                    RequestForPCSumExpensing.Reset();
                    RequestForPCSumExpensing.SetRange("Document No.", DocumentAttachment."No.");
                    if RequestForPCSumExpensing.findfirst() then
                        RecRef.Gettable(RequestForPCSumExpensing);
                end;
            DATABASE::"Fuel Topup Request":
                begin
                    RecRef.Open(DATABASE::"Fuel Topup Request");
                    if FuelTopUpRequest.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(FuelTopUpRequest);
                end;
            Database::"Payroll Header":
                begin
                    RecRef.Open(Database::"Payroll Header");
                    if DirectorPayroll.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(DirectorPayroll);
                end;
            Database::"Perfomance Evaluation":
                begin
                    RecRef.Open(Database::"Perfomance Evaluation");
                    PerformanceEvaluation.Reset();
                    PerformanceEvaluation.SetRange(No, DocumentAttachment."No.");
                    if PerformanceEvaluation.findfirst() then
                        RecRef.Gettable(PerformanceEvaluation);
                end;
            DATABASE::"Job Applications":
                begin
                    RecRef.Open(DATABASE::"Job Applications");
                    if JobApplications.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(JobApplications);
                end;
                Database::"HR Leave Planner Header":
                begin
                    RecRef.Open(DATABASE::"HR Leave Planner Header");
                     LeavePlan.Reset();
                    LeavePlan.SetRange("Application Code", DocumentAttachment."No.");
                    if LeavePlan.findfirst() then
                        RecRef.Gettable(LeavePlan);
                end;
            Database::"Standard Purchase Code":
                begin
                    RecRef.Open(Database::"Standard Purchase Code");
                    StandardPurchaseCode.Reset();
                    StandardPurchaseCode.SetRange(Code, DocumentAttachment."No.");
                    if StandardPurchaseCode.FindFirst() then
                        RecRef.GetTable(StandardPurchaseCode);
                end;
            Database::"IFS Tender Committee":
                begin
                    RecRef.Open(Database::"IFS Tender Committee");
                    IFSTenderCommitte.Reset();
                    IFSTenderCommitte.SetRange("Document No.", DocumentAttachment."No.");
                    if IFSTenderCommitte.FindFirst() then
                        RecRef.GetTable(IFSTenderCommitte);
                end;
            Database::"Standard Purchase Line":
                begin
                    RecRef.Open(Database::"Standard Purchase Line");
                    StandardPurchaseLine.Reset();
                    StandardPurchaseLine.SetRange("Standard Purchase Code", DocumentAttachment."No.");
                    StandardPurchaseLine.SetRange("Line No.", DocumentAttachment."Line No.");
                    if StandardPurchaseLine.FindFirst() then
                        RecRef.GetTable(StandardPurchaseLine);
                end;
                Database::"Payroll HeaderT":
                begin
                    
                    RecRef.Open(Database::"Payroll HeaderT");
                    SalaryVoucherTemp.Reset();
                    SalaryVoucherTemp.SetRange("No.", DocumentAttachment."No.");
                    if SalaryVoucherTemp.FindFirst() then
                        RecRef.GetTable(SalaryVoucherTemp);
                end;
                DATABASE::"Transport Requisition":
                begin
                    RecRef.Open(DATABASE::"Transport Requisition");
                    if TransportRequisition.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(TransportRequisition);
                end;
                DATABASE::"Membership Fees Requisitions":
                begin
                    RecRef.Open(DATABASE::"Membership Fees Requisitions");
                    if MembershipFeesRequisitions.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(MembershipFeesRequisitions);
                end;
                Database::"HR Disciplinary Cases":
                begin
                    RecRef.Open(Database::"HR Disciplinary Cases");
                    DisciplinaryCases.Reset();
                    if DisciplinaryCases.Get(DisciplinaryCases."Case Number") then
                        RecRef.GetTable(DisciplinaryCases);
                end;           
                Database::"Contract Termination":
                begin
                    RecRef.Open(Database::"Contract Termination");
                    if ContractTermination.Get(DocumentAttachment."No.") then
                    RecRef.GetTable(ContractTermination);
                end;

        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Approval Entry", 'OnBeforeMarkAllWhereUserisApproverOrSender', '', false, false)]
    local procedure MarkAllWhereUserIsApproverorSender(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)

    begin
        IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequestsForRecordOnAfterSetApprovalEntryFilters', '', false, false)]
    local procedure OnRejectApprovalRequestsForRecordOnAfterSetApprovalEntryFilters(var ApprovalEntry: Record "Approval Entry"; RecRef: RecordRef)
    var
        PurchHeader: Record "Purchase Header";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        ImprestMemo: Record "Imprest Memo";
        Payment: Record payments;
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentType: Enum "Commitment Type";
        PurchaseLine: Record "Purchase Line";
        ImprestLines: Record "Imprest Lines";
        PvLines: Record "PV Lines";
    begin
        case RecRef.Number of
            Database::"Purchase Header":
                begin
                    RecRef.SetTable(PurchHeader);
                    PurchHeader.Validate(Rejected, true);
                    PurchHeader.Modify;
                    //Decommit
                    PurchHeader.CalcFields("Amount Including VAT");
                    Case PurchHeader."Document Type" of
                        PurchHeader."Document Type"::Order:
                            begin
                                CommitmentEntries.Reset();
                                CommitmentEntries.SetRange("Commitment No", PurchHeader."No.");
                                CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                                if CommitmentEntries.FindSet() then begin
                                    PurchaseLine.Reset();
                                    PurchaseLine.SetRange("Document No.", PurchHeader."No.");
                                    PurchaseLine.SetRange("Document Type", PurchHeader."Document Type");
                                    PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                                    if PurchaseLine.findset() then begin
                                        repeat
                                            CustomFunction.FnCommitAmount(-PurchaseLine."Amount Including VAT", "Account Type"::"G/L Account", PurchaseLine."No.", CustomFunction.GetBudgetYear(PurchHeader."Posting Date"), PurchHeader."No.", CommitmentEntries."Source Type"::LPO, PurchaseLine."Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 2 Code",PurchaseLine."Department Code", PurchHeader."Document Date", CommitmentType::Reversal, CopyStr('Cancellation ' + PurchaseLine.Description, 1, 2048));
                                        until PurchaseLine.next() = 0;
                                    end;
                                end;
                            end;
                        PurchHeader."Document Type"::"Purchase Requisition":
                            begin
                                CommitmentEntries.Reset();
                                CommitmentEntries.SetRange("Commitment No", PurchHeader."No.");
                                CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                                if CommitmentEntries.FindSet() then begin
                                    PurchaseLine.Reset();
                                    PurchaseLine.SetRange("Document No.", PurchHeader."No.");
                                    PurchaseLine.SetRange("Document Type", PurchHeader."Document Type");
                                    PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                                    if PurchaseLine.findset() then begin
                                        repeat
                                            CustomFunction.FnCommitAmount(-PurchaseLine."Amount Including VAT", "Account Type"::"G/L Account", PurchaseLine."No.", CustomFunction.GetBudgetYear(PurchHeader."Posting Date"), PurchHeader."No.", CommitmentEntries."Source Type"::LPO, PurchaseLine."Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 2 Code",PurchaseLine."Department Code", PurchHeader."Document Date", CommitmentType::Reversal, CopyStr('Cancellation ' + PurchaseLine.Description, 1, 2048));
                                        until PurchaseLine.next() = 0;
                                    end;
                                end;
                            end;
                        PurchHeader."Document Type"::"Store Requisition":
                            begin
                                exit;
                            end;
                    End;
                end;
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    CommitmentEntries.Reset();
                    CommitmentEntries.SetRange("Commitment No", ImprestMemo."No.");
                    CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                    if CommitmentEntries.FindSet() then begin
                    CustomFunction.UnCommitImprest(ImprestMemo);
                end;
                end;
            Database::payments:
                begin
                    RecRef.settable(payment);
                    CommitmentEntries.Reset();
                    CommitmentEntries.SetRange("Commitment No", payment."No.");
                    CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                    if not CommitmentEntries.FindSet() then
                        exit;
                    Case Payment."Payment Type" of
                        Payment."Payment Type"::"Petty Cash":
                            begin
                                PvLines.Reset();
                                PvLines.SetRange(No, payment."No.");
                                if PvLines.findset() then begin
                                    repeat
                                        CustomFunction.FnCommitAmount(-PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code", payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Reversal, CopyStr('Rejected ' + PvLines.Description, 1, 2048));
                                    until PvLines.Next() = 0;
                                end;
                            end;
                        Payment."Payment Type"::"Staff Claim":
                            begin
                                PvLines.Reset();
                                PvLines.SetRange(No, payment."No.");
                                if PvLines.findset() then begin
                                    repeat
                                        CustomFunction.FnCommitAmount(-PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code", payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Reversal, CopyStr('Rejected ' + PvLines.Description, 1, 2048));
                                    until PvLines.Next() = 0;
                                end;
                            end;
                    End;
                    /* ImprestLines.Reset();
                      ImprestLines.SetRange(No, Payment."No.");
                      if ImprestLines.findSet() then begin
                          repeat
                              CustomFunction.FnCommitAmount(-ImprestLines.Amount, "Account Type"::"G/L Account", ImprestLines."Account No.", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code",payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestLines.Purpose, 1, 2048));
                          until ImprestLines.next() = 0;
                      end*/

                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendApprovalRequestFromRecordOnAfterSetApprovalEntryFilters', '', false, false)]
    local procedure OnSendApprovalRequestFromRecordOnAfterSetApprovalEntryFilters(var ApprovalEntry: Record "Approval Entry"; RecRef: RecordRef; var IsHandled: Boolean)

    var
        PurchHeader: Record "Purchase Header";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        ImprestMemo: Record "Imprest Memo";
        Payment: Record payments;
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentType: Enum "Commitment Type";
        PurchaseLine: Record "Purchase Line";
        ImprestLines: Record "Imprest Lines";
        PvLines: Record "PV Lines";
    begin
        case RecRef.Number of
            Database::"Purchase Header":
                begin
                    //Decommit

                    Case PurchHeader."Document Type" of
                        PurchHeader."Document Type"::Order:
                            begin
                                //checkBudget

                                //Decommit PRN
                                PurchaseLine.Reset();
                                PurchaseLine.SetRange("Document No.", PurchHeader."No.");
                                PurchaseLine.SetRange("Document Type", PurchHeader."Document Type");
                                PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                                if PurchaseLine.findset() then begin
                                    repeat
                                        if PurchaseLine."Available Amount" < (PurchaseLine."Amount Including VAT" + OtherLineAmountsPline(PurchaseLine)) then
                                            Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', PurchaseLine."Available Amount", PurchaseLine."Budgeted Amount", PurchaseLine."Amount Including VAT");
                                        CustomFunction.FnCommitAmount(-PurchaseLine."Amount Including VAT", "Account Type"::"G/L Account", PurchaseLine."No.", CustomFunction.GetBudgetYear(PurchHeader."Posting Date"), PurchHeader."No.", CommitmentEntries."Source Type"::LPO, PurchaseLine."Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 2 Code",PurchaseLine."Department Code", PurchHeader."Document Date", CommitmentType::Reversal, CopyStr('Send Approval ' + PurchaseLine.Description, 1, 2048));
                                    until PurchaseLine.next() = 0;
                                end;
                                //Commit LPO
                                PurchaseLine.Reset();
                                PurchaseLine.SetRange("Document No.", PurchHeader."No.");
                                PurchaseLine.SetRange("Document Type", PurchHeader."Document Type");
                                PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                                if PurchaseLine.findset() then begin
                                    repeat
                                        if PurchaseLine."Available Amount" < (PurchaseLine."Amount Including VAT" + OtherLineAmountsPline(PurchaseLine)) then
                                            Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', PurchaseLine."Available Amount", PurchaseLine."Budgeted Amount", PurchaseLine."Amount Including VAT");
                                        CustomFunction.FnCommitAmount(PurchaseLine."Amount Including VAT", "Account Type"::"G/L Account", PurchaseLine."No.", CustomFunction.GetBudgetYear(PurchHeader."Posting Date"), PurchHeader."No.", CommitmentEntries."Source Type"::LPO, PurchaseLine."Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 2 Code", PurchaseLine."Department Code", PurchHeader."Document Date", CommitmentType::Committed, CopyStr('Send Approval ' + PurchaseLine.Description, 1, 2048));
                                    until PurchaseLine.next() = 0;
                                end;
                            end;

                        PurchHeader."Document Type"::"Purchase Requisition":
                            begin
                                //Commit PRN
                                PurchaseLine.Reset();
                                PurchaseLine.SetRange("Document No.", PurchHeader."No.");
                                PurchaseLine.SetRange("Document Type", PurchHeader."Document Type");
                                PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                                if PurchaseLine.findset() then begin
                                    repeat
                                                              if PurchaseLine."Available Amount" < (PurchaseLine."Amount Including VAT" + OtherLineAmountsPline(PurchaseLine)) then
                                        Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', PurchaseLine."Available Amount", PurchaseLine."Budgeted Amount", PurchaseLine."Amount Including VAT");
                                        CustomFunction.FnCommitAmount(PurchaseLine."Amount Including VAT", "Account Type"::"G/L Account", PurchaseLine."No.", CustomFunction.GetBudgetYear(PurchHeader."Posting Date"), PurchHeader."No.", CommitmentEntries."Source Type"::LPO, PurchaseLine."Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 2 Code", PurchaseLine."Department Code", PurchHeader."Document Date", CommitmentType::Committed, CopyStr('Send Approval ' + PurchaseLine.Description, 1, 2048));
                                    until PurchaseLine.next() = 0;
                                end;
                            end;
                        PurchHeader."Document Type"::"Store Requisition":
                            begin
                                exit;
                            end;
                    End;
                end;
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    CustomFunction.CommitImprest(ImprestMemo);
                end;
            Database::payments:
                begin
                    RecRef.settable(payment);
                    payment.CalcFields("Imprest Amount");
                    Case payment."Payment Type" of
                        payment."Payment Type"::Imprest:
                            begin
                                Case Payment."Payment Type" of
                                    Payment."Payment Type"::"Petty Cash":
                                        begin
                                            PvLines.Reset();
                                            PvLines.SetRange(No, payment."No.");
                                            if PvLines.findset() then begin
                                                repeat
                                                    CustomFunction.FnCommitAmount(PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code", payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Committed, CopyStr('Approval Request ' + PvLines.Description, 1, 2048));
                                                until PvLines.Next() = 0;
                                            end;
                                        end;
                                    Payment."Payment Type"::"Staff Claim":
                                        begin
                                            PvLines.Reset();
                                            PvLines.SetRange(No, payment."No.");
                                            if PvLines.findset() then begin
                                                repeat
                                                    if PvLines."Available Amount" < (PvLines."Net Amount" + OtherLineAmountsPVline(PvLines)) then
                                                        Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', PvLines."Available Amount", PvLines."Budgeted Amount", PvLines."Net Amount");
                                                    CustomFunction.FnCommitAmount(PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code", payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Committed, CopyStr('Approval Request ' + PvLines.Description, 1, 2048));
                                                until PvLines.Next() = 0;
                                            end;
                                        end;
                                End;
                                /*  ImprestLines.Reset();
                                  ImprestLines.SetRange(No, Payment."No.");
                                  if ImprestLines.findSet() then begin
                                      repeat
                                          if ImprestLines."Available Amount" < (ImprestLines.Amount + OtherLineAmountsPayments(ImprestLines)) then
                                              Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', ImprestLines."Available Amount", ImprestLines."Budgeted Amount", ImprestLines.Amount);
                                          //commit requisition
                                          CustomFunction.FnCommitAmount(-ImprestLines.Amount, "Account Type"::"G/L Account", ImprestLines."Account No.", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code",payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Committed, CopyStr('Cancellation ' + ImprestLines.Purpose, 1, 2048));
                                          CustomFunction.FnCommitAmount(ImprestLines.Amount, "Account Type"::"G/L Account", ImprestLines."Account No.", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code",payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Committed, CopyStr('Cancellation ' + ImprestLines.Purpose, 1, 2048));
                                      //uncommit imprest memo

                                      until ImprestLines.next() = 0;
                                  end;*/
                            end;
                        payment."Payment Type"::"Imprest Surrender":
                            begin
                                ImprestLines.Reset();
                                ImprestLines.SetRange(No, Payment."No.");
                                if ImprestLines.findSet() then begin
                                    repeat
                                    // if ImprestLines."Available Amount" < (ImprestLines.Amount + OtherLineAmountsPayments(ImprestLines)) then
                                    //     Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', ImprestLines."Available Amount", ImprestLines."Budgeted Amount", ImprestLines.Amount);
                                    // CustomFunction.FnCommitAmount(-ImprestLines.Amount, "Account Type"::"G/L Account", ImprestLines."Account No.", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code", Payment.Date, CommitmentType::Committed, CopyStr('Cancellation ' + ImprestLines.Purpose, 1, 2048));
                                    until ImprestLines.next() = 0;
                                end
                            end;
                    End;

                end;
        end;
    end;

    Procedure OtherLineAmountsPline(PurchaseLine: Record "Purchase Line"): Decimal
    var
        PurchaseLine2: Record "Purchase Line";
        LineAmount: Decimal;
    begin
        PurchaseLine2.Reset();
        PurchaseLine2.SetRange("Document No.", PurchaseLine."Document No.");
        PurchaseLine2.SetRange("Document Type", PurchaseLine."Document Type");
        PurchaseLine2.SetRange(Type, PurchaseLine2.Type::"G/L Account");
        PurchaseLine2.SetRange("No.", PurchaseLine."No.");
        PurchaseLine2.Setfilter("Line No.", '<>%1', PurchaseLine."Line No.");
        if PurchaseLine2.findset() then begin
            repeat
                LineAmount := LineAmount + PurchaseLine2."Amount Including VAT";
            until PurchaseLine2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Procedure OtherLineAmountsPVline(PVLine: Record "PV Lines"): Decimal
    var
        PvLine2: Record "PV Lines";
        LineAmount: Decimal;
    begin
        PVLine2.Reset();
        PVLine2.SetRange(No, PVLine.No);
        //PVLine2.SetRange("Document Type", PVLine."Document Type");
        PVLine2.SetRange("Account Type", PVLine2."Account Type"::"G/L Account");
        PVLine2.SetRange("Account No", PVLine."Account No");
        PVLine2.Setfilter("Line No", '<>%1', PVLine."Line No");
        if PVLine2.findset() then begin
            repeat
                LineAmount := LineAmount + PVLine2."Net Amount";
            until PVLine2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Local Procedure OtherLineAmountsPayments(ImprestLines: Record "Imprest Lines"): Decimal
    var
        LineAmount: Decimal;
        ImprestLines2: Record "Imprest Lines";
    begin
        ImprestLines2.Reset();
        ImprestLines2.SetRange(No, ImprestLines.No);
        // ImprestLines2.SetRange("Document Type", ImprestLines."Document Type");
        // ImprestLines2.SetRange(Type, ImprestLines2.Type::"G/L Account");
        ImprestLines2.SetRange("Account No.", ImprestLines."Account No.");
        ImprestLines2.Setfilter("Line No", '<>%1', ImprestLines."Line No");
        if ImprestLines2.findset() then begin
            repeat
                LineAmount := LineAmount + ImprestLines2.Amount;
            until ImprestLines2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCancelApprovalRequestsForRecordOnAfterSetApprovalEntryFilters', '', false, false)]
    local procedure OnCancelApprovalRequestsForRecordOnAfterSetApprovalEntryFilters(var ApprovalEntry: Record "Approval Entry"; RecRef: RecordRef)
    var
        PurchHeader: Record "Purchase Header";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        ImprestMemo: Record "Imprest Memo";
        Payment: Record payments;
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentType: Enum "Commitment Type";
        PurchaseLine: Record "Purchase Line";
        ImprestLines: Record "Imprest Lines";
        PvLines: Record "PV Lines";
    begin
        case RecRef.Number of
            Database::"Purchase Header":
                begin
                    //Decommit
                    PurchHeader.CalcFields("Amount Including VAT");
                    Case PurchHeader."Document Type" of
                        PurchHeader."Document Type"::Order:
                            begin
                                CommitmentEntries.Reset();
                                CommitmentEntries.SetRange("Commitment No", PurchHeader."No.");
                                CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                                if CommitmentEntries.FindSet() then begin
                                    PurchaseLine.Reset();
                                    PurchaseLine.SetRange("Document No.", PurchHeader."No.");
                                    PurchaseLine.SetRange("Document Type", PurchHeader."Document Type");
                                    PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                                    if PurchaseLine.findset() then begin
                                        repeat
                                            CustomFunction.FnCommitAmount(-PurchaseLine."Amount Including VAT", "Account Type"::"G/L Account", PurchaseLine."No.", CustomFunction.GetBudgetYear(PurchHeader."Posting Date"), PurchHeader."No.", CommitmentEntries."Source Type"::LPO, PurchaseLine."Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 2 Code",PurchaseLine."Department Code",PurchHeader."Document Date", CommitmentType::Reversal, CopyStr('Cancellation ' + PurchaseLine.Description, 1, 2048));
                                        until PurchaseLine.next() = 0;
                                    end;
                                end;
                            end;
                        PurchHeader."Document Type"::"Purchase Requisition":
                            begin
                                CommitmentEntries.Reset();
                                CommitmentEntries.SetRange("Commitment No", PurchHeader."No.");
                                CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                                if CommitmentEntries.FindSet() then begin
                                    PurchaseLine.Reset();
                                    PurchaseLine.SetRange("Document No.", PurchHeader."No.");
                                    PurchaseLine.SetRange("Document Type", PurchHeader."Document Type");
                                    PurchaseLine.SetRange(Type, PurchaseLine.Type::"G/L Account");
                                    if PurchaseLine.findset() then begin
                                        repeat
                                            CustomFunction.FnCommitAmount(-PurchaseLine."Amount Including VAT", "Account Type"::"G/L Account", PurchaseLine."No.", CustomFunction.GetBudgetYear(PurchHeader."Posting Date"), PurchHeader."No.", CommitmentEntries."Source Type"::LPO, PurchaseLine."Shortcut Dimension 1 Code", PurchaseLine."Shortcut Dimension 2 Code",PurchaseLine."Department Code", PurchHeader."Document Date", CommitmentType::Reversal, CopyStr('Cancellation ' + PurchaseLine.Description, 1, 2048));
                                        until PurchaseLine.next() = 0;
                                    end;
                                end;
                            end;
                        PurchHeader."Document Type"::"Store Requisition":
                            begin
                                exit;
                            end;
                    End;
                end;
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    CommitmentEntries.Reset();
                    CommitmentEntries.SetRange("Commitment No", ImprestMemo."No.");
                    CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                    if CommitmentEntries.FindSet() then begin
                    CustomFunction.UnCommitImprest(ImprestMemo);
                end;
                end;
            Database::payments:
                begin
                    RecRef.settable(payment);
                    CommitmentEntries.Reset();
                    CommitmentEntries.SetRange("Commitment No", payment."No.");
                    CommitmentEntries.SetRange("Commitment Type", CommitmentEntries."Commitment Type"::Committed);
                    if not CommitmentEntries.FindSet() then
                        exit;
                    Case Payment."Payment Type" of
                        Payment."Payment Type"::"Petty Cash":
                            begin
                                PvLines.Reset();
                                PvLines.SetRange(No, payment."No.");
                                if PvLines.findset() then begin
                                    repeat
                                        CustomFunction.FnCommitAmount(-PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code", payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + PvLines.Description, 1, 2048));
                                    until PvLines.Next() = 0;
                                end;
                            end;
                        Payment."Payment Type"::"Staff Claim":
                            begin
                                PvLines.Reset();
                                PvLines.SetRange(No, payment."No.");
                                if PvLines.findset() then begin
                                    repeat
                                        CustomFunction.FnCommitAmount(-PvLines."Net Amount", "Account Type"::"G/L Account", PvLines."Account No", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code", payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + PvLines.Description, 1, 2048));
                                    until PvLines.Next() = 0;
                                end;
                            end;
                    End;
                    /*ImprestLines.Reset();
                    ImprestLines.SetRange(No, Payment."No.");
                    if ImprestLines.findSet() then begin
                        repeat
                            CustomFunction.FnCommitAmount(-ImprestLines.Amount, "Account Type"::"G/L Account", ImprestLines."Account No.", CustomFunction.GetBudgetYear(payment.Date), payment."No.", CommitmentEntries."Source Type"::Payment, Payment."Shortcut Dimension 1 Code", Payment."Shortcut Dimension 2 Code",payment."Shortcut Dimension 3 Code", Payment.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestLines.Purpose, 1, 2048));
                        until ImprestLines.next() = 0;
                    end;*/

                end;
        end;
    end;



    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAfterGetDescription', '', false, false)]
    local procedure OnAfterGetDescription(WorkflowStepArgument: Record "Workflow Step Argument"; WorkflowResponse: Record "Workflow Response"; var Result: Text[250])
    var
        Workflowresponsehandling: Codeunit "Workflow Response Handling";
        ApproverLimitDesc: Text;
        ApproverTypeTok: Label '<Approver Type>';
    begin
        case WorkflowResponse."Function Name" of
            Workflowresponsehandling.CreateApprovalRequestsCode:
                begin
                    if WorkflowStepArgument."Approver Type" = WorkflowStepArgument."Approver Type"::"Use Table" then
                        Result := (CopyStr(StrSubstNo(WorkflowResponse.Description,
                              GetTokenValue(ApproverTypeTok, Format(WorkflowStepArgument."Approver Type")),
                              ''), 1, 250));
                end;
        end;
    end;

    local procedure GetTokenValue(TokenValue: Text; FieldValue: Text): Text
    begin
        if FieldValue <> '' then
            exit(FieldValue);

        exit(TokenValue);
    end;
    //Do not run the approval comments page if request is from portal.

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeRunApprovalCommentsPage', '', false, false)]
    local procedure OnBeforeRunApprovalCommentsPage(var ApprovalCommentLine: Record "Approval Comment Line"; WorkflowStepInstanceID: Guid; var IsHandle: Boolean)
    begin
        if not GuiAllowed then
            IsHandle := true;
    end;


}





