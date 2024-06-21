#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70097 "IFP Responses Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/IFP Responses Report.rdlc';

    dataset
    {
        dataitem("Request For Information";"Request For Information")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(image1;corec.Picture)
            {
            }
            column(name;corec.Name)
            {
            }
            column(Code_RequestForInformation;"Request For Information".Code)
            {
            }
            column(Description_RequestForInformation;"Request For Information".Description)
            {
            }
            column(PeriodStartDate_RequestForInformation;"Request For Information"."Period Start Date")
            {
            }
            column(PeriodEndDate_RequestForInformation;"Request For Information"."Period End Date")
            {
            }
            dataitem("IFP Response Line";"IFP Response Line")
            {
                DataItemLink = "RFI Document No."=field(Code);
                column(ReportForNavId_7; 7)
                {
                }
                column(DocumentType_IFPResponseLine;"IFP Response Line"."Document Type")
                {
                }
                column(DocumentNo_IFPResponseLine;"IFP Response Line"."Document No.")
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
                column(EvaluationDecision_IFPResponseLine;"IFP Response Line"."Evaluation Decision")
                {
                }
                column(EvaluationScore_IFPResponseLine;"IFP Response Line"."Evaluation Score %")
                {
                }
                column(vendorname;vendorname)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ven.Reset;
                    ven.SetRange(ven."No.","IFP Response Line"."Vendor No.");
                    if ven.FindSet then begin
                    vendorname:=ven.Name;
                      //MESSAGE(vendorname);
                    end;
                end;
            }

            trigger OnPreDataItem()
            begin
                corec.Get;
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

    trigger OnPostReport()
    begin
        corec.Get;
        corec.CalcFields(corec.Picture);
    end;

    trigger OnPreReport()
    begin
        corec.Get;
        corec.CalcFields(corec.Picture);
    end;

    var
        corec: Record "Company Information";
        ven: Record Vendor;
        vendorname: Text;
        IFPResponseLine: Record "IFP Response Line";
}

