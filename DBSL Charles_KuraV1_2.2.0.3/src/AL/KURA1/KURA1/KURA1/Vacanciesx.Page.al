#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69336 "Vacanciesx"
{
    CardPageID = Vacancyx;
    PageType = List;
    SourceTable = Vacancyx;
    SourceTableView = where(Status=filter(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No.";"Requisition No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Id";"Job Id")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description";"Job Description")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Qty";"Requested Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applications End Time";"Applications End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Applications End Date";"Applications End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applications Start Date";"Applications Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Type";"Requisition Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Type of Contract";"Type of Contract")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control27;Outlook)
            {
            }
            systempart(Control28;Notes)
            {
            }
            systempart(Control29;MyNotes)
            {
            }
            systempart(Control30;Links)
            {
            }
        }
    }

    actions
    {
    }
}

