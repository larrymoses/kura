#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80121 "Standard Perform Appraisal-E"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type"=const("Performance Appraisal"),
                            "Document Status"=const(Evaluation),
                            "Evaluation Type"=const("Standard Appraisal/Supervisor Score Only"));

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
                    Editable = false;
                }
                field("Performance Mgt Plan ID";"Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Task ID";"Performance Task ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
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
                    Editable = false;
                }
                field("Supervisor Staff No.";"Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Name";"Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
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
                    Editable = false;
                }
            }
            group(Statistics)
            {
                Caption = 'Appraisal Confirmation';
                field("Employee Confirm";"Employee Confirm")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Confirm";"Supervisor Confirm")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Objectives and Outcomes";"Objectives and Outcomes-E")
            {
                SubPageLink = "Performance Evaluation ID"=field(No);
            }
            part(Control39;"Proficiency Evalulation-E")
            {
                SubPageLink = "Performance Evaluation ID"=field(No);
            }
            part(Control42;"Evaluation Improvement Plan")
            {
                SubPageLink = "Perfomance Evaluation No"=field(No);
            }
            part("Evaluation Training Needs";"Evaluation Training Needs")
            {
                SubPageLink = "Perfomance Evaluation No"=field(No);
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
            action("Submit Appraisal")
            {
                ApplicationArea = Basic;
                Image = Delivery;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    TestField("Employee Confirm",true);
                    TestField("Supervisor Confirm",true);
                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID",No);
                    if ObjectiveOutcome.Find('-') then begin
                       repeat
                          ObjectiveOutcome.TestField("Target Qty");
                          ObjectiveOutcome.TestField("AppraiserReview Qty");
                         until ObjectiveOutcome.Next=0;
                      end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID",No);
                    if ProEvaluation.Find('-') then begin
                       repeat
                         ProEvaluation.TestField("Target Qty");
                         ProEvaluation.TestField("AppraiserReview Qty");
                         until ProEvaluation.Next=0;
                      end;

                    "Document Status":="document status"::Submitted;
                    Modify;
                    Message('Appraisal Submitted Sucessfully');
                    //ProcurementProcessing.FnSendAppraisalReport(Rec);
                end;
            }
            separator(Action43)
            {
            }
            action("Print Appraisal Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    SetRange(No,No);
                    Report.Run(80016,true,true,Rec)
                end;
            }
            separator(Action41)
            {
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Performance Appraisal";
        "Evaluation Type":="evaluation type"::"Standard Appraisal/Supervisor Score Only";
    end;

    trigger OnOpenPage()
    begin
        "Document Type":="document type"::"Performance Appraisal";
        "Evaluation Type":="evaluation type"::"Standard Appraisal/Supervisor Score Only";
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";

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

