#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69820 "Consolidated Interview Records"
{
    ApplicationArea = Basic;
    CardPageID = "Consolidated Interview Record";
    Editable = false;
    PageType = List;
    SourceTable = "Panel Chair Interview Line";
    SourceTableView = where("Document Type"=filter("Consolidated Interview Report"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Invitation No.";"Interview Invitation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Application No.";"Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No.";"Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Date";"Interview Date")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Start Time";"Interview Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Interview End Time";"Interview End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Venue";"Interview Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Room No.";"Room No.")
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

