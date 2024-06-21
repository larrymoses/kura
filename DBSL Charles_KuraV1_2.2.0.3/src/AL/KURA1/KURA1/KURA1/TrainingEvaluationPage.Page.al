#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69225 "Training Evaluation Page"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Training Evaluation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Application Code";"Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Course Title";"Course Title")
                {
                    ApplicationArea = Basic;
                }
                field("Course Methodology";"Course Methodology")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start DateTime";"Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime";"End DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field("Course Justification";"Course Justification")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Participants";"No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Facilitators;Facilitators)
                {
                    ApplicationArea = Basic;
                }
                field("Comment on Relevance of Course";"Comment on Relevance of Course")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008;Links)
            {
            }
            systempart(Control1000000009;Notes)
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
                Caption = 'Print';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange(No,No);
                    Report.Run(69104,true,false,Rec);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to submit this evaluation?')=false then
                    exit else
                    Status:=Status::Submitted;
                    Modify
                end;
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if Status=Status::Submitted then
        Error('You cannot modify a submitted evaluation')
    end;

    var
        EvaluationAreas: Record "HR Models";
        EvaluationLines: Record "Training Evaluation Lines";
}

