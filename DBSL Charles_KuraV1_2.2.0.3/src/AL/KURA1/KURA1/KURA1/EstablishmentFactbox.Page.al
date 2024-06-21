#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69788 "Establishment Factbox"
{
    PageType = CardPart;
    SourceTable = "Staff Establishment Plan";

    layout
    {
        area(content)
        {
            field("External Document No.";"External Document No.")
            {
                ApplicationArea = Basic;
            }
            field("No. of Recruitment Requisitions";NoOfRequisitions)
            {
                ApplicationArea = Basic;
            }
            field("No. of Job Vacancies";NoofVacancies)
            {
                ApplicationArea = Basic;
            }
            field("No. of Direct Hire Vouchers";NoOfDirectHire)
            {
                ApplicationArea = Basic;
            }
            field("No. of Career Fairs";NoOfCareerFairs)
            {
                ApplicationArea = Basic;
            }
            field("No. of Job Applications";NoOfApplications)
            {
                ApplicationArea = Basic;
            }
            field("No. of Candidate Shortlisitng";NoOfShortlisting)
            {
                ApplicationArea = Basic;
            }
            field("No. of Interview Invitations";NoOfInterviewInvitations)
            {
                ApplicationArea = Basic;
            }
            field("No. of Employment Offers";NoOfOffers)
            {
                ApplicationArea = Basic;
            }
            field("No. of Rejected Offers";NoOfRejections)
            {
                ApplicationArea = Basic;
            }
            field("No. of Background Checks";NoOfBackgroundChecks)
            {
                ApplicationArea = Basic;
            }
            field("No. of Interview Reports";NoOfInterviewReports)
            {
                ApplicationArea = Basic;
            }
            field("No. of Medical Reports";NoOfMedicalReport)
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
        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type",RequisitionHeader."document type"::"Recruitment Requisition");
        if RequisitionHeader.FindSet then begin
          repeat
            NoOfRequisitions+=1;
          until RequisitionHeader.Next=0;
        end;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type",RequisitionHeader."document type"::"Job Vacancy");
        if RequisitionHeader.FindSet then begin
          repeat
            NoofVacancies+=1;
          until RequisitionHeader.Next=0;
        end;

        VacancyAnnouncement.Reset;
        VacancyAnnouncement.SetRange("Posting Type",VacancyAnnouncement."posting type"::"Direct Hire Announcement");
        if VacancyAnnouncement.FindSet then begin
          repeat
            NoOfDirectHire+=1;
          until VacancyAnnouncement.Next=0;
        end;

        VacancyAnnouncement.Reset;
        VacancyAnnouncement.SetRange("Posting Type",VacancyAnnouncement."posting type"::"Career Fair");
        if VacancyAnnouncement.FindSet then begin
          repeat
            NoOfCareerFairs+=1;
          until VacancyAnnouncement.Next=0;
        end;

        JobApplications.Reset;
        JobApplications.SetFilter("Application Status",'<>%1',JobApplications."application status"::Closed);
        if JobApplications.FindSet then begin
          repeat
            NoOfApplications+=1;
          until JobApplications.Next=0;
        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type",SelectionHeader."document type"::"Candidate Shortlisting");
        if SelectionHeader.FindSet then begin
          repeat
            NoOfShortlisting+=1;
            until SelectionHeader.Next=0;

        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type",SelectionHeader."document type"::"Interview Invitation");
        if SelectionHeader.FindSet then begin
          repeat
            NoOfInterviewInvitations+=1;
            until SelectionHeader.Next=0;

        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type",SelectionHeader."document type"::"Consolidated Interview Report");
        if SelectionHeader.FindSet then begin
          repeat
            NoOfInterviewReports+=1;
            until SelectionHeader.Next=0;

        end;
        BackgroundChecksHeader.Reset;
        BackgroundChecksHeader.SetRange("Document Status",BackgroundChecksHeader."document status"::Active);
        if BackgroundChecksHeader.FindSet then begin
          repeat
            NoOfBackgroundChecks+=1;
          until BackgroundChecksHeader.Next=0;
        end;

        PreHireMedicalReport.Reset;
        PreHireMedicalReport.SetRange("Application No.",'<>%1','');
        if PreHireMedicalReport.FindSet then begin
          repeat
            NoOfMedicalReport+=1;
          until PreHireMedicalReport.Next=0
        end;

        EmploymentOffer.Reset;
        EmploymentOffer.SetRange("Offer Acceptance Status",EmploymentOffer."offer acceptance status"::Accepted);
        if EmploymentOffer.FindSet then begin
          repeat
            NoOfOffers+=1;
          until EmploymentOffer.Next=0;
        end;
        EmploymentOffer.Reset;
        EmploymentOffer.SetRange("Offer Acceptance Status",EmploymentOffer."offer acceptance status"::Rejected);
        if EmploymentOffer.FindSet then begin
          repeat
            NoOfRejections+=1;
          until EmploymentOffer.Next=0;
        end
    end;

    var
        NoOfRequisitions: Integer;
        NoofVacancies: Integer;
        NoOfDirectHire: Integer;
        NoOfCareerFairs: Integer;
        NoOfApplications: Integer;
        NoOfShortlisting: Integer;
        NoOfInterviewInvitations: Integer;
        NoOfOffers: Integer;
        NoOfRejections: Integer;
        NoOfBackgroundChecks: Integer;
        NoOfInterviewReports: Integer;
        NoOfMedicalReport: Integer;
        RequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        JobApplications: Record "Job Applications";
        SelectionHeader: Record "Candidate Selection Header";
        BackgroundChecksHeader: Record "Background Checks Header";
        PreHireMedicalReport: Record "PreHire Medical Report";
        EmploymentOffer: Record "Employment Offer";
}

