#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80140 "Self-Supervisor Appraisal-Sub"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type"=const("Performance Appraisal"),
                            "Document Status"=const(Submitted));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Type";"Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Mgt Plan ID";"Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Task ID";"Performance Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Start Date";"Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation End Date";"Evaluation End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appraisal Template ID";"Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No.";"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Designation";"Current Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Grade";"Current Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Personal Scorecard ID";"Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Staff No.";"Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name";"Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Competency Template ID";"Competency Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("General Assessment Template ID";"General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Objective & Outcome Weight %";"Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Competency Weight %";"Competency Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Weight %";"Total Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Rating Scale";"Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Proficiency Rating Scale";"Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Annual Reporting Code";"Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?";"Blocked?")
                {
                    ApplicationArea = Basic;
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
                field("Last Evaluation Date";"Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Objectives and Outcomes";"Objectives and Outcomes-Self S")
            {
                SubPageLink = "Performance Evaluation ID"=field(No);
            }
            part(Control39;"Proficiency Evalulation-Self S")
            {
                SubPageLink = "Performance Evaluation ID"=field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(creation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Close Appraisal")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    TestField(Closed,false);

                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID",No);
                    if ObjectiveOutcome.Find('-') then begin
                       repeat
                          ObjectiveOutcome.TestField("Self-Review Qty");
                          ObjectiveOutcome.TestField("AppraiserReview Qty");
                         until ObjectiveOutcome.Next=0;
                      end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID",No);
                    if ProEvaluation.Find('-') then begin
                       repeat
                         ProEvaluation.TestField("Self-Review Qty");
                         ProEvaluation.TestField("AppraiserReview Qty");
                         until ProEvaluation.Next=0;
                      end;


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID",No);
                    if ObjectiveOutcome.Find('-') then begin
                       repeat
                           StrategicPlanning.fnPostObjectiveEntry(ObjectiveOutcome);

                           ObjectiveOutcome."Final/Actual Qty":= ObjectiveOutcome."AppraiserReview Qty";
                           Modify;
                         until ObjectiveOutcome.Next=0;
                      end;

                    Closed:=true;
                    "Closed By":=UserId;
                    Modify;
                    //"Closed On":=TODAY;

                    Message('Appraisal No %1 Closed Successfully',No);
                end;
            }
            action("Print Appraisal Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Message('Testing');
                end;
            }
            action("Email Apraisal Report")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Message('Email');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Performance Appraisal";
        "Evaluation Type":="evaluation type"::"Self-Appraisal with Supervisor Score";
    end;

    trigger OnOpenPage()
    begin
        "Document Type":="document type"::"Performance Appraisal";
        "Evaluation Type":="evaluation type"::"Self-Appraisal with Supervisor Score";
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        StrategicPlanning: Codeunit "Strategic Planning";

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Objective Evaluation Result";
    begin
        Billable.Reset;
        if Billable.Find('+') then
        LineNumber:=Billable."Line No"
        else
         LineNumber:=1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoB() LineNumber: Integer
    var
        ProEvalution: Record "Proficiency Evaluation Result";
    begin
        ProEvalution.Reset;
        if ProEvalution.Find('+') then
        LineNumber:=ProEvalution."Line No"
        else
         LineNumber:=1;
        exit(LineNumber);
    end;
}
