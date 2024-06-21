#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Report 75013 "40%"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/40%.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = where("Document Type" = const(Order));
            RequestFilterFields = "Order Date", "PP Preference/Reservation Code", "Procurement Type";
            column(ReportForNavId_1; 1)
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(Amount_PurchaseHeader; "Purchase Header".Amount)
            {
            }
            column(PaytoName_PurchaseHeader; "Purchase Header"."Pay-to Name")
            {
            }
            column(DocumentType_PurchaseHeader; "Purchase Header"."Document Type")
            {
            }
            column(AmountIncludingVAT_PurchaseHeader; "Purchase Header"."Amount Including VAT")
            {
            }
            column(PPPlanningCategory_PurchaseHeader; "Purchase Header"."PP Planning Category")
            {
            }
            column(OrderDate_PurchaseHeader; "Purchase Header"."Order Date")
            {
            }
            column(PPPreferenceReservationCode_PurchaseHeader; "Purchase Header"."PP Preference/Reservation Code")
            {
            }
            column(Quotation_No_; "Quotation No.") { }
            column(Quotation_Description; "Quotation Description") { }

            column(SNO; SNO)
            {
            }

            trigger OnAfterGetRecord()
            begin
                SNO := SNO + 1;
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
        SNO := 0;
    end;

    var
        IFSTenderCommitteeMember: Record "IFS Tender Committee Member";
        IFSTenderCommittee: Record "IFS Tender Committee";
        // SMTPSetup: Record "Mail Setup";
        //SMTPMail: Codeunit 400;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        SentMail: Text;
        ProcurementSetup: Record "Procurement Setup";
        ReminderDate: Date;
        SNO: Integer;
}
