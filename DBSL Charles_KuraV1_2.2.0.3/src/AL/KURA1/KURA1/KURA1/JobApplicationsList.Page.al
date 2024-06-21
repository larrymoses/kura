#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69116 "Job Applications List"
{
    CardPageID = "Job Application Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Job Application Table";
    SourceTableView = where(Status=filter(New));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No";"Application No")
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
                field(Surname;Surname)
                {
                    ApplicationArea = Basic;
                }
                field(Salutation;Salutation)
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport";"ID/Passport")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth";"Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Marital Status";"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Origin";"Ethnic Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Origin Description";"Ethnic Origin Description")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Home Phone No.";"Home Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Work Phone No.";"Work Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Shortlisted;Shortlisted)
                {
                    ApplicationArea = Basic;
                }
                field("Postal Code.";"Postal Code.")
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address";"Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("Residential Address";"Residential Address")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(County;County)
                {
                    ApplicationArea = Basic;
                }
                field("Country Code";"Country Code")
                {
                    ApplicationArea = Basic;
                }
                field("Country Name";"Country Name")
                {
                    ApplicationArea = Basic;
                }
                field(Citizenship;Citizenship)
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy Requisition No.";"Vacancy Requisition No.")
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
            group("Application Details")
            {
                action("Education Background")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Education Background";
                    RunPageLink = "Application No"=field("Application No");
                    RunPageMode = View;
                }
                action("Employment History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Employment History";
                    RunPageLink = "Application No"=field("No. Series");
                }
                action("Professional Qualifications")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Professional Qualifications";
                    RunPageLink = "Application No"=field("Application No");
                    RunPageMode = View;
                }
                action("Trainings Attended")
                {
                    ApplicationArea = Basic;
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Trainings Attended";
                    RunPageLink = "Application No"=field("Application No");
                    RunPageMode = View;
                }
                action("Professional Bodies")
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Professional Bodies";
                    RunPageLink = "Application No"=field("Application No");
                    RunPageMode = View;
                }
                action("Applicant Accomplishments")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Applicant Accomplishments";
                    RunPageLink = "Application No"=field("Application No");
                    RunPageMode = View;
                }
                action(Referees)
                {
                    ApplicationArea = Basic;
                    Image = Users;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Applicant Referees";
                    RunPageLink = "Job Application No"=field("Application No");
                }
            }
            group(Shortlisting)
            {
                Caption = 'Shortlisting';
                action("Shortlist Based on Criteria")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        BasedOnCriteria(Rec);
                    end;
                }
                action("Shortlist for Oral Interview")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyApplicantsTable);
                        if VacancyApplicantsTable.FindSet then begin
                          repeat
                           Status:=Status::Oral;
                            VacancyApplicantsTable.Modify(true);

                          until VacancyApplicantsTable.Next = 0;
                          Clear(VacancyApplicantsTable);
                         end;
                         Message('Applicants succesfully shortlitsed for Oral Interview');
                    end;
                }
                action("Shortlist for Written Interview")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyApplicantsTable);
                        if VacancyApplicantsTable.FindSet then begin
                          repeat
                           Status:=Status::Written;
                            VacancyApplicantsTable.Modify(true);

                          until VacancyApplicantsTable.Next = 0;
                          Clear(VacancyApplicantsTable);
                         end;
                         Message('Applicants succesfully shortlitsed for Written Interview');
                    end;
                }
                action("Shortlist for Aptitude Test")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyApplicantsTable);
                        if VacancyApplicantsTable.FindSet then begin
                          repeat
                          Status:=Status::Apptitude;
                           VacancyApplicantsTable.Modify(true);

                          until VacancyApplicantsTable.Next = 0;
                          Clear(VacancyApplicantsTable);
                         end;
                          Message('Applicants succesfully shortlitsed for Aptitude Test');
                    end;
                }
            }
        }
    }

    var
        VacancyApplicantsTable: Record "Job Application Table";
        TempVacancy: Record "Job Application Table";
        noFilter: Text;

    local procedure BasedOnCriteria(JobApplicationTable: Record "Job Application Table")
    var
        Application: Record "Job Application Table";
        ShortlistCriteria: Record "Shortlist Criteria";
        CriteriaSetup: Record "Criteria Setup";
    begin
        Application.Reset;
        Application.SetRange("Vacancy Requisition No.",JobApplicationTable."Vacancy Requisition No.");
        if Application.FindSet then begin
          repeat
            //Check individual criteria for the requisition
            ShortlistCriteria.Reset;
            ShortlistCriteria.SetRange("Requisition No.",Application."Vacancy Requisition No.");
            if ShortlistCriteria.FindSet then begin
              repeat
                CriteriaSetup.Reset;
                CriteriaSetup.SetRange(Code,ShortlistCriteria."Shortlist Criteria");
                 if CriteriaSetup.FindSet then begin
                  repeat
                    //check for each criteria in a table
                    Message('%1',CriteriaSetup."Table ID");
                   until CriteriaSetup.Next=0;
                    end;
                until ShortlistCriteria.Next=0;
              end;
            until Application.Next=0;
          end
    end;
}

