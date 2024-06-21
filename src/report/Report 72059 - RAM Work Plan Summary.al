report 72059 "RAM Work Plan Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/RAM Work Plan Summary.rdl';

    dataset
    {
        dataitem("RAM Workplan Header"; "RAM Workplan Header")
        {
            RequestFilterFields = "Document No";
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {

            }
            column(GlobalDimension1Name; Customfunction.DimensionName(1, "Global Dimension 1 Code"))
            {

            }
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CIName; CompanyInformation.Name)
            {
            }
            column(CIAddress; CompanyInformation.Address)
            {
            }
            column(CIAddress2; CompanyInformation."Address 2")
            {
            }
            column(CICity; CompanyInformation.City)
            {
            }
            column(CIMotto; CompanyInformation.Motto)
            {
            }
            column(CIPicture; CompanyInformation.Picture)
            {
            }
            column(DocumentNo_RAMWorkplanHeader; "RAM Workplan Header"."Document No")
            {
            }
            column(FinancialYearCode_RAMWorkplanHeader; "RAM Workplan Header"."Financial Year Code")
            {
            }
            column(WorkplanType_RAMWorkplanHeader; UPPERCASE(FORMAT("RAM Workplan Header"."Workplan Type")))
            {
            }

            dataitem("RAM Workplan Line"; "RAM Workplan Line")
            {
                DataItemLink = "Document No" = FIELD("Document No");
                RequestFilterFields = Revised;
                column(DocumentNo_RAMWorkplanLine; "RAM Workplan Line"."Document No")
                {
                }
                column(GlobalDimension2Code_RAMWorkplanLine; "RAM Workplan Line"."Global Dimension 2 Code")
                {
                }
                column(ProjectDescription_RAMWorkplanLine; "RAM Workplan Line"."Project Description")
                {
                }
                column(BoQTemplate_RAMWorkplanLine; "RAM Workplan Line"."BoQ Template")
                {
                }
                column(RegionCode_RAMWorkplanLine; "RAM Workplan Line"."Region Code")
                {
                }
                column(RegionName_RAMWorkplanLine; "RAM Workplan Line"."Region Name")
                {
                }
                column(ConstituencyCode_RAMWorkplanLine; "RAM Workplan Line"."Constituency Code")
                {
                }
                column(ConstituencyName_RAMWorkplanLine; "RAM Workplan Line"."Constituency Name")
                {
                }
                column(WorkplannedLengthKM_RAMWorkplanLine; "RAM Workplan Line"."Workplanned Length(KM)")
                {
                }
                column(ContingencyRate_RAMWorkplanLine; "RAM Workplan Line"."Contingency Rate (%)")
                {
                }
                column(ContingencyAmountKES_RAMWorkplanLine; "RAM Workplan Line"."Contingency Amount (KES)")
                {
                }
                column(VoPRate_RAMWorkplanLine; "RAM Workplan Line"."VoP Rate(%)")
                {
                }
                column(VoPAmountKES_RAMWorkplanLine; "RAM Workplan Line"."VoP Amount (KES)")
                {
                }
                column(VATRate_RAMWorkplanLine; "RAM Workplan Line"."VAT Rate")
                {
                }
                column(VATAmount_RAMWorkplanLine; "RAM Workplan Line"."VAT Amount")
                {
                }
                column(TotalInclVAT_RAMWorkplanLine; "RAM Workplan Line"."Total Incl VAT")
                {
                }
                column(FundingSourceType_RAMWorkplanLine; "RAM Workplan Line"."Funding Source Type")
                {
                }
                column(Town;Town)
                {

                }
                dataitem("Workplan Project Road Link"; "Workplan Project Road Link")
                {
                    DataItemLink = "Workplan Type" = FIELD("Workplan Type"),
                                   "Workplan No" = FIELD("Document No"),
                                   "Line No" = FIELD("Line No");
                    column(RoadCode_WorkplanProjectRoadLink; "Road Code")
                    {
                    }
                    column(Road_Name; "Link Name")
                    {

                    }
                    column(RoadSectionNo_WorkplanProjectRoadLink; "Workplan Project Road Link"."Road Section No")
                    {
                    }
                    column(LinkName_WorkplanProjectRoadLink; "Workplan Project Road Link"."Link Name")
                    {
                    }
                    column(WorkplannedLengthKM_WorkplanProjectRoadLink; "Workplan Project Road Link"."Workplanned Length(KM)")
                    {
                    }
                    trigger OnAfterGetRecord()

                    begin
                        Roads.Reset();
                        Roads.SetRange("Road Code", "Road Code");
                        if Roads.FindFirst() then
                            RoadName := Roads.Description;
                    end;
                }
                dataitem("Work Plan Bill Item"; "Work Plan Bill Item")
                {
                    DataItemLinkReference ="RAM Workplan Line";
                    DataItemLink = "Workplan Type" = FIELD("Workplan Type"),
                                  "Workplan No" = FIELD("Document No"),
                                   "Line No" = FIELD("Line No");
                    column(Bill_Item_Category_Code; "Bill Item Category Code")
                    {

                    }
                    column(ActivityCode_WorkPlanBillItem; "Work Plan Bill Item"."Activity Code")
                    {
                    }
                    column(Description_WorkPlanBillItem; "Work Plan Bill Item".Description)
                    {
                    }
                    column(UnitofMeasureCode_WorkPlanBillItem; "Work Plan Bill Item"."Unit of Measure Code")
                    {
                    }
                    column(PlannedQuantity_WorkPlanBillItem; "Work Plan Bill Item"."Planned Quantity")
                    {
                    }
                    column(EngineersRateUnitCost_WorkPlanBillItem; "Work Plan Bill Item"."Engineer's Rate (Unit Cost)")
                    {
                    }
                    column(LineAmountInclVAT_WorkPlanBillItem; "Work Plan Bill Item"."Line Amount Incl. VAT")
                    {
                    }
                }
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Global Dimension 1 Code", RespCenter, CompanyInfo, CompanyAddr);
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

    trigger OnInitReport()
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    trigger OnPreReport()
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        Constituency: Record Constituency;
        RegionName: Text[250];
        ConstituencyName: Text[250];
        ProjectName: Text[500];
        WorkplannedLength: Integer;
        RAMWorkplanLine: Record "RAM Workplan Line";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        Customfunction: Codeunit "Custom Function";
        RoadName: Text;
        Roads: Record "Road Inventory";
        RespCenter: Record "Responsibility Center";
}

