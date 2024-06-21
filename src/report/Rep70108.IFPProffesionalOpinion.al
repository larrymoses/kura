#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70108 "IFP Proffesional Opinion"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/IFP Proffesional Opinion.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header";"Bid Tabulation Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyName;CompInfo.Name)
            {
            }
            column(CompanyAddress;CompInfo.Address)
            {
            }
            column(CompanyLogo;CompInfo.Picture)
            {
            }
            column(CompanyName2;CompInfo."Name 2")
            {
            }
            column(City;CompInfo.City)
            {
            }
            column(Address2;CompInfo."Address 2")
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
            column(ProcurementOfficerLicenseNo_BidTabulationHeader;"Bid Tabulation Header"."Procurement Officer License No")
            {
            }
            column(ProcurementMethod_BidTabulationHeader;"Bid Tabulation Header"."Procurement Method")
            {
            }
            column(ProcessType_BidTabulationHeader;"Bid Tabulation Header"."Process Type")
            {
            }
            column(IFPCode_BidTabulationHeader;"Bid Tabulation Header"."IFP Code")
            {
            }
            column(PrequalificationCategory_BidTabulationHeader;"Bid Tabulation Header"."Prequalification Category")
            {
            }
            column(CategoryName_BidTabulationHeader;"Bid Tabulation Header"."Category Name")
            {
            }
            dataitem("Request For Information";"Request For Information")
            {
                DataItemLink = Code=field("IFP Code");
                column(ReportForNavId_63; 63)
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
                column(ApplicabletoAllRegions_RequestForInformation;"Request For Information"."Applicable to All Regions")
                {
                }
            }
            dataitem("Bid Opening Register";"Bid Opening Register")
            {
                DataItemLink = Code=field("IFP Code");
                column(ReportForNavId_125; 125)
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
            dataitem("Prequalification Score Header";"Prequalification Score Header")
            {
                DataItemLink = Code=field("IFP Code");
                column(ReportForNavId_163; 163)
                {
                }
                column(Code_PrequalificationScoreHeader;"Prequalification Score Header".Code)
                {
                }
                column(DocumentDate_PrequalificationScoreHeader;"Prequalification Score Header"."Document Date")
                {
                }
                column(PrequalificationEvaluationTe_PrequalificationScoreHeader;"Prequalification Score Header"."Prequalification Evaluation Te")
                {
                }
                column(EvaluationLead_PrequalificationScoreHeader;"Prequalification Score Header"."Evaluation Lead")
                {
                }
                column(EvaluationLeadName_PrequalificationScoreHeader;"Prequalification Score Header"."Evaluation Lead Name")
                {
                }
                column(PrequalificationResponseNo_PrequalificationScoreHeader;"Prequalification Score Header"."Prequalification Response No.")
                {
                }
                column(VendorNo_PrequalificationScoreHeader;"Prequalification Score Header"."Vendor No.")
                {
                }
                column(VendorName_PrequalificationScoreHeader;"Prequalification Score Header"."Vendor Name")
                {
                }
                column(IFPNo_PrequalificationScoreHeader;"Prequalification Score Header"."IFP No.")
                {
                }
                column(ProcurementCategory_PrequalificationScoreHeader;"Prequalification Score Header"."Procurement Category")
                {
                }
                column(CategoryName_PrequalificationScoreHeader;"Prequalification Score Header"."Category Name")
                {
                }
                column(Description_PrequalificationScoreHeader;"Prequalification Score Header".Description)
                {
                }
                column(PrimaryResponsibilityCenter_PrequalificationScoreHeader;"Prequalification Score Header"."Primary Responsibility Center")
                {
                }
                column(SystemEvaluationScore_PrequalificationScoreHeader;"Prequalification Score Header"."System Evaluation Score %")
                {
                }
                column(FinalEvaluationScore_PrequalificationScoreHeader;"Prequalification Score Header"."Final Evaluation Score %")
                {
                }
                column(FinalEvaluationDecision_PrequalificationScoreHeader;"Prequalification Score Header"."Final Evaluation Decision")
                {
                }
                column(EvaluationCommitteeRemarks_PrequalificationScoreHeader;"Prequalification Score Header"."Evaluation Committee Remarks")
                {
                }
                column(NoSeries_PrequalificationScoreHeader;"Prequalification Score Header"."No. Series")
                {
                }
                column(CreatedBy_PrequalificationScoreHeader;"Prequalification Score Header"."Created By")
                {
                }
                column(CreatedDate_PrequalificationScoreHeader;"Prequalification Score Header"."Created Date")
                {
                }
                column(CreatedTime_PrequalificationScoreHeader;"Prequalification Score Header"."Created Time")
                {
                }
                column(EvaluationCommittee_PrequalificationScoreHeader;"Prequalification Score Header"."Evaluation Committee")
                {
                }
                column(Type_PrequalificationScoreHeader;"Prequalification Score Header".Type)
                {
                }
                column(Posted_PrequalificationScoreHeader;"Prequalification Score Header".Posted)
                {
                }
                column(Postingdate_PrequalificationScoreHeader;"Prequalification Score Header"."Posting date")
                {
                }
                column(PostedBy_PrequalificationScoreHeader;"Prequalification Score Header"."Posted By")
                {
                }
                column(ProcessType_PrequalificationScoreHeader;"Prequalification Score Header"."Process Type")
                {
                }
                column(EvaluationVenue_PrequalificationScoreHeader;"Prequalification Score Header"."Evaluation Venue")
                {
                }
            }
            dataitem("IFS Tender Committee";"IFS Tender Committee")
            {
                DataItemLink = "Document No."=field("IFP Code");
                column(ReportForNavId_193; 193)
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
            dataitem("Bid Opening Register Line";"Bid Opening Register Line")
            {
                DataItemLink = Code=field("IFP Code");
                column(ReportForNavId_239; 239)
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
            dataitem("IFS Tender Committee Member";"IFS Tender Committee Member")
            {
                DataItemLink = "Document No."=field("IFP Code");
                column(ReportForNavId_264; 264)
                {
                }
                column(DocumentNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Document No.")
                {
                }
                column(CommitteeType_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Committee Type")
                {
                }
                column(LineNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Line No")
                {
                }
                column(Role_IFSTenderCommitteeMember;"IFS Tender Committee Member".Role)
                {
                }
                column(MemberNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Member No.")
                {
                }
                column(MemberName_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Member Name")
                {
                }
                column(Designation_IFSTenderCommitteeMember;"IFS Tender Committee Member".Designation)
                {
                }
                column(IDPassportNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Tax Registration (PIN) No.")
                {
                }
                column(MemberEmail_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Member Email")
                {
                }
                column(TelephoneNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Telephone No.")
                {
                }
                column(StaffNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Staff  No.")
                {
                }
                column(IFSCode_IFSTenderCommitteeMember;"IFS Tender Committee Member"."IFS Code")
                {
                }
                column(NotifiedonEmail_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Notified on Email")
                {
                }
                column(DateTimeNotified_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Date/Time Notified")
                {
                }
                column(Destination_IFSTenderCommitteeMember;"IFS Tender Committee Member".Destination)
                {
                }
                column(NoofDays_IFSTenderCommitteeMember;"IFS Tender Committee Member"."No. of Days")
                {
                }
                column(TotalAmount_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Total Amount")
                {
                }
                column(Type_IFSTenderCommitteeMember;"IFS Tender Committee Member".Type)
                {
                }
                column(UnitAmount_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Unit Amount")
                {
                }
            }
            dataitem("IFP Response Line";"IFP Response Line")
            {
                DataItemLink = "RFI Document No."=field("IFP Code");
                column(ReportForNavId_285; 285)
                {
                }
                column(DocumentType_IFPResponseLine;"IFP Response Line"."Document Type")
                {
                }
                column(DocumentNo_IFPResponseLine;"IFP Response Line"."Document No.")
                {
                }
                column(ProcurementCategory_IFPResponseLine;"IFP Response Line"."Procurement Category")
                {
                }
                column(CategoryDescription_IFPResponseLine;"IFP Response Line"."Category Description")
                {
                }
                column(RFIDocumentNo_IFPResponseLine;"IFP Response Line"."RFI Document No.")
                {
                }
                column(VendorNo_IFPResponseLine;"IFP Response Line"."Vendor No.")
                {
                }
                column(SpecialGroupReservation_IFPResponseLine;"IFP Response Line"."Special Group Reservation")
                {
                }
                column(UniqueCategoryRequirements_IFPResponseLine;"IFP Response Line"."Unique Category Requirements")
                {
                }
                column(GlobalRCPrequalification_IFPResponseLine;"IFP Response Line"."Global RC Prequalification")
                {
                }
                column(RestrictedResponsbilityCente_IFPResponseLine;"IFP Response Line"."Restricted Responsbility Cente")
                {
                }
                column(RestrictedRCID_IFPResponseLine;"IFP Response Line"."Restricted RC ID")
                {
                }
                column(PrequalificationStartDate_IFPResponseLine;"IFP Response Line"."Prequalification Start Date")
                {
                }
                column(PrequalificationEndDate_IFPResponseLine;"IFP Response Line"."Prequalification End Date")
                {
                }
                column(EvaluationDecision_IFPResponseLine;"IFP Response Line"."Evaluation Decision")
                {
                }
                column(EvaluationScore_IFPResponseLine;"IFP Response Line"."Evaluation Score %")
                {
                }
                column(VendorName_IFPResponseLine;"IFP Response Line"."Vendor Name")
                {
                }
                column(ResponseStage_IFPResponseLine;"IFP Response Line"."Response Stage")
                {
                }
                column(IFPOpeningRegisterNo_IFPResponseLine;"IFP Response Line"."IFP Opening Register No")
                {
                }
                column(EvaluationVoucherNo_IFPResponseLine;"IFP Response Line"."Evaluation Voucher No")
                {
                }
                column(EvaluationReportNo_IFPResponseLine;"IFP Response Line"."Evaluation Report No")
                {
                }
                column(ProfessionalOpinionNo_IFPResponseLine;"IFP Response Line"."Professional Opinion No")
                {
                }
                column(NoticeOfAwardNo_IFPResponseLine;"IFP Response Line"."Notice Of Award No")
                {
                }
                column(ResponsibilityCenterID_IFPResponseLine;"IFP Response Line"."Responsibility Center ID")
                {
                }
                column(Description_IFPResponseLine;"IFP Response Line".Description)
                {
                }
                column(ConstituencyCode_IFPResponseLine;"IFP Response Line"."Constituency Code")
                {
                }
                column(Constituency_IFPResponseLine;"IFP Response Line".Constituency)
                {
                }
                column(Remarks_IFPResponseLine;"IFP Response Line".Remarks)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
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

    trigger OnPreReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
}

