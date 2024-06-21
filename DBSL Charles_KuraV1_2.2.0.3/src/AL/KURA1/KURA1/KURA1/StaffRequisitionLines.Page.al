#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69114 "Staff Requisition Lines"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Vacancy Requisition Lines";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition Type"; "Requisition Type")
                {
                    ApplicationArea = Basic;
                }
                field("Job Id"; "Job Id")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description"; "Job Description")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Contract"; "Type of Contract")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Qty"; "Planned Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Qty"; "Requested Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; "Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applications End Time"; "Applications End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Applications End Date"; "Applications End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applications Start Date"; "Applications Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Salary; Salary)
                {
                    ApplicationArea = Basic;
                }
                field("Job Function"; "Job Function")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; "Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Location)
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
            action("Create Vacancy")
            {
                ApplicationArea = Basic;
                Image = CreateSerialNo;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm(TXT001) = true then begin
                        CurrPage.SetSelectionFilter(VacancyRequisitionLines);
                        VacancyRequisitionLines.Reset;
                        VacancyRequisitionLines.SetRange(Status, VacancyRequisitionLines.Status::Open);
                        if VacancyRequisitionLines.FindSet then begin
                            repeat
                                HRSetup.Get;
                                HRSetup.TestField(HRSetup."Vacancy Nos.");
                                NoSeriesMgt.InitSeries(HRSetup."Vacancy Nos.", HRSetup."Vacancy Nos.", 0D, VacancyNo, HRSetup."Vacancy Nos.");

                                Vacancies.Init;
                                Vacancies."Requisition No." := VacancyNo;
                                Vacancies."Job Id" := VacancyRequisitionLines."Job Id";
                                Vacancies."Job Description" := VacancyRequisitionLines."Job Description";
                                Vacancies."Planned Start Date" := VacancyRequisitionLines."Planned Start Date";
                                Vacancies."Planned End Date" := VacancyRequisitionLines."Planned End Date";
                                Vacancies."Planned Qty" := VacancyRequisitionLines."Planned Qty";
                                Vacancies.Insert;
                            until VacancyRequisitionLines.Next = 0;
                            Message(TXT002, VacancyNo);
                        end
                    end
                end;
            }
            group(Shortlisting)
            {
                Visible = false;
                action("Shortlisting Criteria")
                {
                    ApplicationArea = Basic;
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Shortlisting Criteria";
                    RunPageLink = "Entry No." = field("Line No."),
                                  "Requisition No." = field("Requisition No.");
                }
                action("Filter Based on Criteria")
                {
                    ApplicationArea = Basic;
                    Image = FilterLines;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyRequisitionLines);
                        if VacancyRequisitionLines.FindSet then begin
                            repeat
                            //   ShortlistingCriteria.BasedOnCriteria(VacancyRequisitionLines);
                            until VacancyRequisitionLines.Next = 0;
                            Clear(VacancyRequisitionLines);
                        end;
                    end;
                }
            }
        }
    }

    var
        StatusApproved: Boolean;
        VacancyRequisitionsTable: Record "ManPower Planning Lines";
        Text001: label 'The job position has already been advertised';
        Text002: label 'Are you sure you want to advertise the  position %1';
        JobAdvertHeader: Record "Advertisement Channels";
        JobAdvertLines: Record "Job Advert Lines";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        Text003: label 'The Job Advertisement template no, %1, has been created succesfully';
        VacancyRequisitionLines: Record "Vacancy Requisition Lines";
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";
        TXT001: label 'Are you sure you want to create a vacancy for this Position';
        Vacancies: Record Vacancyx;
        VacancyNo: Code[30];
        TXT002: label 'Vacancy %1, has been created succesfully';

    local procedure BasedOnCriteria(JobApplicationTable: Record "Job Application Table")
    var
        Application: Record "Job Application Table";
        ShortlistCriteria: Record "Shortlist Criteria";
        CriteriaSetup: Record "Criteria Setup";
    begin
    end;
}

