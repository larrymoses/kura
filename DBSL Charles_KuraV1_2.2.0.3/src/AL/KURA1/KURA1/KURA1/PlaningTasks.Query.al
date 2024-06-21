#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 50065 "PlaningTasks"
{

    elements
    {
        dataitem(Contractor_Request_Task;"Contractor Request Task")
        {
            DataItemTableFilter = "Job Task Type"=const(Posting);
            column(Job_No;"Job No.")
            {
            }
            column(Job_Task_No;"Job Task No.")
            {
            }
            column(Description;Description)
            {
            }
            column(Job_Task_Type;"Job Task Type")
            {
            }
            column(Document_No;"Document No.")
            {
            }
            column(Document_Type;"Document Type")
            {
            }
            column(Usage_Total_Cost;"Usage (Total Cost)")
            {
            }
            column(Schedule_Total_Cost;"Schedule (Total Cost)")
            {
            }
        }
    }
}

