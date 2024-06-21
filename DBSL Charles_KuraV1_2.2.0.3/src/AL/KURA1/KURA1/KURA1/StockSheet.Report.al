report 50001 "Stock Sheet"
{
    ApplicationArea = All;
    Caption = 'Stock Sheet ';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Report/StockSheet.rdlc';
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";

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
            // column(Vendor_Name; "Vendor Name")
            //{
            //
            // }
            column(Description; Description)
            {

            }
            column(Vendor_No_; "Vendor No.")
            {
            }
            column(Quantity; Quantity)
            {

            }
            column(TIME_PRINTED_____FORMAT_TIME_; 'TIME PRINTED:' + Format(Time))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4_; 'DATE PRINTED:' + Format(Today, 0, 4))
            {
                AutoFormatType = 1;
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
