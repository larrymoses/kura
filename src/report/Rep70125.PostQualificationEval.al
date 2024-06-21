#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70125 "Post Qualification Eval"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Post Qualification Eval.rdlc';

    dataset
    {
        dataitem("Bid Evaluation Register";"Bid Evaluation Register")
        {
            DataItemTableView = where("Evaluation Type"=filter("Post Qualification"));
            column(ReportForNavId_74; 74)
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
            column(TenderNo;TenderNo)
            {
            }
            column(EvaluationType_BidEvaluationRegister;"Bid Evaluation Register"."Evaluation Type")
            {
            }
            column(Description_BidEvaluationRegister;"Bid Evaluation Register".Description)
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
            column(PostQuEvaluationDecision_BidEvaluationRegister;"Bid Evaluation Register"."Post Qu Evaluation  Decision")
            {
            }
            column(PostQualiCommRemarks_BidEvaluationRegister;"Bid Evaluation Register"."Post Quali Comm Remarks")
            {
            }
            column(PostQualificationReccommenda_BidEvaluationRegister;"Bid Evaluation Register"."Post Qualification Reccommenda")
            {
            }
            column(TenderName;UpperCase(TenderName))
            {
            }
            dataitem(ENTRY;"Bid Evaluation Score Entry")
            {
                DataItemLink = Code=field(Code);
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
                column(SNumberDetailed;SNumber)
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
                    ScoreEntry.Reset;
                    ScoreEntry.SetRange(ScoreEntry.Code,ENTRY.Code);
                    if ScoreEntry.FindSet then begin
                      SNumber:=SNumber;
                      end;
                      SNumber:=SNumber+1;
                end;
            }
            dataitem("Bid Score Requirement";"Bid Score Requirement")
            {
                DataItemLink = "Template ID"=field("Bid Scoring Document No.");
                DataItemTableView = where("Evaluation Type"=filter("Post Qualification"));
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
                DataItemLink = "Document No."=field("Appointed Bid Evaluation Commi");
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
                SNumber:=0;
                StandardPurchaseCode.Reset;
                StandardPurchaseCode.SetRange(StandardPurchaseCode.Code,"Bid Evaluation Register"."IFS Code");
                if StandardPurchaseCode.FindSet then begin
                  TenderName:=StandardPurchaseCode."Tender Name";
                  TenderNo:=StandardPurchaseCode."External Document No";
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
        TenderName: Text[250];
        StandardPurchaseCode: Record "Standard Purchase Code";
        TenderNo: Code[50];
}

