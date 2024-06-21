#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69821 "Consolidated Interview Record"
{
    PageType = Card;
    SourceTable = "Panel Chair Interview Line";
    SourceTableView = where("Document Type"=filter("Consolidated Interview Report"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Invitation No.";"Interview Invitation No.")
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
                field("Interview Panel Outcome";"Interview Panel Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Panel Score %";"Interview Panel Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Panel Remarks";"Interview Panel Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Unsuccesful Application Reason";"Unsuccesful Application Reason")
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
                field("Assigned Panel ID";"Assigned Panel ID")
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
                field("Candidate Attendance Status";"Candidate Attendance Status")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate Shortlist Voucher";"Candidate Shortlist Voucher")
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
                field("Marital Status";"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(Religion;Religion)
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
                field("Academic Qualification Name";"Academic Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic Pointer";"Highest Academic Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("General Work Experience Yrs";"General Work Experience Yrs")
                {
                    ApplicationArea = Basic;
                }
                field("Management Experience Yrs";"Management Experience Yrs")
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
                field("Disability Cert No.";"Disability Cert No.")
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
            }
        }
        area(factboxes)
        {
            systempart(Control28;Outlook)
            {
            }
            systempart(Control29;Notes)
            {
            }
            systempart(Control30;MyNotes)
            {
            }
            systempart(Control31;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Evaluation Sections")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Question Categories";
                RunPageLink = "Document No."=field("Document No.");
            }
            action("Panelist Evaluation Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Document No.","Document No.");
                    Report.Run(69625,true,false,Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to complete the evaluation?';
                begin
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

