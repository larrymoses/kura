#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70121 "Tender Opening Report"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './Layouts/Tender Opening Report.rdlc';
 RDLCLayout = './Layouts/Tender Opening Report.rdl';
    dataset
    {
        dataitem("Bid Opening Register";"Bid Opening Register")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(ComapanyAbbreviation;CompanyInfor."Company Abbreviation")
            {

            }
            column(logo;CompanyInfor.Picture)
            {
            }
            column(name;UpperCase(CompanyInfor.Name))
            {
            }
            column(CIAddress;CompanyInfor.Address)
            {
            }
            column(CIAddress2;CompanyInfor."Address 2")
            {
            }
            column(CICity;CompanyInfor.City)
            {
            }
            column(CIPhoneNo;CompanyInfor."Phone No.")
            {
            }
            column(CIEmail;CompanyInfor."E-Mail")
            {
            }
            column(CIWebsite;CompanyInfor."Home Page")
            {
            }
            column(CIMotto;CompanyInfor.Motto)
            {
            }
            column(EngBidSum1;EngBidSum1)
            {
            }
            column(EngBidSum2;EngBidSum2)
            {
            }
            column(TotalEngEstimates;TotalEngEstimates)
            {
            }
            column(TotalEngineerEstimates_BidOpeningRegister;"Bid Opening Register"."Total Engineer Estimates")
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
            column(TenderName_BidOpeningRegister;UpperCase("Bid Opening Register"."Tender Name"))
            {
            }
            column(BidOpeningDate_BidOpeningRegister;Format("Bid Opening Register"."Bid Opening Date"))
            {
            }
            column(BidOpeningStartTime_BidOpeningRegister;Format("Bid Opening Register"."Bid Opening Start Time"))
            {
            }
            column(BidOpeningEndDate_BidOpeningRegister;Format("Bid Opening Register"."Bid Opening End Date"))
            {
            }
            column(BidOpeningEndTime_BidOpeningRegister;Format("Bid Opening Register"."Bid Opening End Time"))
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
            dataitem("Bid Opening Bidder Attendance";"Bid Opening Bidder Attendance")
            {
                DataItemLink = Code=field(Code),"IFS Code"=field("IFS Code");
                column(ReportForNavId_50; 50)
                {
                }
                column(Code_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance".Code)
                {
                }
                column(IFSCode_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."IFS Code")
                {
                }
                column(VendorNo_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Vendor No.")
                {
                }
                column(BidderRepresentativeName_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Bidder Representative Name")
                {
                }
                column(RepresentativeEmail_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Representative Email")
                {
                }
                column(RepresentativeTelNo_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Representative Tel No")
                {
                }
                column(DateTimeNotified_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Date/Time Notified")
                {
                }
                column(EntryNo_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Entry No")
                {
                }
                column(Designation_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance".Designation)
                {
                }
                column(VendorName_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Vendor Name")
                {
                }
                column(PostalAddress_BidOpeningBidderAttendance;"Bid Opening Bidder Attendance"."Postal Address")
                {
                }
            }
            dataitem("Bid Opening Register Line";"Bid Opening Register Line")
            {
                DataItemLink = Code=field(Code),"IFS Code"=field("IFS Code");
                column(ReportForNavId_27; 27)
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
                column(Rank_BidOpeningRegisterLine;"Bid Opening Register Line".Rank)
                {
                }
                column(AssignedBidNo_BidOpeningRegisterLine;"Bid Opening Register Line"."Assigned Bid No.")
                {
                }
                column(BidSum1;BidSum1)
                {
                }
                column(BidSum2;BidSum2)
                {
                }
                column(AutoAssignedNo;AutoAssignedNo)
                {
                }
                column(NoOfPages_BidOpeningRegisterLine;"Bid Opening Register Line"."No Of Pages")
                {
                }
                column(TaxComplianceCertificate_BidOpeningRegisterLine;"Bid Opening Register Line"."Tax Compliance Certificate")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    BidSum1:=0;
                    BidSum2:=0;

                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document No.","Bid Opening Register Line"."Bid No.");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", "Bid Opening Register Line"."Vendor No.");
                    PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."document type"::Quote);
                    PurchaseLine.SetRange(PurchaseLine."Contract Type",PurchaseLine."contract type"::Construction);
                    if PurchaseLine.FindSet then begin
                    PurchaseLine.CalcSums("Amount Including VAT");
                    BidSum1:=PurchaseLine."Amount Including VAT";
                    end;

                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document No.","Bid Opening Register Line"."Bid No.");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", "Bid Opening Register Line"."Vendor No.");
                    PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."document type"::Quote);
                    PurchaseLine.SetRange(PurchaseLine."Contract Type",PurchaseLine."contract type"::PBRM);
                    if PurchaseLine.FindSet then begin
                    PurchaseLine.CalcSums("Amount Including VAT");
                    BidSum2:=PurchaseLine."Amount Including VAT";
                    end;

                    PurchaseHeader.Reset;
                    PurchaseHeader.SetRange(PurchaseHeader."No.","Bid Opening Register Line"."Bid No.");
                    if PurchaseHeader.FindSet then begin
                      AutoAssignedNo:=Format(PurchaseHeader."Auto Assigned No");
                      end
                end;
            }
            dataitem("Tender Opening Summary Note";"Tender Opening Summary Note")
            {
                DataItemLink = "Register ID"=field(Code);
                column(ReportForNavId_60; 60)
                {
                }
                column(RegisterID_TenderOpeningSummaryNote;"Tender Opening Summary Note"."Register ID")
                {
                }
                column(AgendaCode_TenderOpeningSummaryNote;"Tender Opening Summary Note"."Agenda Code")
                {
                }
                column(LineNo_TenderOpeningSummaryNote;"Tender Opening Summary Note"."Line No.")
                {
                }
                column(ItemDiscussed_TenderOpeningSummaryNote;"Tender Opening Summary Note"."Item Discussed")
                {
                }
                column(SummaryNotes_TenderOpeningSummaryNote;"Tender Opening Summary Note"."Summary Notes")
                {
                }
                column(ReferencedSectionofTender_TenderOpeningSummaryNote;"Tender Opening Summary Note"."Referenced Section of Tender")
                {
                }
                column(ReferencedClauseofTender_TenderOpeningSummaryNote;"Tender Opening Summary Note"."Referenced Clause of Tender")
                {
                }
            }
            dataitem("IFS Tender Committee";"IFS Tender Committee")
            {
                DataItemLink = "Document No."=field("Appointed Bid Opening Com");
                column(ReportForNavId_72; 72)
                {
                }
                column(DocumentNo_IFSTenderCommittee;"IFS Tender Committee"."Document No.")
                {
                }
                column(CommitteeType_IFSTenderCommittee;"IFS Tender Committee"."Committee Type")
                {
                }
                column(AppointmentEffectiveDate_IFSTenderCommittee;"IFS Tender Committee"."Appointment Effective Date")
                {
                }
                column(IFSCode_IFSTenderCommittee;"IFS Tender Committee"."IFS Code")
                {
                }
                dataitem("IFS Tender Committee Member";"IFS Tender Committee Member")
                {
                    DataItemLink = "Document No."=field("Document No.");
                    column(ReportForNavId_74; 74)
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
                }
            }

            trigger OnAfterGetRecord()
            begin
                EngBidSum1:=0;
                EngBidSum2:=0;
                TotalEngEstimates:=Format("Bid Opening Register"."Total Engineer Estimates");

                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.","Bid Opening Register"."Job No");
                JobPlanningLine.SetRange(JobPlanningLine."Contract Type",JobPlanningLine."contract type"::Construction);
                if JobPlanningLine.FindSet then begin
                  JobPlanningLine.CalcSums("Total Cost");
                  EngBidSum1:=JobPlanningLine."Total Cost";
                  end;

                 JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.","Bid Opening Register"."Job No");
                JobPlanningLine.SetRange(JobPlanningLine."Contract Type",JobPlanningLine."contract type"::PBRM);
                if JobPlanningLine.FindSet then begin
                  JobPlanningLine.CalcSums("Total Cost");
                  EngBidSum2:=JobPlanningLine."Total Cost";
                  end;
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
        CompanyInfor.Get();
        CompanyInfor.CalcFields(CompanyInfor.Picture);
    end;

    var
        CompanyInfor: Record "Company Information";
        BidSum1: Decimal;
        BidSum2: Decimal;
        PurchaseLine: Record "Purchase Line";
        AutoAssignedNo: Code[50];
        PurchaseHeader: Record "Purchase Header";
        JobPlanningLine: Record "Job Planning Line";
        EngBidSum1: Decimal;
        EngBidSum2: Decimal;
        TotalEngEstimates: Text;
}

