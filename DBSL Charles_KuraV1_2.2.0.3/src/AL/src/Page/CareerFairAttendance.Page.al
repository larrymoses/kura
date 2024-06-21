#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69649 "Career Fair Attendance"
{
    PageType = List;
    SourceTable = "Career Fair Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Attendee Type";"Attendee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name";"Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Email";"Representative Email")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Tel No";"Representative Tel No")
                {
                    ApplicationArea = Basic;
                }
                field("Notified on Email";"Notified on Email")
                {
                    ApplicationArea = Basic;
                }
                field("Date/Time Notified";"Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12;Outlook)
            {
            }
            systempart(Control13;Notes)
            {
            }
            systempart(Control14;MyNotes)
            {
            }
            systempart(Control15;Links)
            {
            }
        }
    }

    actions
    {
    }
}
