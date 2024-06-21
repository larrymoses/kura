#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70124 "NFinancial Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NFinancial Evaluation Report.rdlc';

    dataset
    {
        dataitem("Bid Evaluation Register";"Bid Evaluation Register")
        {
            column(ReportForNavId_1; 1)
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
            column(CIPhone;CompanyInformation."Phone No.")
            {
            }
            column(CIPic;CompanyInformation.Picture)
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
            column(TenderName;UpperCase(TenderName))
            {
            }
            column(Code_BidEvaluationRegister;"Bid Evaluation Register".Code)
            {
            }
            column(EvaluationType_BidEvaluationRegister;"Bid Evaluation Register"."Evaluation Type")
            {
            }
            column(IFSCode_BidEvaluationRegister;"Bid Evaluation Register"."IFS Code")
            {
            }
            column(FinalOpeningDone_BidEvaluationRegister;"Bid Evaluation Register"."Final Opening Done")
            {
            }
            column(PreliminaryEvaluationScore_BidEvaluationRegister;"Bid Evaluation Register"."Preliminary Evaluation Score")
            {
            }
            column(WeightedTechnicalEvalScore_BidEvaluationRegister;"Bid Evaluation Register"."Weighted Technical Eval Score")
            {
            }
            column(FinanceOpeningRegisterNo_BidEvaluationRegister;"Bid Evaluation Register"."Finance Opening Register No.")
            {
            }
            column(FinanceOpeningDate_BidEvaluationRegister;"Bid Evaluation Register"."Finance Opening Date")
            {
            }
            column(SensitivityAnalysisRemarks_BidEvaluationRegister;"Bid Evaluation Register"."Sensitivity Analysis Remarks")
            {
            }
            column(PreferenceReservationRemarks_BidEvaluationRegister;"Bid Evaluation Register"."Preference/Reservation Remarks")
            {
            }
            column(HasPostQualification_BidEvaluationRegister;"Bid Evaluation Register"."Has Post Qualification")
            {
            }
            dataitem(EPercentage;"Escalation Percentage")
            {
                DataItemLink = "Bid Register No"=field(Code);
                column(ReportForNavId_76; 76)
                {
                }
                column(ItemCatecory_EPercentage;EPercentage."Item Catecory")
                {
                }
                column(EscalationPercentage_EPercentage;EPercentage."Escalation Percentage")
                {
                }
                column(EscalationAmount_EPercentage;EPercentage."Escalation Amount")
                {
                }
                column(ItemCategoryDescription_EPercentage;EPercentage."Item Category Description")
                {
                }
                column(Amount_EPercentage;EPercentage.Amount)
                {
                }
                column(BidRegisterNo_EPercentage;EPercentage."Bid Register No")
                {
                }
                column(IFSCode_EPercentage;EPercentage."IFS Code")
                {
                }
            }
            dataitem("Finance Evaluation Line";"Finance Evaluation Line")
            {
                DataItemLink = "Document ID"=field(Code);
                column(ReportForNavId_12; 12)
                {
                }
                column(AutoBidNo3;AutoBidNo3)
                {
                }
                column(DocumentID_FinanceEvaluationLine;"Finance Evaluation Line"."Document ID")
                {
                }
                column(DocumentType_FinanceEvaluationLine;"Finance Evaluation Line"."Document Type")
                {
                }
                column(No_FinanceEvaluationLine;"Finance Evaluation Line"."No.")
                {
                }
                column(BidderNo_FinanceEvaluationLine;"Finance Evaluation Line"."Bidder No")
                {
                }
                column(BidderName_FinanceEvaluationLine;"Finance Evaluation Line"."Bidder Name")
                {
                }
                column(InvitationForSupplyNo_FinanceEvaluationLine;"Finance Evaluation Line"."Invitation For Supply No")
                {
                }
                column(FinalEvaluatedBidPrice_FinanceEvaluationLine;"Finance Evaluation Line"."Final Evaluated Bid Price")
                {
                }
                column(ReadoutBidPriceA_FinanceEvaluationLine;"Finance Evaluation Line"."Read-out Bid Price (A)")
                {
                }
                column(FinalTenderOutcome_FinanceEvaluationLine;"Finance Evaluation Line"."Final Tender Outcome")
                {
                }
                column(CorrectedDiscBidPrice_FinanceEvaluationLine;"Finance Evaluation Line"."Corrected & Disc Bid Price")
                {
                }
                column(FinacialAutoRanking_FinanceEvaluationLine;"Finance Evaluation Line"."Finacial Auto-Ranking")
                {
                }
                column(CorrectedBidPrice_FinanceEvaluationLine;"Finance Evaluation Line"."Corrected Bid Price")
                {
                }
                column(EvaluationCommitteeRemarks_FinanceEvaluationLine;"Finance Evaluation Line"."Evaluation Committee Remarks")
                {
                }
                column(EvaluationCommitteeRecomm_FinanceEvaluationLine;"Finance Evaluation Line"."Evaluation Committee Recomm")
                {
                }
                column(BidSum1;BidSum1)
                {
                }
                column(BidSum2;BidSum2)
                {
                }

                trigger OnAfterGetRecord()
                begin
                     PurchaseLine.Reset;
                     PurchaseLine.SetRange(PurchaseLine."Document No.","Finance Evaluation Line"."No.");
                     //PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type");
                     PurchaseLine.SetRange(PurchaseLine."Contract Type",PurchaseLine."contract type"::Construction);
                     PurchaseLine.CalcSums("Amount Including VAT");
                     BidSum1:=PurchaseLine."Amount Including VAT";

                     PurchaseLine.SetRange(PurchaseLine."Document No.","Finance Evaluation Line"."No.");
                     //PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type");
                     PurchaseLine.SetRange(PurchaseLine."Contract Type",PurchaseLine."contract type"::PBRM);
                     PurchaseLine.CalcSums("Amount Including VAT");
                     BidSum2:=PurchaseLine."Amount Including VAT";

                    PurchaseHeader1.Reset;
                    PurchaseHeader1.SetRange(PurchaseHeader1."No.","Finance Evaluation Line"."No.");
                    if PurchaseHeader1.FindSet then begin
                      AutoBidNo3:=Format(PurchaseHeader1."Auto Assigned No");
                      end;
                end;
            }
            dataitem(FLINES;"Finance Evaluation Line")
            {
                DataItemLink = "Document ID"=field(Code);
                column(ReportForNavId_68; 68)
                {
                }
                column(DocumentID_FLINES;FLINES."Document ID")
                {
                }
                column(DocumentType_FLINES;FLINES."Document Type")
                {
                }
                column(No_FLINES;FLINES."No.")
                {
                }
                column(BidderNo_FLINES;FLINES."Bidder No")
                {
                }
                column(BidderName_FLINES;FLINES."Bidder Name")
                {
                }
                dataitem(SensitivityAnalysis;"Fin Evaluation Lines")
                {
                    DataItemLink = "Document No"=field("Document ID"),"Bid No"=field("No."),"Bidder No"=field("Bidder No");
                    DataItemTableView = where(Type=filter(Sensitivity));
                    column(ReportForNavId_34; 34)
                    {
                    }
                    column(AutoBidNo1;AutoBidNo1)
                    {
                    }
                    column(EntryNo_SensitivityAnalysis;SensitivityAnalysis."Entry No")
                    {
                    }
                    column(DocumentNo_SensitivityAnalysis;SensitivityAnalysis."Document No")
                    {
                    }
                    column(BidNo_SensitivityAnalysis;SensitivityAnalysis."Bid No")
                    {
                    }
                    column(BidderName_SensitivityAnalysis;SensitivityAnalysis."Bidder Name")
                    {
                    }
                    column(EvaluatedTenderSum_SensitivityAnalysis;SensitivityAnalysis."Evaluated Tender Sum")
                    {
                    }
                    column(EscalatedTenderSum_SensitivityAnalysis;SensitivityAnalysis."Escalated Tender Sum")
                    {
                    }
                    column(Escalation_SensitivityAnalysis;SensitivityAnalysis."Escalation %")
                    {
                    }
                    column(Remarks_SensitivityAnalysis;SensitivityAnalysis.Remarks)
                    {
                    }
                    column(Type_SensitivityAnalysis;SensitivityAnalysis.Type)
                    {
                    }
                    column(BidderNo_SensitivityAnalysis;SensitivityAnalysis."Bidder No")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        PurchaseHeader1.Reset;
                        PurchaseHeader1.SetRange(PurchaseHeader1."No.",SensitivityAnalysis."Bid No");
                        if PurchaseHeader1.FindSet then begin
                          AutoBidNo1:=Format(PurchaseHeader1."Auto Assigned No");
                          end;
                    end;
                }
                dataitem(Rates;"Fin Evaluation Lines")
                {
                    DataItemLink = "Document No"=field("Document ID"),"Bid No"=field("No."),"Bidder No"=field("Bidder No");
                    DataItemTableView = where(Type=const(Rates));
                    column(ReportForNavId_45; 45)
                    {
                    }
                    column(AutoBidNo2;AutoBidNo2)
                    {
                    }
                    column(EntryNo_Rates;Rates."Entry No")
                    {
                    }
                    column(DocumentNo_Rates;Rates."Document No")
                    {
                    }
                    column(BidNo_Rates;Rates."Bid No")
                    {
                    }
                    column(BidderName_Rates;Rates."Bidder Name")
                    {
                    }
                    column(EvaluatedTenderSum_Rates;Rates."Evaluated Tender Sum")
                    {
                    }
                    column(EscalatedTenderSum_Rates;Rates."Escalated Tender Sum")
                    {
                    }
                    column(Escalation_Rates;Rates."Escalation %")
                    {
                    }
                    column(Remarks_Rates;Rates.Remarks)
                    {
                    }
                    column(Type_Rates;Rates.Type)
                    {
                    }
                    column(BidderNo_Rates;Rates."Bidder No")
                    {
                    }
                    column(BillItemMarketRate_Rates;Rates."Bill Item Market  Rate")
                    {
                    }
                    column(BidderBillItemRate_Rates;Rates."Bidder Bill Item Rate")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        PurchaseHeader1.Reset;
                        PurchaseHeader1.SetRange(PurchaseHeader1."No.",Rates."Bid No");
                        if PurchaseHeader1.FindSet then begin
                          AutoBidNo2:=Format(PurchaseHeader1."Auto Assigned No");
                          end;
                    end;
                }
                dataitem("Vendor Special Group Entry";"Vendor Special Group Entry")
                {
                    DataItemLink = "Vendor No"=field("Bidder No");
                    column(ReportForNavId_56; 56)
                    {
                    }
                    column(CertifcateNo_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Certifcate No")
                    {
                    }
                    column(VendorNo_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Vendor No")
                    {
                    }
                    column(RegisteredSpecialGroup_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Registered Special Group")
                    {
                    }
                    column(VendorName;VendorName)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        Vendor.Reset;
                        Vendor.SetRange(Vendor."No.","Vendor Special Group Entry"."Vendor No");
                        if Vendor.FindSet then
                          VendorName:=Vendor.Name;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                     PurchaseLine.Reset;
                     PurchaseLine.SetRange(PurchaseLine."Document No.","Finance Evaluation Line"."No.");
                     //PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type");
                     PurchaseLine.SetRange(PurchaseLine."Contract Type",PurchaseLine."contract type"::Construction);
                     PurchaseLine.CalcSums("Amount Including VAT");
                     BidSum1:=PurchaseLine."Amount Including VAT";

                     PurchaseLine.SetRange(PurchaseLine."Document No.","Finance Evaluation Line"."No.");
                     //PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type");
                     PurchaseLine.SetRange(PurchaseLine."Contract Type",PurchaseLine."contract type"::PBRM);
                     PurchaseLine.CalcSums("Amount Including VAT");
                     BidSum2:=PurchaseLine."Amount Including VAT";

                    PurchaseHeader1.Reset;
                    PurchaseHeader1.SetRange(PurchaseHeader1."No.","Finance Evaluation Line"."No.");
                    if PurchaseHeader1.FindSet then begin
                      AutoBidNo3:=Format(PurchaseHeader1."Auto Assigned No");
                      end;
                end;
            }
            dataitem("IFS Tender Committee";"IFS Tender Committee")
            {
                DataItemLink = "Document No."=field("Appointed Bid Evaluation Commi");
                column(ReportForNavId_97; 97)
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
                dataitem("IFS Tender Committee Member";"IFS Tender Committee Member")
                {
                    DataItemLink = "Document No."=field("Document No.");
                    column(ReportForNavId_87; 87)
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
                StandardPurchaseCode.Reset;
                StandardPurchaseCode.SetRange(StandardPurchaseCode.Code,"Bid Evaluation Register"."IFS Code");
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
        CompanyInformation: Record "Company Information";
        Vendor: Record Vendor;
        VendorName: Text[250];
        PurchaseLine: Record "Purchase Line";
        BidSum1: Decimal;
        BidSum2: Decimal;
        PurchaseHeader1: Record "Purchase Header";
        AutoBidNo1: Code[50];
        PurchaseHeader2: Record "Purchase Header";
        AutoBidNo2: Code[50];
        PurchaseHeader3: Record "Purchase Header";
        AutoBidNo3: Code[50];
        PurchaseHeader4: Record "Purchase Header";
        AutoBidNo4: Code[50];
        StandardPurchaseCode: Record "Standard Purchase Code";
        TenderNo: Code[50];
        TenderName: Text[250];
}

