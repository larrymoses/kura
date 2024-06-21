#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 80020 "Standard PC Reporting"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Standard PC Reporting.rdlc';

    dataset
    {
        dataitem("Perfomance Contract Header";"Perfomance Contract Header")
        {
            DataItemTableView = where("Document Type"=filter("Individual Scorecard"));
            RequestFilterFields = No,"Document Type","Annual Reporting Code","Responsible Employee No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(CIName;CompanyInformation.Name)
            {
            }
            column(CIPicture;CompanyInformation.Picture)
            {
            }
            column(No_PerfomanceContractHeader;"Perfomance Contract Header".No)
            {
            }
            column(DocumentDate_PerfomanceContractHeader;"Perfomance Contract Header"."Document Date")
            {
            }
            column(StrategyPlanID_PerfomanceContractHeader;"Perfomance Contract Header"."Strategy Plan ID")
            {
            }
            column(AnnualReportingCode_PerfomanceContractHeader;"Perfomance Contract Header"."Annual Reporting Code")
            {
            }
            column(StartDate_PerfomanceContractHeader;"Perfomance Contract Header"."Start Date")
            {
            }
            column(EndDate_PerfomanceContractHeader;"Perfomance Contract Header"."End Date")
            {
            }
            dataitem("PC Objective";"PC Objective")
            {
                DataItemLink = "Workplan No."=field(No);
                column(ReportForNavId_8; 8)
                {
                }
                column(WorkplanNo_PCObjective;"PC Objective"."Workplan No.")
                {
                }
                column(InitiativeNo_PCObjective;"PC Objective"."Initiative No.")
                {
                }
                column(ObjectiveInitiative_PCObjective;"PC Objective"."Objective/Initiative")
                {
                }
                column(GoalID_PCObjective;"PC Objective"."Goal ID")
                {
                }
                column(InitiativeType_PCObjective;"PC Objective"."Initiative Type")
                {
                }
                column(TaskType_PCObjective;"PC Objective"."Task Type")
                {
                }
                column(Indentation_PCObjective;"PC Objective".Indentation)
                {
                }
                column(Totaling_PCObjective;"PC Objective".Totaling)
                {
                }
                column(Progress_PCObjective;"PC Objective".Progress)
                {
                }
                column(Complete_PCObjective;"PC Objective"."%Complete")
                {
                }
                column(PriorityLevel_PCObjective;"PC Objective"."Priority Level")
                {
                }
                column(StrategyPlanID_PCObjective;"PC Objective"."Strategy Plan ID")
                {
                }
                column(YearReportingCode_PCObjective;"PC Objective"."Year Reporting Code")
                {
                }
                column(StartDate_PCObjective;"PC Objective"."Start Date")
                {
                }
                column(DueDate_PCObjective;"PC Objective"."Due Date")
                {
                }
                column(PrimaryDirectorate_PCObjective;"PC Objective"."Primary Directorate")
                {
                }
                column(PrimaryDepartment_PCObjective;"PC Objective"."Primary Department")
                {
                }
                column(OverallOwner_PCObjective;"PC Objective"."Overall Owner")
                {
                }
                column(OutcomePerfomanceIndicator_PCObjective;"PC Objective"."Outcome Perfomance Indicator")
                {
                }
                column(UnitofMeasure_PCObjective;"PC Objective"."Unit of Measure")
                {
                }
                column(DesiredPerfomanceDirection_PCObjective;"PC Objective"."Desired Perfomance Direction")
                {
                }
                column(KPIType_PCObjective;"PC Objective"."KPI Type")
                {
                }
                column(ImportedAnnualTargetQty_PCObjective;"PC Objective"."Imported Annual Target Qty")
                {
                }
                column(Q1TargetQty_PCObjective;"PC Objective"."Q1 Target Qty")
                {
                }
                column(Q1SelfReviewQty_PCObjective;"PC Objective"."Q1 Self-Review Qty")
                {
                }
                column(Q1ManagerReviewQty_PCObjective;"PC Objective"."Q1 ManagerReview Qty")
                {
                }
                column(Q1ActualQty_PCObjective;"PC Objective"."Q1 Actual Qty")
                {
                }
                column(Q2TargetQty_PCObjective;"PC Objective"."Q2 Target Qty")
                {
                }
                column(Q2SelfReviewQty_PCObjective;"PC Objective"."Q2 Self-Review Qty")
                {
                }
                column(Q2ManagerReviewQty_PCObjective;"PC Objective"."Q2 ManagerReview Qty")
                {
                }
                column(Q2ActualQty_PCObjective;"PC Objective"."Q2 Actual Qty")
                {
                }
                column(Q3TargetQty_PCObjective;"PC Objective"."Q3 Target Qty")
                {
                }
                column(Q3SelfReviewQty_PCObjective;"PC Objective"."Q3 Self-Review Qty")
                {
                }
                column(Q3ManagerReviewQty_PCObjective;"PC Objective"."Q3 ManagerReview Qty")
                {
                }
                column(Q3ActualQty_PCObjective;"PC Objective"."Q3 Actual Qty")
                {
                }
                column(Q4TargetQty_PCObjective;"PC Objective"."Q4 Target Qty")
                {
                }
                column(Q4SelfReviewQty_PCObjective;"PC Objective"."Q4 Self-Review Qty")
                {
                }
                column(Q4ManagerReviewQty_PCObjective;"PC Objective"."Q4 ManagerReview Qty")
                {
                }
                column(Q4ActualQty_PCObjective;"PC Objective"."Q4 Actual Qty")
                {
                }
                column(GlobalDimension1Code_PCObjective;"PC Objective"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_PCObjective;"PC Objective"."Global Dimension 2 Code")
                {
                }
                column(PlanningDateFilter_PCObjective;"PC Objective"."Planning Date Filter")
                {
                }
                column(GoalTemplateID_PCObjective;"PC Objective"."Goal Template ID")
                {
                }
                column(IndividualAchievedTargets_PCObjective;"PC Objective"."Individual Achieved Targets")
                {
                }
                column(FunctionalAchievedTargets_PCObjective;"PC Objective"."Functional Achieved Targets")
                {
                }
                column(CEOAchievedTargets_PCObjective;"PC Objective"."CEO Achieved Targets")
                {
                }
                column(BoardAchievedTargets_PCObjective;"PC Objective"."Board Achieved Targets")
                {
                }
                column(AnnualWorkplanAchievedTarget_PCObjective;"PC Objective"."AnnualWorkplan Achieved Target")
                {
                }
                column(EntryNo_PCObjective;"PC Objective".EntryNo)
                {
                }
                column(AssignedWeight_PCObjective;"PC Objective"."Assigned Weight (%)")
                {
                }
                column(PlogAchievedTargets_PCObjective;"PC Objective"."Plog Achieved Targets")
                {
                }
                column(Datefilter_PCObjective;"PC Objective"."Date filter")
                {
                }
                column(FrameworkPerspective_PCObjective;"PC Objective"."Framework Perspective")
                {
                }
                column(StrategyFramework_PCObjective;"PC Objective"."Strategy Framework")
                {
                }
                column(PreviousAnnualTargetQty_PCObjective;"PC Objective"."Previous Annual Target Qty")
                {
                }
                column(AdditionalComments_PCObjective;"PC Objective"."Additional Comments")
                {
                }
                column(ActivityType_PCObjective;"PC Objective"."Activity Type")
                {
                }
                column(DirectorsAchievedTargets_PCObjective;"PC Objective"."Directors Achieved Targets")
                {
                }
                column(DepartmentAchievedTarget_PCObjective;"PC Objective"."Department Achieved Target")
                {
                }
                column(KeyPerformanceIndicator_PCObjective;"PC Objective"."Key Performance Indicator")
                {
                }
                column(PrimaryDirectorateName_PCObjective;"PC Objective"."Primary Directorate Name")
                {
                }
                column(PrimaryDepartmentName_PCObjective;"PC Objective"."Primary Department Name")
                {
                }
                column(PrincipalsAchievedTargets_PCObjective;"PC Objective"."Principals Achieved Targets")
                {
                }
                column(SeniorsAchievedTargets_PCObjective;"PC Objective"."Seniors Achieved Targets")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
}

