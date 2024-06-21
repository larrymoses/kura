#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69750 "Background Checks"
{
    ApplicationArea = Basic;
    CardPageID = "Background Checks Card";
    PageType = List;
    SourceTable = "Background Checks Header";
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
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Panel Interview Report ID";"Panel Interview Report ID")
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
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No.";"Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Birth Date";"Birth Date")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field("ID Number";"ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Passport No.";"Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Registration(PIN)";"Tax Registration(PIN)")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control26;Outlook)
            {
            }
            systempart(Control27;Notes)
            {
            }
            systempart(Control28;MyNotes)
            {
            }
            systempart(Control29;Links)
            {
            }
        }
    }

    actions
    {
    }
}

