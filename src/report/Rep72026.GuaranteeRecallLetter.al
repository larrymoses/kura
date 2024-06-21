#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Report 72026 "Guarantee Recall Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Guarantee Recall Letter.rdlc';

    dataset
    {
        dataitem("Quality Mgt.  Plan Checklist"; "Quality Mgt.  Plan Checklist")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CIName; CompanyInformation.Name)
            {
            }
            column(CIAddress; CompanyInformation.Address)
            {
            }
            column(CIAddress2; CompanyInformation."Address 2")
            {
            }
            column(CICity; CompanyInformation.City)
            {
            }
            column(CIPhone; CompanyInformation."Phone No.")
            {
            }
            column(CIPhone2; CompanyInformation."Phone No. 2")
            {
            }
            column(CIPic; CompanyInformation.Picture)
            {
            }
            column(CIEmail; CompanyInformation."E-Mail")
            {
            }
            column(CIWebsite; CompanyInformation."Home Page")
            {
            }
            column(CIMotto; CompanyInformation.Motto)
            {
            }
            // column(DocumentNo_GuaranteeRecallHeader;"Guarantee Recall Header"."Document No.")
            // {
            // }
            // column(DocumentType_GuaranteeRecallHeader;"Guarantee Recall Header"."Document Type")
            // {
            // }
            // column(ContractorID_GuaranteeRecallHeader;"Guarantee Recall Header"."Contractor ID")
            // {
            // }
            // column(ContractorName_GuaranteeRecallHeader;"Guarantee Recall Header"."Contractor Name")
            // {
            // }
            // column(ProjectID_GuaranteeRecallHeader;"Guarantee Recall Header"."Project ID")
            // {
            // }
            // column(ProjectName_GuaranteeRecallHeader;"Guarantee Recall Header"."Project Name")
            // {
            // }
            // column(InsurerGuarantorName_GuaranteeRecallHeader;"Guarantee Recall Header"."Insurer/Guarantor Name")
            // {
            // }
            // column(PolicyGuaranteeNo_GuaranteeRecallHeader;"Guarantee Recall Header"."Policy/Guarantee No")
            // {
            // }
            // column(ExpiryDate_GuaranteeRecallHeader;"Guarantee Recall Header"."Expiry Date")
            // {
            // }
            // column(AmountInsuredGuaranteed_GuaranteeRecallHeader;"Guarantee Recall Header"."Amount Insured/Guaranteed")
            // {
            // }
            // column(PurchaseContractID_GuaranteeRecallHeader;"Guarantee Recall Header"."Purchase Contract ID")
            // {
            // }
            // column(IssuerRegisteredOffices_GuaranteeRecallHeader;"Guarantee Recall Header"."Issuer Registered Offices")
            // {
            // }
            // column(BankCode_GuaranteeRecallHeader;"Guarantee Recall Header"."Bank Code")
            // {
            // }
            // column(BankName_GuaranteeRecallHeader;"Guarantee Recall Header"."Bank Name")
            // {
            // }
            // column(BankBranchName_GuaranteeRecallHeader;"Guarantee Recall Header"."Bank Branch Name")
            // {
            // }
            // column(BankAccountNo_GuaranteeRecallHeader;"Guarantee Recall Header"."Bank Account No")
            // {
            // }
            // column(ProjectContractSum_GuaranteeRecallHeader;"Guarantee Recall Header"."Project Contract Sum")
            // {
            // }
            // column(OrdertoCommenceDate_GuaranteeRecallHeader;"Guarantee Recall Header"."Order to Commence Date")
            // {
            // }
            // column(CommencementDate_GuaranteeRecallHeader;"Guarantee Recall Header"."Commencement Date")
            // {
            // }
            // column(ContractPeriod_GuaranteeRecallHeader;"Guarantee Recall Header"."Contract Period")
            // {
            // }
            // column(DLPPeriod_GuaranteeRecallHeader;"Guarantee Recall Header"."DLP Period")
            // {
            // }
            // column(TimeLapsed_GuaranteeRecallHeader;"Guarantee Recall Header"."Time Lapsed %")
            // {
            // }
            // column(ProjectPhysicalProgress_GuaranteeRecallHeader;"Guarantee Recall Header"."Project Physical Progress %")
            // {
            // }
            // column(ReferenceNo_GuaranteeRecallHeader;"Guarantee Recall Header"."Reference No")
            // {
            // }
            // column(AdvanceRecoveryAmount_GuaranteeRecallHeader;"Guarantee Recall Header"."Advance Recovery Amount")
            // {
            // }
            // column(AdvanceRecoveryBalance_GuaranteeRecallHeader;"Guarantee Recall Header"."Advance Recovery Balance")
            // {
            // }
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
        ResponsibilityCenter: Record "Responsibility Center";
}
