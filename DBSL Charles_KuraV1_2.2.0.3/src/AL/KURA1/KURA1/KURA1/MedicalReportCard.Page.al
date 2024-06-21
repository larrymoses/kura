#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69760 "Medical Report Card"
{
    PageType = Card;
    SourceTable = "PreHire Medical Report";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Editable;
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Background Checks Inv No.";"Background Checks Inv No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application No.";"Application No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Medical Checks Template";"Medical Checks Template")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
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
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control23;"Medical Lines")
            {
                Editable = Editable;
                SubPageLink = "Document No."=field("Document No.");
            }
            group("Results/Outcome")
            {
                Caption = 'Results/Outcome';
                field("Overall Medical Fitness";"Overall Medical Fitness")
                {
                    ApplicationArea = Basic;
                }
                field("Doctor Name";"Doctor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control19;Outlook)
            {
            }
            systempart(Control20;Notes)
            {
            }
            systempart(Control21;MyNotes)
            {
            }
            systempart(Control22;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Suggest Questions")
            {
                ApplicationArea = Basic;
                Image = SuggestLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Suggest the questions based on the template';
                begin
                    TestField("Document Status","document status"::Open);
                    if Confirm(TXT001)=true then begin
                      Recruitment.SuggestMedicalQuestions(Rec);
                    end
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
                    TXT001: label 'Post the overall medical report?';
                begin
                    TestField("Document Status","document status"::Open);
                    if Confirm(TXT001)=true then
                      begin
                        TestField("Overall Medical Fitness");
                    JobApplications.Reset;
                    JobApplications.SetRange("Application No.","Application No.");
                    if JobApplications.FindFirst then begin
                      if "Overall Medical Fitness"="overall medical fitness"::"FIT FOR DUTY" then
                        begin
                      JobApplications."Medical Checks Pass":=true;
                      JobApplications.Modify(true);
                      end else begin
                         JobApplications."Medical Checks Pass":=false;
                      JobApplications.Modify(true);
                      end;
                      end;
                      "Document Status":="document status"::Closed;
                      Modify(true);
                      end
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Document No.","Document No.");
                    Report.Run(69627,true,false,Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Editable:=true;
        if "Document Status"="document status"::Closed then
          Editable:=false;
    end;

    var
        Recruitment: Codeunit Recruitment;
        JobApplications: Record "Job Applications";
        Editable: Boolean;
}

