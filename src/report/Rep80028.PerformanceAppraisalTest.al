#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 80028 "Performance Appraisal-Test"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Performance Appraisal-Test.rdlc';

    dataset
    {
        dataitem("Perfomance Evaluation";"Perfomance Evaluation")
        {
            RequestFilterFields = No;
            column(ReportForNavId_1; 1)
            {
            }
            column(No_PerfomanceEvaluation;"Perfomance Evaluation".No)
            {
            }
            column(EmployeeNo_PerfomanceEvaluation;"Perfomance Evaluation"."Employee No.")
            {
            }
            column(EmployeeName_PerfomanceEvaluation;"Perfomance Evaluation"."Employee Name")
            {
            }
            column(CurrentDesignation_PerfomanceEvaluation;"Perfomance Evaluation"."Current Designation")
            {
            }
            column(CurrentGrade_PerfomanceEvaluation;"Perfomance Evaluation"."Current Grade")
            {
            }
            column(SupervisorStaffNo_PerfomanceEvaluation;"Perfomance Evaluation"."Supervisor Staff No.")
            {
            }
            column(SupervisorName_PerfomanceEvaluation;"Perfomance Evaluation"."Supervisor Name")
            {
            }
            column(AnnualReportingCode_PerfomanceEvaluation;"Perfomance Evaluation"."Annual Reporting Code")
            {
            }
            column(PersonalScorecardID_PerfomanceEvaluation;"Perfomance Evaluation"."Personal Scorecard ID")
            {
            }
            column(EvaluationStartDate_PerfomanceEvaluation;"Perfomance Evaluation"."Evaluation Start Date")
            {
            }
            column(EvaluationEndDate_PerfomanceEvaluation;"Perfomance Evaluation"."Evaluation End Date")
            {
            }
            column(TotalFinalWeightedScore_PerfomanceEvaluation;"Perfomance Evaluation"."Total Final Weighted Score")
            {
            }
            column(TotalProficiencyScore_PerfomanceEvaluation;"Perfomance Evaluation"."Total Proficiency Score")
            {
            }
            column(TotalProficiencyScore;TotalProficiencyScore)
            {
            }
            column(TotalNormalScore;TotalNormalScore)
            {
            }
            column(TotalPercentageScore;TotalPercentageScore)
            {
            }
            column(GradeAchieved; GradeAchieved)
            {
            }
            dataitem("Company Information";"Company Information")
            {
                column(ReportForNavId_124; 124)
                {
                }
                column(Name_CompanyInformation;"Company Information".Name)
                {
                }
                column(Name2_CompanyInformation;"Company Information"."Name 2")
                {
                }
                column(Address_CompanyInformation;"Company Information".Address)
                {
                }
                column(Address2_CompanyInformation;"Company Information"."Address 2")
                {
                }
                column(City_CompanyInformation;"Company Information".City)
                {
                }
                column(Picture_CompanyInformation;"Company Information".Picture)
                {
                }
                column(PostCode_CompanyInformation;"Company Information"."Post Code")
                {
                }
                column(County_CompanyInformation;"Company Information".County)
                {
                }
                column(CountryName;CountryName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*Country.RESET;
                    Country.SETRANGE(Code, "Company Information"."Country/Region Code");
                    IF Country.FINDSET THEN
                      CountryName:=Country.Name;*/
                    
                    
                    if Country.Get("Company Information"."Country/Region Code") then
                       CountryName:=Country.Name;

                end;
            }
            dataitem("Objective Evaluation Result";"Objective Evaluation Result")
            {
                DataItemLink = "Performance Evaluation ID"=field(No);
                column(ReportForNavId_17; 17)
                {
                }
                column(PerformanceEvaluationID_ObjectiveEvaluationResult;"Objective Evaluation Result"."Performance Evaluation ID")
                {
                }
                column(LineNo_ObjectiveEvaluationResult;"Objective Evaluation Result"."Line No")
                {
                }
                column(ScorecardID_ObjectiveEvaluationResult;"Objective Evaluation Result"."Scorecard ID")
                {
                }
                column(ScorecardLineNo_ObjectiveEvaluationResult;"Objective Evaluation Result"."Scorecard Line No")
                {
                }
                column(ObjectiveInitiative_ObjectiveEvaluationResult;"Objective Evaluation Result"."Objective/Initiative")
                {
                }
                column(OutcomePerfomanceIndicator_ObjectiveEvaluationResult;"Objective Evaluation Result"."Outcome Perfomance Indicator")
                {
                }
                column(UnitofMeasure_ObjectiveEvaluationResult;"Objective Evaluation Result"."Unit of Measure")
                {
                }
                column(DesiredPerfomanceDirection_ObjectiveEvaluationResult;"Objective Evaluation Result"."Desired Perfomance Direction")
                {
                }
                column(PerformanceRatingScale_ObjectiveEvaluationResult;"Objective Evaluation Result"."Performance Rating Scale")
                {
                }
                column(ScaleType_ObjectiveEvaluationResult;"Objective Evaluation Result"."Scale Type")
                {
                }
                column(TargetQty_ObjectiveEvaluationResult;"Objective Evaluation Result"."Target Qty")
                {
                }
                column(SelfReviewQty_ObjectiveEvaluationResult;"Objective Evaluation Result"."Self-Review Qty")
                {
                }
                column(AppraiserReviewQty_ObjectiveEvaluationResult;"Objective Evaluation Result"."AppraiserReview Qty")
                {
                }
                column(FinalActualQty_ObjectiveEvaluationResult;"Objective Evaluation Result"."Final/Actual Qty")
                {
                }
                column(RawPerformanceScore_ObjectiveEvaluationResult;"Objective Evaluation Result"."Raw Performance Score")
                {
                }
                column(Weight_ObjectiveEvaluationResult;"Objective Evaluation Result"."Weight %")
                {
                }
                column(FinalWeightedLineScore_ObjectiveEvaluationResult;"Objective Evaluation Result"."Final Weighted Line Score")
                {
                }
                column(IntiativeNo_ObjectiveEvaluationResult;"Objective Evaluation Result"."Intiative No")
                {
                }
                column(PrimaryDirectorate_ObjectiveEvaluationResult;"Objective Evaluation Result"."Primary Directorate")
                {
                }
                column(PrimaryDepartment_ObjectiveEvaluationResult;"Objective Evaluation Result"."Primary Department")
                {
                }
                column(RawPerformanceGrade_ObjectiveEvaluationResult;"Objective Evaluation Result"."Raw Performance Grade")
                {
                }
            }
            dataitem(AppraisalResults;"Objective Evaluation Result")
            {
                DataItemLink = "Performance Evaluation ID"=field(No);
                column(ReportForNavId_56; 56)
                {
                }
                column(PerformanceEvaluationID_AppraisalResults;AppraisalResults."Performance Evaluation ID")
                {
                }
                column(LineNo_AppraisalResults;AppraisalResults."Line No")
                {
                }
                column(ScorecardID_AppraisalResults;AppraisalResults."Scorecard ID")
                {
                }
                column(ScorecardLineNo_AppraisalResults;AppraisalResults."Scorecard Line No")
                {
                }
                column(ObjectiveInitiative_AppraisalResults;AppraisalResults."Objective/Initiative")
                {
                }
                column(OutcomePerfomanceIndicator_AppraisalResults;AppraisalResults."Outcome Perfomance Indicator")
                {
                }
                column(UnitofMeasure_AppraisalResults;AppraisalResults."Unit of Measure")
                {
                }
                column(DesiredPerfomanceDirection_AppraisalResults;AppraisalResults."Desired Perfomance Direction")
                {
                }
                column(PerformanceRatingScale_AppraisalResults;AppraisalResults."Performance Rating Scale")
                {
                }
                column(ScaleType_AppraisalResults;AppraisalResults."Scale Type")
                {
                }
                column(TargetQty_AppraisalResults;AppraisalResults."Target Qty")
                {
                }
                column(SelfReviewQty_AppraisalResults;AppraisalResults."Self-Review Qty")
                {
                }
                column(AppraiserReviewQty_AppraisalResults;AppraisalResults."AppraiserReview Qty")
                {
                }
                column(FinalActualQty_AppraisalResults;AppraisalResults."Final/Actual Qty")
                {
                }
                column(RawPerformanceScore_AppraisalResults;AppraisalResults."Raw Performance Score")
                {
                }
                column(Weight_AppraisalResults;AppraisalResults."Weight %")
                {
                }
                column(FinalWeightedLineScore_AppraisalResults;AppraisalResults."Final Weighted Line Score")
                {
                }
                column(IntiativeNo_AppraisalResults;AppraisalResults."Intiative No")
                {
                }
                column(PrimaryDirectorate_AppraisalResults;AppraisalResults."Primary Directorate")
                {
                }
                column(PrimaryDepartment_AppraisalResults;AppraisalResults."Primary Department")
                {
                }
                column(RawPerformanceGrade_AppraisalResults;AppraisalResults."Raw Performance Grade")
                {
                }
                column(PercentageScore;PercentageScore)
                {
                }
                column(KeyPerformanceIndicator_AppraisalResults;AppraisalResults."Key Performance Indicator")
                {
                }
                dataitem(SubAppraisalResult;"Sub Objective Evaluation")
                {
                    DataItemLink = "Performance Evaluation ID"=field("Performance Evaluation ID"),"Scorecard ID"=field("Scorecard ID"),"Intiative No"=field("Intiative No");
                    column(ReportForNavId_106; 106)
                    {
                    }
                    column(Weight_SubAppraisalResult;SubAppraisalResult."Weight %")
                    {
                    }
                    column(SubIntiativeNo_SubAppraisalResult;SubAppraisalResult."Sub Intiative No")
                    {
                    }
                    column(SubIntiativeDescription_SubAppraisalResult;SubAppraisalResult."Sub Intiative Description")
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    PercentageScore:=0;
                    PercentageScore:=(AppraisalResults."Final/Actual Qty"/AppraisalResults."Target Qty")*100;
                    //MESSAGE('PercentageScore is %1',PercentageScore);
                end;
            }
            dataitem(ProficiencyEvaluation;"Proficiency Evaluation Result")
            {
                DataItemLink = "Performance Evaluation ID"=field(No);
                column(ReportForNavId_57; 57)
                {
                }
                column(PerformanceEvaluationID_ProficiencyEvaluation;ProficiencyEvaluation."Performance Evaluation ID")
                {
                }
                column(LineNo_ProficiencyEvaluation;ProficiencyEvaluation."Line No")
                {
                }
                column(CompetencyTemplateID_ProficiencyEvaluation;ProficiencyEvaluation."Competency Template ID")
                {
                }
                column(CompetencyCode_ProficiencyEvaluation;ProficiencyEvaluation."Competency Code")
                {
                }
                column(Description_ProficiencyEvaluation;ProficiencyEvaluation.Description)
                {
                }
                column(OutcomePerfomanceIndicator_ProficiencyEvaluation;ProficiencyEvaluation."Outcome Perfomance Indicator")
                {
                }
                column(UnitofMeasure_ProficiencyEvaluation;ProficiencyEvaluation."Unit of Measure")
                {
                }
                column(DesiredProficiencyDirection_ProficiencyEvaluation;ProficiencyEvaluation."Desired Proficiency Direction")
                {
                }
                column(ProfiencyRatingScale_ProficiencyEvaluation;ProficiencyEvaluation."Profiency Rating Scale")
                {
                }
                column(ScaleType_ProficiencyEvaluation;ProficiencyEvaluation."Scale Type")
                {
                }
                column(TargetQty_ProficiencyEvaluation;ProficiencyEvaluation."Target Qty")
                {
                }
                column(SelfReviewQty_ProficiencyEvaluation;ProficiencyEvaluation."Self-Review Qty")
                {
                }
                column(AppraiserReviewQty_ProficiencyEvaluation;ProficiencyEvaluation."AppraiserReview Qty")
                {
                }
                column(FinalActualQty_ProficiencyEvaluation;ProficiencyEvaluation."Final/Actual Qty")
                {
                }
                column(RawProfiencyScore_ProficiencyEvaluation;ProficiencyEvaluation."Raw Profiency Score")
                {
                }
                column(Weight_ProficiencyEvaluation;ProficiencyEvaluation."Weight %")
                {
                }
                column(FinalWeightedLineScore_ProficiencyEvaluation;ProficiencyEvaluation."Final Weighted Line Score")
                {
                }
                column(IntiativeNo_ProficiencyEvaluation;ProficiencyEvaluation."Intiative No")
                {
                }
                column(CompetencyDescription_ProficiencyEvaluation;ProficiencyEvaluation."Competency Description")
                {
                }
                column(CompetencyCategory_ProficiencyEvaluation;ProficiencyEvaluation."Competency Category")
                {
                }
            }
            dataitem("Perfomance Scale Line";"Perfomance Scale Line")
            {
                DataItemLink = "Performance Scale ID"=field("Performance Rating Scale");
                column(ReportForNavId_79; 79)
                {
                }
                column(PerformanceScaleID_PerfomanceScaleLine;"Perfomance Scale Line"."Performance Scale ID")
                {
                }
                column(PerfomanceGrade_PerfomanceScaleLine;"Perfomance Scale Line"."Perfomance Grade")
                {
                }
                column(DefaultScoreValue_PerfomanceScaleLine;"Perfomance Scale Line"."Default Score Value")
                {
                }
                column(BehavioralIndicator_PerfomanceScaleLine;"Perfomance Scale Line"."Behavioral Indicator")
                {
                }
                column(LowerLimitTarget_PerfomanceScaleLine;"Perfomance Scale Line"."Lower Limit Target (%)")
                {
                }
                column(UpperLimitTarget_PerfomanceScaleLine;"Perfomance Scale Line"."Upper Limit Target (%)")
                {
                }
                column(LowerLimitCriteriaValue_PerfomanceScaleLine;"Perfomance Scale Line"."Lower Limit Criteria Value")
                {
                }
                column(UpperLimitCriteriaValue_PerfomanceScaleLine;"Perfomance Scale Line"."Upper Limit Criteria Value")
                {
                }
                column(CriteriaValueRangeSpan_PerfomanceScaleLine;"Perfomance Scale Line"."Criteria Value Range Span")
                {
                }
                column(Description_PerfomanceScaleLine;"Perfomance Scale Line".Description)
                {
                }
                column(ScaleType_PerfomanceScaleLine;"Perfomance Scale Line"."Scale Type")
                {
                }
            }
            dataitem("Evaluation PIP";"Evaluation PIP")
            {
                DataItemLink = "Perfomance Evaluation No"=field(No);
                column(ReportForNavId_97; 97)
                {
                }
                column(PIPNumber_EvaluationPIP;"Evaluation PIP"."PIP Number")
                {
                }
                column(PIPCategory_EvaluationPIP;"Evaluation PIP"."PIP Category")
                {
                }
                column(Description_EvaluationPIP;"Evaluation PIP".Description)
                {
                }
            }
            dataitem("Evaluation Training needs";"Evaluation Training needs")
            {
                DataItemLink = "Perfomance Evaluation No"=field(No);
                column(ReportForNavId_101; 101)
                {
                }
                column(TrainingNeedNumber_EvaluationTrainingneeds;"Evaluation Training needs"."Training Need Number")
                {
                }
                column(TrainingNeedCategory_EvaluationTrainingneeds;"Evaluation Training needs"."Training Need Category")
                {
                }
                column(Description_EvaluationTrainingneeds;"Evaluation Training needs".Description)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                "Perfomance Evaluation".CalcFields("Total Final Weighted Score","Total Proficiency Score", "Perfomance Evaluation"."Total Raw Score");

                TotalProficiencyScore:=0;
                TotalNormalScore:=ROUND(("Perfomance Evaluation"."Total Final Weighted Score"/"Perfomance Evaluation"."Total Raw Score")*100,0.01,'=');
                TotalPercentageScore:=ROUND((TotalNormalScore/100)*70,0.01,'=');


                PerformanceRatingRawScore:="Perfomance Evaluation"."Total Final Weighted Score";

                PerfomanceScaleLine.Reset;
                PerfomanceScaleLine.SetRange("Performance Scale ID","Performance Rating Scale");
                if PerfomanceScaleLine.Find('-') then begin
                   repeat
                    if  ((PerformanceRatingRawScore>=PerfomanceScaleLine."Lower Limit Criteria Value") and
                       (PerformanceRatingRawScore<=PerfomanceScaleLine."Upper Limit Criteria Value")) then begin
                         GradeAchieved:=PerfomanceScaleLine."Perfomance Grade";

                    end;
                   until PerfomanceScaleLine.Next=0;
                end;


                 TotalProficiencyScore:=ROUND(("Perfomance Evaluation"."Total Proficiency Score"/65)*30,0.01,'=');
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
            end;
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

    var
        Country: Record "Country/Region";
        CountryName: Code[100];
        CompInfo: Record "Company Information";
        PercentageScore: Decimal;
        TotalProficiencyScore: Decimal;
        TotalNormalScore: Decimal;
        TotalPercentageScore: Decimal;
        TotalOverSeventyScore: Decimal;
        GradeAchieved: Code[100];
        PerformanceRatingRawScore: Decimal;
        PerfomanceScaleLine: Record "Perfomance Scale Line";
}

