#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95323 "Batch Payment List - Pending"
{
    CardPageID = "Batch Payment Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bank Payments Batching";
    SourceTableView = where("Approval  Status"=filter("Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Batch No";"Batch No")
                {
                    ApplicationArea = Basic;
                }
                field("Description/Remarks";"Description/Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Approval  Status";"Approval  Status")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By";"Prepared By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Processed";"Payment Processed")
                {
                    ApplicationArea = Basic;
                }
                field("File Generated By";"File Generated By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Processed";"Date Processed")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

