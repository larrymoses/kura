
Page 80090 "Standard Perform Appraisal"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type" = const("Performance Appraisal"),
                            "Document Status" = const(Draft));

    layout
    {
        area(content)
        {
            group(General)
            {
                group("Section 1")
                {
                    field("Review Period"; Rec."Review Period")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Personal No."; Rec."Employee No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Name; Rec."Employee Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Directorate; Rec.Directorate)
                    {
                        ApplicationArea = Basic;
                    }
                    field(Department; Rec.Department)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Work Station"; Rec."Work Station")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Current Designation"; Rec."Current Designation")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Terms of Service"; Rec."Employement Terms")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Job Group"; Rec."Job Group")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Salary Scale"; Rec."Salary Scale")
                    {
                        ApplicationArea = Basic;
                    }


                }



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
                field("Second Supervisor Staff No."; Rec."Second Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Second Supervisor Name"; Rec."Second Supervisor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
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
                    Caption = 'Behavioural Competencies';
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
            // part(Objectives; "Departmental Objectives")
            // {
            //     SubPageLink = "Department Code" = field(Department), "Appraisal Period" = field("Review Period");
            //     UpdatePropagation = Both;
            //     Editable =false;
            // }
            // part("Department Objectives"; "Strategy Workplan Lines")
            // {
            //     Caption = 'Department Objectives';
            //     SubPageLink = "Primary Department" = field(Department), "Strategy Plan ID" = field("Strategy Plan ID");
            //     UpdatePropagation = Both;
            //     Editable =false;
            // }
            part("Department Objectives"; "AppraisalDept.ObjectivesSF")
            {
                Caption = 'Department Objectives';
                SubPageLink = "Primary Department" = field(Department), "Appraisal Period" = field("Review Period");
                UpdatePropagation = Both;
                Editable = false;
            }
            part("MidYear Appraisal"; NewAndChangedApprTargets)
            {
                Caption = 'Mid-Year Performance Appraisal';
                SubPageLink = "Document No." = field(No);
            }
            part("Objectives and Outcomes"; "Objectives and Outcomes")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                // Editable =false;
            }
            part(Control39; "Proficiency Evalulation")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
            }
            group("&Recommendation Reward/Sanctions")
            {
                Caption = 'Recommendations Of Rewards Or Sanctions';
                field("Recommendation Type";Rec."Recommendation Type")
                {
                    ApplicationArea = Basic;
                }
                field(RecommendationsOfRewardsOrSanctions; RecommendationsOfRewardsOrSanctions)
                {
                    ApplicationArea = Basic, Suite;
                    // Importance = Additional;
                    MultiLine = true;
                    // ShowCaption = false;
                    Caption = 'Recommendations';

                    trigger OnValidate()
                    begin
                        Rec.SetRecommendationOfRewardOrSanction(RecommendationsOfRewardsOrSanctions);
                    end;
                }
            }
            part("Evaluation Improvement Plan"; "Evaluation Improvement Plan")
            {
                Caption = 'Performance Improvement Plan';
                SubPageLink = "Perfomance Evaluation No" = field(No);
            }
            group("&PIP Comments")
            {
                Caption = 'PIP Comments & Review';
                field(PIPSupervisorComments; PIPSupervisorComments)
                {
                    ApplicationArea = Basic, Suite;
                    // Importance = Additional;
                    MultiLine = true;
                    // ShowCaption = false;
                    Caption = 'PIP Supervisor Comments';

                    trigger OnValidate()
                    begin
                        Rec.SetPIPSupervisorComments(PIPSupervisorComments);
                    end;
                }

                field(PIPEmployeeComments; PIPEmployeeComments)
                {
                    ApplicationArea = Basic, Suite;
                    // Importance = Additional;
                    MultiLine = true;
                    // ShowCaption = false;
                    Caption = 'PIP Employee Comments';

                    trigger OnValidate()
                    begin
                        Rec.SetPIPEmployeeComments(PIPEmployeeComments);
                    end;
                }

                field(PIPFinalReview; PIPFinalReview)
                {
                    ApplicationArea = Basic, Suite;
                    // Importance = Additional;
                    MultiLine = true;
                    // ShowCaption = false;
                    Caption = 'PIP Final Review';

                    trigger OnValidate()
                    begin
                        Rec.SetPIPFinalReview(PIPFinalReview);
                    end;
                }
            }
            // group("&PIP Employee Comments")
            // {
            //     Caption = 'PIP Employee Comments';

            // }
            // group("&PIP Final Review")
            // {
            //     Caption = 'PIP Final Review';

            // }
            part(Control47; "Evaluation Training Needs")
            {
                SubPageLink = "Perfomance Evaluation No" = field(No);
            }
        }
        area(factboxes)
        {
            part("Attached Documents1"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(80079), "No." =
                FIELD(No);
            }
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
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
                var
                    MidYearPerformance: Record NewAndChangedApprTargets;
                begin
                    if not Confirm('Are you sure you want to Suggest Objectives & Outcomes?', true) then
                        Error('Objectives & Outcomes not Suggested');

                    ObjectiveOutcome.Reset();
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.FindSet then
                        ObjectiveOutcome.DeleteAll();

                    MidYearPerformance.Reset();
                    MidYearPerformance.SetRange("Document No.", Rec.No);
                    if MidYearPerformance.FindSet then
                        MidYearPerformance.DeleteAll();

                    SPMGeneralSetup.Get;
                    SPMGeneralSetup.TestField("Appraisal Based On");

                    if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Direct Input" then begin
                        SPMGeneralSetup.Get();
                        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if PCObjective.FindFirst then begin
                                repeat
                                    PCObjective.TestField("Due Date");
                                until PCObjective.Next = 0;
                            end;

                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCObjective.TestField("Due Date");
                            PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCObjective.FindSet() then begin
                                repeat
                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Departmental Objective" := PCObjective."Departmental Objective";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                                    if ObjectiveOutcome.Insert(true) then begin
                                        MidYearPerformance.Init();
                                        MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                        MidYearPerformance."Line No." := FnGetLastLineNoMidY + 1;
                                        MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                        MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                        MidYearPerformance.Insert(true);
                                    end;
                                    //Sub Objective OutCome
                                    SubPCObjective.Reset;
                                    SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                                    SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    if SubPCObjective.FindSet then begin
                                        repeat
                                            SubObjectiveEvaluation.Init;
                                            SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
                                            SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                            SubObjectiveEvaluation."Scorecard ID" := PCObjective."Workplan No.";
                                            SubObjectiveEvaluation."Intiative No" := PCObjective."Initiative No.";
                                            SubObjectiveEvaluation."Objective/Initiative" := PCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                            SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Primary Directorate" := Rec.Directorate;
                                            SubObjectiveEvaluation."Primary Department" := Rec.Department;
                                            SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                            SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                            SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                            SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
                                            SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
                                            SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                            SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                            SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                            SubObjectiveEvaluation.Insert(true);

                                        until SubPCObjective.Next = 0;
                                    end;
                                //End Sub Objective OutCome
                                until PCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                //SecondaryPCObjective.TESTFIELD("Due Date");
                                until SecondaryPCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                                    if ObjectiveOutcome.Insert(true) then begin
                                        MidYearPerformance.Init();
                                        MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                        MidYearPerformance."Line No." := FnGetLastLineNoMidY + 1;
                                        MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                        MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                        MidYearPerformance.Insert(true);
                                    end;
                                    //Insert Sub Objective Outcome
                                    //Sub Objective OutCome
                                    SubPCObjective.Reset;
                                    SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                                    SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                                    if SubPCObjective.FindSet then begin
                                        repeat
                                            SubObjectiveEvaluation.Init;
                                            SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
                                            SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                            SubObjectiveEvaluation."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                            SubObjectiveEvaluation."Intiative No" := SecondaryPCObjective."Initiative No.";
                                            SubObjectiveEvaluation."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                            SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Primary Directorate" := Rec.Directorate;
                                            SubObjectiveEvaluation."Primary Department" := Rec.Department;
                                            SubObjectiveEvaluation."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                            SubObjectiveEvaluation."Key Performance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                            SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                            SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
                                            SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
                                            SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                            SubObjectiveEvaluation."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                            SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                            SubObjectiveEvaluation.Insert(true);

                                        until SubPCObjective.Next = 0;
                                    end;
                                //End Sub Objective OutCome
                                //End Insert Sub Objective Outcome

                                until SecondaryPCObjective.Next = 0;
                            end;
                        end;

                        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                            PCJobDescription.Reset;
                            PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            //  PCJobDescription.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCJobDescription.FindFirst then begin
                                repeat
                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                                    ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                                    if ObjectiveOutcome.Insert(true) then begin
                                        MidYearPerformance.Init();
                                        MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                        MidYearPerformance."Line No." := FnGetLastLineNoMidY + 1;
                                        MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                        MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                        MidYearPerformance.Insert(true);
                                    end;
                                until PCJobDescription.Next = 0;
                            end;
                        end;
                    end;

                    if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Plog Input" then begin
                        SPMGeneralSetup.Get();
                        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if PCObjective.FindFirst then begin
                                repeat
                                    PCObjective.TestField("Due Date");
                                until PCObjective.Next = 0;
                            end;

                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            //PCObjective.TESTFIELD("Due Date");
                            PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCObjective.FindFirst then begin
                                repeat

                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    /* IF AchievedTarget=0 THEN
                                        ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date");*/

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                                    ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                                    ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                                    ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                                    ObjectiveOutcome.Validate("Final/Actual Qty");
                                    if ObjectiveOutcome.Insert(true) then begin
                                        MidYearPerformance.Init();
                                        MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                        MidYearPerformance."Line No." := FnGetLastLineNoMidY + 1;
                                        MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                        MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                        MidYearPerformance.Insert(true);
                                    end;

                                    //Sub Objective OutCome
                                    AchievedSubActivityTarget := 0;
                                    SubPlogLines.Reset;
                                    SubPlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                                    SubPlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    SubPlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    SubPlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    SubPCObjective.Reset;
                                    SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                                    SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    if SubPCObjective.FindSet then begin
                                        repeat
                                            SubObjectiveEvaluation.Init;
                                            SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
                                            SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                            SubObjectiveEvaluation."Scorecard ID" := SubPCObjective."Workplan No.";
                                            SubObjectiveEvaluation."Intiative No" := SubPCObjective."Initiative No.";
                                            SubObjectiveEvaluation."Objective/Initiative" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                            SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Primary Directorate" := Rec.Directorate;
                                            SubObjectiveEvaluation."Primary Department" := Rec.Department;
                                            SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                            SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                            SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                            SubObjectiveEvaluation."Target Qty" := SubPCObjective."Sub Targets";
                                            SubObjectiveEvaluation."Self-Review Qty" := AchievedSubActivityTarget;
                                            SubObjectiveEvaluation."AppraiserReview Qty" := AchievedSubActivityTarget;
                                            SubObjectiveEvaluation."Final/Actual Qty" := AchievedSubActivityTarget;
                                            SubObjectiveEvaluation.Validate("Final/Actual Qty");
                                            SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
                                            SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                            SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                            SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                            SubObjectiveEvaluation.Insert(true);

                                        until SubPCObjective.Next = 0;
                                    end;
                                //End Sub Objective OutCome


                                until PCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                //SecondaryPCObjective.TESTFIELD("Due Date");
                                until SecondaryPCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", SecondaryPCObjective."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    /* IF AchievedTarget=0 THEN
                                        ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */


                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                                    ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                                    ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                                    ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                                    if ObjectiveOutcome.Insert(true) then begin
                                        MidYearPerformance.Init();
                                        MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                        MidYearPerformance."Line No." := FnGetLastLineNoMidY + 1;
                                        MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                        MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                        MidYearPerformance.Insert(true);
                                    end;
                                until SecondaryPCObjective.Next = 0;
                            end;
                        end;
                        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                            PCJobDescription.Reset;
                            PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCJobDescription.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCJobDescription.FindFirst then begin
                                repeat
                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", PCJobDescription."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", Format(PCJobDescription."Line Number"));
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    /*IF AchievedTarget=0 THEN
                                       ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                                    ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                                    ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                                    ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                                    ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                                    ObjectiveOutcome.Validate("Final/Actual Qty");
                                    if ObjectiveOutcome.Insert(true) then begin
                                        MidYearPerformance.Init();
                                        MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                        MidYearPerformance."Line No." := FnGetLastLineNoMidY + 1;
                                        MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                        MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                        MidYearPerformance.Insert(true);
                                    end;
                                until PCJobDescription.Next = 0;
                            end;
                        end;
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
                    if not Confirm('Are you sure you want to load Competency Templates', true) then
                        Error('Competency Templates not loaded');

                    ProEvaluation.Reset();
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.FindSet() then
                        ProEvaluation.DeleteAll();

                    CompetencyLines.Reset;
                    CompetencyLines.SetRange("Competency Template ID", Rec."Competency Template ID");
                    //MESSAGE('%1, %2', "Current Grade", CompetencyLines."Job Grade");
                    // CompetencyLines.SetRange("Job Grade", Rec."Current Grade");
                    if CompetencyLines.FindSet() then begin
                        repeat
                            ProEvaluation.Init;
                            ProEvaluation."Performance Evaluation ID" := Rec.No;
                            ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                            ProEvaluation."Competency Template ID" := Rec."Competency Template ID";
                            ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                            ProEvaluation.Validate("Competency Code");
                            ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                            ProEvaluation."Competency Description" := CompetencyLines."Competency Description";
                            ProEvaluation.Description := CompetencyLines.Description;
                            ProEvaluation."Profiency Rating Scale" := Rec."Proficiency Rating Scale";
                            ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                            ProEvaluation."Weight %" := CompetencyLines."Weight %";
                            ProEvaluation.Insert(true);
                        until CompetencyLines.Next = 0;
                    end;
                    Message('Competency Templates loaded Successfully');
                    /*
                    CompetencyLines.RESET;
                    CompetencyLines.SETRANGE("Competency Template ID","Competency Template ID");
                    IF CompetencyLines.FIND('-') THEN BEGIN
                      REPEAT
                          ProEvaluation.INIT;
                          ProEvaluation."Performance Evaluation ID":=No;
                          ProEvaluation."Line No":=FnGetLastLineNoB+1;
                          ProEvaluation."Competency Template ID":="Competency Template ID";
                          ProEvaluation."Competency Code":=CompetencyLines."Competency Code";
                          ProEvaluation.VALIDATE("Competency Code");
                          ProEvaluation."Competency Category":=CompetencyLines."Competency Category";
                          ProEvaluation.Description:=CompetencyLines.Description;
                          ProEvaluation."Profiency Rating Scale":="Proficiency Rating Scale";
                          ProEvaluation."Target Qty":=CompetencyLines."Weight %";
                          ProEvaluation."Weight %":=CompetencyLines."Weight %";
                          ProEvaluation.INSERT(TRUE);
                        UNTIL CompetencyLines.NEXT=0;
                     END;
                       MESSAGE('Competency Templates loaded Successfully');
                    */

                end;
            }
            separator(Action42)
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
                    Reset();
                    Rec.SetRange(No, Rec.No);
                    // Report.Run(50022,true,true,Rec)
                    Report.Run(report::"Standard Performance Appraisal", true, true, Rec);
                end;
            }
            separator(Action40)
            {
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
                //   ApprovalMgt: Codeunit "Approvals Mgmt.";
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
        Rec."Evaluation Type" := Rec."evaluation type"::"Standard Appraisal/Supervisor Score Only";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Standard Appraisal/Supervisor Score Only";
        // Rec.Validate("Employee No.");
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
        SubObjectiveEvaluation: Record "Sub Objective Evaluation";
        SubPCObjective: Record "Sub PC Objective";
        AchievedSubActivityTarget: Decimal;
        SubPlogLines: Record "Sub Plog Lines";
        PIPSupervisorComments: Text;
        PIPEmployeeComments: Text;
        PIPFinalReview: Text;
        RecommendationsOfRewardsOrSanctions: Text;

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

    local procedure FnGetLastSubPcLineNo() LineNumber: Integer
    var
        Billable: Record "Sub Objective Evaluation";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoMidY() LineNumber: Integer
    var
        MidY: Record NewAndChangedApprTargets;
    begin
        MidY.Reset;
        if MidY.Find('+') then
            LineNumber := MidY."Line No."
        else
            LineNumber := 1;
        exit(LineNumber);
    end;
}



