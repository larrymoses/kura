report 90005 "Stock Sheet/Summary"
{
    ApplicationArea = All;
    Caption = 'Stock Sheet/ Summary ';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Report/StockSheetSummary.rdlc';
    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "Posting Date";

            column(CompInfo; info.Name)
            {
            }
            column(CompAddr; info.Address)
            {
            }
            column(CompPhone; info."Phone No.")
            {
            }
            column(CompFax; info."Fax No.")
            {
            }
            column(No_; "No.")
            {

            }

            column(Applies_to_Doc__Type; "Applies-to Doc. Type")
            {

            }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {

            }

            column(Posting_Date; "Posting Date")

            {

            }

            column(Document_Date; "Document Date")
            {

            }

            column(External_Document_No_; "External Document No.")
            {

            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Name_2; "Bill-to Name 2")
            {

            }

            column(Amount; Amount)
            {

            }

            column(Amount_Including_VAT; "Amount Including VAT")
            {
            }


        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalUserArr: array[10] of Code[30];
        ApprovalDateArr: array[10] of DateTime;
        ArrCount: Integer;
        seq: Integer;
        dimVal: Record "Dimension Value";
        info: Record "Company Information";
        intApprovalNo: Integer;
        CompanyInfo: Record "Company Information";


}
