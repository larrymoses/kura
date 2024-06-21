#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 80054 "Detailed CEO Workplan Contract"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Detailed CEO Workplan Contract.rdlc';
    Caption = 'Detailed CEO Workplan Contract';

    dataset
    {
        dataitem("Perfomance Contract Header"; "Perfomance Contract Header")
        {
            RequestFilterFields = No;
            column(ReportForNavId_1; 1)
            {
            }
            column(No_PerfomanceContractHeader; "Perfomance Contract Header".No)
            {
            }
            column(DocumentType_PerfomanceContractHeader; "Perfomance Contract Header"."Document Type")
            {
            }
            column(Description_PerfomanceContractHeader; "Perfomance Contract Header".Description)
            {
            }
            column(DocumentDate_PerfomanceContractHeader; "Perfomance Contract Header"."Document Date")
            {
            }
            column(ObjectiveSettingDueDate_PerfomanceContractHeader; "Perfomance Contract Header"."Objective Setting Due Date")
            {
            }
            column(StrategyPlanID_PerfomanceContractHeader; "Perfomance Contract Header"."Strategy Plan ID")
            {
            }
            column(AnnualReportingCode_PerfomanceContractHeader; "Perfomance Contract Header"."Annual Reporting Code")
            {
            }
            column(StartDate_PerfomanceContractHeader; "Perfomance Contract Header"."Start Date")
            {
            }
            column(EndDate_PerfomanceContractHeader; "Perfomance Contract Header"."End Date")
            {
            }
            column(ResponsibleEmployeeNo_PerfomanceContractHeader; "Perfomance Contract Header"."Responsible Employee No.")
            {
            }
            column(Designation_PerfomanceContractHeader; "Perfomance Contract Header".Designation)
            {
            }
            column(Grade_PerfomanceContractHeader; "Perfomance Contract Header".Grade)
            {
            }
            column(EmployeeName_PerfomanceContractHeader; "Perfomance Contract Header"."Employee Name")
            {
            }
            column(ResponsibilityCenter_PerfomanceContractHeader; "Perfomance Contract Header"."Responsibility Center")
            {
            }
            column(ResponsibilityCenterName_PerfomanceContractHeader; "Perfomance Contract Header"."Responsibility Center Name")
            {
            }
            column(Directorate_PerfomanceContractHeader; "Perfomance Contract Header".Directorate)
            {
            }
            column(StartYear; StartYear)
            {
            }
            column(EndYear; EndYear)
            {
            }
            column(CStartYear; CStartYear)
            {
            }
            column(CEndYear; CEndYear)
            {
            }
            column(Vision; "Company Information".Vision)
            {
            }
            column(Mission; "Company Information".Mission)
            {
            }
            column(Current_Head; "Company Information"."Current Head")
            {
            }
            column(Head_Name; "Company Information"."Current Head Name")
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_124; 124)
                {
                }
                column(Name_CompanyInformation; "Company Information".Name)
                {
                }
                column(Name2_CompanyInformation; "Company Information"."Name 2")
                {
                }
                column(Address_CompanyInformation; "Company Information".Address)
                {
                }
                column(Address2_CompanyInformation; "Company Information"."Address 2")
                {
                }
                column(City_CompanyInformation; "Company Information".City)
                {
                }
                column(Picture_CompanyInformation; "Company Information".Picture)
                {
                }
                column(PostCode_CompanyInformation; "Company Information"."Post Code")
                {
                }
                column(County_CompanyInformation; "Company Information".County)
                {
                }
                column(CountryName; CountryName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*Country.RESET;
                    Country.SETRANGE(Code, "Company Information"."Country/Region Code");
                    IF Country.FINDSET THEN
                      CountryName:=Country.Name;*/


                    if Country.Get("Company Information"."Country/Region Code") then
                        CountryName := Country.Name;

                end;
            }
            dataitem("PC Objective"; "PC Objective")
            {
                DataItemLink = "Workplan No." = field(No);
                column(ReportForNavId_2; 2)
                {
                }
                column(WorkplanNo_PCObjective; "PC Objective"."Workplan No.")
                {
                }
                column(InitiativeNo_PCObjective; "PC Objective"."Initiative No.")
                {
                }
                column(ObjectiveInitiative_PCObjective; "PC Objective"."Objective/Initiative")
                {
                }
                column(PrimaryDirectorate_PCObjective; "PC Objective"."Primary Directorate")
                {
                }
                column(PrimaryDepartment_PCObjective; "PC Objective"."Primary Department")
                {
                }
                column(UnitofMeasure_PCObjective; "PC Objective"."Unit of Measure")
                {
                }
                column(DesiredPerfomanceDirection_PCObjective; "PC Objective"."Desired Perfomance Direction")
                {
                }
                column(KPIType_PCObjective; "PC Objective"."KPI Type")
                {
                }
                column(ImportedAnnualTargetQty_PCObjective; "PC Objective"."Imported Annual Target Qty")
                {
                }
                column(Q1TargetQty_PCObjective; "PC Objective"."Q1 Target Qty")
                {
                }
                column(Q1SelfReviewQty_PCObjective; "PC Objective"."Q1 Self-Review Qty")
                {
                }
                column(Q1ManagerReviewQty_PCObjective; "PC Objective"."Q1 ManagerReview Qty")
                {
                }
                column(Q1ActualQty_PCObjective; "PC Objective"."Q1 Actual Qty")
                {
                }
                column(Q2TargetQty_PCObjective; "PC Objective"."Q2 Target Qty")
                {
                }
                column(Q2SelfReviewQty_PCObjective; "PC Objective"."Q2 Self-Review Qty")
                {
                }
                column(Q2ManagerReviewQty_PCObjective; "PC Objective"."Q2 ManagerReview Qty")
                {
                }
                column(Q2ActualQty_PCObjective; "PC Objective"."Q2 Actual Qty")
                {
                }
                column(Q3TargetQty_PCObjective; "PC Objective"."Q3 Target Qty")
                {
                }
                column(Q3SelfReviewQty_PCObjective; "PC Objective"."Q3 Self-Review Qty")
                {
                }
                column(Q3ManagerReviewQty_PCObjective; "PC Objective"."Q3 ManagerReview Qty")
                {
                }
                column(Q3ActualQty_PCObjective; "PC Objective"."Q3 Actual Qty")
                {
                }
                column(Q4TargetQty_PCObjective; "PC Objective"."Q4 Target Qty")
                {
                }
                column(Q4SelfReviewQty_PCObjective; "PC Objective"."Q4 Self-Review Qty")
                {
                }
                column(Q4ManagerReviewQty_PCObjective; "PC Objective"."Q4 ManagerReview Qty")
                {
                }
                column(Q4ActualQty_PCObjective; "PC Objective"."Q4 Actual Qty")
                {
                }
                column(GlobalDimension1Code_PCObjective; "PC Objective"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_PCObjective; "PC Objective"."Global Dimension 2 Code")
                {
                }
                column(PlanningDateFilter_PCObjective; "PC Objective"."Planning Date Filter")
                {
                }
                column(GoalTemplateID_PCObjective; "PC Objective"."Goal Template ID")
                {
                }
                column(AnnualWorkplanAchievedTarget_PCObjective; "PC Objective"."AnnualWorkplan Achieved Target")
                {
                }
                column(EntryNo_PCObjective; "PC Objective".EntryNo)
                {
                }
                column(AssignedWeight_PCObjective; "PC Objective"."Assigned Weight (%)")
                {
                }
                column(PlogAchievedTargets_PCObjective; "PC Objective"."Plog Achieved Targets")
                {
                }
                column(Datefilter_PCObjective; "PC Objective"."Date filter")
                {
                }
                column(FrameworkPerspective_PCObjectives; "PC Objective"."Framework Perspective")
                {
                }
                column(StrategyFramework_PCObjective; "PC Objective"."Strategy Framework")
                {
                }
                column(PreviousAnnualTargetQty_PCObjective; "PC Objective"."Previous Annual Target Qty")
                {
                }
                column(AdditionalComments_PCObjective; "PC Objective"."Additional Comments")
                {
                }
                column(ActivityType_PCObjective; "PC Objective"."Activity Type")
                {
                }
                column(DirectorsAchievedTargets_PCObjective; "PC Objective"."Directors Achieved Targets")
                {
                }
                column(DepartmentAchievedTarget_PCObjective; "PC Objective"."Department Achieved Target")
                {
                }
                column(Selected_PCObjective; "PC Objective".Selected)
                {
                }
                column(PrimaryDirectorateName_PCObjective; "PC Objective"."Primary Directorate Name")
                {
                }
                column(PrimaryDepartmentName_PCObjective; "PC Objective"."Primary Department Name")
                {
                }
                column(Summaryofsubactivities_PCObjective; "PC Objective"."Summary of subactivities")
                {
                }
                column(Budget_PCObjective; "PC Objective".Budget)
                {
                }
                column(Notify_PCObjective; "PC Objective".Notify)
                {
                }
                column(PlanningBudgetType_PCObjective; "PC Objective"."Planning Budget Type")
                {
                }
                dataitem("Sub PC Objective"; "Sub PC Objective")
                {
                    DataItemLink = "Workplan No." = field("Workplan No."), "Initiative No." = field("Initiative No.");
                    column(ReportForNavId_3; 3)
                    {
                    }
                    column(WorkplanNo_SubPCObjective; "Sub PC Objective"."Workplan No.")
                    {
                    }
                    column(InitiativeNo_SubPCObjective; "Sub PC Objective"."Initiative No.")
                    {
                    }
                    column(ObjectiveInitiative_SubPCObjective; "Sub PC Objective"."Objective/Initiative")
                    {
                    }
                    column(PrimaryDirectorate_SubPCObjective; "Sub PC Objective"."Primary Directorate")
                    {
                    }
                    column(PrimaryDepartment_SubPCObjective; "Sub PC Objective"."Primary Department")
                    {
                    }
                    column(OverallOwner_SubPCObjective; "Sub PC Objective"."Overall Owner")
                    {
                    }
                    column(OutcomePerfomanceIndicator_SubPCObjective; "Sub PC Objective"."Outcome Perfomance Indicator")
                    {
                    }
                    column(UnitofMeasure_SubPCObjective; "Sub PC Objective"."Unit of Measure")
                    {
                    }
                    column(DesiredPerfomanceDirection_SubPCObjective; "Sub PC Objective"."Desired Perfomance Direction")
                    {
                    }
                    column(KPIType_SubPCObjective; "Sub PC Objective"."KPI Type")
                    {
                    }
                    column(ImportedAnnualTargetQty_SubPCObjective; "Sub PC Objective"."Imported Annual Target Qty")
                    {
                    }
                    column(Q1TargetQty_SubPCObjective; "Sub PC Objective"."Q1 Target Qty")
                    {
                    }
                    column(Q1SelfReviewQty_SubPCObjective; "Sub PC Objective"."Q1 Self-Review Qty")
                    {
                    }
                    column(Q1ManagerReviewQty_SubPCObjective; "Sub PC Objective"."Q1 ManagerReview Qty")
                    {
                    }
                    column(Q1ActualQty_SubPCObjective; "Sub PC Objective"."Q1 Actual Qty")
                    {
                    }
                    column(Q2TargetQty_SubPCObjective; "Sub PC Objective"."Q2 Target Qty")
                    {
                    }
                    column(Q2SelfReviewQty_SubPCObjective; "Sub PC Objective"."Q2 Self-Review Qty")
                    {
                    }
                    column(Q2ManagerReviewQty_SubPCObjective; "Sub PC Objective"."Q2 ManagerReview Qty")
                    {
                    }
                    column(Q2ActualQty_SubPCObjective; "Sub PC Objective"."Q2 Actual Qty")
                    {
                    }
                    column(Q3TargetQty_SubPCObjective; "Sub PC Objective"."Q3 Target Qty")
                    {
                    }
                    column(Q3SelfReviewQty_SubPCObjective; "Sub PC Objective"."Q3 Self-Review Qty")
                    {
                    }
                    column(Q3ManagerReviewQty_SubPCObjective; "Sub PC Objective"."Q3 ManagerReview Qty")
                    {
                    }
                    column(Q3ActualQty_SubPCObjective; "Sub PC Objective"."Q3 Actual Qty")
                    {
                    }
                    column(Q4TargetQty_SubPCObjective; "Sub PC Objective"."Q4 Target Qty")
                    {
                    }
                    column(Q4SelfReviewQty_SubPCObjective; "Sub PC Objective"."Q4 Self-Review Qty")
                    {
                    }
                    column(Q4ManagerReviewQty_SubPCObjective; "Sub PC Objective"."Q4 ManagerReview Qty")
                    {
                    }
                    column(Q4ActualQty_SubPCObjective; "Sub PC Objective"."Q4 Actual Qty")
                    {
                    }
                    column(GlobalDimension1Code_SubPCObjective; "Sub PC Objective"."Global Dimension 1 Code")
                    {
                    }
                    column(GlobalDimension2Code_SubPCObjective; "Sub PC Objective"."Global Dimension 2 Code")
                    {
                    }
                    column(PlanningDateFilter_SubPCObjective; "Sub PC Objective"."Planning Date Filter")
                    {
                    }
                    column(GoalTemplateID_SubPCObjective; "Sub PC Objective"."Goal Template ID")
                    {
                    }
                    column(SubInitiativeNo_SubPCObjective; "Sub PC Objective"."Sub Initiative No.")
                    {
                    }
                    column(SubTargets_SubPCObjective; "Sub PC Objective"."Sub Targets")
                    {
                    }
                    column(EntryNumber_SubPCObjective; "Sub PC Objective"."Entry Number")
                    {
                    }
                    column(SubActivityweight_SubPCObjective; "Sub PC Objective"."Sub Activity weight %")
                    {
                    }
                    column(Budget_SubPCObjective; "Sub PC Objective".Budget)
                    {
                    }
                    column(SubActivityDescription_SubPCObjective; "Sub PC Objective"."Sub Activity Description")
                    {
                    }
                    column(ExpenseAmount_SubPCObjective; "Sub PC Objective"."Expense Amount")
                    {
                    }
                    column(PlanningBudgetType_SubPCObjective; "Sub PC Objective"."Planning Budget Type")
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //TotalDepartmentalBudget:=TotalDepartmentalBudget+"Strategy Workplan Lines"."Total Subactivity budget";
                    //MESSAGE('TotalDepartmentalBudget is %1',TotalDepartmentalBudget);
                end;

                trigger OnPreDataItem()
                begin
                    //TotalDepartmentalBudget:=0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if UserSetup.Get(PerfomanceContractHeader."Created By") then begin
                    Creator := PerfomanceContractHeader."Created By";
                    CreatorName := UserSetup."Employee Name";
                    UserSetup.CalcFields(Picture);
                end;

                StartYear := Date2dmy("Perfomance Contract Header"."Start Date", 3);
                EndYear := Date2dmy("Perfomance Contract Header"."End Date", 3);


                CorporateStrategicPlans.Reset;
                CorporateStrategicPlans.SetRange(Code, "Perfomance Contract Header"."Strategy Plan ID");
                if CorporateStrategicPlans.FindSet then begin
                    CStartYear := Date2dmy("Perfomance Contract Header"."Start Date", 3);
                    CEndYear := Date2dmy("Perfomance Contract Header"."End Date", 3);

                end;
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
        // rec: Decimal;
        StartYear: Integer;
        EndYear: Integer;
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
        CStartYear: Integer;
        CEndYear: Integer;
        Country: Record "Country/Region";
        CountryName: Code[100];
        CompInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        Creator: Text;
        CreatorName: Text;
}

