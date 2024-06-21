#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Report 80019 "Performance Contracts"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Performance Contracts.rdlc';

//     dataset
//     {
//         dataitem("Perfomance Contract Header";"Perfomance Contract Header")
//         {
//             RequestFilterFields = No;
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(No_PerfomanceContractHeader;"Perfomance Contract Header".No)
//             {
//             }
//             column(DocumentType_PerfomanceContractHeader;"Perfomance Contract Header"."Document Type")
//             {
//             }
//             column(Description_PerfomanceContractHeader;"Perfomance Contract Header".Description)
//             {
//             }
//             column(DocumentDate_PerfomanceContractHeader;"Perfomance Contract Header"."Document Date")
//             {
//             }
//             column(ObjectiveSettingDueDate_PerfomanceContractHeader;"Perfomance Contract Header"."Objective Setting Due Date")
//             {
//             }
//             column(StrategyPlanID_PerfomanceContractHeader;"Perfomance Contract Header"."Strategy Plan ID")
//             {
//             }
//             column(AnnualReportingCode_PerfomanceContractHeader;"Perfomance Contract Header"."Annual Reporting Code")
//             {
//             }
//             column(StartDate_PerfomanceContractHeader;"Perfomance Contract Header"."Start Date")
//             {
//             }
//             column(EndDate_PerfomanceContractHeader;"Perfomance Contract Header"."End Date")
//             {
//             }
//             column(AnnualWorkplan_PerfomanceContractHeader;"Perfomance Contract Header"."Annual Workplan")
//             {
//             }
//             column(CompanyInfoName;CompInfo.Name)
//             {
//             }
//             column(CompanyInfoPicture;CompInfo.Picture)
//             {
//             }
//             column(ResponsibleEmployeeNo_PerfomanceContractHeader;"Perfomance Contract Header"."Responsible Employee No.")
//             {
//             }
//             column(Designation_PerfomanceContractHeader;"Perfomance Contract Header".Designation)
//             {
//             }
//             column(Grade_PerfomanceContractHeader;"Perfomance Contract Header".Grade)
//             {
//             }
//             column(EmployeeName_PerfomanceContractHeader;"Perfomance Contract Header"."Employee Name")
//             {
//             }
//             dataitem("Company Information";"Company Information")
//             {
//                 column(ReportForNavId_124; 124)
//                 {
//                 }
//                 column(Name_CompanyInformation;"Company Information".Name)
//                 {
//                 }
//                 column(Name2_CompanyInformation;"Company Information"."Name 2")
//                 {
//                 }
//                 column(Address_CompanyInformation;"Company Information".Address)
//                 {
//                 }
//                 column(Address2_CompanyInformation;"Company Information"."Address 2")
//                 {
//                 }
//                 column(City_CompanyInformation;"Company Information".City)
//                 {
//                 }
//                 column(Picture_CompanyInformation;"Company Information".Picture)
//                 {
//                 }
//                 column(PostCode_CompanyInformation;"Company Information"."Post Code")
//                 {
//                 }
//                 column(County_CompanyInformation;"Company Information".County)
//                 {
//                 }
//                 column(CountryName;CountryName)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     /*Country.RESET;
//                     Country.SETRANGE(Code, "Company Information"."Country/Region Code");
//                     IF Country.FINDSET THEN
//                       CountryName:=Country.Name;*/


//                     if Country.Get("Company Information"."Country/Region Code") then
//                        CountryName:=Country.Name;

//                 end;
//             }
//             dataitem("PC Perspective";"PC Perspective")
//             {
//                 DataItemLink = "Document No"=field(No);
//                 column(ReportForNavId_62; 62)
//                 {
//                 }
//                 column(Code_PCPerspective;"PC Perspective".Code)
//                 {
//                 }
//                 column(DocumentNo_PCPerspective;"PC Perspective"."Document No")
//                 {
//                 }
//                 column(Description_PCPerspective;"PC Perspective".Description)
//                 {
//                 }
//                 column(NoofActivities_PCPerspective;"PC Perspective"."No of Activities")
//                 {
//                 }
//                 column(TotalWeight_PCPerspective;"PC Perspective"."Total Weight")
//                 {
//                 }
//             }
//             dataitem("PC Objective";"PC Objective")
//             {
//                 DataItemLink = "Workplan No."=field(No);
//                 column(ReportForNavId_17; 17)
//                 {
//                 }
//                 column(WorkplanNo_PCObjective;"PC Objective"."Workplan No.")
//                 {
//                 }
//                 column(InitiativeNo_PCObjective;"PC Objective"."Initiative No.")
//                 {
//                 }
//                 column(ObjectiveInitiative_PCObjective;"PC Objective"."Objective/Initiative")
//                 {
//                 }
//                 column(GoalID_PCObjective;"PC Objective"."Goal ID")
//                 {
//                 }
//                 column(InitiativeType_PCObjective;"PC Objective"."Initiative Type")
//                 {
//                 }
//                 column(TaskType_PCObjective;"PC Objective"."Task Type")
//                 {
//                 }
//                 column(Indentation_PCObjective;"PC Objective".Indentation)
//                 {
//                 }
//                 column(Totaling_PCObjective;"PC Objective".Totaling)
//                 {
//                 }
//                 column(Progress_PCObjective;"PC Objective".Progress)
//                 {
//                 }
//                 column(Complete_PCObjective;"PC Objective"."%Complete")
//                 {
//                 }
//                 column(PriorityLevel_PCObjective;"PC Objective"."Priority Level")
//                 {
//                 }
//                 column(StrategyPlanID_PCObjective;"PC Objective"."Strategy Plan ID")
//                 {
//                 }
//                 column(YearReportingCode_PCObjective;"PC Objective"."Year Reporting Code")
//                 {
//                 }
//                 column(StartDate_PCObjective;"PC Objective"."Start Date")
//                 {
//                 }
//                 column(DueDate_PCObjective;"PC Objective"."Due Date")
//                 {
//                 }
//                 column(PrimaryDirectorate_PCObjective;"PC Objective"."Primary Directorate")
//                 {
//                 }
//                 column(PrimaryDepartment_PCObjective;"PC Objective"."Primary Department")
//                 {
//                 }
//                 column(OverallOwner_PCObjective;"PC Objective"."Overall Owner")
//                 {
//                 }
//                 column(OutcomePerfomanceIndicator_PCObjective;"PC Objective"."Outcome Perfomance Indicator")
//                 {
//                 }
//                 column(UnitofMeasure_PCObjective;"PC Objective"."Unit of Measure")
//                 {
//                 }
//                 column(DesiredPerfomanceDirection_PCObjective;"PC Objective"."Desired Perfomance Direction")
//                 {
//                 }
//                 column(KPIType_PCObjective;"PC Objective"."KPI Type")
//                 {
//                 }
//                 column(ImportedAnnualTargetQty_PCObjective;"PC Objective"."Imported Annual Target Qty")
//                 {
//                 }
//                 column(Q1TargetQty_PCObjective;"PC Objective"."Q1 Target Qty")
//                 {
//                 }
//                 column(Q1SelfReviewQty_PCObjective;"PC Objective"."Q1 Self-Review Qty")
//                 {
//                 }
//                 column(Q1ManagerReviewQty_PCObjective;"PC Objective"."Q1 ManagerReview Qty")
//                 {
//                 }
//                 column(Q1ActualQty_PCObjective;"PC Objective"."Q1 Actual Qty")
//                 {
//                 }
//                 column(Q2TargetQty_PCObjective;"PC Objective"."Q2 Target Qty")
//                 {
//                 }
//                 column(Q2SelfReviewQty_PCObjective;"PC Objective"."Q2 Self-Review Qty")
//                 {
//                 }
//                 column(Q2ManagerReviewQty_PCObjective;"PC Objective"."Q2 ManagerReview Qty")
//                 {
//                 }
//                 column(Q2ActualQty_PCObjective;"PC Objective"."Q2 Actual Qty")
//                 {
//                 }
//                 column(Q3TargetQty_PCObjective;"PC Objective"."Q3 Target Qty")
//                 {
//                 }
//                 column(Q3SelfReviewQty_PCObjective;"PC Objective"."Q3 Self-Review Qty")
//                 {
//                 }
//                 column(Q3ManagerReviewQty_PCObjective;"PC Objective"."Q3 ManagerReview Qty")
//                 {
//                 }
//                 column(Q3ActualQty_PCObjective;"PC Objective"."Q3 Actual Qty")
//                 {
//                 }
//                 column(Q4TargetQty_PCObjective;"PC Objective"."Q4 Target Qty")
//                 {
//                 }
//                 column(Q4SelfReviewQty_PCObjective;"PC Objective"."Q4 Self-Review Qty")
//                 {
//                 }
//                 column(Q4ManagerReviewQty_PCObjective;"PC Objective"."Q4 ManagerReview Qty")
//                 {
//                 }
//                 column(Q4ActualQty_PCObjective;"PC Objective"."Q4 Actual Qty")
//                 {
//                 }
//                 column(GlobalDimension1Code_PCObjective;"PC Objective"."Global Dimension 1 Code")
//                 {
//                 }
//                 column(GlobalDimension2Code_PCObjective;"PC Objective"."Global Dimension 2 Code")
//                 {
//                 }
//                 column(PlanningDateFilter_PCObjective;"PC Objective"."Planning Date Filter")
//                 {
//                 }
//                 column(GoalTemplateID_PCObjective;"PC Objective"."Goal Template ID")
//                 {
//                 }
//                 column(FrameworkPerspective_PCObjective;"PC Objective"."Framework Perspective")
//                 {
//                 }
//                 column(StrategyFramework_PCObjective;"PC Objective"."Strategy Framework")
//                 {
//                 }
//                 column(AssignedWeight_PCObjective;"PC Objective"."Assigned Weight (%)")
//                 {
//                 }
//                 column(PreviousAnnualTargetQty_PCObjective;"PC Objective"."Previous Annual Target Qty")
//                 {
//                 }
//                 column(BoardAchievedTargets_PCObjective;"PC Objective"."Board Achieved Targets")
//                 {
//                 }
//                 column(PrimaryDirectorateName_PCObjective;"PC Objective"."Primary Directorate Name")
//                 {
//                 }
//                 column(PrimaryDepartmentName_PCObjective;"PC Objective"."Primary Department Name")
//                 {
//                 }
//                 column(KeyPerformanceIndicator_PCObjective;"PC Objective"."Key Performance Indicator")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     //"PC Objective".CALCFIELDS("Board Achieved Targets");
//                     AchievedTargets:=0;
//                     AchievedTargets:=FnGetAchievedTargets("PC Objective"."Workplan No.","PC Objective"."Initiative No.");
//                 end;
//             }

//             trigger OnPreDataItem()
//             begin
//                 CompInfo.Get;
//                 CompInfo.CalcFields(Picture);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         Country: Record "Country/Region";
//         CountryName: Code[100];
//         CompInfo: Record "Company Information";
//         AchievedTargets: Decimal;


//     procedure FnGetAchievedTargets(PCNumber: Code[50];ActivityID: Code[50]) AchievedT: Decimal
//     var
//         PCObjective: Record "PC Objective";
//     begin
//         AchievedT:=0;
//         PCObjective.Reset;
//         PCObjective.SetRange("Workplan No.",PCNumber);
//         PCObjective.SetRange("Initiative No.",ActivityID);
//         if PCObjective.Find('-') then begin
//            PCObjective.CalcFields("Individual Achieved Targets","Functional Achieved Targets","CEO Achieved Targets","Board Achieved Targets",
//                                  "Directors Achieved Targets","Department Achieved Target");

//            if PCObjective."Individual Achieved Targets">0 then
//               AchievedT:=PCObjective."Individual Achieved Targets";

//            if PCObjective."Functional Achieved Targets">0 then
//               AchievedT:=PCObjective."Functional Achieved Targets";

//             if PCObjective."CEO Achieved Targets">0 then
//               AchievedT:=PCObjective."CEO Achieved Targets";

//             if PCObjective."Board Achieved Targets">0 then
//               AchievedT:=PCObjective."Board Achieved Targets";

//             if PCObjective."Directors Achieved Targets">0 then
//               AchievedT:=PCObjective."Directors Achieved Targets";

//             if PCObjective."Department Achieved Target">0 then
//               AchievedT:=PCObjective."Department Achieved Target";

//         end;
//         exit;
//     end;
// }

