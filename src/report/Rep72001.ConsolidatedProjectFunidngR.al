#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 72001 "Consolidated Project Funidng R"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Consolidated Project Funidng R.rdlc';

    dataset
    {
        dataitem("Consolidated Project Funding R";"Consolidated Project Funding R")
        {
            RequestFilterFields = Region,"Funding Source","Year Code","Constituency Code","Road Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(DocumentNo_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Document No")
            {
            }
            column(LineNo_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Line No")
            {
            }
            column(WorksCategory_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Works Category")
            {
            }
            column(Region_ConsolidatedProjectFundingR;"Consolidated Project Funding R".Region)
            {
            }
            column(Directorate_ConsolidatedProjectFundingR;"Consolidated Project Funding R".Directorate)
            {
            }
            column(Department_ConsolidatedProjectFundingR;"Consolidated Project Funding R".Department)
            {
            }
            column(FundingSource_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Funding Source")
            {
            }
            column(YearCode_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Year Code")
            {
            }
            column(StartDate_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Start Date")
            {
            }
            column(EndDate_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."End Date")
            {
            }
            column(ConstituencyCode_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Constituency Code")
            {
            }
            column(RoadCode_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Road Code")
            {
            }
            column(RoadLinkName_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Road Link Name")
            {
            }
            column(CurrencyCode_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Currency Code")
            {
            }
            column(FundingAmount_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Total Estimated Cost")
            {
            }
            column(FundingAmountLCY_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Total Estimated Cost(LCY)")
            {
            }
            column(EntryType_ConsolidatedProjectFundingR;"Consolidated Project Funding R"."Revision Status")
            {
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
}

