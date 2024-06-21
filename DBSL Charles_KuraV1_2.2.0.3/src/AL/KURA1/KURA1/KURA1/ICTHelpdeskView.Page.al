#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56081 "ICT Helpdesk View"
{
    PageType = List;
    SourceTable = "ICT Helpdesk";

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
                field("Assigned To";"Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Date";"Assigned Date")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By";"Attended By")
                {
                    ApplicationArea = Basic;
                }
                field("Attended Date";"Attended Date")
                {
                    ApplicationArea = Basic;
                }
                field("Attended Time";"Attended Time")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

