#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69805 "Interview Scoresheet Template"
{
    PageType = Card;
    SourceTable = "HR Screening Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions";"No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight";"Total Weight")
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
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12;"Interview Scoresheet Questions")
            {
                SubPageLink = "Template ID"=field(Code);
            }
        }
        area(factboxes)
        {
            systempart(Control24;Outlook)
            {
            }
            systempart(Control25;Notes)
            {
            }
            systempart(Control26;MyNotes)
            {
            }
            systempart(Control27;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    SetRange(Code,Code);
                    Report.Run(69620,true,false,Rec);
                end;
            }
            action("Evaluation Sections")
            {
                ApplicationArea = Basic;
                Image = AvailableToPromise;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Question Group";
                RunPageLink = "Header No."=field(Code);
            }
            action("Interview Plans")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Interview Invitations";
                RunPageLink = "Interview Scoresheet Template"=field(Code);
            }
            action("Suggest Score Guide")
            {
                ApplicationArea = Basic;
                Image = SuggestReminderLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Recruitment.SuggestTemplateScoreGuide(Rec);
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

