#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70114 "Intention to Award Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Intention to Award Letter.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header";"Bid Tabulation Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyName;Corec.Name)
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
            column(Motto;Corec.Motto)
            {
            }
            column(CurrentHeadName;Corec."Current Head Name")
            {
            }
            column(ProcurementEmail;ProcurementEmail)
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
            column(JobTitle;JobTitle)
            {
            }
            column(DirectorateName;DirectorateName)
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
                "Bid Tabulation Header".CalcFields("Directorate ID");

                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Bid Tabulation Header"."Directorate ID");
                if ResponsibilityCenter.FindSet then begin
                  DirectorateName:=UpperCase(ResponsibilityCenter.Name);
                  end;


                  Positions.Reset;
                  Positions.SetRange(Positions."Position ID",Corec."Headed By");
                  if Positions.FindSet then
                    JobTitle:=UpperCase(Positions."Job Title");

                ProcurementSetup.Get;
                ProcurementEmail:=Lowercase(ProcurementSetup."Default Proc Email Contact");
                //MESSAGE(ProcurementEmail);
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

    trigger OnInitReport()
    begin
        Corec.Get;
        Corec.CalcFields(Picture);
    end;

    var
        Corec: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        Positions: Record Positions;
        JobTitle: Text[250];
        DirectorateName: Text[250];
        ProcurementSetup: Record "Procurement Setup";
        ProcurementEmail: Text[100];
}

