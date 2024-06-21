#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69640 "Work Shift Time"
{
    PageType = List;
    SourceTable = "Work Shift Time";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Day;Day)
                {
                    ApplicationArea = Basic;
                }
                field("Deployment Type";"Deployment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time";"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time";"End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Work Hrs/Day";"Minimum Work Hrs/Day")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;Notes)
            {
            }
            systempart(Control13;MyNotes)
            {
            }
            systempart(Control14;Links)
            {
            }
        }
    }

    actions
    {
    }
}

