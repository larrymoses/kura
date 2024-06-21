#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70102 "Prequalification Response"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Prequalification Response.rdlc';

    dataset
    {
        dataitem("RFI Response";"RFI Response")
        {
            DataItemTableView = where("Document Type"=filter("IFP Response"));
            column(ReportForNavId_1; 1)
            {
            }
            column(logo;corec.Picture)
            {
            }
            column(CompanyName;corec.Name)
            {
            }
            column(DocumentNo_RFIResponse;"RFI Response"."Document No.")
            {
            }
            column(VendorNo_RFIResponse;"RFI Response"."Vendor No.")
            {
            }
            column(VendorName_RFIResponse;"RFI Response"."Vendor Name")
            {
            }
            column(RFIDocumentNo_RFIResponse;"RFI Response"."RFI Document No.")
            {
            }
            column(VendorRepresentativeName_RFIResponse;"RFI Response"."Vendor Representative Name")
            {
            }
            column(VendorReprDesignation_RFIResponse;"RFI Response"."Vendor Repr Designation")
            {
            }
            column(VendorAddress_RFIResponse;"RFI Response"."Vendor Address")
            {
            }
            column(VendorAddress2_RFIResponse;"RFI Response"."Vendor Address 2")
            {
            }
            column(DateSubmitted_RFIResponse;"RFI Response"."Date Submitted")
            {
            }
            column(City_RFIResponse;"RFI Response".City)
            {
            }
            column(PhoneNo_RFIResponse;"RFI Response"."Phone No.")
            {
            }
            column(CountryRegionCode_RFIResponse;"RFI Response"."Country/Region Code")
            {
            }
            column(PostCode_RFIResponse;"RFI Response"."Post Code")
            {
            }
            column(County_RFIResponse;"RFI Response".County)
            {
            }
            column(EMail_RFIResponse;"RFI Response"."E-Mail")
            {
            }
            column(ResponsibilityCenterID_RFIResponse;"RFI Response"."Responsibility Center ID")
            {
            }
            column(Description_RFIResponse;"RFI Response".Description)
            {
            }
            column(SpecialGroupVendor_RFIResponse;"RFI Response"."Special Group Vendor")
            {
            }
            column(SpecialGroupCategory_RFIResponse;"RFI Response"."Special Group Category")
            {
            }
            column(FinalEvaluationScore_RFIResponse;"RFI Response"."Final Evaluation Score")
            {
            }
            column(DocumentStatus_RFIResponse;"RFI Response"."Document Status")
            {
            }
            column(NoSeries_RFIResponse;"RFI Response"."No. Series")
            {
            }
            column(CreatedBy_RFIResponse;"RFI Response"."Created By")
            {
            }
            column(CreatedDate_RFIResponse;"RFI Response"."Created Date")
            {
            }
            column(CreatedTime_RFIResponse;"RFI Response"."Created Time")
            {
            }
            dataitem("Request For Information";"Request For Information")
            {
                DataItemLink = Code=field("RFI Document No.");
                column(ReportForNavId_41; 41)
                {
                }
                column(Description_RequestForInformation;"Request For Information".Description)
                {
                }
                column(SubmissionEndDate_RequestForInformation;"Request For Information"."Submission End Date")
                {
                }
            }
            dataitem("IFP Response Line";"IFP Response Line")
            {
                DataItemLink = "Document No."=field("Document No.");
                column(ReportForNavId_24; 24)
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
                column(DocumentNo_IFPResponseLine;"IFP Response Line"."Document No.")
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
                column(ResponsibilityCenterID_IFPResponseLine;"IFP Response Line"."Responsibility Center ID")
                {
                }
                column(Description_IFPResponseLine;"IFP Response Line".Description)
                {
                }
                column(Constituency_IFPResponseLine;"IFP Response Line".Constituency)
                {
                }
            }
            dataitem("RFI Response Filed Document";"RFI Response Filed Document")
            {
                DataItemLink = "Document No"=field("Document No."),"Vendor No"=field("Vendor No.");
                column(ReportForNavId_46; 46)
                {
                }
                column(DocumentDescription_RFIResponseFiledDocument;"RFI Response Filed Document"."Document Description")
                {
                }
                column(CertificateNo_RFIResponseFiledDocument;"RFI Response Filed Document"."Certificate No.")
                {
                }
            }

            trigger OnPreDataItem()
            begin
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

    trigger OnPreReport()
    begin
        corec.CalcFields(corec.Picture);
    end;

    var
        corec: Record "Company Information";
        SerialNo: Integer;
}

