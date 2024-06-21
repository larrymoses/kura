#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69706 "Candidate Shortlist Lines"
{
    PageType = ListPart;
    SourceTable = "Candidate Shortlist Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
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
                field("Candidate No";"Candidate No")
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
                field("Complete Doc Submitted";"Complete Doc Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Shortlisting Outcome";"Shortlisting Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Remarks";"Committee Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Unsuccesfull App Reason Code";"Unsuccesfull App Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Report ID";"Ability Test Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Report ID";"Phone Interview Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Pass Score %";"Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Outcome";"Phone Interview Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No.";"Employee No.")
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
                field("Tax Registration No.";"Tax Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Marital Status";"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Group";"Ethnic Group")
                {
                    ApplicationArea = Basic;
                }
                field(Nationality;Nationality)
                {
                    ApplicationArea = Basic;
                }
                field("Specialization Area";"Specialization Area")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic Qualification";"Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Name";"Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Experience (Years)";"Work Experience (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Management Experience (Years)";"Management Experience (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Disability Code";"Disability Code")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled;Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Disability Description";"Disability Description")
                {
                    ApplicationArea = Basic;
                }
                field("Disability Certificate No";"Disability Certificate No")
                {
                    ApplicationArea = Basic;
                }
                field(Notified;Notified)
                {
                    ApplicationArea = Basic;
                }
                field("Notified On";"Notified On")
                {
                    ApplicationArea = Basic;
                }
                field(Religion;Religion)
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic Hierarchy Poi";"Highest Academic Hierarchy Poi")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Candidate Score")
            {
                action("Candidate Shortlist Score")
                {
                    ApplicationArea = Basic;
                    Image = SerialNo;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Candidate Shortlist Scoring";
                    RunPageLink = "Document No."=field("Document No"),
                                  "Application No."=field("Application No.");
                }
            }
        }
    }

    var
        JobApplications: Record "Job Applications";
}

