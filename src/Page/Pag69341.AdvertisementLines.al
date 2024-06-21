#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69341 "Advertisement Lines"
{
    PageType = ListPart;
    SourceTable = "Vacancy Requisition Lines";
    SourceTableView = where(Advertise = filter(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy No"; "Vacancy No")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Contract"; "Type of Contract")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requisition Type"; "Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Id"; "Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Description"; "Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Qty"; "Planned Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requested Qty"; "Requested Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Start Date"; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned End Date"; "Planned End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applications End Time"; "Applications End Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applications End Date"; "Applications End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applications Start Date"; "Applications Start Date")
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
            action(Advertise)
            {
                ApplicationArea = Basic;
                Image = Alerts;

                trigger OnAction()
                begin
                    if Confirm(TXT002) = true then begin
                        CurrPage.SetSelectionFilter(VacancyRequisitionLines);
                        if VacancyRequisitionLines.FindSet then begin
                            repeat
                                VacancyRequisitionLines.Advertise := true;
                                VacancyRequisitionLines."Advertised By" := UserId;
                                VacancyRequisitionLines."Advertised Date" := Today;
                                VacancyRequisitionLines.Modify(true);
                                //modify the vacancies table'
                                Vacancy.Reset;
                                Vacancy.SetRange("Requisition No.", VacancyRequisitionLines."Vacancy No");
                                if Vacancy.FindFirst then begin
                                    Vacancy.Advertise := true;
                                    Vacancy.Status := Vacancy.Status::Advertised;
                                    Vacancy."Advertised By" := UserId;
                                    Vacancy."Advertised Date" := Today;
                                    Vacancy.Modify(true);
                                end;

                            until VacancyRequisitionLines.Next = 0;
                            Clear(VacancyRequisitionLines);
                        end;
                        Message(TXT001, VacancyRequisitionLines."Vacancy No");
                    end
                end;
            }
            group(Shortlisting)
            {
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
                            //  ShortlistingCriteria.BasedOnCriteria(VacancyRequisitionLines);
                            until VacancyRequisitionLines.Next = 0;
                            Clear(VacancyRequisitionLines);
                        end;
                    end;
                }
            }
        }
    }

    var
        VacancyRequisitionLines: Record "Vacancy Requisition Lines";
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";
        TXT001: label 'The vacancy %1,has been advertised succesfully';
        Vacancy: Record Vacancyx;
        TXT002: label 'Are you sure you want to advertise the selected vacancies?';
}

