#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70055 "Professional Opinion Report"
{
    DefaultLayout = RDLC;
   // RDLCLayout = './Layouts/Professional Opinion Report.rdlc';
    RDLCLayout = './Layouts/Professional Opinion Report.rdl';
    dataset
    {
        dataitem("Bid Tabulation Header";"Bid Tabulation Header")
        {
            column(OpinionTo;OpinionTo)
            {

            }
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(OpinionOwnerPosition; OpinionOwnerPosition)
            {

            }
            column(OpinionOwner; OpinionOwner)
            {

            }
            column(OpinionOwnerSignature; UserSetup.Picture)
            {

            }
            column(ReportForNavId_1; 1)
            {
            }
            column(NONRESTECH;Variance)
            {
            }
            column(NoofResponsivePreliminary_BidTabulationHeader;"Bid Tabulation Header"."No of Responsive(Preliminary)")
            {
            }
            column(NoofnonResponsivePrelim_BidTabulationHeader;"Bid Tabulation Header"."No of non- Responsive(Prelim)")
            {
            }
            column(Noofsubmittedbids_BidTabulationHeader;"Bid Tabulation Header"."No of submitted bids")
            {
            }
            column(NoofOpenedBidsTech_BidTabulationHeader;"Bid Tabulation Header"."No of Opened Bids(Tech)")
            {
            }
            column(NoofOpenedBidsFinance_BidTabulationHeader;"Bid Tabulation Header"."No of Opened Bids(Finance)")
            {
            }
            column(NoofResponsiveTech_BidTabulationHeader;"Bid Tabulation Header"."No of Responsive(Tech)")
            {
            }
            column(NoofnonResponsiveTech_BidTabulationHeader;"Bid Tabulation Header"."No of non- Responsive(Tech)")
            {
            }
            column(NoofResponsiveFinance_BidTabulationHeader;"Bid Tabulation Header"."No of Responsive(Finance)")
            {
            }
            column(NoofnonResponsiveFinance_BidTabulationHeader;"Bid Tabulation Header"."No of non- Responsive(Finance)")
            {
            }
            column(logo;corec.Picture)
            {
            }
            column(CompanyName;corec.Name)
            {
            }
            column(AppointingAuthority;AppointAuthority)
            {
            }
            column(EvalStartDate;IFSEvalStartDate)
            {
            }
            column(EvalEndDate;IFSEvalEndDate)
            {
            }
            column(AppDate;AppointmEffectDate)
            {
            }
            column(Code_BidTabulationHeader;"Bid Tabulation Header".Code)
            {
            }
            column(DocumentType_BidTabulationHeader;"Bid Tabulation Header"."Document Type")
            {
            }
            column(IFSCode_BidTabulationHeader;"Bid Tabulation Header"."IFS Code")
            {
            }
            column(DocumentDate_BidTabulationHeader;"Bid Tabulation Header"."Document Date")
            {
            }
            column(FinalEvaluationReportID_BidTabulationHeader;"Bid Tabulation Header"."Final Evaluation Report ID")
            {
            }
            column(Description_BidTabulationHeader;"Bid Tabulation Header".Description)
            {
            }
            column(TenderName_BidTabulationHeader;"Bid Tabulation Header"."Tender Name")
            {
            }
            column(ProcurementOfficerLicenseNo_BidTabulationHeader;"Bid Tabulation Header"."Procurement Officer License No")
            {
            }
            column(RaisedBy_BidTabulationHeader;"Bid Tabulation Header"."Raised By")
            {
            }
            column(Name_BidTabulationHeader;"Bid Tabulation Header".Name)
            {
            }
            column(TenderCommitteeRole_BidTabulationHeader;"Bid Tabulation Header"."Tender Committee Role")
            {
            }
            column(DesignationTitle_BidTabulationHeader;"Bid Tabulation Header"."Designation/Title")
            {
            }
            column(AnnualProcurementPlanID_BidTabulationHeader;"Bid Tabulation Header"."Annual Procurement Plan ID")
            {
            }
            column(ProcurementPlanDate_BidTabulationHeader;"Bid Tabulation Header"."Procurement Plan Date")
            {
            }
            column(FinancialYearCode_BidTabulationHeader;"Bid Tabulation Header"."Financial Year Code")
            {
            }
            column(ProcurementPlanLineNo_BidTabulationHeader;"Bid Tabulation Header"."Procurement Plan Line No.")
            {
            }
            column(ProcurementPlanEntryNo_BidTabulationHeader;"Bid Tabulation Header"."Procurement Plan Entry No")
            {
            }
            column(AvailableProcurementBudget_BidTabulationHeader;"Bid Tabulation Header"."Available Procurement Budget")
            {
            }
            column(BudgetNarration_BidTabulationHeader;"Bid Tabulation Header"."Budget Narration")
            {
            }
            column(BidOpeningDate_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Date")
            {
            }
            column(EvaluationCompletionDate_BidTabulationHeader;"Bid Tabulation Header"."Evaluation Completion Date")
            {
            }
            column(AppointedBidOpeningComm_BidTabulationHeader;"Bid Tabulation Header"."Appointed Bid Opening Comm")
            {
            }
            column(AppointedBidEvaluationCom_BidTabulationHeader;"Bid Tabulation Header"."Appointed Bid Evaluation Com")
            {
            }
            column(PrimaryRegion_BidTabulationHeader;"Bid Tabulation Header"."Primary Region")
            {
            }
            column(ApprovalStatus_BidTabulationHeader;"Bid Tabulation Header"."Approval Status")
            {
            }
            column(ProfessionalOpinionID_BidTabulationHeader;"Bid Tabulation Header"."Professional Opinion ID")
            {
            }
            column(AwardedBidNo_BidTabulationHeader;"Bid Tabulation Header"."Awarded Bid No")
            {
            }
            column(AwardedBidderNo_BidTabulationHeader;"Bid Tabulation Header"."Awarded Bidder No.")
            {
            }
            column(AwardedBidderName_BidTabulationHeader;"Bid Tabulation Header"."Awarded Bidder Name")
            {
            }
            column(AwardTenderSumIncTaxes_BidTabulationHeader;"Bid Tabulation Header"."Award Tender Sum Inc Taxes")
            {
            }
            column(AwardAcceptanceDeadline_BidTabulationHeader;"Bid Tabulation Header"."Award Acceptance Deadline")
            {
            }
            column(AwardAcceptanceResponse_BidTabulationHeader;"Bid Tabulation Header"."Award Acceptance Response")
            {
            }
            column(MinContractHolding_BidTabulationHeader;"Bid Tabulation Header"."Min. Contract Holding")
            {
            }
            column(EarliestContractIssuanceDt_BidTabulationHeader;"Bid Tabulation Header"."Earliest Contract Issuance Dt")
            {
            }
            column(BidderNoAResponseType_BidTabulationHeader;"Bid Tabulation Header"."Bidder NoA Response Type")
            {
            }
            column(BidderNoAResponseDate_BidTabulationHeader;"Bid Tabulation Header"."Bidder NoA Response Date")
            {
            }
            column(NoofPostAwardDisputes_BidTabulationHeader;"Bid Tabulation Header"."No. of Post-Award Disputes")
            {
            }
            column(DocumentStatus_BidTabulationHeader;"Bid Tabulation Header"."Document Status")
            {
            }
            column(NoSeries_BidTabulationHeader;"Bid Tabulation Header"."No. Series")
            {
            }
            column(CreatedBy_BidTabulationHeader;"Bid Tabulation Header"."Created By")
            {
            }
            column(CreatedDate_BidTabulationHeader;"Bid Tabulation Header"."Created Date")
            {
            }
            column(CreatedTime_BidTabulationHeader;"Bid Tabulation Header"."Created Time")
            {
            }
            column(Posted_BidTabulationHeader;"Bid Tabulation Header".Posted)
            {
            }
            column(PostedBy_BidTabulationHeader;"Bid Tabulation Header"."Posted By")
            {
            }
            column(PostedDate_BidTabulationHeader;"Bid Tabulation Header"."Posted Date")
            {
            }
            column(FinancialEvaluationID_BidTabulationHeader;"Bid Tabulation Header"."Financial Evaluation ID")
            {
            }
            column(GeneralProcurementRemarks_BidTabulationHeader;"Bid Tabulation Header"."General Procurement Remarks")
            {
            }
            column(BidOpeningRegisterTech_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Register(Tech)")
            {
            }
            column(ProcurementMethod_BidTabulationHeader;"Bid Tabulation Header"."Procurement Method")
            {
            }
            column(BidOpeningRegisterFinance_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Register(Finance)")
            {
            }
            dataitem(Open;"Standard Vendor Purchase Code")
            {
                DataItemLink = Code = field("IFS Code");
                column(ReportForNavId_216; 216)
                {
                }
                column(VendorNo_OPEN;Open."Vendor No.")
                {
                }
                column(Code_OPEN;Open.Code)
                {
                }
                column(Description_OPEN;Open.Description)
                {
                }
                column(IFSCode_OPEN;Open."IFS Code")
                {
                }
                column(BidNo_OPEN;Open."Bid No.")
                {
                }
                column(VendorName_OPEN;Open."Vendor Name")
                {
                }
                column(PrimaryEmail_OPEN;Open."Primary Email")
                {
                }
                column(PositiveIntentToBid_OPEN;Open."Positive Intent To Bid")
                {
                }
                column(InvitationEmailSent_OPEN;Open."Invitation Email Sent")
                {
                }
                column(DateTimeNotified_OPEN;Open."Date/Time Notified")
                {
                }
                column(NoofPostedAddendumNotices_OPEN;Open."No. of Posted Addendum Notices")
                {
                }
                column(PostedAddendumNoticeNo_OPEN;Open."Posted Addendum Notice No.")
                {
                }
                column(BidCurrencyCode_OPEN;Open."Bid Currency Code")
                {
                }
                column(SealedBidsTechnical_OPEN;Open."Sealed Bids (Technical)")
                {
                }
                column(SealedBidsFinancial_OPEN;Open."Sealed Bids (Financial)")
                {
                }
                column(PrebidRegisterNo_OPEN;Open."Prebid Register No.")
                {
                }
                column(PrebidMeetingDate_OPEN;Open."Prebid Meeting Date")
                {
                }
                column(BidOpeningRegisterNo_OPEN;Open."Bid Opening Register No.")
                {
                }
                column(BidOpeningDateTechnical_OPEN;Open."Bid Opening Date (Technical)")
                {
                }
                column(LateBidOpeningStage_OPEN;Open."Late Bid (Opening Stage)")
                {
                }
                column(WithdrawnBidOpeningStage_OPEN;Open."Withdrawn Bid (Opening Stage)")
                {
                }
                column(BidWithdrawalNoticeNo_OPEN;Open."Bid Withdrawal Notice No")
                {
                }
                column(ModifiedBidOpeningStage_OPEN;Open."Modified Bid (Opening Stage)")
                {
                }
                column(BidOpeningResult_OPEN;Open."Bid Opening Result")
                {
                }
                column(BidOpeningCommitteeRemarks_OPEN;Open."Bid Opening Committee Remarks")
                {
                }
                column(PreliminaryEvaluationReg_OPEN;Open."Preliminary Evaluation Reg")
                {
                }
                column(PreliminaryEvaluationDate_OPEN;Open."Preliminary Evaluation Date")
                {
                }
                column(PreliminaryEvaluationOutcome_OPEN;Open."Preliminary Evaluation Outcome")
                {
                }
                column(PreminaryEvaluationCommittee_OPEN;Open."Preminary Evaluation Committee")
                {
                }
                column(TechnicalEvaluationReg_OPEN;Open."Technical Evaluation Reg")
                {
                }
                column(TechnicalEvaluationDate_OPEN;Open."Technical Evaluation Date")
                {
                }
                column(MinWeightedTechPassScore_OPEN;Open."Min Weighted Tech Pass Score %")
                {
                }
                column(WeightedTechnicalScore_OPEN;Open."Weighted Technical  Score %")
                {
                }
                column(TechnicalEvaluationOutcome_OPEN;Open."Technical Evaluation  Outcome")
                {
                }
                column(EvaluationCommitteeRem_OPEN;Open."Evaluation Committee Rem")
                {
                }
                column(TechnicalEvaluationCommittee_OPEN;Open."Technical Evaluation Committee")
                {
                }
                column(BidOpeningFinanceRegister_OPEN;Open."Bid Opening Finance Register")
                {
                }
                column(BidOpeningDateFinancial_OPEN;Open."Bid Opening Date (Financial)")
                {
                }
                column(FinancialEvalRegisterNo_OPEN;Open."Financial Eval Register No")
                {
                }
                column(FinancialEvaluationDate_OPEN;Open."Financial Evaluation Date")
                {
                }
                column(ReadoutBidPriceA_OPEN;Open."Read-out Bid Price (A)")
                {
                }
                column(ArithmeticCorrectionsB_OPEN;Open."Arithmetic Corrections (B)")
                {
                }
                column(CorrectedBidPriceCAB_OPEN;Open."Corrected Bid Price (C=A+B)")
                {
                }
                column(UnconditionalDiscountD_OPEN;Open."Unconditional Discount % (D)")
                {
                }
                column(UnconditionalDiscAmountE_OPEN;Open."Unconditional Disc Amount (E)")
                {
                }
                column(CorrectedDiscBidPrice_OPEN;Open."Corrected & Disc Bid Price")
                {
                }
                column(AnyAdditionalAdjustmentsG_OPEN;Open."Any Additional Adjustments (G)")
                {
                }
                column(AnyPricedDeviationsH_OPEN;Open."Any Priced Deviations (H))")
                {
                }
                column(FinalEvaluatedBidPrice_OPEN;Open."Final Evaluated Bid Price")
                {
                }
                column(WeightedFinancialScore_OPEN;Open."Weighted Financial Score %")
                {
                }
                column(FinancialEvaluationRanking_OPEN;Open."Financial Evaluation Ranking")
                {
                }
                column(FinancialEvaluationCommRem_OPEN;Open."Financial Evaluation Comm Rem")
                {
                }
                column(AggregateWeightedScore_OPEN;Open."Aggregate Weighted Score %")
                {
                }
                column(EvaluationCommitteeRecomm_OPEN;Open."Evaluation Committee Recomm")
                {
                }
                column(FinalEvaluationReport_OPEN;Open."Final Evaluation Report")
                {
                }
                column(FinalEvaluationDate_OPEN;Open."Final Evaluation Date")
                {
                }
                column(ProfessionalOpionID_OPEN;Open."Professional Opion ID")
                {
                }
                column(ProfessionalOpionDate_OPEN;Open."Professional Opion Date")
                {
                }
                column(DueDilgenceDate_OPEN;Open."Due Dilgence Date")
                {
                }
                column(DueDiligenceRating_OPEN;Open."Due Diligence Rating")
                {
                }
                column(DueDiligenceReportID_OPEN;Open."Due Diligence Report ID")
                {
                }
                column(DueDiligenceVoucher_OPEN;Open."Due Diligence Voucher")
                {
                }
                column(SupplierType_OPEN;Open."Supplier Type")
                {
                }
                column(ProcurementCategory_OPEN;Open."Procurement Category")
                {
                }
                column(PassedTechEvaluation_OPEN;Open."Passed Tech Evaluation")
                {
                }
                column(PassedPreliminaryEvaluation_OPEN;Open."Passed Preliminary  Evaluation")
                {
                }
                column(ResponsiveBid_OPEN;Open."Responsive Bid")
                {
                }
                column(TechEvaluationRanking_OPEN;Open."Tech Evaluation Ranking")
                {
                }
                column(ValidBidSecurityProvided_OPEN;Open."Valid Bid Security Provided")
                {
                }
                column(BidSecurityIssuer_OPEN;Open."Bid Security Issuer")
                {
                }
                column(BidSecurityAmountLCY_OPEN;Open."Bid Security Amount (LCY)")
                {
                }
                column(BidSecurityAmountPass_OPEN;Open."Bid Security Amount Pass")
                {
                }
                column(CompleteBidDocSubmitted_OPEN;Open."Complete Bid Doc Submitted")
                {
                }
                column(LateBidSubmissionTime_OPEN;Open."Late Bid Submission Time")
                {
                }
                column(BidOpeningRanking_OPEN;Open."Bid Opening Ranking")
                {
                }
            }
            dataitem("Bid Tabulation Line";"Bid Tabulation Line")
            {
                DataItemLink = "Tabulation ID"=field(Code);
                column(ReportForNavId_57; 57)
                {
                }
                column(ProcurementHeadComments_BidTabulationLine;"Bid Tabulation Line"."Procurement Head Comments")
                {
                }
                column(TabulationID_BidTabulationLine;"Bid Tabulation Line"."Tabulation ID")
                {
                }
                column(TabulationType_BidTabulationLine;"Bid Tabulation Line"."Tabulation Type")
                {
                }
                column(DocumentType_BidTabulationLine;"Bid Tabulation Line"."Document Type")
                {
                }
                column(No_BidTabulationLine;"Bid Tabulation Line"."No.")
                {
                }
                column(BidderNo_BidTabulationLine;"Bid Tabulation Line"."Bidder No")
                {
                }
                column(BidderName_BidTabulationLine;"Bid Tabulation Line"."Bidder Name")
                {
                }
                column(InvitationForSupplyNo_BidTabulationLine;"Bid Tabulation Line"."Invitation For Supply No")
                {
                }
                column(BidCurrencyCode_BidTabulationLine;"Bid Tabulation Line"."Bid Currency Code")
                {
                }
                column(PrebidRegisterNo_BidTabulationLine;"Bid Tabulation Line"."Pre-bid Register No.")
                {
                }
                column(AttendedPrebidConference_BidTabulationLine;Format("Bid Tabulation Line"."Attended Pre-bid Conference"))
                {
                }
                column(PrebidConferenceDate_BidTabulationLine;"Bid Tabulation Line"."Prebid Conference Date")
                {
                }
                column(BidOpeningRegisterNo_BidTabulationLine;"Bid Tabulation Line"."Bid Opening Register No.")
                {
                }
                column(BidOpeningDate_BidTabulationLine;"Bid Tabulation Line"."Bid Opening Date")
                {
                }
                column(LateBidOpeningStage_BidTabulationLine;Format("Bid Tabulation Line"."Late Bid (Opening Stage)"))
                {
                }
                column(WithdrawnBidOpeningStage_BidTabulationLine;"Bid Tabulation Line"."Withdrawn Bid (Opening Stage)")
                {
                }
                column(WithdrawalNoticeNo_BidTabulationLine;"Bid Tabulation Line"."Withdrawal Notice No")
                {
                }
                column(SuccesfulBidOpeningStage_BidTabulationLine;Format("Bid Tabulation Line"."Succesful Bid (Opening Stage)"))
                {
                }
                column(PreliminaryEvaluationDate_BidTabulationLine;"Bid Tabulation Line"."Preliminary Evaluation Date")
                {
                }
                column(ResponsiveBid_BidTabulationLine;Format("Bid Tabulation Line"."Responsive Bid"))
                {
                }
                column(TechnicalEvaluationDate_BidTabulationLine;"Bid Tabulation Line"."Technical Evaluation Date")
                {
                }
                column(WeightedTechScore_BidTabulationLine;"Bid Tabulation Line"."Weighted Tech Score %")
                {
                }
                column(PassedTechEvaluation_BidTabulationLine;Format("Bid Tabulation Line"."Passed Tech Evaluation"))
                {
                }
                column(TechEvaluationRanking_BidTabulationLine;"Bid Tabulation Line"."Tech Evaluation Ranking")
                {
                }
                column(FinalEvaluatedBidPrice_BidTabulationLine;"Bid Tabulation Line"."Final Evaluated Bid Price")
                {
                }
                column(FinancialEvaluationDate_BidTabulationLine;"Bid Tabulation Line"."Financial Evaluation Date")
                {
                }
                column(WeightedFinancialScore_BidTabulationLine;"Bid Tabulation Line"."Weighted Financial Score %")
                {
                }
                column(FinancialEvaluationRanking_BidTabulationLine;"Bid Tabulation Line"."Financial Evaluation Ranking")
                {
                }
                column(AggregateWeightedScore_BidTabulationLine;"Bid Tabulation Line"."Aggregate Weighted Score %")
                {
                }
                column(AggregateRanking_BidTabulationLine;"Bid Tabulation Line"."Aggregate Ranking")
                {
                }
                column(DueDilgenceDate_BidTabulationLine;"Bid Tabulation Line"."Due Dilgence Date")
                {
                }
                column(DueDiligenceRating_BidTabulationLine;"Bid Tabulation Line"."Due Diligence Rating")
                {
                }
                column(ProfessionalOpionNo_BidTabulationLine;"Bid Tabulation Line"."Professional Opion No.")
                {
                }
                column(ProfessionalOpionDate_BidTabulationLine;"Bid Tabulation Line"."Professional Opion Date")
                {
                }
                column(ProfessionalOpinionOutcome_BidTabulationLine;"Bid Tabulation Line"."Professional Opinion Outcome")
                {
                }
                column(CorrectedBidPriceCAB_BidTabulationLine;"Bid Tabulation Line"."Corrected Bid Price (C=A+B)")
                {
                }
                column(UnconditionalDiscountD_BidTabulationLine;"Bid Tabulation Line"."Unconditional Discount % (D)")
                {
                }
                column(UnconditionalDiscAmountE_BidTabulationLine;"Bid Tabulation Line"."Unconditional Disc Amount (E)")
                {
                }
                column(CorrectedDiscBidPrice_BidTabulationLine;"Bid Tabulation Line"."Corrected & Disc Bid Price")
                {
                }
                column(AnyAdditionalAdjustmentsG_BidTabulationLine;"Bid Tabulation Line"."Any Additional Adjustments (G)")
                {
                }
                column(AnyPricedDeviationsH_BidTabulationLine;"Bid Tabulation Line"."Any Priced Deviations (H))")
                {
                }
                column(FinancialEvaluationCommRem_BidTabulationLine;"Bid Tabulation Line"."Financial Evaluation Comm Rem")
                {
                }
                column(EvaluationCommitteeRecomm_BidTabulationLine;"Bid Tabulation Line"."Evaluation Committee Recomm")
                {
                }
                column(ReadoutBidPriceA_BidTabulationLine;"Bid Tabulation Line"."Read-out Bid Price (A)")
                {
                }
                column(ArithmeticCorrectionsB_BidTabulationLine;"Bid Tabulation Line"."Arithmetic Corrections (B)")
                {
                }
                column(BidOpeningResult_BidTabulationLine;"Bid Tabulation Line"."Bid Opening Result")
                {
                }
                column(BidOpeningCommitteeRemarks_BidTabulationLine;"Bid Tabulation Line"."Bid Opening Committee Remarks")
                {
                }
                column(PreliminaryEvaluationReg_BidTabulationLine;"Bid Tabulation Line"."Preliminary Evaluation Reg")
                {
                }
                column(PreliminaryEvaluationOutcome_BidTabulationLine;"Bid Tabulation Line"."Preliminary Evaluation Outcome")
                {
                }
                column(PreminaryEvaluationCommittee_BidTabulationLine;"Bid Tabulation Line"."Preminary Evaluation Committee")
                {
                }
                column(BidOpeningFinanceRegister_BidTabulationLine;"Bid Tabulation Line"."Bid Opening Finance Register")
                {
                }
                column(BidOpeningDateFinancial_BidTabulationLine;"Bid Tabulation Line"."Bid Opening Date (Financial)")
                {
                }
                column(FinancialEvalRegisterNo_BidTabulationLine;"Bid Tabulation Line"."Financial Eval Register No")
                {
                }
                column(VendorPIN_BidTabulationLine;"Bid Tabulation Line"."Vendor PIN")
                {
                }
            }
            dataitem(OPENCOMM;"IFS Tender Committee Member")
            {
                DataItemLink = "Document No."=field("Appointed Bid Opening Comm");
                column(ReportForNavId_129; 129)
                {
                }
                column(DocumentNo_OPENCOMM;OPENCOMM."Document No.")
                {
                }
                column(CommitteeType_OPENCOMM;OPENCOMM."Committee Type")
                {
                }
                column(LineNo_OPENCOMM;OPENCOMM."Line No")
                {
                }
                column(Role_OPENCOMM;OPENCOMM.Role)
                {
                }
                column(MemberNo_OPENCOMM;OPENCOMM."Member No.")
                {
                }
                column(MemberName_OPENCOMM;OPENCOMM."Member Name")
                {
                }
                column(Designation_OPENCOMM;OPENCOMM.Designation)
                {
                }
                column(IDPassportNo_OPENCOMM;OPENCOMM."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_OPENCOMM;OPENCOMM."Tax Registration (PIN) No.")
                {
                }
                column(MemberEmail_OPENCOMM;OPENCOMM."Member Email")
                {
                }
                column(TelephoneNo_OPENCOMM;OPENCOMM."Telephone No.")
                {
                }
                column(StaffNo_OPENCOMM;OPENCOMM."Staff  No.")
                {
                }
            }
            dataitem(EVALCOMM;"IFS Tender Committee Member")
            {
                DataItemLink = "Document No."=field("Appointed Bid Evaluation Com");
                column(ReportForNavId_112; 112)
                {
                }
                column(DocumentNo_EVALCOMM;EVALCOMM."Document No.")
                {
                }
                column(CommitteeType_EVALCOMM;EVALCOMM."Committee Type")
                {
                }
                column(LineNo_EVALCOMM;EVALCOMM."Line No")
                {
                }
                column(Role_EVALCOMM;EVALCOMM.Role)
                {
                }
                column(MemberNo_EVALCOMM;EVALCOMM."Member No.")
                {
                }
                column(MemberName_EVALCOMM;EVALCOMM."Member Name")
                {
                }
                column(Designation_EVALCOMM;EVALCOMM.Designation)
                {
                }
                column(IDPassportNo_EVALCOMM;EVALCOMM."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_EVALCOMM;EVALCOMM."Tax Registration (PIN) No.")
                {
                }
                column(MemberEmail_EVALCOMM;EVALCOMM."Member Email")
                {
                }
                column(TelephoneNo_EVALCOMM;EVALCOMM."Telephone No.")
                {
                }
            }
            trigger OnAfterGetRecord()
            begin
                OpinionOwner := '';
                OpinionOwnerPosition := '';
                OpinionTo :='';
                RespCenter2.Reset();
                RespCenter2.SetRange("Operating Unit Type",RespCenter2."Operating Unit Type"::Region);
                RespCenter2.SetRange(Code,"Primary Region");
                if RespCenter2.FindFirst() then begin
                    if Positions.Get(RespCenter2."Headed By (Title)") then
                            OpinionTo:= Positions."Job Title";
                end;
                if UserSetup.Get(GetApproverID("Bid Tabulation Header")) then begin
                    UserSetup.CalcFields(Picture);
                    if Emp.Get(UserSetup."Employee No.") then begin
                        OpinionOwner := Emp.FullName();
                        if Positions.Get(Emp.Position) then
                            OpinionOwnerPosition := Positions."Job Title";
                    end;
                end;
                if CompanyInfo.get() then begin
                    CompanyInfo.CalcFields(Picture);
                    if RespCenter.Get("Primary Region") then
                        FormatAddr.GetCompanyAddr("Primary Region", RespCenter, CompanyInfo, CompanyAddr)
                    else
                        FormatAddr.Company(CompanyAddr, CompanyInfo);
                end;
            end;

            trigger OnPreDataItem()
            begin
                corec.CalcFields(corec.Picture);
                TenderCommit.Reset;
                TenderCommit.SetRange("Document No.","Bid Tabulation Header"."Appointed Bid Evaluation Com");
                if TenderCommit.FindSet then begin
                  AppointAuthority:=TenderCommit."Appointing Authority";
                  AppointmEffectDate:=TenderCommit."Appointment Effective Date";
                  end;
                  IFS.Reset;
                  IFS.SetRange(Code,"Bid Tabulation Header"."IFS Code");
                  if IFS.FindSet then begin
                    IFSEvalEndDate:=IFS."IFS Evaluation End Date";
                    IFSEvalStartDate:=IFS."IFS Evaluation Start Date";
                    end;
                "Bid Tabulation Header".CalcFields("No of Responsive(Preliminary)");
                "Bid Tabulation Header".CalcFields("No of Responsive(Tech)");
                ResponsivePreli:="Bid Tabulation Header"."No of Responsive(Preliminary)";
                respTech:="Bid Tabulation Header"."No of Responsive(Tech)";
                Variance:=ResponsivePreli-respTech;


            end;


        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        corec: Record "Company Information";
        TenderCommit: Record "IFS Tender Committee";
        AppointAuthority: Text;
        AppointmEffectDate: Date;
        IFS: Record "Standard Purchase Code";
        IFSEvalStartDate: Date;
        IFSEvalEndDate: Date;
        ResponsivePreli: Integer;
        respTech: Integer;
        Variance: Integer;
        PositionDesc: Text;
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        OpinionOwner: Text;
        OpinionOwnerPosition: Text;
        Positions: Record "Company Positions";
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        RespCenter2: Record "Responsibility Center";
        OpinionTo:Text;


    procedure GetApproverID(BidTabulationheader: Record "Bid Tabulation Header"): Code[50]
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalEntry1: Record "Approval Entry";
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Document No.", "Bid Tabulation Header".Code);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);
        ApprovalEntry.SetRange("Sequence No.", 1);
        if ApprovalEntry.FINDSET() then begin
            repeat
                ApprovalEntry1.Reset();
                ApprovalEntry1.SetRange("Document No.", ApprovalEntry."Document No.");
                ApprovalEntry1.SetRange(Status, ApprovalEntry1.Status::Approved);
                ApprovalEntry1.SetRange("Approver ID", ApprovalEntry."Approver ID");
                ApprovalEntry1.SetRange("Last Modified By User ID", ApprovalEntry."Approver ID");
                if ApprovalEntry1.FindFirst() then
                    exit(ApprovalEntry1."Approver ID");
            until ApprovalEntry.next() = 0;
        end;
    end;
}

