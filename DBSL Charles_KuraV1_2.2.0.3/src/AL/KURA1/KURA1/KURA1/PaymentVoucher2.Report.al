#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57009 "Payment Voucher2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payment Voucher2.rdlc';

    dataset
    {
        dataitem(payments;payments)
        {
            DataItemTableView = where("Payment Type"=const("Payment Voucher"));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.",Date,"Cheque No","Bank Code",Payee;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(No_Payments;payments."No.")
            {
            }
            column(Date_Payments;payments.Date)
            {
            }
            column(PaymentsNarration;payments."Payment Narration")
            {
            }
            column(Type_Payments;payments.Type)
            {
            }
            column(PayMode_Payments;payments."Pay Mode")
            {
            }
            column(ChequeNo_Payments;payments."Cheque No")
            {
            }
            column(ChequeDate_Payments;payments."Cheque Date")
            {
            }
            column(BankCode_Payments;payments."Bank Code")
            {
            }
            column(Payee_Payments;payments.Payee)
            {
            }
            column(Onbehalfof_Payments;payments."On behalf of")
            {
            }
            column(CreatedBy_Payments;payments."Created By")
            {
            }
            column(Posted_Payments;payments.Posted)
            {
            }
            column(PostedBy_Payments;payments."Posted By")
            {
            }
            column(PostedDate_Payments;payments."Posted Date")
            {
            }
            column(GlobalDimension1Code_Payments;payments."Shortcut Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Payments;payments."Shortcut Dimension 2 Code")
            {
            }
            column(TimePosted_Payments;payments."Time Posted")
            {
            }
            column(TotalAmount_Payments;payments."Total Amount")
            {
            }
            column(PayingBankAccount_Payments;payments."Paying Bank Account")
            {
            }
            column(Status_Payments;payments.Status)
            {
            }
            column(PaymentType_Payments;payments."Payment Type")
            {
            }
            column(Currency_Payments;payments.Currency)
            {
            }
            column(NoSeries_Payments;payments."No. Series")
            {
            }
            column(AccountType_Payments;payments."Account Type")
            {
            }
            column(AccountNo_Payments;payments."Account No.")
            {
            }
            column(AccountName_Payments;payments."Account Name")
            {
            }
            column(ImprestAmount_Payments;payments."Imprest Amount")
            {
            }
            column(Surrendered_Payments;payments.Surrendered)
            {
            }
            column(AppliesToDocNo_Payments;payments."Applies- To Doc No.")
            {
            }
            column(PettyCashAmount_Payments;payments."Petty Cash Amount")
            {
            }
            column(OriginalDocument_Payments;payments."Original Document")
            {
            }
            column(PVCreationDateTime_Payments;payments."PV Creation DateTime")
            {
            }
            column(PVCreatorID_Payments;payments."PV Creator ID")
            {
            }
            column(RemainingAmount_Payments;payments."Remaining Amount")
            {
            }
            column(ReceiptCreated_Payments;payments."Receipt Created")
            {
            }
            column(ImprestDeadline_Payments;payments."Imprest Deadline")
            {
            }
            column(ImprestSurrenderDate_Payments;payments."Surrender Date")
            {
            }
            column(DateFilter_Payments;payments."Date Filter")
            {
            }
            column(ImprestType_Payments;payments."Imprest Type")
            {
            }
            dataitem("PV Lines";"PV Lines")
            {
                DataItemLink = No=field("No.");
                column(ReportForNavId_1000000024; 1000000024)
                {
                }
                column(No_PVLines;"PV Lines".No)
                {
                }
                column(LineNo_PVLines;"PV Lines"."Line No")
                {
                }
                column(Date_PVLines;"PV Lines".Date)
                {
                }
                column(AccountType_PVLines;"PV Lines"."Account Type")
                {
                }
                column(AccountNo_PVLines;"PV Lines"."Account No")
                {
                }
                column(AccountName_PVLines;"PV Lines"."Account Name")
                {
                }
                column(Description_PVLines;"PV Lines".Description)
                {
                }
                column(Amount_PVLines;"PV Lines".Amount)
                {
                }
                column(Posted_PVLines;"PV Lines".Posted)
                {
                }
                column(PostedDate_PVLines;"PV Lines"."Posted Date")
                {
                }
                column(PostedTime_PVLines;"PV Lines"."Posted Time")
                {
                }
                column(GlobalDimension1Code_PVLines;"PV Lines"."Shortcut Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_PVLines;"PV Lines"."Shortcut Dimension 2 Code")
                {
                }
                column(AppliestoDocNo_PVLines;"PV Lines"."Applies to Doc. No")
                {
                }
                column(VATCode_PVLines;"PV Lines"."VAT Code")
                {
                }
                column(WTaxCode_PVLines;"PV Lines"."W/Tax Code")
                {
                }
                column(RetentionCode_PVLines;"PV Lines"."Retention Code1")
                {
                }
                column(VATAmount_PVLines;"PV Lines"."VAT Amount")
                {
                }
                column(WTaxAmount_PVLines;"PV Lines"."W/Tax Amount")
                {
                }
                column(RetentionAmount_PVLines;"PV Lines"."Retention Amount1")
                {
                }
                column(NetAmount_PVLines;"PV Lines"."Net Amount")
                {
                }
                column(WTVATCode_PVLines;"PV Lines"."W/T VAT Code")
                {
                }
                column(WTVATAmount_PVLines;"PV Lines"."W/T VAT Amount")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                //Ushindi
                /*
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText,TTotal,'');
                */

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
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array [2] of Text[80];
        TTotal: Decimal;
}

