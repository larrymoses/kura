#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 80039 "Budget Consolidation Analysis"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Budget Consolidation Analysis.rdlc';

    dataset
    {
        dataitem("Consolidated Bugdet Entry"; "Consolidated Bugdet Entry")
        {
            RequestFilterFields = "Consolidation Header No";
            column(ReportForNavId_1; 1)
            {
            }
            column(ConsolidationHeaderNo_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Consolidation Header No")
            {
            }
            column(JobNo_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Job No")
            {
            }
            column(Voteid_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Vote id")
            {
            }
            column(EntryNo_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Entry No")
            {
            }
            column(Amount_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry".Amount)
            {
            }
            column(Description_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry".Description)
            {
            }
            column(VoteDesription_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Vote Desription")
            {
            }
            column(ActivityId_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Activity Id")
            {
            }
            column(ActivityDescription_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Activity Description")
            {
            }
            column(ActualAmount_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Actual Amount")
            {
            }
            column(WorkplanNo_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Workplan No")
            {
            }
            column(InitiativeNo_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Initiative No.")
            {
            }
            column(SubInitiativeNo_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Sub Initiative No.")
            {
            }
            column(PrimaryDirectorate_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Primary Directorate")
            {
            }
            column(PrimaryDepartment_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Primary Department")
            {
            }
            column(PrimaryDirectorateName_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Primary Directorate Name")
            {
            }
            column(PrimaryDepartmentName_ConsolidatedBugdetEntry; "Consolidated Bugdet Entry"."Primary Department Name")
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_29; 29)
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
                column(PhoneNo_CompanyInformation; "Company Information"."Phone No.")
                {
                }
                column(PhoneNo2_CompanyInformation; "Company Information"."Phone No. 2")
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
}

