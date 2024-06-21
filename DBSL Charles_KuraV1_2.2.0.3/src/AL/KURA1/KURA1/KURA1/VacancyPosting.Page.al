#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69648 "Vacancy Posting"
{
    PageType = List;
    SourceTable = "Vacancy Announcement Posting";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Announcement No.";"Announcement No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Type";"Posting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Board ID";"Job Board ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Advertisment Cost";"Advertisment Cost")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Posting Link";"Job Posting Link")
                {
                    ApplicationArea = Basic;
                }
                field("Channel Category";"Channel Category")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control15;Outlook)
            {
            }
            systempart(Control16;Notes)
            {
            }
            systempart(Control17;MyNotes)
            {
            }
            systempart(Control18;Links)
            {
            }
        }
    }

    actions
    {
    }
}

