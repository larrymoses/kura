#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69677 "Candidate"
{
    PageType = Card;
    SourceTable = Applicant;

    layout
    {
        area(content)
        {
            group("Personal Information")
            {
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
                field("Full Names";"Full Names")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Birth Date";"Birth Date")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code";"Country/Region Code")
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
                field("Marital Status";"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(Religion;Religion)
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Description";"Ethnic Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ethnic Group';
                    Editable = false;
                }
                field("NHIF No";"NHIF No")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF No";"NSSF No")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Pin";"KRA Pin")
                {
                    ApplicationArea = Basic;
                }
                field(Nationality;Nationality)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                field("Mobile Phone No.";"Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("County of Birth";"County of Birth")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Disability Information")
            {
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
            }
            group("Applicant Qualification")
            {
                field("Skills & Competences";"Skills & Competences")
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
                group(Administration)
                {
                    field("Employee No";"Employee No")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Status;Status)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Inactive Date";"Inactive Date")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Cause of Inactivity Code";"Cause of Inactivity Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Termination Date";"Termination Date")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
        area(factboxes)
        {
            part("Candidate Picture";"Job Applicant Picture")
            {
                SubPageLink = "Candidate No."=field("Candidate No.");
            }
            part(Control59;"Candidate Statistics")
            {
                SubPageLink = "Candidate No."=field("Candidate No.");
            }
            systempart(Control41;Outlook)
            {
            }
            systempart(Control42;Notes)
            {
            }
            systempart(Control43;MyNotes)
            {
            }
            systempart(Control44;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Qualifications)
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Job Applicant Qualification";
                RunPageLink = "Candidate No."=field("Candidate No.");
            }
            action("Employment History")
            {
                ApplicationArea = Basic;
                Image = History;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Applicant Qualification Hist";
            }
            action("Hobbies & Interests")
            {
                ApplicationArea = Basic;
                Image = Holiday;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page Hobbies;
                RunPageLink = "No."=field("Candidate No.");
            }
            action(Referees)
            {
                ApplicationArea = Basic;
                Image = Relationship;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page Referees;
                RunPageLink = "No."=field("Candidate No.");
            }
            action(Language)
            {
                ApplicationArea = Basic;
                Image = Language;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Employee_Applicant Language";
                RunPageLink = "No."=field("Candidate No.");
            }
            action("Print Resume")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Candidate No.","Candidate No.");
                    Report.Run(69604,true,false,Rec);
                end;
            }
        }
    }
}

