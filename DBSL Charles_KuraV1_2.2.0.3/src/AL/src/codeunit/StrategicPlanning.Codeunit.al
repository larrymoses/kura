#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 57007 "Strategic Planning"
{

    trigger OnRun()
    begin
    end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        FIleManagement: Codeunit "File Management";
        ExcelExt: Text;
        AnnualWorkPlan: Record "Strategy Workplan Lines";
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        WPlanLines: Record "Strategy Workplan Lines";
        I: Integer;
        ThemeID: Code[50];
        ObjectiveID: Code[50];
        StrategicInt: Record "Strategic Initiative";
        SourceType: Option "Strategic Plan","Perfomance Contract";
        YearCode: Record "Annual Reporting Codes";
        QYearCode: Record "Quarterly Reporting Periods";
        QCount: Integer;
        Q1: Code[20];
        Q1date: Date;
        Q2: Code[20];
        Q2date: Date;
        Q3: Code[20];
        Q3date: Date;
        Q4: Code[20];
        Q4date: Date;
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        ReviewPeriods: Record "Review Periods";
        SPMGeneralSetup: Record "SPM General Setup";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";


    procedure fnPostPlanEntry(WPlanLines: Record "Strategy Workplan Lines")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, WPlanLines."Activity ID");
        if StrategicInt.Find('-') then begin
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        QYearCode.Reset;
        QYearCode.SetRange("Year Code", WPlanLines."Year Reporting Code");
        if QYearCode.Find('-') then begin
            repeat
                QCount := QCount + 1;
                if (QCount = 1) then begin
                    Q1 := QYearCode.Code;
                    Q1date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 2) then begin
                    Q2 := QYearCode.Code;
                    Q2date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 3) then begin
                    Q3 := QYearCode.Code;
                    Q3date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 4) then begin
                    Q4 := QYearCode.Code;
                    Q4date := QYearCode."Reporting Start Date";
                end;
            until QYearCode.Next = 0;
        end;


        // I:=0;
        for I := 1 to 4 do begin

            if (I = 1) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q1, Q1date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q1 Target", WPlanLines."Q1 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;
            if (I = 2) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q2, Q2date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q2 Target", WPlanLines."Q2 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;

            if (I = 3) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q3, Q3date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q3 Target", WPlanLines."Q3 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");

            end;
            if (I = 4) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q4, Q4date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q4 Target", WPlanLines."Q4 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;
        end;
    end;


    procedure FnInsertEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry.Insert(true);
    end;


    procedure fnPostObjectiveEntry(ObjectiveOutcome: Record "Objective Evaluation Result")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        PerformanceEvaluation: Record "Perfomance Evaluation";
        ReviewQuarterlyPeriods: Record "Review Quarterly Periods";
        StrategicPlan: Code[50];
        EntryType: Option Planned,Actual;
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, ObjectiveOutcome."Intiative No");
        if StrategicInt.Find('-') then begin
            StrategicPlan := StrategicInt."Strategic Plan ID";
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        PerformanceEvaluation.Reset;
        PerformanceEvaluation.SetRange(No, ObjectiveOutcome."Performance Evaluation ID");
        if PerformanceEvaluation.FindFirst then begin
            ReviewPeriods.Reset;
            ReviewPeriods.SetRange(Code, PerformanceEvaluation."Review Period");
            if ReviewPeriods.FindFirst then begin
                QCount := 0;
                case ReviewPeriods."Review Type" of
                    ReviewPeriods."review type"::Quartely:
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                               ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                               ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty", 0,
                               ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                            end;
                        end;
                    ReviewPeriods."review type"::"Semi-Quartely":
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                repeat
                                    FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                                    ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                                    ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty" / ReviewPeriods."No of Quarters", 0,
                                    ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                                until ReviewQuarterlyPeriods.Next = 0;
                            end;

                        end;
                    ReviewPeriods."review type"::Annually:
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                repeat
                                    FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                                    ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                                    ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty" / ReviewPeriods."No of Quarters", 0,
                                    ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                                until ReviewQuarterlyPeriods.Next = 0;
                            end;

                        end else
                                Error('Review Type Category must be selected for Review Period %1', ReviewPeriods.Code);
                end;
            end;
        end;

    end;


    procedure FnGenerateBatchAppraisals(PerformancePlanTask: Record "Performance Plan Task"; StrategicID: Code[10])
    var
        Employee: Record Employee;
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        PerformanceManagementPlan: Record "Performance Management Plan";
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AnnualReportingCode: Code[30];
        PerfomanceEvaluationNo: Code[30];
    begin
        Employee.Reset;
        Employee.SetRange(Status, Employee.Status::Active);
        //Employee.SETRANGE("Primary Bank %",TRUE);
        if Employee.Find('-') then begin
            repeat
                SPMSetup.Get;
                PerfomanceEvaluation.Init;
                PerfomanceEvaluation."Document Type" := PerfomanceEvaluation."document type"::"Performance Appraisal";
                PerformanceManagementPlan.Reset;
                PerformanceManagementPlan.SetRange(No, PerformancePlanTask."Performance Mgt Plan ID");
                if PerformanceManagementPlan.Find('-') then begin
                    // PerformanceManagementPlan.TESTFIELD("Evaluation Type");
                    PerformanceManagementPlan.TestField("Strategy Plan ID");
                    PerformanceManagementPlan.TestField("Annual Reporting Code");
                    StrategicID := PerformanceManagementPlan."Strategy Plan ID";
                    AnnualReportingCode := PerformanceManagementPlan."Annual Reporting Code";
                    PerfomanceEvaluation."Evaluation Type" := PerformanceManagementPlan."Evaluation Type";
                end;
                PerfomanceEvaluation.No := '';
                PerfomanceEvaluation."Performance Mgt Plan ID" := PerformancePlanTask."Performance Mgt Plan ID";
                PerfomanceEvaluation."Strategy Plan ID" := StrategicID;
                PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
                PerfomanceEvaluation."Performance Task ID" := PerformancePlanTask."Task Code";
                PerfomanceEvaluation.Validate("Performance Task ID");
                PerfomanceEvaluation."Employee No." := Employee."No.";
                PerfomanceEvaluation.Validate("Employee No.");
                PerfomanceEvaluation."Personal Scorecard ID" := FnGetPersonalScorecard(Employee."No.", AnnualReportingCode);
                PerfomanceEvaluation."Annual Reporting Code" := AnnualReportingCode;
                if PerfomanceEvaluation.Insert(true) then begin
                    FnSuggestObjectives(PerfomanceEvaluation);
                    FnSuggestEvaluations(PerfomanceEvaluation);
                end;
            until Employee.Next = 0;
        end;
        Message('Employees Performance Appraisals Generated Successfully');
    end;


    procedure FnGetPersonalScorecard(EmployeeNo: Code[30]; AnnualReportingCode: Code[10]) PersonalScoreCard: Code[10]
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange("Responsible Employee No.", EmployeeNo);
        PerfomanceContractHeader.SetRange("Annual Reporting Code", AnnualReportingCode);
        PerfomanceContractHeader.SetRange("Document Type", PerfomanceContractHeader."document type"::"Individual Scorecard");
        PerfomanceContractHeader.SetRange(Status, PerfomanceContractHeader.Status::Signed);
        if PerfomanceContractHeader.FindFirst then begin
            PersonalScoreCard := PerfomanceContractHeader.No;
            exit(PersonalScoreCard);
        end else
            Error('Employee No %1 does not have a Signed Performance Contract for Annual Period %2', EmployeeNo, AnnualReportingCode);
    end;

    procedure FnUpdateAnnualWorkplan(AnnualStrategyWorkplan: record "Annual Strategy Workplan")
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        StrategyWorkplanLines1: Record "Strategy Workplan Lines";
        BoardActivities: Record "Board Activities";
        BoardActivities1: Record "Board Activities";
        BoardSubActivities: Record "Board Sub Activities";
        BoardSubActivities1: Record "Board Sub Activities";
        SubWorkplanActivity: Record "Sub Workplan Activity";
        SubWorkplanActivity1: Record "Sub Workplan Activity";
        WorkplanCostElements: Record "Workplan Cost Elements";
        WorkplanCostElement1: Record "Workplan Cost Elements";
    begin
        AnnualStrategyWorkplan.TESTFIELD("Annual Workplan");
        //AnnualStrategyWorkplan.TESTFIELD("Functional Procurment Plan No");
        AnnualStrategyWorkplan.TESTFIELD("Approval Status", AnnualStrategyWorkplan."Approval Status"::Released);

        AnnualStrategyWorkplan.TESTFIELD("Annual Workplan");
        AnnualStrategyWorkplan.TESTFIELD(Posted, FALSE);
        AnnualStrategyWorkplan.CALCFIELDS("Total Assigned Weight(%)");
        IF AnnualStrategyWorkplan."Total Assigned Weight(%)" <> 100 THEN
            ERROR('Assigned Weight should be equals to 100%');

        IF NOT CONFIRM('Are you sure you want to update the Selected Annual Workplan?', TRUE) THEN BEGIN
            ERROR('Annual Workplan not Updated');
        END;
        //Insert Strategy Workplan Lines
        StrategyWorkplanLines.RESET;
        StrategyWorkplanLines.SETRANGE(No, AnnualStrategyWorkplan.No);
        IF StrategyWorkplanLines.FINDSET THEN BEGIN
            REPEAT
                StrategyWorkplanLines.TESTFIELD("Primary Directorate");
                StrategyWorkplanLines.TESTFIELD("Primary Department");

                StrategyWorkplanLines1.INIT;
                StrategyWorkplanLines1.No := AnnualStrategyWorkplan."Annual Workplan";
                StrategyWorkplanLines1."Strategy Plan ID" := StrategyWorkplanLines."Strategy Plan ID";
                StrategyWorkplanLines1."Activity ID" := StrategyWorkplanLines."Activity ID";
                StrategyWorkplanLines1.Description := StrategyWorkplanLines.Description;
                StrategyWorkplanLines1."Goal ID" := StrategyWorkplanLines."Goal ID";
                StrategyWorkplanLines1."Cross Cutting" := StrategyWorkplanLines."Cross Cutting";
                StrategyWorkplanLines1."Imported Annual Target Qty" := StrategyWorkplanLines."Imported Annual Target Qty";
                StrategyWorkplanLines1."Imported Annual Budget Est." := StrategyWorkplanLines."Imported Annual Budget Est.";
                StrategyWorkplanLines1."Primary Department" := StrategyWorkplanLines."Primary Department";
                StrategyWorkplanLines1."Primary Department Name" := StrategyWorkplanLines."Primary Department Name";
                StrategyWorkplanLines1."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                StrategyWorkplanLines1."Primary Directorate Name" := StrategyWorkplanLines."Primary Directorate Name";
                StrategyWorkplanLines1."Q1 Target" := StrategyWorkplanLines."Q1 Target";
                StrategyWorkplanLines1."Q1 Budget" := StrategyWorkplanLines."Q1 Budget";
                StrategyWorkplanLines1."Q2 Target" := StrategyWorkplanLines."Q2 Target";
                StrategyWorkplanLines1."Q2 Budget" := StrategyWorkplanLines."Q2 Budget";
                StrategyWorkplanLines1."Q3 Target" := StrategyWorkplanLines."Q3 Target";
                StrategyWorkplanLines1."Q3 Budget" := StrategyWorkplanLines."Q3 Budget";
                StrategyWorkplanLines1."Q4 Target" := StrategyWorkplanLines."Q4 Target";
                StrategyWorkplanLines1."Q4 Budget" := StrategyWorkplanLines."Q4 Budget";
                StrategyWorkplanLines1."Entry Type" := StrategyWorkplanLines."Entry Type";
                StrategyWorkplanLines1."Year Reporting Code" := StrategyWorkplanLines."Year Reporting Code";
                StrategyWorkplanLines1."Perfomance Indicator" := FORMAT(StrategyWorkplanLines."Perfomance Indicator");
                StrategyWorkplanLines1."Source Of Fund" := StrategyWorkplanLines."Source Of Fund";
                StrategyWorkplanLines1."Unit of Measure" := StrategyWorkplanLines."Unit of Measure";
                StrategyWorkplanLines1."Desired Perfomance Direction" := StrategyWorkplanLines."Desired Perfomance Direction";
                StrategyWorkplanLines1."Strategy Framework" := StrategyWorkplanLines."Strategy Framework";
                StrategyWorkplanLines1."Framework Perspective" := StrategyWorkplanLines."Framework Perspective";
                StrategyWorkplanLines1."Key Performance Indicator" := StrategyWorkplanLines."Key Performance Indicator";
                StrategyWorkplanLines1."Assigned Weight(%)" := StrategyWorkplanLines."Assigned Weight(%)";
                StrategyWorkplanLines1."Annual Budget" := StrategyWorkplanLines."Annual Budget";
                StrategyWorkplanLines1."Annual Target" := StrategyWorkplanLines."Annual Target";
                StrategyWorkplanLines1."Total Subactivity budget" := StrategyWorkplanLines."Total Subactivity budget";
                StrategyWorkplanLines1."Departmental Activity Weight" := StrategyWorkplanLines."Departmental Activity Weight";
                StrategyWorkplanLines1.INSERT(TRUE);

                //Insert Annual Workplan Sub-Activities
                SubWorkplanActivity.RESET;
                SubWorkplanActivity.SETRANGE("Workplan No.", AnnualStrategyWorkplan.No);
                SubWorkplanActivity.SETRANGE("Activity Id", StrategyWorkplanLines."Activity ID");
                IF SubWorkplanActivity.FINDSET THEN BEGIN
                    REPEAT
                        // ERROR('Testing');
                        SubWorkplanActivity1.INIT;
                        SubWorkplanActivity1."Workplan No." := AnnualStrategyWorkplan."Annual Workplan";
                        SubWorkplanActivity1."Initiative No." := SubWorkplanActivity."Initiative No.";
                        SubWorkplanActivity1."Activity Id" := SubWorkplanActivity."Activity Id";
                        SubWorkplanActivity1."Objective/Initiative" := SubWorkplanActivity."Objective/Initiative";
                        SubWorkplanActivity1."Sub Initiative No." := SubWorkplanActivity."Sub Initiative No.";
                        SubWorkplanActivity1."Unit of Measure" := SubWorkplanActivity."Unit of Measure";
                        SubWorkplanActivity1."Imported Annual Target Qty" := SubWorkplanActivity."Imported Annual Target Qty";
                        SubWorkplanActivity1.Weight := SubWorkplanActivity.Weight;
                        SubWorkplanActivity1."Q1 Actual Qty" := SubWorkplanActivity."Q1 Actual Qty";
                        SubWorkplanActivity1."Q1 ManagerReview Qty" := SubWorkplanActivity."Q1 ManagerReview Qty";
                        SubWorkplanActivity1."Q1 Self-Review Qty" := SubWorkplanActivity."Q1 Self-Review Qty";
                        SubWorkplanActivity1."Q1 Target Qty" := SubWorkplanActivity."Q1 Target Qty";
                        SubWorkplanActivity1."Q2 Actual Qty" := SubWorkplanActivity."Q2 Actual Qty";
                        SubWorkplanActivity1."Q2 ManagerReview Qty" := SubWorkplanActivity."Q2 ManagerReview Qty";
                        SubWorkplanActivity1."Q2 Self-Review Qty" := SubWorkplanActivity."Q2 Self-Review Qty";
                        SubWorkplanActivity1."Q2 Target Qty" := SubWorkplanActivity."Q2 Target Qty";
                        SubWorkplanActivity1."Q3 Actual Qty" := SubWorkplanActivity."Q3 Actual Qty";
                        SubWorkplanActivity1."Q3 ManagerReview Qty" := SubWorkplanActivity."Q3 ManagerReview Qty";
                        SubWorkplanActivity1."Q3 Self-Review Qty" := SubWorkplanActivity."Q3 Self-Review Qty";
                        SubWorkplanActivity1."Q3 Target Qty" := SubWorkplanActivity."Q3 Target Qty";
                        SubWorkplanActivity1."Q4 Actual Qty" := SubWorkplanActivity."Q4 Actual Qty";
                        SubWorkplanActivity1."Q4 ManagerReview Qty" := SubWorkplanActivity."Q4 ManagerReview Qty";
                        SubWorkplanActivity1."Q4 Self-Review Qty" := SubWorkplanActivity."Q4 Self-Review Qty";
                        SubWorkplanActivity1."Q4 Target Qty" := SubWorkplanActivity."Q4 Target Qty";
                        SubWorkplanActivity1."Total Budget" := SubWorkplanActivity."Total Budget";
                        SubWorkplanActivity1."Due Date" := SubWorkplanActivity."Due Date";
                        SubWorkplanActivity1."Strategy Plan ID" := SubWorkplanActivity."Strategy Plan ID";
                        IF SubWorkplanActivity1.INSERT = TRUE THEN BEGIN
                            //work plan cost elements
                            WorkplanCostElements.RESET;
                            WorkplanCostElements.SETRANGE("Workplan No.", AnnualStrategyWorkplan.No);
                            WorkplanCostElements.SETRANGE("Activity Id", SubWorkplanActivity."Activity Id");
                            WorkplanCostElements.SETRANGE("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                            IF WorkplanCostElements.FINDSET THEN BEGIN
                                REPEAT
                                    // WorkplanCostElements.TESTFIELD("Plan Item No");
                                    //WorkplanCostElements.TESTFIELD("Unit Cost");
                                    //                       WorkplanCostElements.TESTFIELD(Quantity);
                                    //                       WorkplanCostElements.TESTFIELD(Amount);// to be uncommented in future

                                    WorkplanCostElement1.INIT;
                                    WorkplanCostElement1."Workplan No." := AnnualStrategyWorkplan."Annual Workplan";
                                    WorkplanCostElement1."Activity Id" := WorkplanCostElements."Activity Id";
                                    WorkplanCostElement1."Sub Activity No" := WorkplanCostElements."Sub Activity No";
                                    WorkplanCostElement1."Initiative No." := WorkplanCostElements."Initiative No.";
                                    WorkplanCostElement1.TRANSFERFIELDS(WorkplanCostElements, FALSE);
                                    WorkplanCostElement1."Functional Procurment Plan No" := AnnualStrategyWorkplan."Functional Procurment Plan No";
                                    WorkplanCostElement1.INSERT;
                                UNTIL WorkplanCostElements.NEXT = 0;
                            END;
                        END;
                    UNTIL SubWorkplanActivity.NEXT = 0;
                END;
            UNTIL StrategyWorkplanLines.NEXT = 0;
        END;
        //Insert Board Activities
        BoardActivities.RESET;
        BoardActivities.SETRANGE("AWP No", AnnualStrategyWorkplan.No);
        IF BoardActivities.FINDSET THEN BEGIN
            REPEAT
                BoardActivities1.INIT;
                BoardActivities1."AWP No" := AnnualStrategyWorkplan."Annual Workplan";
                BoardActivities1."Board Activity Code" := BoardActivities."Board Activity Code";
                BoardActivities1."Activity Code" := BoardActivities."Activity Code";
                BoardActivities1."Board Activity Description" := BoardActivities."Board Activity Description";
                BoardActivities1."Activity Description" := BoardActivities."Activity Description";
                BoardActivities1."Unit of Measure" := BoardActivities."Unit of Measure";
                BoardActivities1."WT(%)" := BoardActivities."WT(%)";
                BoardActivities1.Target := BoardActivities.Target;
                BoardActivities1."Framework Perspective" := BoardActivities."Framework Perspective";
                BoardActivities1."Strategy Framework" := BoardActivities."Strategy Framework";
                BoardActivities1."Achieved Targets" := BoardActivities."Achieved Targets";
                //BoardActivities1."Outcome Performance Indicator":=BoardActivities."Outcome Performance Indicator";
                //BoardActivities1."Previous Annual Target Qty":=BoardActivities."Previous Annual Target Qty";
                IF BoardActivities1.INSERT = TRUE THEN BEGIN
                    //Insert Board sub-Activities
                    BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE("Workplan No.", AnnualStrategyWorkplan.No);
                    BoardSubActivities.SETRANGE("Initiative No.", BoardActivities."Board Activity Code");
                    BoardSubActivities.SETRANGE("Activity Id", BoardActivities."Activity Code");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                        REPEAT
                            BoardSubActivities1.INIT;
                            BoardSubActivities1."Workplan No." := AnnualStrategyWorkplan."Annual Workplan";
                            BoardSubActivities1."Initiative No." := BoardSubActivities."Initiative No.";
                            BoardSubActivities1."Activity Id" := BoardSubActivities."Activity Id";
                            BoardSubActivities1."Entry Number" := BoardSubActivities."Entry Number";
                            BoardSubActivities1."Objective/Initiative" := BoardSubActivities."Objective/Initiative";
                            BoardSubActivities1."Initiative Type" := BoardSubActivities."Initiative Type";
                            BoardSubActivities1."Task Type" := BoardSubActivities."Task Type";
                            BoardSubActivities1.Indentation := BoardSubActivities.Indentation;
                            BoardSubActivities1."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                            BoardSubActivities1."Year Reporting Code" := BoardSubActivities."Year Reporting Code";
                            BoardSubActivities1."Start Date" := BoardSubActivities."Start Date";
                            BoardSubActivities1."Due Date" := BoardSubActivities."Due Date";
                            BoardSubActivities1."Primary Department" := BoardSubActivities."Primary Department";
                            BoardSubActivities1."Primary Directorate" := BoardSubActivities."Primary Directorate";
                            BoardSubActivities1."Outcome Perfomance Indicator" := BoardSubActivities."Outcome Perfomance Indicator";
                            BoardSubActivities1."Q1 Target Qty" := BoardSubActivities."Q1 Target Qty";
                            BoardSubActivities1."Q2 Target Qty" := BoardSubActivities."Q2 Target Qty";
                            BoardSubActivities1."Q3 Target Qty" := BoardSubActivities."Q3 Target Qty";
                            BoardSubActivities1."Q4 Target Qty" := BoardSubActivities."Q4 Target Qty";
                            BoardSubActivities1."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                            BoardSubActivities1."Sub Targets" := BoardSubActivities."Sub Targets";
                        UNTIL BoardSubActivities.NEXT = 0;
                    END;
                END;
            UNTIL BoardActivities.NEXT = 0;
        END;

        AnnualStrategyWorkplan.Posted := TRUE;
        AnnualStrategyWorkplan.MODIFY;
        MESSAGE('Annual Workplan Updated Successfully!');
    end;
    ///
    procedure FnSuggestObjectives(PerfomanceEvaluation: Record "Perfomance Evaluation")
    begin
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
        PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
        if PCObjective.FindFirst then begin
            repeat

                ObjectiveOutcome.Init;
                ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                ObjectiveOutcome.Insert(true);

            until PCObjective.Next = 0;

        end;
    end;

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


    procedure FnSuggestEvaluations(PerfomanceEvaluation: Record "Perfomance Evaluation")
    begin
        CompetencyLines.Reset;
        CompetencyLines.SetRange("Competency Template ID", PerfomanceEvaluation."Competency Template ID");
        if CompetencyLines.Find('-') then begin
            repeat

                ProEvaluation.Init;
                ProEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                ProEvaluation."Competency Template ID" := PerfomanceEvaluation."Competency Template ID";
                ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                ProEvaluation.Description := CompetencyLines.Description;
                ProEvaluation."Profiency Rating Scale" := PerfomanceEvaluation."Proficiency Rating Scale";
                ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                ProEvaluation."Weight %" := CompetencyLines."Weight %";
                ProEvaluation.Insert(true);
            until CompetencyLines.Next = 0;
        end;
    end;


    procedure FnUpdateOrganizationalPC(AnnualStrategyWorkplan: Record "Annual Strategy Workplan")
    var
        PlogLines: Record "Plog Lines";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";
        StrategyWorkplanLines: record "Strategy Workplan Lines";
        StrategyWorkplanLines1: record "Strategy Workplan Lines";
        BoardActivities: Record "Board Activities";
        BoardActivities1: Record "Board Activities";
        BoardSubActivities: Record "Board Sub Activities";
        BoardSubActivities1: Record "Board Sub Activities";
        SubWorkplanActivity: Record "Sub Workplan Activity";
        SubWorkplanActivity1: Record "Sub Workplan Activity";
        WorkplanCostElements: Record "Workplan Cost Elements";
        WorkplanCostElements1: Record "Workplan Cost Elements";
    //  AnnualStrategyWorkplan: Record "Annual Strategy Workplan";

    begin
        //  AnnualStRategyWorkplan.TestField("Organiztional PC");

        // AnnualStrategyWorkplan.TESTFIELD("Annual Workplan");
        // AnnualStrategyWorkplan.TESTFIELD(Posted, FALSE);
        // AnnualStrategyWorkplan.CALCFIELDS("Total Assigned Weight(%)");
        // IF AnnualStrategyWorkplan."Total Assigned Weight(%)"<>100 THEN
        //   ERROR('Assigned Weight should be equals to 100%');
        // 
        // IF NOT CONFIRM('Are you sure you want to update the Selected Annual Workplan?', TRUE) THEN BEGIN
        //  ERROR('Annual Workplan not Updated');
        //  END;
        //Insert Strategy Workplan Lines
        // StrategyWorkplanLines.RESET;
        // StrategyWorkplanLines.SETRANGE(No, AnnualStrategyWorkplan.No);
        // IF StrategyWorkplanLines.FINDSET THEN BEGIN
        //  REPEAT
        //    StrategyWorkplanLines.TESTFIELD("Primary Directorate");
        //    StrategyWorkplanLines.TESTFIELD("Primary Department");
        // 
        //    StrategyWorkplanLines1.INIT;
        //    StrategyWorkplanLines1.No:=AnnualStrategyWorkplan."Annual Workplan";
        //    StrategyWorkplanLines1."Strategy Plan ID":=StrategyWorkplanLines."Strategy Plan ID";
        //    StrategyWorkplanLines1."Activity ID":=StrategyWorkplanLines."Activity ID";
        //    StrategyWorkplanLines1.Description:=StrategyWorkplanLines.Description;
        //    StrategyWorkplanLines1."Cross Cutting":=StrategyWorkplanLines."Cross Cutting";
        //    StrategyWorkplanLines1."Imported Annual Target Qty":=StrategyWorkplanLines."Imported Annual Target Qty";
        //    StrategyWorkplanLines1."Imported Annual Budget Est.":=StrategyWorkplanLines."Imported Annual Budget Est.";
        //    StrategyWorkplanLines1."Primary Department":=StrategyWorkplanLines."Primary Department";
        //    StrategyWorkplanLines1."Primary Department Name":=StrategyWorkplanLines."Primary Department Name";
        //    StrategyWorkplanLines1."Primary Directorate":=StrategyWorkplanLines."Primary Directorate";
        //    StrategyWorkplanLines1."Primary Directorate Name":=StrategyWorkplanLines."Primary Directorate Name";
        //    StrategyWorkplanLines1."Q1 Target":=StrategyWorkplanLines."Q1 Target";
        //    StrategyWorkplanLines1."Q1 Budget":=StrategyWorkplanLines."Q1 Budget";
        //    StrategyWorkplanLines1."Q2 Target":=StrategyWorkplanLines."Q2 Target";
        //    StrategyWorkplanLines1."Q2 Budget":=StrategyWorkplanLines."Q2 Budget";
        //    StrategyWorkplanLines1."Q3 Target":=StrategyWorkplanLines."Q3 Target";
        //    StrategyWorkplanLines1."Q3 Budget":=StrategyWorkplanLines."Q3 Budget";
        //    StrategyWorkplanLines1."Q4 Target":=StrategyWorkplanLines."Q4 Target";
        //    StrategyWorkplanLines1."Q4 Budget":=StrategyWorkplanLines."Q4 Budget";
        //    StrategyWorkplanLines1."Entry Type":=StrategyWorkplanLines."Entry Type";
        //    StrategyWorkplanLines1."Year Reporting Code":=StrategyWorkplanLines."Year Reporting Code";
        //    StrategyWorkplanLines1."Perfomance Indicator":=FORMAT(StrategyWorkplanLines."Perfomance Indicator");
        //    StrategyWorkplanLines1."Source Of Fund":=StrategyWorkplanLines."Source Of Fund";
        //    StrategyWorkplanLines1."Unit of Measure":=StrategyWorkplanLines."Unit of Measure";
        //    StrategyWorkplanLines1."Desired Perfomance Direction":=StrategyWorkplanLines."Desired Perfomance Direction";
        //    StrategyWorkplanLines1."Strategy Framework":=StrategyWorkplanLines."Strategy Framework";
        //    StrategyWorkplanLines1."Framework Perspective":=StrategyWorkplanLines."Framework Perspective";
        //    StrategyWorkplanLines1."Key Performance Indicator":=StrategyWorkplanLines."Key Performance Indicator";
        //    StrategyWorkplanLines1."Assigned Weight(%)":=StrategyWorkplanLines."Assigned Weight(%)";
        //    StrategyWorkplanLines1."Annual Budget":=StrategyWorkplanLines."Annual Budget";
        //    StrategyWorkplanLines1."Annual Target":=StrategyWorkplanLines."Annual Target";
        //    StrategyWorkplanLines1."Total Subactivity budget":=StrategyWorkplanLines."Total Subactivity budget";
        //    StrategyWorkplanLines1."Departmental Activity Weight":=StrategyWorkplanLines."Departmental Activity Weight";
        //    StrategyWorkplanLines1.INSERT(TRUE);
        // 
        //        //Insert Annual Workplan Sub-Activities
        //  SubWorkplanActivity.RESET;
        //  SubWorkplanActivity.SETRANGE("Workplan No.", AnnualStrategyWorkplan.No);
        //  SubWorkplanActivity.SETRANGE("Activity Id",StrategyWorkplanLines."Activity ID");
        //  IF SubWorkplanActivity.FINDSET THEN BEGIN
        //    REPEAT
        //     // ERROR('Testing');
        //      SubWorkplanActivity1.INIT;
        //      SubWorkplanActivity1."Workplan No.":=AnnualStrategyWorkplan."Annual Workplan";
        //      SubWorkplanActivity1."Initiative No.":=SubWorkplanActivity."Initiative No.";
        //      SubWorkplanActivity1."Activity Id":=SubWorkplanActivity."Activity Id";
        //      SubWorkplanActivity1."Objective/Initiative":=SubWorkplanActivity."Objective/Initiative";
        //      SubWorkplanActivity1."Sub Initiative No.":=SubWorkplanActivity."Sub Initiative No.";
        //      SubWorkplanActivity1."Unit of Measure":=SubWorkplanActivity."Unit of Measure";
        //      SubWorkplanActivity1."Imported Annual Target Qty":=SubWorkplanActivity."Imported Annual Target Qty";
        //      SubWorkplanActivity1.Weight:=SubWorkplanActivity.Weight;
        //      SubWorkplanActivity1."Total Budget":=SubWorkplanActivity."Total Budget";
        //      SubWorkplanActivity1."Due Date":=SubWorkplanActivity."Due Date";
        //      SubWorkplanActivity1."Strategy Plan ID":=SubWorkplanActivity."Strategy Plan ID";
        //      IF SubWorkplanActivity1.INSERT=TRUE THEN BEGIN
        //       //work plan cost elements
        //       WorkplanCostElements.RESET;
        //       WorkplanCostElements.SETRANGE("Workplan No.",AnnualStrategyWorkplan.No);
        //       WorkplanCostElements.SETRANGE("Activity Id",SubWorkplanActivity."Activity Id");
        //       WorkplanCostElements.SETRANGE("Sub Activity No",SubWorkplanActivity."Sub Initiative No.");
        //       IF WorkplanCostElements.FINDSET THEN BEGIN
        //         REPEAT
        //           // WorkplanCostElements.TESTFIELD("Plan Item No");
        //            {WorkplanCostElements.TESTFIELD("Unit Cost");
        //            WorkplanCostElements.TESTFIELD(Quantity);
        //            WorkplanCostElements.TESTFIELD(Amount);}// to be uncommented in future
        // 
        //            WorkplanCostElement1.INIT;
        //            WorkplanCostElement1."Workplan No.":=AnnualStrategyWorkplan."Annual Workplan";
        //            WorkplanCostElement1."Activity Id":= WorkplanCostElements."Activity Id";
        //            WorkplanCostElement1."Sub Activity No":= WorkplanCostElements."Sub Activity No";
        //            WorkplanCostElement1."Initiative No.":= WorkplanCostElements."Initiative No.";
        //            WorkplanCostElement1.TRANSFERFIELDS( WorkplanCostElements,FALSE);
        //            WorkplanCostElement1."Functional Procurment Plan No":=AnnualStrategyWorkplan."Functional Procurment Plan No";
        //            WorkplanCostElement1.INSERT;
        //         UNTIL WorkplanCostElements.NEXT=0;
        //         END;
        //        END;
        //      UNTIL SubWorkplanActivity.NEXT=0;
        //    END;
        //    UNTIL StrategyWorkplanLines.NEXT=0;
        //  END;

        IF NOT CONFIRM('Are you sure you want to update the Selected Annual Workplan?', TRUE) THEN BEGIN
            ERROR('Annual Workplan not Updated');
        end;
        //Insert Board Activities
        BoardActivities.RESET;
        BoardActivities.SETRANGE("AWP No", AnnualStrategyWorkplan.No);
        //  Message('%1', AnnualStrategyWorkplan.No);
        IF BoardActivities.FINDSET THEN BEGIN
            REPEAT
                BoardActivities1.INIT;
                BoardActivities1."AWP No" := AnnualStrategyWorkplan."Organiztional PC";
                BoardActivities1."Primary Directorate" := AnnualStrategyWorkplan."Primary Directorate";
                BoardActivities1."Primary Department" := AnnualStrategyWorkplan.Department;
                BoardActivities1."Board Activity Code" := BoardActivities."Board Activity Code";
                BoardActivities1."Activity Code" := BoardActivities."Activity Code";
                BoardActivities1."Board Activity Description" := BoardActivities."Board Activity Description";
                BoardActivities1."Activity Description" := BoardActivities."Activity Description";
                BoardActivities1."Unit of Measure" := BoardActivities."Unit of Measure";
                BoardActivities1."WT(%)" := BoardActivities."WT(%)";
                BoardActivities1.Target := BoardActivities.Target;
                BoardActivities1."Framework Perspective" := BoardActivities."Framework Perspective";
                BoardActivities1."Strategy Framework" := BoardActivities."Strategy Framework";
                //cc// BoardActivities1."Achieved Target" := BoardActivities."Achieved Target";
                //BoardActivities1."Outcome Performance Indicator":=BoardActivities."Outcome Performance Indicator";
                //BoardActivities1."Previous Annual Target Qty":=BoardActivities."Previous Annual Target Qty";
                IF BoardActivities1.INSERT = TRUE THEN BEGIN
                    //Insert Board sub-Activities
                    MESSAGE('Test Sub One');
                    BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE("Workplan No.", AnnualStrategyWorkplan.No);
                    BoardSubActivities.SETRANGE("Initiative No.", BoardActivities."Board Activity Code");
                    BoardSubActivities.SETRANGE("Activity Id", BoardActivities."Activity Code");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                        REPEAT
                            MESSAGE('Test Sub Two');
                            BoardSubActivities1.INIT;
                            BoardSubActivities1."Workplan No." := AnnualStrategyWorkplan."Organiztional PC";
                            BoardSubActivities1."Initiative No." := BoardSubActivities."Initiative No.";
                            BoardSubActivities1."Activity Id" := BoardSubActivities."Activity Id";
                            BoardSubActivities1."Entry Number" := BoardSubActivities."Entry Number";
                            BoardSubActivities1."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                            IF BoardSubActivities1."Objective/Initiative" <> BoardSubActivities."Objective/Initiative" THEN BEGIN
                                BoardSubActivities1."Objective/Initiative" := BoardSubActivities."Objective/Initiative";
                            END;
                            BoardSubActivities1."Initiative Type" := BoardSubActivities."Initiative Type";
                            BoardSubActivities1."Task Type" := BoardSubActivities."Task Type";
                            BoardSubActivities1.Indentation := BoardSubActivities.Indentation;
                            BoardSubActivities1."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                            BoardSubActivities1."Year Reporting Code" := BoardSubActivities."Year Reporting Code";
                            BoardSubActivities1."Start Date" := BoardSubActivities."Start Date";
                            BoardSubActivities1."Due Date" := BoardSubActivities."Due Date";
                            BoardSubActivities1."Unit of Measure" := BoardSubActivities."Unit of Measure";
                            BoardSubActivities1."Imported Annual Target Qty" := BoardSubActivities."Imported Annual Target Qty";
                            BoardSubActivities1."Primary Department" := BoardSubActivities."Primary Department";
                            BoardSubActivities1."Primary Directorate" := BoardSubActivities."Primary Directorate";
                            BoardSubActivities1."Outcome Perfomance Indicator" := BoardSubActivities."Outcome Perfomance Indicator";
                            BoardSubActivities1."Q1 Target Qty" := BoardSubActivities."Q1 Target Qty";
                            BoardSubActivities1."Q2 Target Qty" := BoardSubActivities."Q2 Target Qty";
                            BoardSubActivities1."Q3 Target Qty" := BoardSubActivities."Q3 Target Qty";
                            BoardSubActivities1."Q4 Target Qty" := BoardSubActivities."Q4 Target Qty";
                            BoardSubActivities1."Sub Targets" := BoardSubActivities."Sub Targets";
                            BoardSubActivities1.INSERT;
                        UNTIL BoardSubActivities.NEXT = 0;
                    END;
                END;
            UNTIL BoardActivities.NEXT = 0;
        END;

        AnnualStrategyWorkplan.Posted := TRUE;
        AnnualStrategyWorkplan.MODIFY;
        MESSAGE('Annual Workplan Updated Successfully!');
    end;

    procedure FnSuggestPlogLines(PerformanceDiaryLog: Record "Performance Diary Log")
    var
        PlogLines: Record "Plog Lines";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";
    begin
        PerformanceDiaryLog.TestField("Employee No.");
        PerformanceDiaryLog.TestField("Personal Scorecard ID");
        PerformanceDiaryLog.TestField("Activity Start Date");
        PerformanceDiaryLog.TestField("Activity End Date");

        SPMGeneralSetup.Get();
        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
            PCObjective.Reset;
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");//Commented for Kerra
            if PCObjective.FindSet then begin
                repeat
                    PCObjective.CalcFields("Individual Achieved Targets");
                    PCObjective.TestField("Due Date");
                    //PCObjective.TESTFIELD("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                    //PlogLines."Key Performance Indicator":=PCObjective."Outcome Perfomance Indicator";
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines."Unit of Measure" := PCObjective."Unit of Measure";
                    //MESSAGE('PCObjective."Assigned Weight (%)" is %1',PCObjective."Assigned Weight (%)");
                    PlogLines."Weight %" := PCObjective."Assigned Weight (%)";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                    PlogLines.Insert;

                    //Sub Activities
                    SubPCObjective.Reset;
                    SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                    if SubPCObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                            SubPlogLines."Sub Activity No." := SubPCObjective."Outcome Perfomance Indicator";
                            SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                            SubPlogLines."Sub Activity No." := SubPCObjective."Sub Initiative No.";
                            SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                            SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                            SubPlogLines."Weight %" := SubPCObjective."Assigned Weight (%)";
                            //SubPlogLines.VALIDATE("Initiative No.");
                            //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Activity No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubPCObjective.Next = 0;
                    end;

                until PCObjective.Next = 0;
            end;

            SecondaryPCObjective.Reset;
            SecondaryPCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            SecondaryPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            SecondaryPCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if SecondaryPCObjective.FindFirst then begin
                repeat
                    SecondaryPCObjective.CalcFields("Individual Achieved Targets");
                    SecondaryPCObjective.TestField("Due Date");
                    //SecondaryPCObjective.TESTFIELD("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                    //MESSAGE('SecondaryPCObjective."Assigned Weight (%)" is %1',SecondaryPCObjective."Assigned Weight (%)");
                    PlogLines."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                    PlogLines.Insert;

                    //Sub Activities
                    SubPCObjective.Reset;
                    SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                    if SubPCObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                            SubPlogLines."Sub Activity No." := SubPCObjective."Outcome Perfomance Indicator";
                            SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                            SubPlogLines."Sub Activity No." := SubPCObjective."Sub Initiative No.";
                            SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                            SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                            SubPlogLines."Weight %" := SubPCObjective."Assigned Weight (%)";
                            SubPlogLines.VALIDATE("Initiative No.");
                            SubPlogLines."Remaining Targets" := SubPCObjective."Imported Annual Target Qty" - SubPCObjective."Individual Achieved Targets";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Activity No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubPCObjective.Next = 0;
                    end;
                until SecondaryPCObjective.Next = 0;
            end;
        end;

        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
            PCJobDescription.Reset;
            PCJobDescription.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCJobDescription.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if PCJobDescription.FindFirst then begin
                repeat
                    PCJobDescription.CalcFields("Individual Achieved Targets");
                    PCJobDescription.TestField("Due Date");
                    //PCJobDescription.TESTFIELD("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"JD Activity";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := Format(PCJobDescription."Line Number");
                    PlogLines."Sub Intiative No" := PCJobDescription.Description;
                    PlogLines."Planned Date" := PCJobDescription."Start Date";
                    PlogLines."Achieved Date" := PerformanceDiaryLog."Document Date";
                    PlogLines."Due Date" := PCJobDescription."Due Date";
                    PlogLines."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                    PlogLines."Weight %" := PCJobDescription."Assigned Weight (%)";
                    PlogLines."Remaining Targets" := PCJobDescription."Imported Annual Target Qty" - PCJobDescription."Individual Achieved Targets";
                    PlogLines.Insert;
                    //Sub JD Plog Lines
                    SubJDObjective.Reset;
                    SubJDObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubJDObjective.SetRange("Line Number", PCJobDescription."Line Number");
                    if SubJDObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"JD Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubJDObjective."Line Number";
                            SubPlogLines."Sub Activity No." := SubJDObjective."Sub Initiative No.";
                            SubPlogLines.Description := SubJDObjective.Description;
                            SubPlogLines."Unit of Measure" := SubJDObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubJDObjective."Due Date";
                            SubPlogLines."Target Qty" := SubJDObjective."Imported Annual Target Qty";
                            SubPlogLines."Due Date" := SubJDObjective."Due Date";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Activity No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubJDObjective.Next = 0;
                    end;
                until PCJobDescription.Next = 0;
            end;
        end;

    end;


    procedure FnInsertPlogEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract"; EmployeeNo: Code[30]; PostingDate: Date; DocumentType: Option Plog,Appraisal; RegionCode: Code[30]; PerformanceContractID: Code[30]; AnnualWorkplan: Code[30]; BoardPCID: Code[30]; CEOPCID: Code[30]; FunctionalPCID: Code[30]; UnitofMeasure: Code[30])
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        PerformanceDiaryLog: Record "Performance Diary Log";
        QuaterCode: code[10];
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        QuaterCode := COPYSTR(QYearCode, 1, 2);
        StrategyEntry."Quarter Reporting Code" := QuaterCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry."Employee No" := EmployeeNo;
        StrategyEntry."Region Code" := RegionCode;
        StrategyEntry."Performance Contract ID" := PerformanceContractID;
        StrategyEntry."Annual Workplan" := AnnualWorkplan;
        StrategyEntry."Board PC ID" := BoardPCID;
        StrategyEntry."CEO PC ID" := CEOPCID;
        StrategyEntry."Functional PC ID" := FunctionalPCID;
        StrategyEntry."Posting Date" := Today;
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, Extdoc);
        if PerformanceDiaryLog.FindFirst then begin
            StrategyEntry."Directors PC ID" := PerformanceDiaryLog."Directors PC ID";
            StrategyEntry."Department/Center PC ID" := PerformanceDiaryLog."Department/Center PC ID";
        end;
        StrategyEntry."Unit of Measure" := UnitofMeasure;
        StrategyEntry.Insert(true);
    end;


    procedure FnInsertJDPlogEntry(PlogLines: Record "Plog Lines")
    var
        PerformanceDiaryEntry: Record "Performance Diary Entry";
    begin
        PerformanceDiaryEntry.Init;
        PerformanceDiaryEntry."Line Number" := PlogLines."Initiative No.";
        PerformanceDiaryEntry."Employee No" := PlogLines."Employee No.";
        PerformanceDiaryEntry."Posting Date" := PlogLines."Achieved Date";
        PerformanceDiaryEntry."Performance Entry Type" := PerformanceDiaryEntry."performance entry type"::"Positive Performance";
        PerformanceDiaryEntry."Diary Source" := PerformanceDiaryEntry."diary source"::"Self-Log";
        PerformanceDiaryEntry.Description := 'PLOG_' + Format(PlogLines."Achieved Date");
        PerformanceDiaryEntry."Personal Scorecard ID" := PlogLines."Personal Scorecard ID";
        PerformanceDiaryEntry.Quantity := PlogLines."Achieved Target";
        PerformanceDiaryEntry."Primary Directorate" := PlogLines."Primary Directorate";
        PerformanceDiaryEntry."Primary Department" := PlogLines."Primary Department";
        PerformanceDiaryEntry."Posting Date" := Today;
        PerformanceDiaryEntry.Insert(true);
    end;


    procedure FnInsertSubPlogEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract"; EmployeeNo: Code[30]; PostingDate: Date; DocumentType: Option Plog,Appraisal; RegionCode: Code[30]; PerformanceContractID: Code[30]; AnnualWorkplan: Code[30]; BoardPCID: Code[30]; CEOPCID: Code[30]; FunctionalPCID: Code[30]; UnitofMeasure: Code[30]; Sub_Intiative_No: Code[30])
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
        Sub_Strategy_Activity: Record Sub_Strategy_Activity;
    begin

        Sub_Strategy_Activity.Init;
        Sub_Strategy_Activity."Strategic Plan ID" := PlanID;
        Sub_Strategy_Activity."Theme ID" := ThemeID;
        Sub_Strategy_Activity."Objective ID" := ObjectiveID;
        Sub_Strategy_Activity."Strategy ID" := StrategyID;
        Sub_Strategy_Activity."Activity ID" := Actitvityid;
        Sub_Strategy_Activity."Entry Description" := Description;
        Sub_Strategy_Activity."Entry Type" := EntryType;
        Sub_Strategy_Activity."Year Reporting Code" := YearCode;
        Sub_Strategy_Activity."Quarter Reporting Code" := QYearCode;
        Sub_Strategy_Activity."Planning Date" := PlanningDate;
        Sub_Strategy_Activity."Primary Directorate" := PrimaryDirectorate;
        Sub_Strategy_Activity."Primary Department" := PrimaryDepartment;
        Sub_Strategy_Activity.Quantity := Quantity;
        Sub_Strategy_Activity."Cost Amount" := CostAmount;
        Sub_Strategy_Activity."External Document No" := Extdoc;
        Sub_Strategy_Activity."Source Type" := SourceType;
        Sub_Strategy_Activity."Employee No" := EmployeeNo;
        Sub_Strategy_Activity."Region Code" := RegionCode;
        Sub_Strategy_Activity."Performance Contract ID" := PerformanceContractID;
        Sub_Strategy_Activity."Annual Workplan" := AnnualWorkplan;
        Sub_Strategy_Activity."Board PC ID" := BoardPCID;
        Sub_Strategy_Activity."CEO PC ID" := CEOPCID;
        Sub_Strategy_Activity."Functional PC ID" := FunctionalPCID;
        Sub_Strategy_Activity."Posting Date" := Today;
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, Extdoc);
        if PerformanceDiaryLog.FindFirst then begin
            Sub_Strategy_Activity."Directors PC ID" := PerformanceDiaryLog."Directors PC ID";
            Sub_Strategy_Activity."Department/Center PC ID" := PerformanceDiaryLog."Department/Center PC ID";
        end;
        Sub_Strategy_Activity."Unit of Measure" := UnitofMeasure;
        Sub_Strategy_Activity."Sub Initiative No." := Sub_Intiative_No;
        Sub_Strategy_Activity.Insert(true);
    end;
}

