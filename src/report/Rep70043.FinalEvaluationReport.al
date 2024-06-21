#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70043 "Final Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Final Evaluation Report.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header";"Bid Tabulation Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(logo;corec.Picture)
            {
            }
            column(CompanyName;UpperCase(corec.Name))
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
            column(BidOpeningRegisterTech_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Register(Tech)")
            {
            }
            column(BidOpeningRegisterFinance_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Register(Finance)")
            {
            }
            column(BidEvaluationCriteria_BidTabulationHeader;"Bid Tabulation Header"."Bid Evaluation Criteria")
            {
            }
            dataitem(CRITERIA;"Bid Score Requirement")
            {
                DataItemLink = "Template ID"=field("Bid Evaluation Criteria");
                column(ReportForNavId_441; 441)
                {
                }
                column(TemplateID_CRITERIA;CRITERIA."Template ID")
                {
                }
                column(EvaluationType_CRITERIA;CRITERIA."Evaluation Type")
                {
                }
                column(CriteriaGroupID_CRITERIA;CRITERIA."Criteria Group ID")
                {
                }
                column(RequirementID_CRITERIA;CRITERIA."Requirement ID")
                {
                }
                column(EvaluationRequirement_CRITERIA;CRITERIA."Evaluation Requirement")
                {
                }
                column(BidderResponse_CRITERIA;CRITERIA."Bidder Response")
                {
                }
            }
            dataitem(OPENING;"Standard Vendor Purchase Code")
            {
                DataItemLink = Code =field("IFS Code");
                column(ReportForNavId_365; 365)
                {
                }
                column(VendorNo_OPENING;OPENING."Vendor No.")
                {
                }
                column(AssignedBidNo_OPENING;OPENING."Assigned Bid No")
                {
                }
                column(BidSum1LCY_OPENING;OPENING."Bid Sum 1(LCY)")
                {
                }
                column(BidSum2LCY_OPENING;OPENING."Bid Sum 2(LCY)")
                {
                }
                column(Code_OPENING;OPENING.Code)
                {
                }
                column(Description_OPENING;OPENING.Description)
                {
                }
                column(IFSCode_OPENING;OPENING."IFS Code")
                {
                }
                column(BidNo_OPENING;OPENING."Bid No.")
                {
                }
                column(VendorName_OPENING;OPENING."Vendor Name")
                {
                }
                column(PrimaryEmail_OPENING;OPENING."Primary Email")
                {
                }
                column(PositiveIntentToBid_OPENING;OPENING."Positive Intent To Bid")
                {
                }
                column(InvitationEmailSent_OPENING;OPENING."Invitation Email Sent")
                {
                }
                column(DateTimeNotified_OPENING;OPENING."Date/Time Notified")
                {
                }
                column(NoofPostedAddendumNotices_OPENING;OPENING."No. of Posted Addendum Notices")
                {
                }
                column(PostedAddendumNoticeNo_OPENING;OPENING."Posted Addendum Notice No.")
                {
                }
                column(BidCurrencyCode_OPENING;OPENING."Bid Currency Code")
                {
                }
                column(SealedBidsTechnical_OPENING;OPENING."Sealed Bids (Technical)")
                {
                }
                column(SealedBidsFinancial_OPENING;OPENING."Sealed Bids (Financial)")
                {
                }
                column(PrebidRegisterNo_OPENING;OPENING."Prebid Register No.")
                {
                }
                column(PrebidMeetingDate_OPENING;OPENING."Prebid Meeting Date")
                {
                }
                column(BidOpeningRegisterNo_OPENING;OPENING."Bid Opening Register No.")
                {
                }
                column(BidOpeningDateTechnical_OPENING;OPENING."Bid Opening Date (Technical)")
                {
                }
                column(LateBidOpeningStage_OPENING;OPENING."Late Bid (Opening Stage)")
                {
                }
                column(WithdrawnBidOpeningStage_OPENING;OPENING."Withdrawn Bid (Opening Stage)")
                {
                }
                column(BidWithdrawalNoticeNo_OPENING;OPENING."Bid Withdrawal Notice No")
                {
                }
                column(ModifiedBidOpeningStage_OPENING;OPENING."Modified Bid (Opening Stage)")
                {
                }
                column(BidOpeningResult_OPENING;OPENING."Bid Opening Result")
                {
                }
                column(BidOpeningCommitteeRemarks_OPENING;OPENING."Bid Opening Committee Remarks")
                {
                }
                column(PreliminaryEvaluationReg_OPENING;OPENING."Preliminary Evaluation Reg")
                {
                }
                column(PreliminaryEvaluationDate_OPENING;OPENING."Preliminary Evaluation Date")
                {
                }
                column(PreliminaryEvaluationOutcome_OPENING;OPENING."Preliminary Evaluation Outcome")
                {
                }
                column(PreminaryEvaluationCommittee_OPENING;OPENING."Preminary Evaluation Committee")
                {
                }
                column(TechnicalEvaluationReg_OPENING;OPENING."Technical Evaluation Reg")
                {
                }
                column(TechnicalEvaluationDate_OPENING;OPENING."Technical Evaluation Date")
                {
                }
                column(MinWeightedTechPassScore_OPENING;OPENING."Min Weighted Tech Pass Score %")
                {
                }
                column(WeightedTechnicalScore_OPENING;OPENING."Weighted Technical  Score %")
                {
                }
                column(TechnicalEvaluationOutcome_OPENING;OPENING."Technical Evaluation  Outcome")
                {
                }
                column(EvaluationCommitteeRem_OPENING;OPENING."Evaluation Committee Rem")
                {
                }
                column(TechnicalEvaluationCommittee_OPENING;OPENING."Technical Evaluation Committee")
                {
                }
                column(BidOpeningFinanceRegister_OPENING;OPENING."Bid Opening Finance Register")
                {
                }
                column(BidOpeningDateFinancial_OPENING;OPENING."Bid Opening Date (Financial)")
                {
                }
                column(FinancialEvalRegisterNo_OPENING;OPENING."Financial Eval Register No")
                {
                }
                column(FinancialEvaluationDate_OPENING;OPENING."Financial Evaluation Date")
                {
                }
                column(ReadoutBidPriceA_OPENING;OPENING."Read-out Bid Price (A)")
                {
                }
                column(ArithmeticCorrectionsB_OPENING;OPENING."Arithmetic Corrections (B)")
                {
                }
                column(CorrectedBidPriceCAB_OPENING;OPENING."Corrected Bid Price (C=A+B)")
                {
                }
                column(UnconditionalDiscountD_OPENING;OPENING."Unconditional Discount % (D)")
                {
                }
                column(UnconditionalDiscAmountE_OPENING;OPENING."Unconditional Disc Amount (E)")
                {
                }
                column(CorrectedDiscBidPrice_OPENING;OPENING."Corrected & Disc Bid Price")
                {
                }
                column(AnyAdditionalAdjustmentsG_OPENING;OPENING."Any Additional Adjustments (G)")
                {
                }
                column(AnyPricedDeviationsH_OPENING;OPENING."Any Priced Deviations (H))")
                {
                }
                column(FinalEvaluatedBidPrice_OPENING;OPENING."Final Evaluated Bid Price")
                {
                }
                column(WeightedFinancialScore_OPENING;OPENING."Weighted Financial Score %")
                {
                }
                column(FinancialEvaluationRanking_OPENING;OPENING."Financial Evaluation Ranking")
                {
                }
                column(FinancialEvaluationCommRem_OPENING;OPENING."Financial Evaluation Comm Rem")
                {
                }
                column(AggregateWeightedScore_OPENING;OPENING."Aggregate Weighted Score %")
                {
                }
                column(EvaluationCommitteeRecomm_OPENING;OPENING."Evaluation Committee Recomm")
                {
                }
                column(FinalEvaluationReport_OPENING;OPENING."Final Evaluation Report")
                {
                }
                column(FinalEvaluationDate_OPENING;OPENING."Final Evaluation Date")
                {
                }
                column(ProfessionalOpionID_OPENING;OPENING."Professional Opion ID")
                {
                }
                column(ProfessionalOpionDate_OPENING;OPENING."Professional Opion Date")
                {
                }
                column(DueDilgenceDate_OPENING;OPENING."Due Dilgence Date")
                {
                }
                column(DueDiligenceRating_OPENING;OPENING."Due Diligence Rating")
                {
                }
                column(DueDiligenceReportID_OPENING;OPENING."Due Diligence Report ID")
                {
                }
                column(DueDiligenceVoucher_OPENING;OPENING."Due Diligence Voucher")
                {
                }
                column(SupplierType_OPENING;OPENING."Supplier Type")
                {
                }
                column(ProcurementCategory_OPENING;OPENING."Procurement Category")
                {
                }
                column(PassedTechEvaluation_OPENING;OPENING."Passed Tech Evaluation")
                {
                }
                column(PassedPreliminaryEvaluation_OPENING;OPENING."Passed Preliminary  Evaluation")
                {
                }
                column(ResponsiveBid_OPENING;OPENING."Responsive Bid")
                {
                }
                column(TechEvaluationRanking_OPENING;OPENING."Tech Evaluation Ranking")
                {
                }
                column(ValidBidSecurityProvided_OPENING;OPENING."Valid Bid Security Provided")
                {
                }
                column(BidSecurityIssuer_OPENING;OPENING."Bid Security Issuer")
                {
                }
                column(BidSecurityAmountLCY_OPENING;OPENING."Bid Security Amount (LCY)")
                {
                }
                column(BidSecurityAmountPass_OPENING;OPENING."Bid Security Amount Pass")
                {
                }
                column(CompleteBidDocSubmitted_OPENING;OPENING."Complete Bid Doc Submitted")
                {
                }
                column(LateBidSubmissionTime_OPENING;OPENING."Late Bid Submission Time")
                {
                }
                column(BidOpeningRanking_OPENING;OPENING."Bid Opening Ranking")
                {
                }
            }
            dataitem("Bid Tabulation Line";"Bid Tabulation Line")
            {
                DataItemLink = "Tabulation ID"=field(Code);
                column(ReportForNavId_57; 57)
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
            dataitem("Bid Opening Tender Committee";"Bid Opening Tender Committee")
            {
                DataItemLink = "Document No."=field(Code);
                column(ReportForNavId_129; 129)
                {
                }
                column(DocumentNo_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Document No.")
                {
                }
                column(LineNo_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Line No")
                {
                }
                column(AppointedBidOpeningCom_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Appointed Bid Opening Com")
                {
                }
                column(RoleType_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Role Type")
                {
                }
                column(MemberNo_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Member No.")
                {
                }
                column(MemberName_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Member Name")
                {
                }
                column(Designation_BidOpeningTenderCommittee;"Bid Opening Tender Committee".Designation)
                {
                }
                column(IDPassportNo_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Tax Registration (PIN) No.")
                {
                }
                column(Email_BidOpeningTenderCommittee;"Bid Opening Tender Committee".Email)
                {
                }
                column(TelephoneNo_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Telephone No.")
                {
                }
                column(StaffNo_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Staff  No.")
                {
                }
                column(IFSCode_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."IFS Code")
                {
                }
                column(OpeningPerson1_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Opening Person 1")
                {
                }
                column(OpeningPerson2_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Opening Person 2")
                {
                }
                column(OpeningPerson3_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Opening Person 3")
                {
                }
                column(NominatedBidOpening_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Nominated Bid Opening")
                {
                }
                column(OpeningPerson4_BidOpeningTenderCommittee;"Bid Opening Tender Committee"."Opening Person 4")
                {
                }
            }
            dataitem("Bid Evaluation Committee";"Bid Evaluation Committee")
            {
                DataItemLink = "Document No."=field(Code);
                DataItemTableView = where(Type=const(Evaluation));
                column(ReportForNavId_112; 112)
                {
                }
                column(DocumentNo_BidEvaluationCommittee;"Bid Evaluation Committee"."Document No.")
                {
                }
                column(LineNo_BidEvaluationCommittee;"Bid Evaluation Committee"."Line No")
                {
                }
                column(AppointedBidOpeningCom_BidEvaluationCommittee;"Bid Evaluation Committee"."Appointed Bid Opening Com")
                {
                }
                column(RoleType_BidEvaluationCommittee;"Bid Evaluation Committee"."Role Type")
                {
                }
                column(MemberNo_BidEvaluationCommittee;"Bid Evaluation Committee"."Member No.")
                {
                }
                column(MemberName_BidEvaluationCommittee;"Bid Evaluation Committee"."Member Name")
                {
                }
                column(Designation_BidEvaluationCommittee;"Bid Evaluation Committee".Designation)
                {
                }
                column(IDPassportNo_BidEvaluationCommittee;"Bid Evaluation Committee"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_BidEvaluationCommittee;"Bid Evaluation Committee"."Tax Registration (PIN) No.")
                {
                }
                column(Email_BidEvaluationCommittee;"Bid Evaluation Committee".Email)
                {
                }
                column(TelephoneNo_BidEvaluationCommittee;"Bid Evaluation Committee"."Telephone No.")
                {
                }
                column(StaffNo_BidEvaluationCommittee;"Bid Evaluation Committee"."Staff  No.")
                {
                }
                column(IFSCode_BidEvaluationCommittee;"Bid Evaluation Committee"."IFS Code")
                {
                }
                column(NotifiedonEmail_BidEvaluationCommittee;"Bid Evaluation Committee"."Notified on Email")
                {
                }
                column(DateTimeNotified_BidEvaluationCommittee;"Bid Evaluation Committee"."Date/Time Notified")
                {
                }
                column(Type_BidEvaluationCommittee;"Bid Evaluation Committee".Type)
                {
                }
            }
            dataitem("Bid_Contract Security Register";"Bid_Contract Security Register")
            {
                DataItemLink = "IFS No"=field("IFS Code");
                column(ReportForNavId_148; 148)
                {
                }
                column(DocumentType_BidContractSecurityRegister;"Bid_Contract Security Register"."Document Type")
                {
                }
                column(No_BidContractSecurityRegister;"Bid_Contract Security Register"."No.")
                {
                }
                column(FormofSecurity_BidContractSecurityRegister;"Bid_Contract Security Register"."Form of Security")
                {
                }
                column(VendorNo_BidContractSecurityRegister;"Bid_Contract Security Register"."Vendor No.")
                {
                }
                column(SecurityType_BidContractSecurityRegister;"Bid_Contract Security Register"."Security Type")
                {
                }
                column(IssuerInstitutionType_BidContractSecurityRegister;"Bid_Contract Security Register"."Issuer Institution Type")
                {
                }
                column(IssuerGuarantorName_BidContractSecurityRegister;"Bid_Contract Security Register"."Issuer/Guarantor Name")
                {
                }
                column(IssuerRegisteredOffices_BidContractSecurityRegister;"Bid_Contract Security Register"."Issuer Registered Offices")
                {
                }
                column(Description_BidContractSecurityRegister;"Bid_Contract Security Register".Description)
                {
                }
                column(SecurityAmountLCY_BidContractSecurityRegister;"Bid_Contract Security Register"."Security Amount (LCY)")
                {
                }
                column(BidSecurityEffectiveDate_BidContractSecurityRegister;"Bid_Contract Security Register"."Bid Security Effective Date")
                {
                }
                column(BidSecurityValidityExpiry_BidContractSecurityRegister;"Bid_Contract Security Register"."Bid Security Validity Expiry")
                {
                }
                column(SecurityID_BidContractSecurityRegister;"Bid_Contract Security Register"."Security ID")
                {
                }
                column(SecurityClosureDate_BidContractSecurityRegister;"Bid_Contract Security Register"."Security Closure Date")
                {
                }
                column(SecurityClosureVoucherNo_BidContractSecurityRegister;"Bid_Contract Security Register"."Security Closure Voucher No.")
                {
                }
                column(SecurityClosureType_BidContractSecurityRegister;"Bid_Contract Security Register"."Security Closure Type")
                {
                }
                column(Blocked_BidContractSecurityRegister;"Bid_Contract Security Register".Blocked)
                {
                }
                column(IFSNo_BidContractSecurityRegister;"Bid_Contract Security Register"."IFS No")
                {
                }
            }
            dataitem("IFS Tender Committee";"IFS Tender Committee")
            {
                DataItemLink = "Document No."=field(Code);
                column(ReportForNavId_168; 168)
                {
                }
                column(DocumentNo_IFSTenderCommittee;"IFS Tender Committee"."Document No.")
                {
                }
                column(CommitteeType_IFSTenderCommittee;"IFS Tender Committee"."Committee Type")
                {
                }
                column(Description_IFSTenderCommittee;"IFS Tender Committee".Description)
                {
                }
                column(AppointmentEffectiveDate_IFSTenderCommittee;"IFS Tender Committee"."Appointment Effective Date")
                {
                }
                column(AppointingAuthority_IFSTenderCommittee;"IFS Tender Committee"."Appointing Authority")
                {
                }
                column(TenderName_IFSTenderCommittee;"IFS Tender Committee"."Tender Name")
                {
                }
                column(ApprovalStatus_IFSTenderCommittee;"IFS Tender Committee"."Approval Status")
                {
                }
                column(PrimaryRegion_IFSTenderCommittee;"IFS Tender Committee"."Primary Region")
                {
                }
                column(PrimaryDirectorate_IFSTenderCommittee;"IFS Tender Committee"."Primary Directorate")
                {
                }
                column(PrimaryDepartment_IFSTenderCommittee;"IFS Tender Committee"."Primary Department")
                {
                }
                column(Blocked_IFSTenderCommittee;"IFS Tender Committee".Blocked)
                {
                }
                column(NoSeries_IFSTenderCommittee;"IFS Tender Committee"."No. Series")
                {
                }
                column(CreatedBy_IFSTenderCommittee;"IFS Tender Committee"."Created By")
                {
                }
                column(CreatedDate_IFSTenderCommittee;"IFS Tender Committee"."Created Date")
                {
                }
                column(CreatedTime_IFSTenderCommittee;"IFS Tender Committee"."Created Time")
                {
                }
                column(IFSCode_IFSTenderCommittee;"IFS Tender Committee"."IFS Code")
                {
                }
                column(DocumentDate_IFSTenderCommittee;"IFS Tender Committee"."Document Date")
                {
                }
                column(DocumentStatus_IFSTenderCommittee;"IFS Tender Committee"."Document Status")
                {
                }
                column(ContractNo_IFSTenderCommittee;"IFS Tender Committee"."Contract No.")
                {
                }
                column(ExternalDocumentNo_IFSTenderCommittee;"IFS Tender Committee"."External Document No")
                {
                }
                column(RaisedBy_IFSTenderCommittee;"IFS Tender Committee"."Raised By")
                {
                }
                column(Name_IFSTenderCommittee;"IFS Tender Committee".Name)
                {
                }
                column(StaffId_IFSTenderCommittee;"IFS Tender Committee"."Staff Id")
                {
                }
                column(Designation_IFSTenderCommittee;"IFS Tender Committee".Designation)
                {
                }
                column(MinRequiredNoofMembers_IFSTenderCommittee;"IFS Tender Committee"."Min Required No. of Members")
                {
                }
                column(ActualNoofCommitteeMemb_IFSTenderCommittee;"IFS Tender Committee"."Actual No. of Committee Memb")
                {
                }
                column(Duration_IFSTenderCommittee;"IFS Tender Committee".Duration)
                {
                }
                column(ReferenceNumber_IFSTenderCommittee;"IFS Tender Committee"."Reference Number")
                {
                }
                column(Location_IFSTenderCommittee;"IFS Tender Committee".Location)
                {
                }
                column(ImprestCreated_IFSTenderCommittee;"IFS Tender Committee"."Imprest Created")
                {
                }
                column(MemoNo_IFSTenderCommittee;"IFS Tender Committee"."Memo No.")
                {
                }
                column(RoadCode_IFSTenderCommittee;"IFS Tender Committee"."Road Code")
                {
                }
                column(RoadSectionNo_IFSTenderCommittee;"IFS Tender Committee"."Road Section No.")
                {
                }
                column(MeasurementSheets_IFSTenderCommittee;"IFS Tender Committee"."Measurement Sheets")
                {
                }
                column(Inspection_IFSTenderCommittee;"IFS Tender Committee".Inspection)
                {
                }
                column(Type_IFSTenderCommittee;"IFS Tender Committee".Type)
                {
                }
                column(PreviousAppointedCommittee_IFSTenderCommittee;"IFS Tender Committee"."Previous Appointed Committee")
                {
                }
                column(DocumentType_IFSTenderCommittee;"IFS Tender Committee"."Document Type")
                {
                }
                column(OpeningTime_IFSTenderCommittee;"IFS Tender Committee"."Opening Time")
                {
                }
                column(IFPCode_IFSTenderCommittee;"IFS Tender Committee"."IFP Code")
                {
                }
            }
            dataitem("Request For Information";"Request For Information")
            {
                DataItemLink = Code=field("IFS Code");
                column(ReportForNavId_208; 208)
                {
                }
                column(Code_RequestForInformation;"Request For Information".Code)
                {
                }
                column(Description_RequestForInformation;"Request For Information".Description)
                {
                }
                column(TenderSummary_RequestForInformation;"Request For Information"."Tender Summary")
                {
                }
                column(PrimaryTargetVendorCluster_RequestForInformation;"Request For Information"."Primary Target Vendor Cluster")
                {
                }
                column(DocumentDate_RequestForInformation;"Request For Information"."Document Date")
                {
                }
                column(ExternalDocumentNo_RequestForInformation;"Request For Information"."External Document No")
                {
                }
                column(PeriodStartDate_RequestForInformation;"Request For Information"."Period Start Date")
                {
                }
                column(PeriodEndDate_RequestForInformation;"Request For Information"."Period End Date")
                {
                }
                column(Status_RequestForInformation;"Request For Information".Status)
                {
                }
                column(Name_RequestForInformation;"Request For Information".Name)
                {
                }
                column(Name2_RequestForInformation;"Request For Information"."Name 2")
                {
                }
                column(Address_RequestForInformation;"Request For Information".Address)
                {
                }
                column(Address2_RequestForInformation;"Request For Information"."Address 2")
                {
                }
                column(PostCode_RequestForInformation;"Request For Information"."Post Code")
                {
                }
                column(City_RequestForInformation;"Request For Information".City)
                {
                }
                column(CountryRegionCode_RequestForInformation;"Request For Information"."Country/Region Code")
                {
                }
                column(PhoneNo_RequestForInformation;"Request For Information"."Phone No.")
                {
                }
                column(EMail_RequestForInformation;"Request For Information"."E-Mail")
                {
                }
                column(TenderBoxLocationCode_RequestForInformation;"Request For Information"."Tender Box Location Code")
                {
                }
                column(PrequalificationChargeCode_RequestForInformation;"Request For Information"."Prequalification Charge Code")
                {
                }
                column(Published_RequestForInformation;"Request For Information".Published)
                {
                }
                column(Createdby_RequestForInformation;"Request For Information"."Created by")
                {
                }
                column(SubmissionStartDate_RequestForInformation;"Request For Information"."Submission Start Date")
                {
                }
                column(SubmissionStartTime_RequestForInformation;"Request For Information"."Submission Start Time")
                {
                }
                column(SubmissionEndDate_RequestForInformation;"Request For Information"."Submission End Date")
                {
                }
                column(SubmissionEndTime_RequestForInformation;"Request For Information"."Submission End Time")
                {
                }
                column(NoofSubmission_RequestForInformation;"Request For Information"."No. of Submission")
                {
                }
                column(EnforceMandatoryEReceipt_RequestForInformation;"Request For Information"."Enforce Mandatory E-Receipt")
                {
                }
                column(ProcurementDocumentTemplate_RequestForInformation;"Request For Information"."Procurement Document Template")
                {
                }
                column(DisplayScoringCriteriaVendo_RequestForInformation;"Request For Information"."Display Scoring Criteria Vendo")
                {
                }
                column(RFIScoringTemplate_RequestForInformation;"Request For Information"."RFI Scoring Template")
                {
                }
                column(CreatedDateTime_RequestForInformation;"Request For Information"."Created Date/Time")
                {
                }
                column(SummarizedTermsConditions_RequestForInformation;"Request For Information"."Summarized Terms & Conditions")
                {
                }
                column(NoSeries_RequestForInformation;"Request For Information"."No. Series")
                {
                }
                column(GlobalDimension1Code_RequestForInformation;"Request For Information"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_RequestForInformation;"Request For Information"."Global Dimension 2 Code")
                {
                }
                column(GlobalDimension3Code_RequestForInformation;"Request For Information"."Global Dimension 3 Code")
                {
                }
                column(County_RequestForInformation;"Request For Information".County)
                {
                }
                column(DocumentType_RequestForInformation;"Request For Information"."Document Type")
                {
                }
                column(AssignedProcurementOfficer_RequestForInformation;"Request For Information"."Assigned Procurement Officer")
                {
                }
                column(ProcurementType_RequestForInformation;"Request For Information"."Procurement Type")
                {
                }
                column(SolicitationType_RequestForInformation;"Request For Information"."Solicitation Type")
                {
                }
                column(ResponsibilityCentre_RequestForInformation;"Request For Information"."Responsibility Centre")
                {
                }
                column(ChargeAmountLCY_RequestForInformation;"Request For Information"."Charge Amount (LCY)")
                {
                }
                column(ChargeBankCode_RequestForInformation;"Request For Information"."Charge Bank Code")
                {
                }
                column(BankName_RequestForInformation;"Request For Information"."Bank Name")
                {
                }
                column(AccountHolderName_RequestForInformation;"Request For Information"."Account Holder Name")
                {
                }
                column(ChargeBankBranch_RequestForInformation;"Request For Information"."Charge Bank Branch")
                {
                }
                column(ChargeBankACNo_RequestForInformation;"Request For Information"."Charge Bank A/C No")
                {
                }
                column(DateTimePublished_RequestForInformation;"Request For Information"."Date/Time Published")
                {
                }
                column(RFIDocumentStatus_RequestForInformation;"Request For Information"."RFI Document Status")
                {
                }
                column(EvaluationCommittee_RequestForInformation;"Request For Information"."Evaluation Committee")
                {
                }
                column(DimensionSetID_RequestForInformation;"Request For Information"."Dimension Set ID")
                {
                }
                column(Constituency_RequestForInformation;"Request For Information".Constituency)
                {
                }
                column(DateFilter_RequestForInformation;"Request For Information"."Date Filter")
                {
                }
                column(Type_RequestForInformation;"Request For Information".Type)
                {
                }
                column(LinkedtoIFPNo_RequestForInformation;"Request For Information"."Linked to IFP No.")
                {
                }
                column(ResponsibilityCenterdescr_RequestForInformation;"Request For Information"."Responsibility Center descr")
                {
                }
                column(Constituencydescription_RequestForInformation;"Request For Information"."Constituency description")
                {
                }
                column(OpeningCommittee_RequestForInformation;"Request For Information"."Opening Committee")
                {
                }
            }
            dataitem("Bid Opening Register";"Bid Opening Register")
            {
                DataItemLink = Code=field("IFS Code");
                column(ReportForNavId_269; 269)
                {
                }
                column(Code_BidOpeningRegister;"Bid Opening Register".Code)
                {
                }
                column(IFSCode_BidOpeningRegister;"Bid Opening Register"."IFS Code")
                {
                }
                column(Description_BidOpeningRegister;"Bid Opening Register".Description)
                {
                }
                column(TenderName_BidOpeningRegister;"Bid Opening Register"."Tender Name")
                {
                }
                column(BidOpeningDate_BidOpeningRegister;"Bid Opening Register"."Bid Opening Date")
                {
                }
                column(BidOpeningStartTime_BidOpeningRegister;"Bid Opening Register"."Bid Opening Start Time")
                {
                }
                column(BidOpeningEndDate_BidOpeningRegister;"Bid Opening Register"."Bid Opening End Date")
                {
                }
                column(BidOpeningEndTime_BidOpeningRegister;"Bid Opening Register"."Bid Opening End Time")
                {
                }
                column(PrebidPurchaserCode_BidOpeningRegister;"Bid Opening Register"."Pre-bid Purchaser Code")
                {
                }
                column(NoofIntentionToBidVendor_BidOpeningRegister;"Bid Opening Register"."No. of Intention To Bid Vendor")
                {
                }
                column(NoofSubmittedBids_BidOpeningRegister;"Bid Opening Register"."No. of Submitted Bids")
                {
                }
                column(NoSeries_BidOpeningRegister;"Bid Opening Register"."No. Series")
                {
                }
                column(CreatedBy_BidOpeningRegister;"Bid Opening Register"."Created By")
                {
                }
                column(CreatedDate_BidOpeningRegister;"Bid Opening Register"."Created Date")
                {
                }
                column(CreatedTime_BidOpeningRegister;"Bid Opening Register"."Created Time")
                {
                }
                column(PrimaryRegion_BidOpeningRegister;"Bid Opening Register"."Primary Region")
                {
                }
                column(AppointedBidOpeningCom_BidOpeningRegister;"Bid Opening Register"."Appointed Bid Opening Com")
                {
                }
                column(BidEnvelopType_BidOpeningRegister;"Bid Opening Register"."Bid Envelop Type")
                {
                }
                column(BidUnsealingType_BidOpeningRegister;"Bid Opening Register"."Bid Unsealing Type")
                {
                }
                column(FinalOpeningDone_BidOpeningRegister;"Bid Opening Register"."Final Opening Done")
                {
                }
                column(TenderEvaluationDeadline_BidOpeningRegister;"Bid Opening Register"."Tender Evaluation Deadline")
                {
                }
                column(BidRegisterNo_BidOpeningRegister;"Bid Opening Register"."Bid Register No.")
                {
                }
                column(RequiredBidSecurityAmount_BidOpeningRegister;"Bid Opening Register"."Required Bid Security Amount")
                {
                }
                column(BidOpeningVenue_BidOpeningRegister;"Bid Opening Register"."Bid Opening Venue")
                {
                }
                column(DocumentStatus_BidOpeningRegister;"Bid Opening Register"."Document Status")
                {
                }
                column(Posted_BidOpeningRegister;"Bid Opening Register".Posted)
                {
                }
                column(PostedBy_BidOpeningRegister;"Bid Opening Register"."Posted By")
                {
                }
                column(PostedDate_BidOpeningRegister;"Bid Opening Register"."Posted Date")
                {
                }
                column(Type_BidOpeningRegister;"Bid Opening Register".Type)
                {
                }
                column(OpeningPerson1_BidOpeningRegister;"Bid Opening Register"."Opening Person 1")
                {
                }
                column(OpeningPerson2_BidOpeningRegister;"Bid Opening Register"."Opening Person 2")
                {
                }
                column(OpeningPerson3_BidOpeningRegister;"Bid Opening Register"."Opening Person 3")
                {
                }
                column(OpeningPerson4_BidOpeningRegister;"Bid Opening Register"."Opening Person 4")
                {
                }
                column(ApprovalStatus_BidOpeningRegister;"Bid Opening Register"."Approval Status")
                {
                }
                column(OpeningPerson5_BidOpeningRegister;"Bid Opening Register"."Opening Person 5")
                {
                }
                column(ProcessType_BidOpeningRegister;"Bid Opening Register"."Process Type")
                {
                }
                column(IFPCode_BidOpeningRegister;"Bid Opening Register"."IFP Code")
                {
                }
            }
            dataitem("Bid Opening Register Line";"Bid Opening Register Line")
            {
                DataItemLink = Code=field("IFS Code");
                column(ReportForNavId_307; 307)
                {
                }
                column(Code_BidOpeningRegisterLine;"Bid Opening Register Line".Code)
                {
                }
                column(VendorNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Vendor No.")
                {
                }
                column(IFSCode_BidOpeningRegisterLine;"Bid Opening Register Line"."IFS Code")
                {
                }
                column(BidderName_BidOpeningRegisterLine;"Bid Opening Register Line"."Bidder Name")
                {
                }
                column(BidNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid No.")
                {
                }
                column(ExternalBidReferenceNo_BidOpeningRegisterLine;"Bid Opening Register Line"."External Bid Reference No")
                {
                }
                column(ValidBidSecurityProvided_BidOpeningRegisterLine;"Bid Opening Register Line"."Valid Bid Security Provided")
                {
                }
                column(BidSecurityIssuer_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Security Issuer")
                {
                }
                column(BidSecurityAmountLCY_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Security Amount (LCY)")
                {
                }
                column(BidSecurityAmountPass_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Security Amount Pass")
                {
                }
                column(TotalTenderPriceLCY_BidOpeningRegisterLine;"Bid Opening Register Line"."Total Tender Price (LCY)")
                {
                }
                column(CompleteBidDocSubmitted_BidOpeningRegisterLine;"Bid Opening Register Line"."Complete Bid Doc Submitted")
                {
                }
                column(LateBid_BidOpeningRegisterLine;"Bid Opening Register Line"."Late Bid")
                {
                }
                column(LateBidSubmissionTime_BidOpeningRegisterLine;"Bid Opening Register Line"."Late Bid Submission Time")
                {
                }
                column(BidWithdrawalNoticeNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Withdrawal Notice No.")
                {
                }
                column(BidModificationNoticeNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Modification Notice No.")
                {
                }
                column(BidWithdrawalExists_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Withdrawal Exists")
                {
                }
                column(BidModificationExists_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Modification Exists")
                {
                }
                column(FinalBidOpeningResult_BidOpeningRegisterLine;"Bid Opening Register Line"."Final Bid Opening Result")
                {
                }
                column(TenderOpeningComRemarks_BidOpeningRegisterLine;"Bid Opening Register Line"."Tender Opening Com Remarks")
                {
                }
                column(NoofRepresentatives_BidOpeningRegisterLine;"Bid Opening Register Line"."No. of Representatives")
                {
                }
                column(Notified_BidOpeningRegisterLine;"Bid Opening Register Line".Notified)
                {
                }
                column(DateTimeNotified_BidOpeningRegisterLine;"Bid Opening Register Line"."Date/Time Notified")
                {
                }
                column(Rank_BidOpeningRegisterLine;"Bid Opening Register Line".Rank)
                {
                }
            }
            dataitem("Bid Score Requirement";"Bid Score Requirement")
            {
                DataItemLink = "Template ID"=field("IFS Code");
                column(ReportForNavId_332; 332)
                {
                }
                column(TemplateID_BidScoreRequirement;"Bid Score Requirement"."Template ID")
                {
                }
                column(CriteriaGroupID_BidScoreRequirement;"Bid Score Requirement"."Criteria Group ID")
                {
                }
                column(RequirementID_BidScoreRequirement;"Bid Score Requirement"."Requirement ID")
                {
                }
                column(EvaluationRequirement_BidScoreRequirement;"Bid Score Requirement"."Evaluation Requirement")
                {
                }
                column(BidderResponse_BidScoreRequirement;"Bid Score Requirement"."Bidder Response")
                {
                }
                column(RatingType_BidScoreRequirement;"Bid Score Requirement"."Rating Type")
                {
                }
                column(TargetValue_BidScoreRequirement;"Bid Score Requirement"."Target Value")
                {
                }
                column(AssignedWeight_BidScoreRequirement;"Bid Score Requirement"."Assigned Weight %")
                {
                }
                column(EvaluationType_BidScoreRequirement;"Bid Score Requirement"."Evaluation Type")
                {
                }
                column(EquipmentType_BidScoreRequirement;"Bid Score Requirement"."Equipment Type")
                {
                }
                column(UnitofMeasure_BidScoreRequirement;"Bid Score Requirement"."Unit of Measure")
                {
                }
                column(TargetQty_BidScoreRequirement;"Bid Score Requirement"."Target Qty")
                {
                }
                column(DesiredPerfomanceDirection_BidScoreRequirement;"Bid Score Requirement"."Desired Perfomance Direction")
                {
                }
                column(PerformanceIndicatorProof_BidScoreRequirement;"Bid Score Requirement"."Performance Indicator/Proof")
                {
                }
            }
            dataitem(Bid_Open;"Bid Evaluation Committee")
            {
                DataItemLink = "Document No."=field(Code);
                DataItemTableView = where(Type=const("Bid Opening"));
                column(ReportForNavId_348; 348)
                {
                }
                column(DocumentNo_BidOpen;Bid_Open."Document No.")
                {
                }
                column(LineNo_BidOpen;Bid_Open."Line No")
                {
                }
                column(AppointedBidOpeningCom_BidOpen;Bid_Open."Appointed Bid Opening Com")
                {
                }
                column(RoleType_BidOpen;Bid_Open."Role Type")
                {
                }
                column(MemberNo_BidOpen;Bid_Open."Member No.")
                {
                }
                column(MemberName_BidOpen;Bid_Open."Member Name")
                {
                }
                column(Designation_BidOpen;Bid_Open.Designation)
                {
                }
                column(IDPassportNo_BidOpen;Bid_Open."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_BidOpen;Bid_Open."Tax Registration (PIN) No.")
                {
                }
                column(Email_BidOpen;Bid_Open.Email)
                {
                }
                column(TelephoneNo_BidOpen;Bid_Open."Telephone No.")
                {
                }
                column(StaffNo_BidOpen;Bid_Open."Staff  No.")
                {
                }
                column(IFSCode_BidOpen;Bid_Open."IFS Code")
                {
                }
                column(NotifiedonEmail_BidOpen;Bid_Open."Notified on Email")
                {
                }
                column(DateTimeNotified_BidOpen;Bid_Open."Date/Time Notified")
                {
                }
                column(Type_BidOpen;Bid_Open.Type)
                {
                }
            }

            trigger OnPreDataItem()
            begin
                corec.Get();
                corec.CalcFields(corec.Picture);
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
}

