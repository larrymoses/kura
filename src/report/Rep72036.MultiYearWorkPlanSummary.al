#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Report 72036 "Multi Year WorkPlan Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Multi Year WorkPlan Summary.rdlc';

    dataset
    {
        dataitem("Road Work Program"; "Road Work Program")
        {
            DataItemTableView = where("Document Type" = filter("Multi-Year Programs"));
            RequestFilterFields = "Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(CName; ObjCInfo.Name)
            {
            }
            column(CPic; ObjCInfo.Picture)
            {
            }
            column(CAddress2; ObjCInfo."Address 2")
            {
            }
            column(CAddress; ObjCInfo.Address)
            {
            }
            column(CCity; ObjCInfo.City)
            {
            }
            column(CPhoneNo; ObjCInfo."Phone No.")
            {
            }
            column(CEmail; ObjCInfo."E-Mail")
            {
            }
            column(CHomepage; ObjCInfo."Home Page")
            {
            }
            column(RegionName; RegionName)
            {
            }
            column(YearName; YearName)
            {
            }
            column(Code_RoadWorkProgram; "Road Work Program".Code)
            {
            }
            column(DocumentType_RoadWorkProgram; "Road Work Program"."Document Type")
            {
            }
            column(Description_RoadWorkProgram; "Road Work Program".Description)
            {
            }
            column(Authority_RoadWorkProgram; "Road Work Program".Authority)
            {
            }
            column(RegionID_RoadWorkProgram; "Road Work Program"."Region ID")
            {
            }
            column(DocumentDate_RoadWorkProgram; Format("Road Work Program"."Document Date"))
            {
            }
            column(FinancialBudgetID_RoadWorkProgram; "Road Work Program"."Financial Budget ID")
            {
            }
            column(FinancialYearCode_RoadWorkProgram; "Road Work Program"."Financial Year Code")
            {
            }
            column(StartDate_RoadWorkProgram; Format("Road Work Program"."Start Date"))
            {
            }
            column(EndDate_RoadWorkProgram; Format("Road Work Program"."End Date"))
            {
            }
            column(TotalWorkplannedLengthKm_RoadWorkProgram; "Road Work Program"."Total Workplanned Length (Km)")
            {
            }
            column(TotalBudgetCeiling_RoadWorkProgram; "Road Work Program"."Total Budget Ceiling")
            {
            }
            column(TotalActualCosts_RoadWorkProgram; Format("Road Work Program"."Total Actual Costs"))
            {
            }
            column(CreatedBy_RoadWorkProgram; "Road Work Program"."Created By")
            {
            }
            column(CreatedDate_RoadWorkProgram; "Road Work Program"."Created Date")
            {
            }
            column(CreatedTime_RoadWorkProgram; "Road Work Program"."Created Time")
            {
            }
            column(PlanningType_RoadWorkProgram; "Road Work Program"."Planning Type")
            {
            }
            column(RoadProjectCategory_RoadWorkProgram; "Road Work Program"."Road Project Category")
            {
            }
            column(GlobalDimension1Code_RoadWorkProgram; "Road Work Program"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_RoadWorkProgram; "Road Work Program"."Global Dimension 2 Code")
            {
            }
            column(GlobalBudgetBookId_RoadWorkProgram; "Road Work Program"."Global Budget Book Id")
            {
            }
            column(FundingSource_RoadWorkProgram; "Road Work Program"."Funding Source")
            {
            }
            column(TotalMultiYearPlanCost_RoadWorkProgram; "Road Work Program"."Total MultiYear Plan Cost")
            {
            }
            dataitem("Detailed Multi_Year Line"; "Detailed Multi_Year Line")
            {
                DataItemLink = "Road Work Program ID" = field(Code);
                column(ReportForNavId_83; 83)
                {
                }
                column(KeRRABudgetCodeName; "KeRRABudgetCode+Name")
                {
                }
                column(RoadWorkProgramID_DetailedMultiYearLine; "Detailed Multi_Year Line"."Road Work Program ID")
                {
                }
                column(PackageNo_DetailedMultiYearLine; "Detailed Multi_Year Line"."Package No.")
                {
                }
                column(YearCode_DetailedMultiYearLine; "Detailed Multi_Year Line"."Year Code")
                {
                }
                column(PackageName_DetailedMultiYearLine; "Detailed Multi_Year Line"."Package Name")
                {
                }
                column(SectionName_DetailedMultiYearLine; "Detailed Multi_Year Line"."Section Name")
                {
                }
                column(FundingSourceID_DetailedMultiYearLine; "Detailed Multi_Year Line"."Funding Source ID")
                {
                }
                column(FinancialYearCode_DetailedMultiYearLine; "Detailed Multi_Year Line"."Financial Year Code")
                {
                }
                column(ActualAmountAllocated_DetailedMultiYearLine; "Detailed Multi_Year Line"."Actual Amount Allocated")
                {
                }
                column(ActualAmountSpent_DetailedMultiYearLine; "Detailed Multi_Year Line"."Actual Amount Spent")
                {
                }
                column(FinancialBudgetName_DetailedMultiYearLine; "Detailed Multi_Year Line"."Financial Budget Name")
                {
                }
                column(AnnualProjection_DetailedMultiYearLine; "Detailed Multi_Year Line"."Annual Projection")
                {
                }
                column(AmountCertified_DetailedMultiYearLine; "Detailed Multi_Year Line"."Amount Certified")
                {
                }
                column(KeRRABudgetCode_DetailedMultiYearLine; "Detailed Multi_Year Line"."KeRRA Budget Code")
                {
                }
                column(Closed_DetailedMultiYearLine; "Detailed Multi_Year Line".Closed)
                {
                }
                column(SupplementaryBudget_DetailedMultiYearLine; "Detailed Multi_Year Line"."Supplementary Budget")
                {
                }
                column(RevisedBudget_DetailedMultiYearLine; "Detailed Multi_Year Line"."Revised Budget")
                {
                }
                column(CurrentBudgetAmount_DetailedMultiYearLine; "Detailed Multi_Year Line"."Current Budget Amount")
                {
                }
                column(ApprovalStatus_DetailedMultiYearLine; "Detailed Multi_Year Line"."Approval Status")
                {
                }
                column(RevisionType_DetailedMultiYearLine; "Detailed Multi_Year Line"."Revision Type")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    GLBudgetEntry.Reset;
                    // GLBudgetEntry.SetRange(GLBudgetEntry."KeRRA Budget Code",Detailed Multi_Year Line."KeRRA Budget Code");
                    if GLBudgetEntry.FindSet then begin
                        "KeRRABudgetCode+Name" := "Detailed Multi_Year Line"."KeRRA Budget Code" + ' ' + GLBudgetEntry.Description;
                    end;

                    ResponsibilityCenter.Reset;
                    ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Detailed Multi_Year Line"."Region ID");
                    if ResponsibilityCenter.FindSet then begin
                        RegionName := UpperCase(ResponsibilityCenter.Name);
                    end;
                    FundingYearCodes.Reset;
                    FundingYearCodes.SetRange(FundingYearCodes."Year Code", "Detailed Multi_Year Line"."Year Code");
                    if FundingYearCodes.FindSet then begin
                        YearName := UpperCase(FundingYearCodes."Financial Year Code");
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

    trigger OnInitReport()
    begin
        // ObjCInfo.GET;
        // ObjCInfo.CALCFIELDS(Picture);
    end;

    trigger OnPreReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    var
        ObjCInfo: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        RegionName: Text[250];
        YearName: Text[250];
        FundingYearCodes: Record "Funding Year Codes";
        "KeRRABudgetCode+Name": Text[250];
        GLBudgetEntry: Record "G/L Budget Entry";
}
