#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69776 "Phone Interview Lines"
{
    Caption = 'Phone Interview Lines';
    PageType = ListPart;
    SourceTable = "PreScreening Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                    Editable = false;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No.";"Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Mobile Phone No.";"Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Test Start Time";"Test Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Test End Time";"Test End Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions";"No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Outcome";"Phone Interview Outcome")
                {
                    ApplicationArea = Basic;
                }
                field(Notified;Notified)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("DateTime Notified";"DateTime Notified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Log)
            {
                action("Phone Log")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Phone Log";
                    RunPageLink = "Application No."=field("Application No."),
                                  "Document No."=field("Document No.");
                }
            }
        }
    }
}

