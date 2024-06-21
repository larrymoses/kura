#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56073 "ICT Helpdesk History List"
{
    ApplicationArea = Basic;
    Caption = 'ICT Helpdesk History';
    CardPageID = "ICT Helpdesk Historyyy";
    PageType = List;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status=const(Closed));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer";"Requesting Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer Name";"Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date";"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Request Time";"Request Time")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Physical Station";"Physical Station")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Service";"Nature of Service")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To";"Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By";"Attended By")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16;Links)
            {
            }
            systempart(Control15;MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}
