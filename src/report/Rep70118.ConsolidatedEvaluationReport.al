#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70118 "Consolidated Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Consolidated Evaluation Report.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header";"Bid Tabulation Header")
        {
            DataItemTableView = where("Document Type"=filter("Evaluation Report"));
            column(ReportForNavId_6; 6)
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
            column(NoofResponsivePreliminary_BidTabulationHeader;"Bid Tabulation Header"."No of Responsive(Preliminary)")
            {
            }
            column(NoofnonResponsivePrelim_BidTabulationHeader;"Bid Tabulation Header"."No of non- Responsive(Prelim)")
            {
            }
            column(BidEvaluationCriteria_BidTabulationHeader;"Bid Tabulation Header"."Bid Evaluation Criteria")
            {
            }
            dataitem("Standard Purchase Code";"Standard Purchase Code")
            {
                DataItemLink = Code=field("IFS Code");
                column(ReportForNavId_16; 16)
                {
                }
                column(Code_StandardPurchaseCode;"Standard Purchase Code".Code)
                {
                }
                column(Description_StandardPurchaseCode;"Standard Purchase Code".Description)
                {
                }
                column(ExternalDocumentNo_StandardPurchaseCode;"Standard Purchase Code"."External Document No")
                {
                }
                column(ProjectID_StandardPurchaseCode;"Standard Purchase Code"."Project ID")
                {
                }
                column(SubmissionEndTime_StandardPurchaseCode;"Standard Purchase Code"."Submission End Time")
                {
                }
                column(SubmissionEndDate_StandardPurchaseCode;"Standard Purchase Code"."Submission End Date")
                {
                }
                column(NoofSubmission_StandardPurchaseCode;"Standard Purchase Code"."No. of Submission")
                {
                }
                column(BidOpeningDate_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Date")
                {
                }
                column(BidOpeningTime_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Time")
                {
                }
                column(BidOpeningVenue_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Venue")
                {
                }
                column(TenderValidityDuration_StandardPurchaseCode;"Standard Purchase Code"."Tender Validity Duration")
                {
                }
                column(MandatoryPrebidVisitDate_StandardPurchaseCode;"Standard Purchase Code"."Mandatory Pre-bid Visit Date")
                {
                }
                column(Job_StandardPurchaseCode;"Standard Purchase Code".Job)
                {
                }
                column(PrebidMeetingAddress_StandardPurchaseCode;"Standard Purchase Code"."Prebid Meeting Address")
                {
                }
                column(PrebidMeetingRegisterID_StandardPurchaseCode;"Standard Purchase Code"."Prebid Meeting Register ID")
                {
                }
                column(RequestingRegion_StandardPurchaseCode;"Standard Purchase Code"."Requesting Region")
                {
                }
                column(RequestingDirectorate_StandardPurchaseCode;"Standard Purchase Code"."Requesting Directorate")
                {
                }
                column(RequestingDepartment_StandardPurchaseCode;"Standard Purchase Code"."Requesting Department")
                {
                }
                column(TenderName_StandardPurchaseCode;"Standard Purchase Code"."Tender Name")
                {
                }
                column(TenderSummary_StandardPurchaseCode;"Standard Purchase Code"."Tender Summary")
                {
                }
            }
            dataitem("IFS Opening Committee";"IFS Tender Committee Member")
            {
                DataItemLink = "Document No."=field("Appointed Bid Opening Comm");
                DataItemTableView = where("Committee Type"=filter('TOC'));
                column(ReportForNavId_37; 37)
                {
                }
                column(Role_IFSOpeningCommittee;"IFS Opening Committee".Role)
                {
                }
                column(MemberNo_IFSOpeningCommittee;"IFS Opening Committee"."Member No.")
                {
                }
                column(MemberName_IFSOpeningCommittee;"IFS Opening Committee"."Member Name")
                {
                }
                column(Designation_IFSOpeningCommittee;"IFS Opening Committee".Designation)
                {
                }
                column(IFSCode_IFSOpeningCommittee;"IFS Opening Committee"."IFS Code")
                {
                }
            }
            dataitem("IFS Evaluation Committee";"IFS Tender Committee Member")
            {
                DataItemLink = "Document No."=field("Appointed Bid Evaluation Com");
                DataItemTableView = where("Committee Type"=filter('TEC'));
                column(ReportForNavId_52; 52)
                {
                }
                column(Role_IFSEvaluationCommittee;"IFS Evaluation Committee".Role)
                {
                }
                column(MemberNo_IFSEvaluationCommittee;"IFS Evaluation Committee"."Member No.")
                {
                }
                column(MemberName_IFSEvaluationCommittee;"IFS Evaluation Committee"."Member Name")
                {
                }
                column(Designation_IFSEvaluationCommittee;"IFS Evaluation Committee".Designation)
                {
                }
                column(IFSCode_IFSEvaluationCommittee;"IFS Evaluation Committee"."IFS Code")
                {
                }
            }
            dataitem("Bid Opening Register";"Bid Opening Register")
            {
                DataItemLink = "IFS Code"=field("IFS Code");
                column(ReportForNavId_58; 58)
                {
                }
                column(Code_BidOpeningRegister;"Bid Opening Register".Code)
                {
                }
                column(IFSCode_BidOpeningRegister;"Bid Opening Register"."IFS Code")
                {
                }
                column(BidOpeningDate_BidOpeningRegister;"Bid Opening Register"."Bid Opening Date")
                {
                }
                column(BidOpeningStartTime_BidOpeningRegister;"Bid Opening Register"."Bid Opening Start Time")
                {
                }
                column(TotalEngineerEstimates_BidOpeningRegister;"Bid Opening Register"."Total Engineer Estimates")
                {
                }
                dataitem("Bid Opening Register Line";"Bid Opening Register Line")
                {
                    DataItemLink = "IFS Code"=field("IFS Code"),Code=field(Code);
                    column(ReportForNavId_59; 59)
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
                    column(Rank_BidOpeningRegisterLine;"Bid Opening Register Line".Rank)
                    {
                    }
                    column(AssignedBidNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Assigned Bid No.")
                    {
                    }
                    column(AutoAssignedNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Auto Assigned No")
                    {
                    }
                    column(BidSum1LCY_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Sum 1(LCY)")
                    {
                    }
                    column(BidSum2LCY_BidOpeningRegisterLine;"Bid Opening Register Line"."Bid Sum 2(LCY)")
                    {
                    }
                }
            }
            dataitem("Prelim Evaluation Register";"Bid Evaluation Register")
            {
                DataItemLink = "IFS Code"=field("IFS Code");
                DataItemTableView = where("Evaluation Type"=filter("Preliminary Evaluation"));
                column(ReportForNavId_82; 82)
                {
                }
                column(BidNo_PrelimEvaluationRegister;"Prelim Evaluation Register"."Bid No.")
                {
                }
                column(VendorNo_PrelimEvaluationRegister;"Prelim Evaluation Register"."Vendor No.")
                {
                }
                column(BidderName_PrelimEvaluationRegister;"Prelim Evaluation Register"."Bidder Name")
                {
                }
                column(EvaluationDate_PrelimEvaluationRegister;"Prelim Evaluation Register"."Evaluation Date")
                {
                }
                column(EvaluationVenue_PrelimEvaluationRegister;"Prelim Evaluation Register"."Evaluation Venue")
                {
                }
                column(IFSCode_PrelimEvaluationRegister;"Prelim Evaluation Register"."IFS Code")
                {
                }
                column(AppointedBidEvaluationCommi_PrelimEvaluationRegister;"Prelim Evaluation Register"."Appointed Bid Evaluation Commi")
                {
                }
                column(PreliminaryEvaluationScore_PrelimEvaluationRegister;"Prelim Evaluation Register"."Preliminary Evaluation Score")
                {
                }
                column(WeightedTechnicalEvalScore_PrelimEvaluationRegister;"Prelim Evaluation Register"."Weighted Technical Eval Score")
                {
                }
                column(TechnicalEvaluationDecision_PrelimEvaluationRegister;"Prelim Evaluation Register"."Technical Evaluation  Decision")
                {
                }
                column(WeightedFinancialEvalScore_PrelimEvaluationRegister;"Prelim Evaluation Register"."Weighted Financial Eval Score")
                {
                }
                column(AwardDecision_PrelimEvaluationRegister;"Prelim Evaluation Register"."Award Decision")
                {
                }
                column(TenderEvaluationCommRemarks_PrelimEvaluationRegister;"Prelim Evaluation Register"."Tender Evaluation Comm Remarks")
                {
                }
                dataitem("Prelim Eval Reg Lines";"Bid Evaluation Score Entry")
                {
                    DataItemLink = Code=field(Code);
                    column(ReportForNavId_86; 86)
                    {
                    }
                    column(BidNo_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Bid No.")
                    {
                    }
                    column(VendorNo_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Vendor No.")
                    {
                    }
                    column(RequirementID_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Requirement ID")
                    {
                    }
                    column(EvaluationRequirement_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Evaluation Requirement")
                    {
                    }
                    column(RatingType_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Rating Type")
                    {
                    }
                    column(UnitofMeasure_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Unit of Measure")
                    {
                    }
                    column(TargetQty_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Target Qty")
                    {
                    }
                    column(ResponseValue_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Response Value")
                    {
                    }
                    column(BidResponseActualQty_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Bid Response Actual Qty")
                    {
                    }
                    column(Score_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Score %")
                    {
                    }
                    column(AssignedWeight_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Assigned Weight %")
                    {
                    }
                    column(WeightedLineScore_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Weighted Line Score")
                    {
                    }
                    column(EvaluationResults_PrelimEvalRegLines;"Prelim Eval Reg Lines"."Evaluation Results")
                    {
                    }
                    column(Remarks_PrelimEvalRegLines;"Prelim Eval Reg Lines".Remarks)
                    {
                    }
                }
            }
            dataitem("Techical Evaluation Register";"Bid Evaluation Register")
            {
                DataItemLink = "IFS Code"=field("IFS Code");
                DataItemTableView = where("Evaluation Type"=filter("Technical Evaluation"));
                column(ReportForNavId_83; 83)
                {
                }
                column(BidNo_TechicalEvaluationRegister;"Techical Evaluation Register"."Bid No.")
                {
                }
                column(VendorNo_TechicalEvaluationRegister;"Techical Evaluation Register"."Vendor No.")
                {
                }
                column(BidderName_TechicalEvaluationRegister;"Techical Evaluation Register"."Bidder Name")
                {
                }
                column(EvaluationDate_TechicalEvaluationRegister;"Techical Evaluation Register"."Evaluation Date")
                {
                }
                column(EvaluationVenue_TechicalEvaluationRegister;"Techical Evaluation Register"."Evaluation Venue")
                {
                }
                column(IFSCode_TechicalEvaluationRegister;"Techical Evaluation Register"."IFS Code")
                {
                }
                column(AppointedBidEvaluationCommi_TechicalEvaluationRegister;"Techical Evaluation Register"."Appointed Bid Evaluation Commi")
                {
                }
                column(TechnicalEvaluationDecision_TechicalEvaluationRegister;"Techical Evaluation Register"."Technical Evaluation  Decision")
                {
                }
                column(AwardDecision_TechicalEvaluationRegister;"Techical Evaluation Register"."Award Decision")
                {
                }
                column(TenderEvaluationCommRemarks_TechicalEvaluationRegister;"Techical Evaluation Register"."Tender Evaluation Comm Remarks")
                {
                }
                dataitem("Technical Eval Reg Lines";"Bid Evaluation Score Entry")
                {
                    DataItemLink = Code=field(Code);
                    column(ReportForNavId_87; 87)
                    {
                    }
                    column(BidNo_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Bid No.")
                    {
                    }
                    column(VendorNo_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Vendor No.")
                    {
                    }
                    column(CriteriaGroup_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Criteria Group")
                    {
                    }
                    column(RequirementID_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Requirement ID")
                    {
                    }
                    column(EvaluationRequirement_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Evaluation Requirement")
                    {
                    }
                    column(RatingType_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Rating Type")
                    {
                    }
                    column(TargetValueKPI_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Target Value/KPI")
                    {
                    }
                    column(TargetQty_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Target Qty")
                    {
                    }
                    column(ResponseValue_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Response Value")
                    {
                    }
                    column(BidResponseActualQty_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Bid Response Actual Qty")
                    {
                    }
                    column(Score_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Score %")
                    {
                    }
                    column(AssignedWeight_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Assigned Weight %")
                    {
                    }
                    column(WeightedLineScore_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Weighted Line Score")
                    {
                    }
                    column(EquipmentType_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Equipment Type")
                    {
                    }
                    column(DesiredPerfomanceDirection_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Desired Perfomance Direction")
                    {
                    }
                    column(EvaluationResults_TechnicalEvalRegLines;"Technical Eval Reg Lines"."Evaluation Results")
                    {
                    }
                    column(Remarks_TechnicalEvalRegLines;"Technical Eval Reg Lines".Remarks)
                    {
                    }
                }
            }
            dataitem("Financial Evaluation Register";"Bid Evaluation Register")
            {
                DataItemLink = "IFS Code"=field("IFS Code");
                DataItemTableView = where("Evaluation Type"=filter("Financial Evaluation"));
                column(ReportForNavId_84; 84)
                {
                }
                dataitem("Financial Eval Reg Lines";"Bid Evaluation Score Entry")
                {
                    DataItemLink = Code=field(Code);
                    column(ReportForNavId_88; 88)
                    {
                    }
                }
            }
            dataitem("Post Qual Evaluation Register";"Bid Evaluation Register")
            {
                column(ReportForNavId_85; 85)
                {
                }
                column(BidNo_PostQualEvaluationRegister;"Post Qual Evaluation Register"."Bid No.")
                {
                }
                column(VendorNo_PostQualEvaluationRegister;"Post Qual Evaluation Register"."Vendor No.")
                {
                }
                column(BidderName_PostQualEvaluationRegister;"Post Qual Evaluation Register"."Bidder Name")
                {
                }
                column(EvaluationDate_PostQualEvaluationRegister;"Post Qual Evaluation Register"."Evaluation Date")
                {
                }
                column(EvaluationVenue_PostQualEvaluationRegister;"Post Qual Evaluation Register"."Evaluation Venue")
                {
                }
                column(IFSCode_PostQualEvaluationRegister;"Post Qual Evaluation Register"."IFS Code")
                {
                }
                column(AppointedBidEvaluationCommi_PostQualEvaluationRegister;"Post Qual Evaluation Register"."Appointed Bid Evaluation Commi")
                {
                }
                dataitem("Post Qual Eval Reg Lines";"Bid Evaluation Score Entry")
                {
                    DataItemLink = Code=field(Code);
                    column(ReportForNavId_89; 89)
                    {
                    }
                }
            }
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
}

