#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70063 "IFP Advert"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/IFP Advert.rdlc';

    dataset
    {
        dataitem("Request For Information";"Request For Information")
        {
            column(ReportForNavId_1; 1)
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
            column(ResponsibilityCenterdescr_RequestForInformation;"Request For Information"."Responsibility Center descr")
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
            column(DimensionSetID_RequestForInformation;"Request For Information"."Dimension Set ID")
            {
            }
            column(Constituency_RequestForInformation;"Request For Information".Constituency)
            {
            }
            column(DateFilter_RequestForInformation;"Request For Information"."Date Filter")
            {
            }
            column(Company;CompanyInf.Name)
            {
            }
            column(compemail;CompanyInf."E-Mail")
            {
            }
            column(Homepage;CompanyInf."Home Page")
            {
            }
            column(LOGO;CompanyInf.Picture)
            {
            }
            dataitem("RFI Required Document";"RFI Required Document")
            {
                DataItemLink = "Document No"=field(Code);
                column(ReportForNavId_77; 77)
                {
                }
                column(DocumentType_RFIRequiredDocument;"RFI Required Document"."Document Type")
                {
                }
                column(DocumentNo_RFIRequiredDocument;"RFI Required Document"."Document No")
                {
                }
                column(ProcurementDocumentTypeID_RFIRequiredDocument;"RFI Required Document"."Procurement Document Type ID")
                {
                }
                column(Document_desc;"RFI Required Document".Description)
                {
                }
                column(TrackCertificateExpiry_RFIRequiredDocument;"RFI Required Document"."Track Certificate Expiry")
                {
                }
                column(documentrec_type;"RFI Required Document"."Requirement Type")
                {
                }
                column(SpecialGroupRequirement_RFIRequiredDocument;"RFI Required Document"."Special Group Requirement")
                {
                }
                column(SpecializedProviderReq_RFIRequiredDocument;"RFI Required Document"."Specialized Provider Req")
                {
                }
            }
            dataitem("Company Information";"Company Information")
            {
                column(ReportForNavId_91; 91)
                {
                }
                column(Picture_CompanyInformation;"Company Information".Picture)
                {
                    IncludeCaption = true;
                }
                column(Name_CompanyInformation;"Company Information".Name)
                {
                }
                column(Name2_CompanyInformation;"Company Information"."Name 2")
                {
                }
                column(Address_CompanyInformation;"Company Information".Address)
                {
                }
                column(Address2_CompanyInformation;"Company Information"."Address 2")
                {
                }
                column(City_CompanyInformation;"Company Information".City)
                {
                }
                column(PhoneNo_CompanyInformation;"Company Information"."Phone No.")
                {
                }
                column(PhoneNo2_CompanyInformation;"Company Information"."Phone No. 2")
                {
                }
                column(LocationCode_CompanyInformation;"Company Information"."Location Code")
                {
                }
                column(ProcurementSupportEmail_CompanyInformation;"Company Information"."Procurement Support E-mail")
                {
                }
                column(EMail_CompanyInformation;"Company Information"."E-Mail")
                {
                }
                column(HomePage_CompanyInformation;"Company Information"."Home Page")
                {
                }
            }
            dataitem("RFI Prequalification Category";"RFI Prequalification Category")
            {
                DataItemLink = "Document No"=field(Code);
                column(ReportForNavId_58; 58)
                {
                }
                column(DocumentNo_RFIPrequalificationCategory;"RFI Prequalification Category"."Document No")
                {
                }
                column(PrequalificationCategoryID_RFIPrequalificationCategory;"RFI Prequalification Category"."Prequalification Category ID")
                {
                }
                column(Description_RFIPrequalificationCategory;"RFI Prequalification Category".Description)
                {
                }
                column(Amount_RFIPrequalificationCategory;"RFI Prequalification Category".Amount)
                {
                }
                column(PeriodStartDate_RFIPrequalificationCategory;"RFI Prequalification Category"."Period Start Date")
                {
                }
                column(PeriodEndDate_RFIPrequalificationCategory;"RFI Prequalification Category"."Period End Date")
                {
                }
                column(SubmissionStartDate_RFIPrequalificationCategory;"RFI Prequalification Category"."Submission Start Date")
                {
                }
                column(SubmissionStartTime_RFIPrequalificationCategory;"RFI Prequalification Category"."Submission Start Time")
                {
                }
                column(SubmissionEndDate_RFIPrequalificationCategory;"RFI Prequalification Category"."Submission End Date")
                {
                }
                column(SubmissionEndTime_RFIPrequalificationCategory;"RFI Prequalification Category"."Submission End Time")
                {
                }
                column(ApplicableLocation_RFIPrequalificationCategory;"RFI Prequalification Category"."Applicable Location")
                {
                }
                column(RestrictedRC_RFIPrequalificationCategory;"RFI Prequalification Category"."Restricted RC")
                {
                }
                column(RestrictedRCType_RFIPrequalificationCategory;"RFI Prequalification Category"."Restricted RC Type")
                {
                }
                column(RestrictedRCCode_RFIPrequalificationCategory;"RFI Prequalification Category"."Restricted RC Code")
                {
                }
                column(NoofSubmissions_RFIPrequalificationCategory;"RFI Prequalification Category"."No. of Submissions")
                {
                }
                column(DocumentType_RFIPrequalificationCategory;"RFI Prequalification Category"."Document Type")
                {
                }
                column(SpecialGroupReservation_RFIPrequalificationCategory;"RFI Prequalification Category"."Special Group Reservation")
                {
                }
                column(ProcurementType_RFIPrequalificationCategory;"RFI Prequalification Category"."Procurement Type")
                {
                }
                dataitem("RFI Category Requirement";"RFI Category Requirement")
                {
                    DataItemLink = "Category ID"=field("Prequalification Category ID");
                    column(ReportForNavId_86; 86)
                    {
                    }
                    column(CategoryID_RFICategoryRequirement;"RFI Category Requirement"."Category ID")
                    {
                    }
                    column(RequirementCode_RFICategoryRequirement;"RFI Category Requirement"."Requirement Code")
                    {
                    }
                    column(Description_RFICategoryRequirement;"RFI Category Requirement".Description)
                    {
                    }
                    column(RequirementType_RFICategoryRequirement;"RFI Category Requirement"."Requirement Type")
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

    trigger OnPreReport()
    begin
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
    end;

    var
        CompanyInf: Record "Company Information";
}

