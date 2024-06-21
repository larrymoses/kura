#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69812 "Candidate Interview Record"
{
    PageType = Card;
    SourceTable = "Candidate Interview Record";

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
                field("Interview Scoresheet Template";"Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate Shortlist Vouch No.";"Candidate Shortlist Vouch No.")
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
                field("Assigned Panel ID";"Assigned Panel ID")
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
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control32;"Interview Questions")
            {
                SubPageLink = "Document No."=field("Document No."),
                              "Interview Scoresheet Template"=field("Interview Scoresheet Template");
            }
            group("Interview Outcome/Results")
            {
                Caption = 'Interview Outcome/Results';
                field("Panel Interview Outcome";"Panel Interview Outcome")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
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
                    TestField(Posted,false);
                    if Confirm(TXT001)=true then begin
                     Recruitment.PostInterviewRecord(Rec);
                      Posted:=true;
                      "Posted By":=UserId;
                      "Posted On":=CurrentDatetime;
                      Modify(true);
                    end
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

