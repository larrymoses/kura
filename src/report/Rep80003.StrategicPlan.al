report 80003 StrategicPlan
{
    Caption = 'Strategic Plan';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Strategic Plan.rdl';

    dataset
    {
        dataitem("Corporate Strategic Plans"; "Corporate Strategic Plans")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_CorporateStrategicPlans; "Corporate Strategic Plans".Code)
            {
            }
            column(Description_CorporateStrategicPlans; "Corporate Strategic Plans".Description)
            {
            }
            column(StartDate_CorporateStrategicPlans; "Corporate Strategic Plans"."Start Date")
            {
            }
            column(EndDate_CorporateStrategicPlans; "Corporate Strategic Plans"."End Date")
            {
            }
            column(DurationYears_CorporateStrategicPlans; "Corporate Strategic Plans"."Duration (Years)")
            {
            }
            column(ImplementationStatus_CorporateStrategicPlans; "Corporate Strategic Plans"."Implementation Status")
            {
            }
            column(ApprovalStatus_CorporateStrategicPlans; "Corporate Strategic Plans"."Approval Status")
            {
            }
            dataitem("Strategic Initiative"; "Strategic Initiative")
            {
                DataItemLink = "Strategic Plan ID" = field(Code);
                column(ReportForNavId_17; 17)
                {
                }
                column(StrategicPlanID_StrategicInitiative; "Strategic Initiative"."Strategic Plan ID")
                {
                }
                column(ObjectiveID_StrategicInitiative; StrategicObjectiveDescription)
                {
                }
                column(StrategyID_StrategicInitiative; StrategyDescription)
                {
                }
                column(Code_StrategicInitiative; "Strategic Initiative".Code)
                {
                }
                column(Description_StrategicInitiative; "Strategic Initiative".Description)
                {
                }
                column(AchievedTarget_StrategicInitiative; "Strategic Initiative"."Total Achieved Target")
                {
                }
                column(KPI_StrategicInitiative; "Strategic Initiative"."Key Perfromance Indicator")
                {
                }
                column(PrimaryDirectorate_StrategicInitiative; "Strategic Initiative"."Primary Directorate")
                {
                }
                column(PrimaryDirectorateName_StrategicInitiative; "Strategic Initiative"."Primary Directorate Name")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    StrategicObjective.Reset;
                    StrategicObjective.SetRange("Objective ID", "Strategic Initiative"."Objective ID");
                    if StrategicObjective.Find('-') then begin
                        StrategicObjectiveDescription := StrategicObjective.Description;
                    end;

                    Strategy.Reset;
                    Strategy.SetRange("Strategy ID", "Strategic Initiative"."Strategy ID");
                    if Strategy.Find('-') then begin
                        StrategyDescription := Strategy.Description;
                    end;

                end;
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

    var
        StrategicObjective: Record "Strategic Objective";
        Strategy: Record Strategy;
        StrategicObjectiveDescription: Text;
        StrategyDescription: Text;
}
