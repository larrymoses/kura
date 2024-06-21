#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69127 "Written Interview Lines"
{
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Shortlisting Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Application No";"Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Full Name";"Full Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Interview Location";"Interview Location")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Date";"Interview Date")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Time";"Interview Time")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Due Date";"Interview Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Written Interview Score";"Written Interview Score")
                {
                    ApplicationArea = Basic;
                }
                field("Apptitude Interview Score";"Apptitude Interview Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Oral Interview Score";"Oral Interview Score")
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
            group(Shortlisting)
            {
                Image = Administration;
                action("Shortlist for Apptitude")
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(ShortlistingLines);
                        if ShortlistingLines.FindSet then begin
                          repeat
                         //Modify status to Shortlisting Type

                              JobApplicationTable.Reset;
                              JobApplicationTable.SetRange("Application No",ShortlistingLines."Application No");
                              if JobApplicationTable.FindSet then begin
                                JobApplicationTable."Shortlisting Type":=JobApplicationTable."shortlisting type"::Apptitude;
                                 JobApplicationTable.Status:=JobApplicationTable.Status::Apptitude;
                                       JobApplicationTable.Modify(true);
                               end;

                              VacancyRequisitionLines.Reset;
                            VacancyRequisitionLines.SetRange("Job Id",ShortlistingLines."Job Id.");
                            if VacancyRequisitionLines.FindSet then begin
                              VacancyRequisitionLines.Status:=VacancyRequisitionLines.Status::Apptitude;
                              VacancyRequisitionLines.Modify(true);
                               end;

                          until ShortlistingLines.Next = 0;
                          Clear(ShortlistingLines);
                         end;
                         Message('Applicants Shortlisted for Apptitude Interview');
                    end;
                }
                action("Shortlist for Oral")
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(ShortlistingLines);
                        if ShortlistingLines.FindSet then begin
                          repeat
                         //Modify status to Shortlisting Type

                              JobApplicationTable.Reset;
                              JobApplicationTable.SetRange("Application No",ShortlistingLines."Application No");
                              if JobApplicationTable.FindSet then begin
                                JobApplicationTable."Shortlisting Type":=JobApplicationTable."shortlisting type"::Oral;
                                 JobApplicationTable.Status:=JobApplicationTable.Status::Oral;
                                       JobApplicationTable.Modify(true);
                               end;

                              VacancyRequisitionLines.Reset;
                            VacancyRequisitionLines.SetRange("Job Id",ShortlistingLines."Job Id.");
                            if VacancyRequisitionLines.FindSet then begin
                              VacancyRequisitionLines.Status:=VacancyRequisitionLines.Status::Oral;
                              VacancyRequisitionLines.Modify(true);
                               end;

                          until ShortlistingLines.Next = 0;
                          Clear(ShortlistingLines);
                         end;
                         Message('Applicants Shortlisted for Oral Interview');
                    end;
                }
            }
        }
    }

    var
        OralInterviewLines: Page "Oral Interview Lines";
        ShortlistingLines: Record "Shortlisting Lines";
        VacancyRequisitionLines: Record "Vacancy Requisition Lines";
        JobApplicationTable: Record "Job Application Table";
}

