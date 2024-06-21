#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 80033 "PC Creation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PC Creation Report.rdlc';

    dataset
    {
        dataitem("Perfomance Contract Header";"Perfomance Contract Header")
        {
            RequestFilterFields = No,"Document Type","Annual Reporting Code","Responsible Employee No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(Name;CI.Name)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(Int;Int)
            {
            }
            column(No_PerfomanceContractHeader;"Perfomance Contract Header".No)
            {
            }
            column(DocumentType_PerfomanceContractHeader;"Perfomance Contract Header"."Document Type")
            {
            }
            column(Description_PerfomanceContractHeader;"Perfomance Contract Header".Description)
            {
            }
            column(DocumentDate_PerfomanceContractHeader;"Perfomance Contract Header"."Document Date")
            {
            }
            column(ObjectiveSettingDueDate_PerfomanceContractHeader;"Perfomance Contract Header"."Objective Setting Due Date")
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
            column(ResponsibleEmployeeNo_PerfomanceContractHeader;"Perfomance Contract Header"."Responsible Employee No.")
            {
            }
            column(Designation_PerfomanceContractHeader;"Perfomance Contract Header".Designation)
            {
            }
            column(Grade_PerfomanceContractHeader;"Perfomance Contract Header".Grade)
            {
            }
            column(EmployeeName_PerfomanceContractHeader;"Perfomance Contract Header"."Employee Name")
            {
            }
            column(ResponsibilityCenter_PerfomanceContractHeader;"Perfomance Contract Header"."Responsibility Center")
            {
            }
            column(ResponsibilityCenterName_PerfomanceContractHeader;"Perfomance Contract Header"."Responsibility Center Name")
            {
            }
            column(EvaluationType_PerfomanceContractHeader;"Perfomance Contract Header"."Evaluation Type")
            {
            }
            column(ApprovalStatus_PerfomanceContractHeader;"Perfomance Contract Header"."Approval Status")
            {
            }
            column(Blocked_PerfomanceContractHeader;"Perfomance Contract Header"."Blocked?")
            {
            }
            column(CreatedBy_PerfomanceContractHeader;"Perfomance Contract Header"."Created By")
            {
            }
            column(CreatedOn_PerfomanceContractHeader;"Perfomance Contract Header"."Created On")
            {
            }
            column(LastEvaluationDate_PerfomanceContractHeader;"Perfomance Contract Header"."Last Evaluation Date")
            {
            }
            column(NoSeries_PerfomanceContractHeader;"Perfomance Contract Header"."No. Series")
            {
            }
            column(GoalTemplateID_PerfomanceContractHeader;"Perfomance Contract Header"."Goal Template ID")
            {
            }
            column(AnnualWorkplan_PerfomanceContractHeader;"Perfomance Contract Header"."Annual Workplan")
            {
            }
            column(CEOWorkPlan_PerfomanceContractHeader;"Perfomance Contract Header"."CEO WorkPlan")
            {
            }
            column(FunctionalWorkPlan_PerfomanceContractHeader;"Perfomance Contract Header"."Functional WorkPlan")
            {
            }
            column(Status_PerfomanceContractHeader;"Perfomance Contract Header".Status)
            {
            }
            column(ChangeStatus_PerfomanceContractHeader;"Perfomance Contract Header"."Change Status")
            {
            }
            column(ShortcutDimension1Code_PerfomanceContractHeader;"Perfomance Contract Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PerfomanceContractHeader;"Perfomance Contract Header"."Shortcut Dimension 2 Code")
            {
            }
            column(DimensionSetID_PerfomanceContractHeader;"Perfomance Contract Header"."Dimension Set ID")
            {
            }
            column(Directorate_PerfomanceContractHeader;"Perfomance Contract Header".Directorate)
            {
            }
            column(DirectorateName_PerfomanceContractHeader;"Perfomance Contract Header"."Directorate Name")
            {
            }
            column(Position_PerfomanceContractHeader;"Perfomance Contract Header".Position)
            {
            }
            column(TotalAssignedWeight_PerfomanceContractHeader;"Perfomance Contract Header"."Total Assigned Weight(%)")
            {
            }
            column(SecondaryAssignedWeight_PerfomanceContractHeader;"Perfomance Contract Header"."Secondary Assigned Weight(%)")
            {
            }
            column(JDAssignedWeight_PerfomanceContractHeader;"Perfomance Contract Header"."JD Assigned Weight(%)")
            {
            }
            column(StrategyFramework_PerfomanceContractHeader;"Perfomance Contract Header"."Strategy Framework")
            {
            }
            column(VisionStatement_PerfomanceContractHeader;"Perfomance Contract Header"."Vision Statement")
            {
            }
            column(MissionStatement_PerfomanceContractHeader;"Perfomance Contract Header"."Mission Statement")
            {
            }
            column(ScoreCardType_PerfomanceContractHeader;"Perfomance Contract Header"."Score Card Type")
            {
            }
            column(DirectorsPCID_PerfomanceContractHeader;"Perfomance Contract Header"."Directors PC ID")
            {
            }
            column(DepartmentCenterPCID_PerfomanceContractHeader;"Perfomance Contract Header"."Department/Center PC ID")
            {
            }
            column(ActivityType_PerfomanceContractHeader;"Perfomance Contract Header"."Activity Type")
            {
            }
            column(HOD_PerfomanceContractHeader;"Perfomance Contract Header".HOD)
            {
            }
            column(ActingJobID_PerfomanceContractHeader;"Perfomance Contract Header"."Acting Job ID")
            {
            }
            column(NoofCEOsPCs_PerfomanceContractHeader;"Perfomance Contract Header"."No.of CEOs PCs")
            {
            }
            column(NoofDirectorsPCs_PerfomanceContractHeader;"Perfomance Contract Header"."No. of Directors' PCs")
            {
            }
            column(NoofDepartmentsPCs_PerfomanceContractHeader;"Perfomance Contract Header"."No. of Departments' PCs")
            {
            }
            column(NoofStaffPCs_PerfomanceContractHeader;"Perfomance Contract Header"."No. of Staff PCs")
            {
            }
            column(NoofDptStaffPCs_PerfomanceContractHeader;"Perfomance Contract Header"."No. of Dpt Staff PCs")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Int:=Int+1;
            end;

            trigger OnPreDataItem()
            begin
                /*PerfomanceContractHeader.RESET;
                PerfomanceContractHeader.SETRANGE("Created On",Tdate);
                IF PerfomanceContractHeader.FINDSET THEN BEGIN
                  Tdate:=PerfomanceContractHeader."Created On";
                  END;*/
                Int:=0;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Document Date Filter";Tdate)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Int: Integer;
        Date: Code[30];
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        Tdate: Date;
}

