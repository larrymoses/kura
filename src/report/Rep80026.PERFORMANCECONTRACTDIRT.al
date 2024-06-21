#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 80026 "PERFORMANCE CONTRACT-DIRT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PERFORMANCE CONTRACT-DIRT.rdlc';

    dataset
    {
        dataitem("Perfomance Contract Header";"Perfomance Contract Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(No_PerfomanceContractHeader;"Perfomance Contract Header".No)
            {
            }
            column(StrategyPlanID_PerfomanceContractHeader;"Perfomance Contract Header"."Strategy Plan ID")
            {
            }
            column(AnnualReportingCode_PerfomanceContractHeader;"Perfomance Contract Header"."Annual Reporting Code")
            {
            }
            column(ResponsibleEmployeeNo_PerfomanceContractHeader;"Perfomance Contract Header"."Responsible Employee No.")
            {
            }
            column(EmployeeName_PerfomanceContractHeader;"Perfomance Contract Header"."Employee Name")
            {
            }
            column(Description_PerfomanceContractHeader;"Perfomance Contract Header".Description)
            {
            }
            column(StartDate_PerfomanceContractHeader;"Perfomance Contract Header"."Start Date")
            {
            }
            column(EndDate_PerfomanceContractHeader;"Perfomance Contract Header"."End Date")
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

                trigger OnAfterGetRecord()
                begin
                    /*Country.RESET;
                    Country.SETRANGE(Code, "Company Information"."Country/Region Code");
                    IF Country.FINDSET THEN
                      CountryName:=Country.Name;*/
                    
                    
                    //IF Country.GET("Company Information"."Country/Region Code") THEN
                     //  CountryName:=Country.Name;

                end;
            }
            dataitem("PC Objective";"PC Objective")
            {
                DataItemLink = "Workplan No."=field(No);
                DataItemTableView = where("Initiative Type"=const(Board));
                column(ReportForNavId_6; 6)
                {
                }
                column(InitiativeNo_PCObjective;"PC Objective"."Initiative No.")
                {
                }
                column(ObjectiveInitiative_PCObjective;"PC Objective"."Objective/Initiative")
                {
                }
                column(UnitofMeasure_PCObjective;"PC Objective"."Unit of Measure")
                {
                }
                column(AssignedWeight_PCObjective;"PC Objective"."Assigned Weight (%)")
                {
                }
                column(ImportedAnnualTargetQty_PCObjective;"PC Objective"."Imported Annual Target Qty")
                {
                }
                column(TextDescription;TextDescription)
                {
                }
                column(AchievedTarget;"PC Objective"."Department Achieved Target")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    BoardActivities.Reset;
                    BoardActivities.SetRange("Activity Code","PC Objective"."Initiative No.");
                    if BoardActivities.FindFirst then begin
                       TextDescription:=BoardActivities."Board Activity Description";
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
        BoardActivities: Record "Board Activities";
        TextDescription: Text;
}

