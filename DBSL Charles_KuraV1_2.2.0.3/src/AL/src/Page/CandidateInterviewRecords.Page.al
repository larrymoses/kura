#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69811 "Candidate Interview Records"
{
    ApplicationArea = Basic;
    CardPageID = "Candidate Interview Record";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Interview Record";
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
                field("Interview Scoresheet Template";"Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate Shortlist Vouch No.";"Candidate Shortlist Vouch No.")
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
                field("Panel Member No.";"Panel Member No.")
                {
                    ApplicationArea = Basic;
                }
                field(Member;Member)
                {
                    ApplicationArea = Basic;
                }
                field("Panel Interview Outcome";"Panel Interview Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Panel Interview Score %";"Panel Interview Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Panelist Interview Remarks";"Panelist Interview Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Unsuccesful App Reason Code";"Unsuccesful App Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
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

