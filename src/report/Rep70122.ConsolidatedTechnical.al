#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70122 "Consolidated Technical"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Consolidated Technical.rdlc';

    dataset
    {
        dataitem("Bid Evaluation Header";"Bid Evaluation Header")
        {
            DataItemTableView = where("Evaluation Type"=filter("Technical Evaluation"));
            column(ReportForNavId_8; 8)
            {
            }
            column(CIName;CompanyInformation.Name)
            {
            }
            column(CIAddress;CompanyInformation.Address)
            {
            }
            column(CIAddress2;CompanyInformation."Address 2")
            {
            }
            column(CICity;CompanyInformation.City)
            {
            }
            column(CIPhoneNo;CompanyInformation."Phone No.")
            {
            }
            column(CIPicture;CompanyInformation.Picture)
            {
            }
            column(CIEmail;CompanyInformation."E-Mail")
            {
            }
            column(CIWebsite;CompanyInformation."Home Page")
            {
            }
            column(CIMotto;CompanyInformation.Motto)
            {
            }
            column(Code_BidEvaluationHeader;"Bid Evaluation Header".Code)
            {
            }
            column(TenderNo;TenderNo)
            {
            }
            column(TenderName;UpperCase(TenderName))
            {
            }
            column(EvaluationType_BidEvaluationHeader;"Bid Evaluation Header"."Evaluation Type")
            {
            }
            column(EvaluatorCategory_BidEvaluationHeader;"Bid Evaluation Header"."Evaluator Category")
            {
            }
            column(EvaluationLead_BidEvaluationHeader;"Bid Evaluation Header"."Evaluation Lead")
            {
            }
            column(EvaluationLeadName_BidEvaluationHeader;"Bid Evaluation Header"."Evaluation Lead Name")
            {
            }
            column(Description_BidEvaluationHeader;"Bid Evaluation Header".Description)
            {
            }
            column(EvaluationDate_BidEvaluationHeader;"Bid Evaluation Header"."Evaluation Date")
            {
            }
            column(EvaluationVenue_BidEvaluationHeader;"Bid Evaluation Header"."Evaluation Venue")
            {
            }
            column(IFSCode_BidEvaluationHeader;"Bid Evaluation Header"."IFS Code")
            {
            }
            column(TenderOpeningCommittee_BidEvaluationHeader;"Bid Evaluation Header"."Tender Opening Committee")
            {
            }
            column(TenderEvaluationCommittee_BidEvaluationHeader;"Bid Evaluation Header"."Tender Evaluation Committee")
            {
            }
            column(BidEvaluationCriteria_BidEvaluationHeader;"Bid Evaluation Header"."Bid Evaluation Criteria")
            {
            }
            column(Recommendation;Recommendation)
            {
            }
            column(TotalEvaluatedBids_BidEvaluationHeader;"Bid Evaluation Header"."Total Evaluated Bids")
            {
            }
            column(NoFailedPreliminary_BidEvaluationHeader;"Bid Evaluation Header"."No Failed Preliminary")
            {
            }
            column(NoPassedPreliminary_BidEvaluationHeader;"Bid Evaluation Header"."No Passed Preliminary")
            {
            }
            column(NoFailedTechnical_BidEvaluationHeader;"Bid Evaluation Header"."No Failed Technical")
            {
            }
            column(NoPassedTechnical_BidEvaluationHeader;"Bid Evaluation Header"."No Passed Technical")
            {
            }
            dataitem("Bid Evaluation Register";"Bid Evaluation Register")
            {
                DataItemLink = "IFS Code"=field("IFS Code"),"Last Evaluation Version No."=field("Last Evaluation Version No.");
                DataItemTableView = where("Evaluation Type"=filter("Technical Evaluation"));
                column(ReportForNavId_74; 74)
                {
                }
                column(EvaluationType_BidEvaluationRegister;"Bid Evaluation Register"."Evaluation Type")
                {
                }
                column(BidNo_BidEvaluationRegister;"Bid Evaluation Register"."Bid No.")
                {
                }
                column(VendorNo_BidEvaluationRegister;"Bid Evaluation Register"."Vendor No.")
                {
                }
                column(BidderName_BidEvaluationRegister;"Bid Evaluation Register"."Bidder Name")
                {
                }
                column(PreliminaryEvaluationScore_BidEvaluationRegister;"Bid Evaluation Register"."Preliminary Evaluation Score")
                {
                }
            }
            dataitem(SUMMARY;"Bid Evaluation Register")
            {
                DataItemLink = "IFS Code"=field("IFS Code"),"Last Evaluation Version No."=field("Last Evaluation Version No.");
                DataItemTableView = where("Evaluation Type"=filter("Technical Evaluation"),"Technical Evaluation  Decision"=const(Pass));
                column(ReportForNavId_93; 93)
                {
                }
                column(Code_SUMMARY;SUMMARY.Code)
                {
                }
                column(VendorNo_SUMMARY;SUMMARY."Vendor No.")
                {
                }
                column(BidderName_SUMMARY;SUMMARY."Bidder Name")
                {
                }
                column(AutoBidNo3;AutoBidNo3)
                {
                }
                column(SNumber3;SNumber3)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PurchaseHeader2.Reset;
                    PurchaseHeader2.SetRange(PurchaseHeader2."No.",SUMMARY."Bid No.");
                    if PurchaseHeader2.FindSet then begin
                      AutoBidNo3:=Format(PurchaseHeader2."Auto Assigned No");
                      end;

                    EvaluationRegister.Reset;
                    EvaluationRegister.SetRange(EvaluationRegister."IFS Code",SUMMARY."IFS Code");
                    if EvaluationRegister.FindSet then begin
                      SNumber3:=SNumber3;
                      end;
                      SNumber3:=SNumber3+1;
                end;
            }
            dataitem(ENTRY;"Bid Evaluation Score Entry")
            {
                DataItemLink = "IFS Code"=field("IFS Code"),"Last Evaluation Version No."=field("Last Evaluation Version No.");
                DataItemTableView = where("Evaluation Type"=filter("Technical Evaluation"));
                column(ReportForNavId_21; 21)
                {
                }
                column(Code_ENTRY;ENTRY.Code)
                {
                }
                column(VendorName;VendorName)
                {
                }
                column(LineNo_ENTRY;ENTRY."Line No")
                {
                }
                column(BidNo_ENTRY;ENTRY."Bid No.")
                {
                }
                column(VendorNo_ENTRY;ENTRY."Vendor No.")
                {
                }
                column(CriteriaGroup_ENTRY;ENTRY."Criteria Group")
                {
                }
                column(RequirementID_ENTRY;ENTRY."Requirement ID")
                {
                }
                column(EvaluationRequirement_ENTRY;ENTRY."Evaluation Requirement")
                {
                }
                column(RatingType_ENTRY;ENTRY."Rating Type")
                {
                }
                column(TargetValueKPI_ENTRY;ENTRY."Target Value/KPI")
                {
                }
                column(UnitofMeasure_ENTRY;ENTRY."Unit of Measure")
                {
                }
                column(TargetQty_ENTRY;ENTRY."Target Qty")
                {
                }
                column(ResponseValue_ENTRY;ENTRY."Response Value")
                {
                }
                column(BidResponseActualQty_ENTRY;ENTRY."Bid Response Actual Qty")
                {
                }
                column(Score_ENTRY;ENTRY."Score %")
                {
                }
                column(AssignedWeight_ENTRY;ENTRY."Assigned Weight %")
                {
                }
                column(WeightedLineScore_ENTRY;ENTRY."Weighted Line Score")
                {
                }
                column(EquipmentType_ENTRY;ENTRY."Equipment Type")
                {
                }
                column(DesiredPerfomanceDirection_ENTRY;ENTRY."Desired Perfomance Direction")
                {
                }
                column(BidScoringDocumentNo_ENTRY;ENTRY."Bid Scoring Document No.")
                {
                }
                column(BidScoringDocumentType_ENTRY;ENTRY."Bid Scoring Document Type")
                {
                }
                column(EvaluationResults_ENTRY;ENTRY."Evaluation Results")
                {
                }
                column(Remarks_ENTRY;ENTRY.Remarks)
                {
                }
                column(RequirementType_ENTRY;ENTRY."Requirement Type")
                {
                }
                column(Priority_ENTRY;ENTRY.Priority)
                {
                }
                column(ContractRefClause_ENTRY;ENTRY."Contract Ref Clause")
                {
                }
                column(REN;Recommendation)
                {
                }
                column(AutoBidNo2;AutoBidNo2)
                {
                }
                column(FinalScore;Score)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Vendors.Reset;
                    Vendors.SetRange("No.",ENTRY."Vendor No.");
                    if Vendors.FindSet then
                      VendorName:=Vendors.Name;

                     BidEvaluationRegister.Reset;
                     BidEvaluationRegister.SetRange(BidEvaluationRegister.Code,ENTRY.Code);
                      if BidEvaluationRegister.FindFirst then begin
                      Recommendation:=Format(BidEvaluationRegister."Technical Evaluation  Decision");
                    end;
                    PurchaseHeader2.Reset;
                    PurchaseHeader2.SetRange(PurchaseHeader2."No.",ENTRY."Bid No.");
                    if PurchaseHeader2.FindSet then begin
                      AutoBidNo2:=Format(PurchaseHeader2."Auto Assigned No");
                      end;

                    EvaluationScoreEntry.Reset;
                    EvaluationScoreEntry.SetRange(EvaluationScoreEntry."IFS Code",ENTRY."IFS Code");
                    EvaluationScoreEntry.SetRange(EvaluationScoreEntry."Evaluation Type",ENTRY."Evaluation Type");
                    EvaluationScoreEntry.SetRange(EvaluationScoreEntry.Code,ENTRY.Code);
                    EvaluationScoreEntry.SetRange(EvaluationScoreEntry."Line No",ENTRY."Line No");
                    EvaluationScoreEntry.SetRange(EvaluationScoreEntry."Evaluation Results",EvaluationScoreEntry."evaluation results"::Fail);
                    if EvaluationScoreEntry.FindSet then begin
                      //REPEAT
                      SNo:=SNo;
                      Score:='N'+Format(SNo);
                      SNo:=SNo+1;
                      end else begin
                      Score:='Y';
                      end;

                      //UNTIL EvaluationScoreEntry.NEXT=0;
                      //END;
                end;
            }
            dataitem(DETAILED;"Bid Evaluation Score Entry")
            {
                DataItemLink = "IFS Code"=field("IFS Code"),"Last Evaluation Version No."=field("Last Evaluation Version No.");
                DataItemTableView = where("Evaluation Type"=filter("Technical Evaluation"),"Evaluation Results"=const(Fail));
                column(ReportForNavId_81; 81)
                {
                }
                column(BidNo_DETAILED;DETAILED."Bid No.")
                {
                }
                column(VendorNo_DETAILED;DETAILED."Vendor No.")
                {
                }
                column(VendorName2;VendorName2)
                {
                }
                column(ResponseValue_DETAILED;DETAILED."Response Value")
                {
                }
                column(EvaluationResults_DETAILED;DETAILED."Evaluation Results")
                {
                }
                column(Remarks_DETAILED;DETAILED.Remarks)
                {
                }
                column(SNumber;SNumber)
                {
                }
                column(AutoBidNo;AutoBidNo)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Vendors2.Reset;
                    Vendors2.SetRange("No.",DETAILED."Vendor No.");
                    if Vendors2.FindSet then
                      VendorName2:=Vendors2.Name;

                    ScoreEntry.Reset;
                    ScoreEntry.SetRange(ScoreEntry."IFS Code",DETAILED."IFS Code");
                    if ScoreEntry.FindSet then begin
                      SNumber:=SNumber;
                      end;
                      SNumber:=SNumber+1;

                    PurchaseHeader.Reset;
                    PurchaseHeader.SetRange(PurchaseHeader."No.",DETAILED."Bid No.");
                    if PurchaseHeader.FindSet then begin
                      AutoBidNo:=Format(PurchaseHeader."Auto Assigned No");
                      end;
                end;
            }
            dataitem("Bid Score Requirement";"Bid Score Requirement")
            {
                DataItemLink = "Template ID"=field("Bid Evaluation Criteria");
                DataItemTableView = where("Evaluation Type"=filter("Technical Evaluation"));
                column(ReportForNavId_1; 1)
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
                column(TemplateID_BidScoreRequirement;"Bid Score Requirement"."Template ID")
                {
                }
                column(BidderResponse_BidScoreRequirement;"Bid Score Requirement"."Bidder Response")
                {
                }
                column(RatingType_BidScoreRequirement;"Bid Score Requirement"."Rating Type")
                {
                }
                column(EvaluationType_BidScoreRequirement;"Bid Score Requirement"."Evaluation Type")
                {
                }
                column(RequirementType_BidScoreRequirement;"Bid Score Requirement"."Requirement Type")
                {
                }
                column(Priority_BidScoreRequirement;"Bid Score Requirement".Priority)
                {
                }
                column(ContractRefClause_BidScoreRequirement;"Bid Score Requirement"."Contract Ref Clause")
                {
                }
                column(SNumber2;SNumber2)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    BidScoreRequirement.Reset;
                    BidScoreRequirement.SetRange(BidScoreRequirement."Template ID","Bid Score Requirement"."Template ID");
                    if BidScoreRequirement.FindSet then begin
                      SNumber2:=SNumber2;
                      end;
                      SNumber2:=SNumber2+1;
                end;
            }
            dataitem("IFS Tender Committee";"IFS Tender Committee")
            {
                DataItemLink = "Document No."=field("Tender Evaluation Committee");
                column(ReportForNavId_52; 52)
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
                column(AppointingAuthority_IFSTenderCommittee;"IFS Tender Committee"."Appointing Authority")
                {
                }
                column(IFSCode_IFSTenderCommittee;"IFS Tender Committee"."IFS Code")
                {
                }
                column(ExternalDocumentNo_IFSTenderCommittee;"IFS Tender Committee"."External Document No")
                {
                }
                column(Location_IFSTenderCommittee;"IFS Tender Committee".Location)
                {
                }
                column(Duration_IFSTenderCommittee;"IFS Tender Committee".Duration)
                {
                }
                column(EndDate;EndDate)
                {
                }
                dataitem("IFS Tender Committee Member";"IFS Tender Committee Member")
                {
                    DataItemLink = "Document No."=field("Document No.");
                    column(ReportForNavId_53; 53)
                    {
                    }
                    column(Role_IFSTenderCommitteeMember;"IFS Tender Committee Member".Role)
                    {
                    }
                    column(MemberName_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Member Name")
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                //Recommendation:='';
                // BidEvaluationScoreEntry.RESET;
                // BidEvaluationScoreEntry.SETRANGE(BidEvaluationScoreEntry.Code,"Bid Evaluation Header".Code);
                // BidEvaluationScoreEntry.SETRANGE(BidEvaluationScoreEntry."IFS Code","Bid Evaluation Header"."IFS Code");
                // BidEvaluationScoreEntry.SETRANGE(BidEvaluationScoreEntry."Vendor No.",BidEvaluationScoreEntry."Vendor No.");
                // BidEvaluationScoreEntry.SETFILTER(BidEvaluationScoreEntry."Response Value",'%1','NON RESPONSIVE');
                // IF BidEvaluationScoreEntry.FINDSET THEN BEGIN
                //  IF BidEvaluationScoreEntry."Response Value"='NON RESPONSIVE' THEN
                //  REPEAT
                //    Recommendation:='NR1'
                //   UNTIL BidEvaluationScoreEntry.NEXT=0;
                // END;

                //Recommendation:='';
                // BidEvaluationScoreEntry.RESET;
                // BidEvaluationScoreEntry.SETRANGE(BidEvaluationScoreEntry.Code,"Bid Evaluation Header".Code);
                // BidEvaluationScoreEntry.SETRANGE(BidEvaluationScoreEntry."IFS Code","Bid Evaluation Header"."IFS Code");
                // BidEvaluationScoreEntry.SETRANGE(BidEvaluationScoreEntry."Vendor No.",BidEvaluationScoreEntry."Vendor No.");
                // BidEvaluationScoreEntry.SETFILTER(BidEvaluationScoreEntry."Response Value",'%1','RESPONSIVE');
                // IF BidEvaluationScoreEntry.FINDSET THEN BEGIN
                //  IF BidEvaluationScoreEntry."Response Value"='RESPONSIVE' THEN
                //  REPEAT
                //    Recommendation:='R2'
                //   UNTIL BidEvaluationScoreEntry.NEXT=0;
                // END;
                SNumber:=0;
                SNumber2:=0;
                SNumber3:=0;
                SNo:=1;

                StandardPurchaseCode.Reset;
                StandardPurchaseCode.SetRange(StandardPurchaseCode.Code,"Bid Evaluation Header"."IFS Code");
                if StandardPurchaseCode.FindSet then begin
                  TenderNo:=StandardPurchaseCode."External Document No";
                  TenderName:=StandardPurchaseCode."Tender Name";
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        Vendors: Record Vendor;
        VendorName: Text[250];
        EndDate: Date;
        CompanyInformation: Record "Company Information";
        Recommendation: Text;
        BidEvaluationScoreEntry: Record "Bid Evaluation Score Entry";
        BidEvaluationRegister: Record "Bid Evaluation Register";
        SNumber: Integer;
        ScoreEntry: Record "Bid Evaluation Score Entry";
        Vendors2: Record Vendor;
        VendorName2: Text[250];
        PurchaseHeader: Record "Purchase Header";
        AutoBidNo: Code[50];
        PurchaseHeader2: Record "Purchase Header";
        AutoBidNo2: Code[50];
        SNumber2: Integer;
        BidScoreRequirement: Record "Bid Score Requirement";
        AutoBidNo3: Code[50];
        SNumber3: Integer;
        EvaluationRegister: Record "Bid Evaluation Register";
        EvaluationScoreEntry: Record "Bid Evaluation Score Entry";
        Score: Text[50];
        SNo: Integer;
        StandardPurchaseCode: Record "Standard Purchase Code";
        TenderNo: Code[50];
        TenderName: Text[250];
}

