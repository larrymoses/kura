#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80144 "Group Appraisal"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type" = const("Performance Appraisal"),
                            "Document Status" = const(Draft),
                            "Evaluation Type" = const("360-Degree/Group Appraisal"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Start Date"; Rec."Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation End Date"; Rec."Evaluation End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Grade"; Rec."Current Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("General Assessment Template ID"; Rec."General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Objective & Outcome Weight %"; Rec."Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Competency Weight %"; Rec."Competency Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Objectives and Outcomes"; "Group Objectives and Outcomes")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
            }
            part(Control39; "Group Proficiency Evalulation")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
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
            action("Suggest Objectives & Outcomes")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Objectives & Outcomes?', true) then
                        Error('Objectives & Outcomes not Suggested');
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                    PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat

                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                            ObjectiveOutcome.Insert(true);

                        until PCObjective.Next = 0;

                    end;
                    Message('Objectives and Outcomes Populated Successfully');
                end;
            }
            action("Load Competency Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Load Competency Templates?', true) then
                        Error('Competency Templates nyo loaded');
                    CompetencyLines.Reset;
                    CompetencyLines.SetRange("Competency Template ID", Rec."Competency Template ID");
                    if CompetencyLines.Find('-') then begin
                        repeat
                            ProEvaluation.Init;
                            ProEvaluation."Performance Evaluation ID" := Rec.No;
                            ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                            ProEvaluation."Competency Template ID" := Rec."Competency Template ID";
                            ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                            ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                            ProEvaluation."Competency Type" :=CompetencyLines."Competency Type";
                            ProEvaluation.Description := CompetencyLines.Description;
                            ProEvaluation."Profiency Rating Scale" := Rec."Proficiency Rating Scale";
                            ProEvaluation."Weight %" := CompetencyLines."Weight %";
                            ProEvaluation.Insert(true);
                        until CompetencyLines.Next = 0;
                    end;
                    Message('Competency Templates loaded Successfully');
                end;
            }
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
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                //  ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Performance Mgt Plan ID");
                    Rec.TestField("Performance Task ID");
                    Rec.TestField("Employee No.");
                    Rec.TestField("Personal Scorecard ID");
                    Rec.TestField("Supervisor Staff No.");
                    Rec.TestField("Annual Reporting Code");
                    Rec.TestField(Closed, false);


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            ObjectiveOutcome.TestField("Target Qty");
                        until ObjectiveOutcome.Next = 0;
                    end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation.TestField("Target Qty");
                        until ProEvaluation.Next = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec."Document Status" := Rec."document status"::Evaluation;
                    Rec.Modify;

                    Message('Document has been approved Automatically');

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                ApprovalsMgmt.""(Rec);*/
                                                                                                // "Approval Status":="Approval Status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"360-Degree/Group Appraisal";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"360-Degree/Group Appraisal";
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
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoB() LineNumber: Integer
    var
        ProEvalution: Record "Proficiency Evaluation Result";
    begin
        ProEvalution.Reset;
        if ProEvalution.Find('+') then
            LineNumber := ProEvalution."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;
}

#pragma implicitwith restore

