#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69797 "Ability Test Header"
{
    Caption = 'Ability Test Header';
    PageType = Card;
    SourceTable = "PreScreen Header";

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
                field("Ability Test ID";"Ability Test ID")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID";"Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation";"Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Openings";"No. of Openings")
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
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Test Duration(Min)";"Maximum Test Duration(Min)")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control29;"Ability Applicants")
            {
                SubPageLink = "Document No."=field("Document No."),
                              "Vacancy ID"=field("Vacancy ID");
            }
        }
        area(factboxes)
        {
            systempart(Control25;Outlook)
            {
            }
            systempart(Control26;Notes)
            {
            }
            systempart(Control27;MyNotes)
            {
            }
            systempart(Control28;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Suggest Job Applicants")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField("Vacancy ID");
                    if Confirm('Are you sure you want to suggest applicants for the ability test?')=true then begin
                    Recruitment.SuggestAbilityTestApplicants(Rec);
                      end
                end;
            }
            action("E-Notify Job Applicants")
            {
                ApplicationArea = Basic;
                Image = ElectronicVATExemption;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to notify the applicants on the scheduled ability tests?')=true then begin
                    Recruitment.NotifyAbilityTestApplicants(Rec);
                      end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to post the report?')=true then begin
                    Recruitment.PostAbilityTestApplicants(Rec);
                      end
                end;
            }
        }
        area(navigation)
        {
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
            }
            action("Ability Test Responses")
            {
                ApplicationArea = Basic;
                Image = Answers;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Ability Responses";
                RunPageLink = "Ability Test Invitation No."=field("Document No.");
            }
        }
        area(reporting)
        {
            action("Print Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Document No.","Document No.");
                    Report.Run(69619,true,false,Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Ability Test Invitation";
    end;

    var
        Recruitment: Codeunit Recruitment;
}

