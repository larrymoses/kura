#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69705 "Candidate Shortlist Voucher"
{
    Caption = 'Candidate Shortlist Voucher';
    PageType = Card;
    SourceTable = "Candidate Selection Header";
    SourceTableView = where("Document Type"=filter("Candidate Shortlisting"));

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
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Invitation No.";"Interview Invitation No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Selection Comm ID";"Appointed Selection Comm ID")
                {
                    ApplicationArea = Basic;
                }
                field("Selection Committee Chair";"Selection Committee Chair")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                group("Shortlisting Fields")
                {
                    field("Minimum Academic Qualification";"Minimum Academic Qualification")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Min Academic Hierarchy Pointer";"Min Academic Hierarchy Pointer")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Minimum Work Experience";"Minimum Work Experience")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Minimum Mngmnt Experience";"Minimum Mngmnt Experience")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group(Statistics)
                {
                    field("No. of Submitted Applications";"No. of Submitted Applications")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No. of Apptitude Invitees";"No. of Apptitude Invitees")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No. of Final Shortlisted Candi";"No. of Final Shortlisted Candi")
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Final Shortlisted Candidates';
                    }
                    field("Missed Academic Total";"Missed Academic Total")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Missed Management Total";"Missed Management Total")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Missed General Total";"Missed General Total")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            part(Control3;"Candidate Shortlist Lines")
            {
                SubPageLink = "Document Type"=field("Document Type"),
                              "Document No"=field("Document No."),
                              "Vacancy ID"=field("Vacancy ID");
            }
            group("Vacancy Details")
            {
                field("Position ID";"Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("No. of openings";"No. of openings")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level";"Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service Code";"Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type";"Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Date";"Application Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Time";"Application Closing Time")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned end Date";"Planned end Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37;Outlook)
            {
            }
            systempart(Control38;Notes)
            {
            }
            systempart(Control39;MyNotes)
            {
            }
            systempart(Control40;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Longlist")
            {
                ApplicationArea = Basic;
                Image = LiFo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to generate the longlist for the vacancy %1?';
                    TXT002: label 'The longlist has been succesfully generated';
                begin
                    if Confirm(TXT001,true,"Job Title")=true then begin
                      Recruitment.ShortlistBasedOnDefinedParameters(Rec);
                      //Recruitment.FnShortlistBasedOnDefinedParameters2(Rec);
                      Message(TXT002);
                    end;
                end;
            }
            action("Default Shortlisting Score Codes")
            {
                ApplicationArea = Basic;
                Image = DefaultFault;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page "Shortlisting Score Code";
                RunPageMode = View;
            }
            action("Suggest Shortlisting Criteria")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'The Requirements have been succesfully suggested';
                    TXT002: label 'Are you sure you want to suggest the shortlisting criteria';
                begin
                    if Confirm(TXT002)=true then begin
                    Recruitment.SuggestShortlistCriteria(Rec);
                      Message(TXT001);
                      end
                end;
            }
            action("Suggest Job Applications")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest job applicants';
                begin
                    if Confirm(TXT001)=true then begin
                    Recruitment.FnSuggestapplicants(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Create Interview Invitation';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'The document has been posted succesfully';
                    TXT002: label 'Are you sure you want to post the shortlisting Voucher';
                begin
                    TestField(Posted,false);
                    if Confirm(TXT002,true,"Job Title")=true then begin
                      Recruitment.CreateInterviewInvitation(Rec);
                      Message(TXT001);
                    end;
                end;
            }
            action("Send Regret Notification")
            {
                ApplicationArea = Basic;
                Image = AlternativeAddress;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Send regret letters to disqualified candidates';
                begin
                    if Confirm(TXT001)=true then begin
                    Recruitment.SendRegretLetter(Rec);
                    end
                end;
            }
        }
        area(navigation)
        {
            group(Shortlisting)
            {
                action("Shortlisting Criteria")
                {
                    ApplicationArea = Basic;
                    Caption = 'Shortlisting Criteria';
                    Image = GainLossEntries;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Shortlist Score Guide";
                    RunPageLink = "Document No."=field("Document No.");
                    RunPageMode = Edit;
                }
                action("Candidate Shortlist Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Candidate Shortlist Committee';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Candidate Shortlist Committee";
                    RunPageLink = "Document No."=field("Document No."),
                                  "Appointed Committee ID"=field("Appointed Selection Comm ID");
                }
            }
            group("Long Listing")
            {
                action("Failed Education")
                {
                    ApplicationArea = Basic;
                    Image = FaultDefault;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Failed Academic Applicants";
                    RunPageLink = "Document No."=field("Document No.");
                }
                action("Failed Management Experience")
                {
                    ApplicationArea = Basic;
                    Image = MakeAgreement;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Failed Management Yrs Applican";
                    RunPageLink = "Document No."=field("Document No.");
                }
                action("Failed Work Experience")
                {
                    ApplicationArea = Basic;
                    Image = EditForecast;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Failed General Exp Applicants";
                    RunPageLink = "Document No."=field("Document No.");
                }
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    SetRange("Document No.","Document No.");
                    Report.Run(69622,true,false,Rec);
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

