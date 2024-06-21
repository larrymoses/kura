#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70103 "Bid Response"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bid Response.rdlc';

    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(logo;corec.Picture)
            {
            }
            column(CompanyName;corec.Name)
            {
            }
            column(BuyfromVendorNo_PurchaseHeader;"Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(No_PurchaseHeader;"Purchase Header"."No.")
            {
            }
            column(BuyfromVendorName_PurchaseHeader;"Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromAddress_PurchaseHeader;"Purchase Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader;"Purchase Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchaseHeader;"Purchase Header"."Buy-from City")
            {
            }
            column(BuyfromContactNo_PurchaseHeader;"Purchase Header"."Buy-from Contact No.")
            {
            }
            column(BuyfromPostCode_PurchaseHeader;"Purchase Header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchaseHeader;"Purchase Header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseHeader;"Purchase Header"."Buy-from Country/Region Code")
            {
            }
            column(InvitationForSupplyNo_PurchaseHeader;"Purchase Header"."Invitation For Supply No")
            {
            }
            column(BidEnvelopeType_PurchaseHeader;"Purchase Header"."Bid Envelope Type")
            {
            }
            column(TenderDescription_PurchaseHeader;"Purchase Header"."Tender Description")
            {
            }
            column(BidderType_PurchaseHeader;"Purchase Header"."Bidder Type")
            {
            }
            column(BidderRepresentativeName_PurchaseHeader;"Purchase Header"."Bidder Representative Name")
            {
            }
            column(BidderRepresentativeDesgn_PurchaseHeader;"Purchase Header"."Bidder Representative Desgn")
            {
            }
            column(BidderRepresentativeAddress_PurchaseHeader;"Purchase Header"."Bidder Representative Address")
            {
            }
            column(BidderWitnessName_PurchaseHeader;"Purchase Header"."Bidder Witness Name")
            {
            }
            column(BidderWitnessDesignation_PurchaseHeader;"Purchase Header"."Bidder Witness Designation")
            {
            }
            column(BidderWitnessAddress_PurchaseHeader;"Purchase Header"."Bidder Witness Address")
            {
            }
            column(TenderDocumentSource_PurchaseHeader;"Purchase Header"."Tender Document Source")
            {
            }
            column(BidChargeLCY_PurchaseHeader;"Purchase Header"."Bid Charge (LCY)")
            {
            }
            column(PrimaryRegion_PurchaseHeader;"Purchase Header"."Primary Region")
            {
            }
            column(BuildingHouseNo_PurchaseHeader;"Purchase Header"."Building/House No")
            {
            }
            column(PlotNo_PurchaseHeader;"Purchase Header"."Plot No")
            {
            }
            column(Street_PurchaseHeader;"Purchase Header".Street)
            {
            }
            column(NatureofBusiness_PurchaseHeader;"Purchase Header"."Nature of Business")
            {
            }
            column(CurrentTradeLicenceNo_PurchaseHeader;"Purchase Header"."Current Trade Licence No")
            {
            }
            column(TradeLicenceExpiryDate_PurchaseHeader;"Purchase Header"."Trade Licence Expiry Date")
            {
            }
            column(MaxValueofBusiness_PurchaseHeader;"Purchase Header"."Max Value of Business")
            {
            }
            column(PreferredBankAccountCode_PurchaseHeader;"Purchase Header"."Preferred Bank Account Code")
            {
            }
            column(BankersName_PurchaseHeader;"Purchase Header"."Bankers Name")
            {
            }
            column(BusinessType_PurchaseHeader;"Purchase Header"."Business Type")
            {
            }
            column(NominalCapitalLCY_PurchaseHeader;"Purchase Header"."Nominal Capital LCY")
            {
            }
            column(IssuedCapitalLCY_PurchaseHeader;"Purchase Header"."Issued Capital LCY")
            {
            }
            dataitem("Purchase Line";"Purchase Line")
            {
                DataItemLink = "Document No."=field("No.");
                column(ReportForNavId_24; 24)
                {
                }
                column(Type_PurchaseLine;"Purchase Line".Type)
                {
                }
                column(DocumentNo_PurchaseLine;"Purchase Line"."Document No.")
                {
                }
                column(No_PurchaseLine;"Purchase Line"."No.")
                {
                }
                column(Description_PurchaseLine;"Purchase Line".Description)
                {
                }
                column(UnitofMeasure_PurchaseLine;"Purchase Line"."Unit of Measure")
                {
                }
                column(Quantity_PurchaseLine;"Purchase Line".Quantity)
                {
                }
                column(UnitCostLCY_PurchaseLine;"Purchase Line"."Unit Cost (LCY)")
                {
                }
                column(AmountIncludingVAT_PurchaseLine;"Purchase Line"."Amount Including VAT")
                {
                }
            }
            dataitem("Bid Filed Document";"Bid Filed Document")
            {
                DataItemLink = "No."=field("No."),"Vendor No"=field("Vendor No.");
                column(ReportForNavId_46; 46)
                {
                }
                column(Description_BidFiledDocument;"Bid Filed Document".Description)
                {
                }
                column(CertificateNo_BidFiledDocument;"Bid Filed Document"."Certificate No.")
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

