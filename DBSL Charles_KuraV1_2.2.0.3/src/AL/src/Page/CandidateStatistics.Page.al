#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69791 "Candidate Statistics"
{
    PageType = CardPart;
    SourceTable = Applicant;

    layout
    {
        area(content)
        {
            field("Candidate No.";"Candidate No.")
            {
                ApplicationArea = Basic;
            }
            field("No. of Job Applications";NoOfJobApplications)
            {
                ApplicationArea = Basic;
            }
            field("No. of Ability Test Invitations";NoAbilityTestInvitations)
            {
                ApplicationArea = Basic;
            }
            field("No. of Phone Screen Invitations";NoPhoneScreenInvitations)
            {
                ApplicationArea = Basic;
            }
            field("No. of Interview Invitations";NoInterviewInvitations)
            {
                ApplicationArea = Basic;
            }
            field("No. of Employment Offers";NoEmploymentOffers)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin

        JobApplications.Reset;
        JobApplications.SetFilter("Application Status",'<>%1',JobApplications."application status"::Closed);
        if JobApplications.FindSet then begin
          repeat
            NoOfJobApplications+=1;
          until JobApplications.Next=0;
        end;

        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type",SelectionHeader."document type"::"Interview Invitation");
        if SelectionHeader.FindSet then begin
          repeat
            NoAbilityTestInvitations+=1;
            until SelectionHeader.Next=0;

        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type",SelectionHeader."interview mode"::"Phone Interview");
        if SelectionHeader.FindSet then begin
          repeat
            NoPhoneScreenInvitations+=1;
            until SelectionHeader.Next=0;

        end;


        EmploymentOffer.Reset;
        EmploymentOffer.SetRange("Offer Acceptance Status",EmploymentOffer."offer acceptance status"::Accepted);
        EmploymentOffer.SetRange("Candidate No.","Candidate No.");
        if EmploymentOffer.FindSet then begin
          repeat
            NoEmploymentOffers+=1;
          until EmploymentOffer.Next=0;
        end;
    end;

    var
        NoOfJobApplications: Integer;
        NoAbilityTestInvitations: Integer;
        NoPhoneScreenInvitations: Integer;
        NoInterviewInvitations: Integer;
        NoEmploymentOffers: Integer;
        RequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        JobApplications: Record "Job Applications";
        SelectionHeader: Record "Candidate Selection Header";
        BackgroundChecksHeader: Record "Background Checks Header";
        PreHireMedicalReport: Record "PreHire Medical Report";
        EmploymentOffer: Record "Employment Offer";
}

