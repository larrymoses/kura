#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 55010 "ProjectMembers"
{

    elements
    {
        dataitem(Project_Members;"Project Members")
        {
            column(Line_No;"Line No")
            {
            }
            column(Type_of_Expense;"Type of Expense")
            {
            }
            column(Time_Period;"Time Period")
            {
            }
            column(Imprest_Memo_No;"Imprest Memo No.")
            {
            }
            column(No;"No.")
            {
            }
            column(Work_Type;"Work Type")
            {
            }
            column(Name;Name)
            {
            }
            column(Type;Type)
            {
            }
            column(Direct_Unit_Cost;"Direct Unit Cost")
            {
            }
            column(Total_Entitlement;"Total Entitlement")
            {
            }
            column(Constituency_Code;"Constituency Code")
            {
            }
            column(Job_Task_Budget;"Job Task Budget")
            {
            }
            column(Job_Task_Remaining_Amount;"Job Task Remaining Amount")
            {
            }
            column(Status;Status)
            {
            }
            column(Project_Lead;"Project Lead")
            {
            }
            dataitem(Imprest_Memo;"Imprest Memo")
            {
                DataItemLink = "No."=Project_Members."Imprest Memo No.";
                column(ImprestNo;"No.")
                {
                }
                column(Requestor;Requestor)
                {
                }
                column(Destination_Name;"Destination Name")
                {
                }
                column(Destination;Destination)
                {
                }
                column(Subject;Subject)
                {
                }
                column(Imprest_Naration;"Imprest Naration")
                {
                }
            }
        }
    }
}

