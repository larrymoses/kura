#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 50089 "PaymentRequestsI"
{

    elements
    {
        dataitem(Measurement_Payment_Header;"Measurement &  Payment Header")
        {
            DataItemTableFilter = Import=filter(true);
            column(Document_No;"Document No.")
            {
            }
            column(Project_Name;"Project Name")
            {
            }
            column(Contract_Sum;"Contract Sum")
            {
            }
            column(Project_ID;"Project ID")
            {
            }
            column(Contractor_Name;"Contractor Name")
            {
            }
            column(Project_Start_Date;"Project Start Date")
            {
            }
            column(Project_End_Date;"Project End Date")
            {
            }
            column(Generate;Generate)
            {
            }
        }
    }
}

