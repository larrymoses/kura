#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65127 "Milestones Lines"
{
    PageType = List;
    SourceTable = "Milestones Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Task No";"Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Code";"Milestone Code")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Description";"Milestone Description")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Start Date";"Milestone Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone End Date";"Milestone End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notification Period";"Notification Period")
                {
                    ApplicationArea = Basic;
                }
                field("Notfification Date";"Notfification Date")
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

