#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80153 "Group Appraisal-Sub"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
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
            part("Objectives and Outcomes";"Group Objective && Outcome-Sub")
            {
                SubPageLink = "Performance Evaluation ID"=field(No);
            }
            part(Control39;"Group Proficiency-Submitted")
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
                          ObjectiveOutcome.TestField("AppraiserReview Qty");
                         until ObjectiveOutcome.Next=0;
                      end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID",No);
                    if ProEvaluation.Find('-') then begin
                       repeat
                         ProEvaluation.TestField("AppraiserReview Qty");
                         until ProEvaluation.Next=0;
                      end;


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID",No);
                    if ObjectiveOutcome.Find('-') then begin
                       repeat
                           fnPostObjectiveEntry(ObjectiveOutcome);

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
        "Evaluation Type":="evaluation type"::"360-Degree/Group Appraisal";
    end;

    trigger OnOpenPage()
    begin
        "Document Type":="document type"::"Performance Appraisal";
        "Evaluation Type":="evaluation type"::"360-Degree/Group Appraisal";
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
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
        ReviewPeriods: Record "Review Periods";

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


    procedure fnPostObjectiveEntry(ObjectiveOutcome: Record "Objective Evaluation Result")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        PerformanceEvaluation: Record "Perfomance Evaluation";
        ReviewQuarterlyPeriods: Record "Review Quarterly Periods";
        StrategicPlan: Code[50];
        EntryType: Option Planned,Actual;
    begin
            StrategicInt.Reset;
            StrategicInt.SetRange(Code,ObjectiveOutcome."Intiative No");
            if StrategicInt.Find('-') then begin
              StrategicPlan:=StrategicInt."Strategic Plan ID";
              ThemeID:=StrategicInt."Theme ID";
              ObjectiveID:=StrategicInt."Objective ID";
            end;

        PerformanceEvaluation.Reset;
        PerformanceEvaluation.SetRange(No,ObjectiveOutcome."Performance Evaluation ID");
        if PerformanceEvaluation.FindFirst then begin
           ReviewPeriods.Reset;
           ReviewPeriods.SetRange(Code,PerformanceEvaluation."Review Period");
           if ReviewPeriods.FindFirst then begin
              QCount:=0;
              case ReviewPeriods."Review Type" of
                 ReviewPeriods."review type"::Quartely:
                begin
                    ReviewQuarterlyPeriods.Reset;
                    ReviewQuarterlyPeriods.SetRange("Review Period Code",ReviewPeriods.Code);
                      if Find('-') then begin
                           FnInsertEntry(StrategicPlan,ThemeID,ObjectiveID,StrategicPlan,ObjectiveOutcome."Intiative No",ObjectiveOutcome."Objective/Initiative",Entrytype::Actual,
                          ReviewQuarterlyPeriods."Year Code",ReviewQuarterlyPeriods.Code,ReviewQuarterlyPeriods."Reporting Start Date",ObjectiveOutcome."Primary Directorate",
                          ObjectiveOutcome."Primary Department",ObjectiveOutcome."AppraiserReview Qty",0,
                          ObjectiveOutcome."Performance Evaluation ID",Sourcetype::"Perfomance Contract");
                      end;
                end;
                  ReviewPeriods."review type"::"Semi-Quartely":
                begin
                   ReviewQuarterlyPeriods.Reset;
                    ReviewQuarterlyPeriods.SetRange("Review Period Code",ReviewPeriods.Code);
                      if Find('-') then begin
                        repeat
                           FnInsertEntry(StrategicPlan,ThemeID,ObjectiveID,StrategicPlan,ObjectiveOutcome."Intiative No",ObjectiveOutcome."Objective/Initiative",Entrytype::Actual,
                           ReviewQuarterlyPeriods."Year Code",ReviewQuarterlyPeriods.Code,ReviewQuarterlyPeriods."Reporting Start Date",ObjectiveOutcome."Primary Directorate",
                           ObjectiveOutcome."Primary Department",ObjectiveOutcome."AppraiserReview Qty"/ReviewPeriods."No of Quarters",0,
                           ObjectiveOutcome."Performance Evaluation ID",Sourcetype::"Perfomance Contract");
                        until ReviewQuarterlyPeriods.Next=0;
                      end;

                end;
                   ReviewPeriods."review type"::Annually:
                begin
                   ReviewQuarterlyPeriods.Reset;
                    ReviewQuarterlyPeriods.SetRange("Review Period Code",ReviewPeriods.Code);
                      if Find('-') then begin
                        repeat
                           FnInsertEntry(StrategicPlan,ThemeID,ObjectiveID,StrategicPlan,ObjectiveOutcome."Intiative No",ObjectiveOutcome."Objective/Initiative",Entrytype::Actual,
                           ReviewQuarterlyPeriods."Year Code",ReviewQuarterlyPeriods.Code,ReviewQuarterlyPeriods."Reporting Start Date",ObjectiveOutcome."Primary Directorate",
                           ObjectiveOutcome."Primary Department",ObjectiveOutcome."AppraiserReview Qty"/ReviewPeriods."No of Quarters",0,
                           ObjectiveOutcome."Performance Evaluation ID",Sourcetype::"Perfomance Contract");
                        until ReviewQuarterlyPeriods.Next=0;
                      end;

                end else
                  Error('Review Type Category must be selected for Review Period %1',ReviewPeriods.Code);
             end;
        end;
        end;

    end;


    procedure FnInsertEntry(PlanID: Code[50];ThemeID: Code[50];ObjectiveID: Code[50];StrategyID: Code[50];Actitvityid: Code[50];Description: Code[255];EntryType: Option Planned,Actual;YearCode: Code[50];QYearCode: Code[50];PlanningDate: Date;PrimaryDirectorate: Code[100];PrimaryDepartment: Code[100];Quantity: Decimal;CostAmount: Decimal;Extdoc: Code[50];SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID":=PlanID;
        StrategyEntry."Theme ID":=ThemeID;
        StrategyEntry."Objective ID":=ObjectiveID;
        StrategyEntry."Strategy ID":=StrategyID;
        StrategyEntry."Activity ID":=Actitvityid;
        StrategyEntry."Entry Description":=Description;
        StrategyEntry."Entry Type":=EntryType;
        StrategyEntry."Year Reporting Code":=YearCode;
        StrategyEntry."Quarter Reporting Code":=QYearCode;
        StrategyEntry."Planning Date":=PlanningDate;
        StrategyEntry."Primary Directorate":=PrimaryDirectorate;
        StrategyEntry."Primary Department":=PrimaryDepartment;
        StrategyEntry.Quantity:=Quantity;
        StrategyEntry."Cost Amount":=CostAmount;
        StrategyEntry."External Document No":=Extdoc;
        StrategyEntry."Source Type":=SourceType;
        StrategyEntry.Insert(true);
    end;
}

