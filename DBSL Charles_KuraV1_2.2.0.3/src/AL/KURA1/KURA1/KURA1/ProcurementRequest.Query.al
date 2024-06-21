#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 50041 "ProcurementRequest"
{

    elements
    {
        dataitem(Procurement_Request;"Procurement Request")
        {
            DataItemTableFilter = Status=const(Released);
            column(No;No)
            {
            }
            column(Title;Title)
            {
            }
            column(Requisition_No;"Requisition No")
            {
            }
            column(Procurement_Plan_No;"Procurement Plan No")
            {
            }
            column(Creation_Date;"Creation Date")
            {
            }
            column(User_ID;"User ID")
            {
            }
            column(Procurement_Method;"Procurement Method")
            {
            }
            column(Process_Type;"Process Type")
            {
            }
            column(Procurement_Plan_Item;"Procurement Plan Item")
            {
            }
            column(Tender_Opening_Date;"Tender Opening Date")
            {
            }
            column(Tender_Status;"Tender Status")
            {
            }
            column(Tender_Closing_Date;"Tender Closing Date")
            {
            }
            column(Addedum;Addedum)
            {
            }
            column(Status;Status)
            {
            }
            column(Return_Date;"Return Date")
            {
            }
            column(Return_Time;"Return Time")
            {
            }
            column(Tender_Type;"Tender Type")
            {
            }
            column(Validity_Period;"Validity Period")
            {
            }
            column(Issued_Date;"Issued Date")
            {
            }
            column(Closed;Closed)
            {
            }
            column(RFQ_Sent;"RFQ Sent")
            {
            }
            column(Vendor_No;"Vendor No")
            {
            }
            column(Successful_Bidder;"Successful Bidder")
            {
            }
            column(Select_Bidder_Vendor_No;"Select Bidder Vendor No")
            {
            }
            column(Selected_Bidder_Name;"Selected Bidder Name")
            {
            }
            column(Quotation_Pending_Opening;"Quotation Pending Opening")
            {
            }
            dataitem(Supplier_Category;"Supplier Category")
            {
                DataItemLink = "Category Code"=Procurement_Request."Supplier Category";
                column(SupplierCategory;Description)
                {
                }
                column(Category_Code;"Category Code")
                {
                }
            }
        }
    }
}

