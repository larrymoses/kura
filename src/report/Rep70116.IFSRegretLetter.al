#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70116 "IFS Regret Letter"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './Layouts/IFS Regret Letter.rdlc';
    RDLCLayout = './Layouts/IFS Regret Letter.rdl';
    dataset
    {
        dataitem(Bid_Lines;"Bid Tabulation Line")
        {
            RequestFilterFields = "Bidder No";
            column(InstitutionHeadName;InstitutionHeadName)
            {
                
            }
            column(ProcurementHeadTitle;ProcurementHeadTitle)
            {

            }
            column(ProcurementHead; ProcurementHead)
            {

            }
            column(ProcurementHSignature; UserSetupi.Picture)
            {

            }
            column(InstitutionHead; InstitutionHead)
            {

            }
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
            {

            }
            column(CompanyEmail;CompanyInfo."E-Mail")
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
            column(ReportForNavId_78; 78)
            {
            }
            column(CompanyName;Corec.Name)
            {
            }
            column(FinalEvaluationRemarks_BidLines;Bid_Lines."Final Evaluation Remarks")
            {
            }
            column(Logo;Corec.Picture)
            {
            }
            column(PhysicalAddress;Corec."Address 2")
            {
            }
            column(COAddress;Corec.Address)
            {
            }
            column(TelNo;Corec."Phone No.")
            {
            }
            column(MobileNo;Corec."Phone No. 2")
            {
            }
            column(Email;Corec."E-Mail")
            {
            }
            column(City;Corec.City)
            {
            }
            column(Website;Corec."Home Page")
            {
            }
            column(TabulationID_BidLines;Bid_Lines."Tabulation ID")
            {
            }
            column(TabulationType_BidLines;Bid_Lines."Tabulation Type")
            {
            }
            column(DocumentType_BidLines;Bid_Lines."Document Type")
            {
            }
            column(No_BidLines;Bid_Lines."No.")
            {
            }
            column(BidderNo_BidLines;Bid_Lines."Bidder No")
            {
            }
            column(BidderName_BidLines;Bid_Lines."Bidder Name")
            {
            }
            column(InvitationForSupplyNo_BidLines;Bid_Lines."Invitation For Supply No")
            {
            }
            column(BidCurrencyCode_BidLines;Bid_Lines."Bid Currency Code")
            {
            }
            column(PrebidRegisterNo_BidLines;Bid_Lines."Pre-bid Register No.")
            {
            }
            column(AttendedPrebidConference_BidLines;Bid_Lines."Attended Pre-bid Conference")
            {
            }
            column(PrebidConferenceDate_BidLines;Bid_Lines."Prebid Conference Date")
            {
            }
            column(BidOpeningRegisterNo_BidLines;Bid_Lines."Bid Opening Register No.")
            {
            }
            dataitem("Bid Tabulation Header";"Bid Tabulation Header")
            {
                DataItemLink = Code=field("Tabulation ID");
                column(ReportForNavId_1; 1)
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
                column(DocumentDate_BidTabulationHeader;Format("Bid Tabulation Header"."Document Date"))
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
                column(AwardAcceptanceDeadline_BidTabulationHeader;Format("Bid Tabulation Header"."Award Acceptance Deadline"))
                {
                }
                column(AwardAcceptanceResponse_BidTabulationHeader;Format("Bid Tabulation Header"."Award Acceptance Response"))
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
                column(Appealed_BidTabulationHeader;"Bid Tabulation Header".Appealed)
                {
                }
                column(LinkedtoNOA_BidTabulationHeader;"Bid Tabulation Header"."Linked to NOA")
                {
                }
                column(ReasonforRejection_BidTabulationHeader;"Bid Tabulation Header"."Reason for Rejection")
                {
                }
                column(ReasonforTenderTermination_BidTabulationHeader;"Bid Tabulation Header"."Reason for Tender Termination")
                {
                }
                column(TenderCancellationReason_BidTabulationHeader;"Bid Tabulation Header"."Tender Cancellation Reason")
                {
                }
                column(TerminationRequest_BidTabulationHeader;"Bid Tabulation Header"."Termination Request")
                {
                }
                dataitem("Bid Tabulation Line";"Bid Tabulation Line")
                {
                    DataItemLink = "Tabulation ID"=field(Code);
                    column(ReportForNavId_70; 70)
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
                    column(FinalEvaluatedBidPrice_BidTabulationLine;"Bid Tabulation Line"."Final Evaluated Bid Price")
                    {
                    }
                    column(ProfessionalOpinionOutcome_BidTabulationLine;"Bid Tabulation Line"."Professional Opinion Outcome")
                    {
                    }
                    column(ReadoutBidPriceA_BidTabulationLine;"Bid Tabulation Line"."Read-out Bid Price (A)")
                    {
                    }
                    column(DueDiligenceReportID_BidTabulationLine;"Bid Tabulation Line"."Due Diligence Report ID")
                    {
                    }
                }
                trigger OnAfterGetRecord()
                begin
                    ProcurementHead := '';
                    InstitutionHead := '';
                    ProcurementHeadTitle :='';
                    InstitutionHeadName:='';
                    ResponsibilityCenter.Reset();
                    ResponsibilityCenter.SetRange(Identifier, ResponsibilityCenter.Identifier::"Supply Chain");
                    ResponsibilityCenter.SetRange("Operating Unit Type", ResponsibilityCenter."Operating Unit Type"::"Department/Center");
                    if ResponsibilityCenter.FindFirst() then begin
                        if Emp2.Get(ResponsibilityCenter."Current Head") then begin
                            if Positions.Get(Emp2.Position) then
                             ProcurementHeadTitle := Positions."Job Title";
                            ProcurementHead := Emp2.FullName();
                            UserSetupi.Reset();
                            UserSetupi.SetRange("Employee No.", Emp2."No.");
                            if UserSetupi.FindFirst() then
                                UserSetupi.CalcFields(Picture);
                        end;
                    end;
                     ResponsibilityCenter.Reset();
                ResponsibilityCenter.SetRange(Identifier, ResponsibilityCenter.Identifier::"Institution Head");
                if ResponsibilityCenter.FindFirst() then begin
                        if Emp2.Get(ResponsibilityCenter."Current Head") then begin
                            InstitutionHeadName :=Emp2.FullName();
                            if Positions.Get(Emp2.Position) then
                                InstitutionHead := Positions."Job Title";
                        end;
                end;
                end;
                trigger OnPreDataItem()
                begin
                    Corec.CalcFields(Corec.Picture);
                    if CompanyInfo.get() then begin
                        CompanyInfo.CalcFields(Picture);
                        if RespCenter.Get("Primary Region") then
                            FormatAddr.GetCompanyAddr("Primary Region", RespCenter, CompanyInfo, CompanyAddr)
                        else
                            FormatAddr.Company(CompanyAddr, CompanyInfo);
                    end;
                end;
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

    trigger OnPreReport()
    begin
        Corec.CalcFields(Corec.Picture);
    end;

    var
        Corec: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        ProcurementHead: Text;
        InstitutionHead: Text;
        UserSetupi: Record "User Setup";
        Emp2: Record Employee;
        Positions: Record "Company Positions";
        ProcurementSignature: Record "User Setup";
        ProcurementHeadTitle: Text;
        DDSCMTitle:Text;
        DDSCM:Text;
        InstitutionHeadName: Text;
}

