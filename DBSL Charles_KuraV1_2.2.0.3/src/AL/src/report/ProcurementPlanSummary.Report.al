#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 90118 "Procurement Plan Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Procurement Plan Summary.rdlc';
    caption = 'Procurement Plan Summary Report';
    UsageCategory = ReportsAndAnalysis;
    applicationArea = all;

    dataset
    {
        dataitem("Procurement Plan"; "Procurement Plan")

        {
            RequestFilterFields = "Code";


            column(FinancialYearCode_ProcurementPlan; "Procurement Plan"."Financial Year Code")
            {
            }
            column(totalG; totalG) { }
            column(totalS; totalS) { }
            column(totalW; totalW) { }
            column(TotalPPG; TotalPPG) { }
            column(TotalPPS; TotalPPS) { }
            column(TotalPPW; TotalPPW) { }
            column(Total_Budget_R11__Goods_; "Total Budget R11 (Goods)") { }
            column(Total_Budget_R11__Services_; "Total Budget R11 (Services)") { }
            column(Total_Budget_R11__Works_; "Total Budget R11 (Works)") { }
            column(ppeximservices; ppeximservices) { }
            column(ppeximworks; ppeximworks) { }

            column(REGIONG1; REGIONG) { }
            column(REGIONS1; REGIONS) { }
            column(REGIONW1; REGIONW) { }

            dataitem(PPEntryRegionsRMLF; "Procurement Plan Entry")
            {
                DataItemLink = "Procurement Plan ID" = field(CODE);
                DataItemTableView = where(Region = filter(<> 'R11'), "Funding Source ID" = filter('10% RDWKS' | '15% OPS' | '15% RDWKS' | '15% SPECIAL'));

                column(PlanningCategory_PPEntryRegionsRMLF; PPEntryRegionsRMLF."Planning Category")
                {
                }
                column(Description_PPEntryRegionsRMLF; PPEntryRegionsRMLF.Description)
                {
                }
                column(ProcurementType_PPEntryRegionsRMLF; PPEntryRegionsRMLF."Procurement Type")
                {
                }
                column(Goods_Total_Per_ProTypeRMLF; PPEntryRegionsRMLF."Goods Total Per ProTypeR") { }
                column(Services_Total_Per_ProTypeRMLF; PPEntryRegionsRMLF."Services Total Per ProTypeR") { }
                column(Works_Total_Per_ProTypeRMLF; PPEntryRegionsRMLF."Works Total Per ProTypeR") { }
                column(FundingSourceID_PPEntryRegionsRMLF; PPEntryRegionsRMLF."Funding Source ID")
                {
                }
                column(Region_PPEntryRegionsRMLF; PPEntryRegionsRMLF.Region)
                {
                }
                column(Directorate_PPEntryRegionsRMLF; PPEntryRegionsRMLF.Directorate)
                {
                }
                column(Department_PPEntryRegionsRMLF; PPEntryRegionsRMLF.Department)
                {
                }
                column(LineBudgetCost_PPEntryRegionsRMLF; PPEntryRegionsRMLF."Line Budget Cost")
                {
                }
                column(RegionNameRMLF; RegionNameRMLF)
                {
                }

                column(Goods_Total_Per_ProTypeR05; "Goods Total Per ProTypeR05") { }
                column(Total_Goods_Total_Per_ProTypeR; "Total Goods Total Per ProTypeR") { }
                column(TotalServicesTotalPerProTypeR; TotalServicesTotalPerProTypeR) { }
                column(TotalWorksTotalPerProTypeR; TotalWorksTotalPerProTypeR) { }
                column(REGIONG; REGIONG) { }
                column(REGIONS; REGIONS) { }
                column(REGIONW; REGIONW) { }


                trigger OnAfterGetRecord()
                var

                begin
                    RCRegionsRMLF.Reset;
                    RCRegionsRMLF.SetRange(RCRegionsRMLF.Code, PPEntryRegionsRMLF.Region);
                    if RCRegionsRMLF.FindSet then begin
                        RegionNameRMLF := RCRegionsRMLF.Name;
                    end;


                end;
            }
            dataitem(PPEntryHQRMLF; "Procurement Plan Entry")
            {
                DataItemLink = "Procurement Plan ID" = field(Code);
                DataItemTableView = where(Region = filter('R11'), "Funding Source ID" = filter('10% RDWKS' | '15% OPS' | '15% RDWKS' | '15% SPECIAL'), Department = filter(<> ''));

                column(PlanningCategory_PPEntryHQRMLF; PPEntryHQRMLF."Planning Category")
                {
                }
                column(Description_PPEntryHQRMLF; PPEntryHQRMLF.Description)
                {
                }
                column(ProcurementType_PPEntryHQRMLF; PPEntryHQRMLF."Procurement Type")
                {
                }
                column(Goods_Total_Per_ProTypeHQRRMLF; "Goods Total Per ProType") { }
                column(Services_Total_Per_ProTypeHQRRMLF; "Services Total Per ProType") { }
                column(Works_Total_Per_ProTypeHQRRMLF; "Works Total Per ProType") { }

                column(FundingSourceID_PPEntryHQRMLF; PPEntryHQRMLF."Funding Source ID")
                {
                }
                column(LineBudgetCost_PPEntryHQRMLF; PPEntryHQRMLF."Line Budget Cost")
                {
                }
                column(Region_PPEntryHQRMLF; PPEntryHQRMLF.Region)
                {
                }
                column(Directorate_PPEntryHQRMLF; PPEntryHQRMLF.Directorate)
                {
                }
                column(Department_PPEntryHQRMLF; PPEntryHQRMLF.Department)
                {
                }
                column(DepartmentNameHQRMLF; DepartmentNameHQRMLF)
                {
                }
                column(Goods_Total_Per_ProType; "Goods Total Per ProType") { }
                column(Total_Goods_Total_Per_HQRLMF; "Total Goods Total Per HQRLMF") { }
                column(Total_Services_Total_Per_HQRLMF; "Total Services Total Per HQRLMF") { }
                column(Total_Works_Total_Per_HQRLMF; "Total Works Total Per HQRLMF") { }
                column(TOTALregionG; TOTALregionG) { }

                trigger OnPreDataItem()
                var

                begin

                    PPEntryHQRMLF.CalcFields("Total Services Total Per HQRLMF");
                    // Message('%1', "Total Goods Total Per HQRLMF");
                    PPEntryHQRMLF.CalcFields("Total Goods Total Per HQRLMF");
                    PPEntryHQRMLF.CalcFields("Total Works Total Per HQRLMF");

                end;

                trigger OnAfterGetRecord()
                var
                    TOTALGOODSHQRMLF: Decimal;

                begin


                    PPEntryHQRMLF.CalcFields("Total Services Total Per HQRLMF");
                    // Message('%1', "Total Services Total Per HQRLMF");
                    TOTALS := PPEntryHQRMLF."Total Services Total Per HQRLMF";
                    PPEntryHQRMLF.CalcFields("Total Goods Total Per HQRLMF");
                    totalG := PPEntryHQRMLF."Total Goods Total Per HQRLMF";
                    PPEntryHQRMLF.CalcFields("Total Works Total Per HQRLMF");
                    TOTALW := PPEntryHQRMLF."Total Works Total Per HQRLMF";

                    RCHQRMLF.Reset;
                    RCHQRMLF.SetRange(RCHQRMLF.Code, PPEntryHQRMLF.Department);
                    if RCHQRMLF.FindSet then begin
                        DepartmentNameHQRMLF := RCHQRMLF.Name;
                    end;


                end;
            }
            dataitem(PPEntryHQGOK; "Procurement Plan Entry")
            {
                DataItemLink = "Procurement Plan ID" = field(Code);
                DataItemTableView = where(Region = filter('R11'), "Funding Source ID" = filter('GOK DEV'), "Procurement Type" = filter(<> ''));
                column(ReportForNavId_25; 25)
                {
                }
                column(PlanningCategory_PPEntryHQGOK; PPEntryHQGOK."Planning Category")
                {
                }
                column(Description_PPEntryHQGOK; PPEntryHQGOK.Description)
                {
                }
                column(ProcurementType_PPEntryHQGOK; PPEntryHQGOK."Procurement Type")
                {
                }
                column(Goods_Total_Per_ProTypeHQGOK; "Goods Total Per ProType") { }
                column(Services_Total_Per_ProTypHQGOK; "Services Total Per ProType") { }
                column(Works_Total_Per_ProTypeHQGOH; "Works Total Per ProType") { }
                column(FundingSourceID_PPEntryHQGOK; PPEntryHQGOK."Funding Source ID")
                {
                }
                column(LineBudgetCost_PPEntryHQGOK; PPEntryHQGOK."Line Budget Cost")
                {
                }
                column(Region_PPEntryHQGOK; PPEntryHQGOK.Region)
                {
                }
                column(Directorate_PPEntryHQGOK; PPEntryHQGOK.Directorate)
                {
                }
                column(Department_PPEntryHQGOK; PPEntryHQGOK.Department)
                {
                }
                column(DepartmentNameHQGOK; DepartmentNameHQGOK)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    RCHQGOK.Reset;
                    RCHQGOK.SetRange(RCHQGOK.Code, PPEntryHQGOK.Department);
                    if RCHQGOK.FindSet then begin
                        DepartmentNameHQGOK := RCHQGOK.Name;
                    end;
                end;
            }
            dataitem(PPEntryDONOR; "Procurement Plan Entry")
            {
                DataItemLink = "Procurement Plan ID" = field(CODE);
                DataItemTableView = where("Funding Source ID" = filter('CHINA_EXIM' | 'EU' | 'JICA' | 'KOREA_EXIM'), "Procurement Type" = filter(<> ''));
                column(ReportForNavId_34; 34)
                {
                }
                column(PlanningCategory_PPEntryDONOR; PPEntryDONOR."Planning Category")
                {
                }
                column(Description_PPEntryDONOR; PPEntryDONOR.Description)
                {
                }
                column(ProcurementType_PPEntryDONOR; PPEntryDONOR."Procurement Type")
                {
                }
                column(Goods_Total_Per_ProTypeDONOR; "Goods Total Per ProType")
                { }
                column(Services_Total_Per_ProTypeDONOR; "Services Total Per ProType") { }
                column(Works_Total_Per_ProTypeDONOR; "Works Total Per ProType") { }
                column(LineBudgetCost_PPEntryDONOR; PPEntryDONOR."Line Budget Cost")
                {
                }
                column(Region_PPEntryDONOR; PPEntryDONOR.Region)
                {
                }
                column(Directorate_PPEntryDONOR; PPEntryDONOR.Directorate)
                {
                }
                column(Department_PPEntryDONOR; PPEntryDONOR.Department)
                {
                }
                column(DepartmentNameDonors; DepartmentNameDonors)
                {
                }
                column(Services_Total_Total_Per_ProTypeEXIM; "Services Total Total Per ProTypeEXIM") { }
                column(Works_Total_Total_Per_ProTypeEXIM; "Works Total Total Per ProTypeEXIM") { }
                column(Services_Total_Per_ProTypeEXIM; "Services Total Per ProTypeEXIM") { }
                column(Works_Total_Per_ProTypeEXIM; "Works Total Per ProTypeEXIM")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    RCDONOR.Reset;
                    RCDONOR.SetRange(RCDONOR.Code, PPEntryDONOR.Department);
                    if RCDONOR.FindSet then begin
                        DepartmentNameDonors := RCDONOR.Name;
                    end;
                end;
            }
            trigger OnPreDataItem()
            begin
                PPHQRLMF.Reset();
                PPHQRLMF.SetRange(PPHQRLMF."Procurement Plan ID", 'PPLAN0044');
                IF PPHQRLMF.FindSeT THEN begin
                    PPEntryHQRMLF.CalcFields("Total Services Total Per HQRLMF");
                    // Message('%1', PPEntryHQRMLF."Total Services Total Per HQRLMF");
                    TOTALS := PPEntryHQRMLF."Total Services Total Per HQRLMF";
                    PPEntryHQRMLF.CalcFields("Total Goods Total Per HQRLMF");
                    totalG := PPEntryHQRMLF."Total Goods Total Per HQRLMF";
                    PPEntryHQRMLF.CalcFields("Total Works Total Per HQRLMF");
                    TOTALW := PPEntryHQRMLF."Total Works Total Per HQRLMF";
                end;
            end;

            trigger OnAfterGetRecord()
            var

            begin
                "Procurement Plan".CalcFields("Total Budget R11 (Goods)");
                "Procurement Plan".CalcFields("Total Budget R11 (Services)");
                "Procurement Plan".CalcFields("Total Budget R11 (Works)");

                PPEntryDONOR.reset;
                PPEntryDONOR.SetRange(PPEntryDONOR."Procurement Plan ID", "Procurement Plan".code);
                if PPEntryDONOR.FindSet then begin
                    PPEntryDONOR.CalcFields("Services Total Total Per ProTypeEXIM");
                    ppeximservices := PPEntryDONOR."Services Total Total Per ProTypeEXIM";
                    PPEntryDONOR.CalcFields("Works Total Total Per ProTypeEXIM");
                    ppeximworks := PPEntryDONOR."Works Total Total Per ProTypeEXIM";
                    //  Message('%1', ppeximworks);
                end;




                PPHQRLMF.Reset();
                PPHQRLMF.SetRange(PPHQRLMF."Procurement Plan ID", "Procurement Plan".Code);
                IF PPHQRLMF.FindSeT THEN begin
                    PPEntryHQRMLF.CalcFields("Total Services Total Per HQRLMF");
                    //Message('%1', PPEntryHQRMLF."Total Services Total Per HQRLMF");
                    TOTALS := PPEntryHQRMLF."Total Services Total Per HQRLMF";
                    PPEntryHQRMLF.CalcFields("Total Goods Total Per HQRLMF");
                    totalG := PPEntryHQRMLF."Total Goods Total Per HQRLMF";
                    PPEntryHQRMLF.CalcFields("Total Works Total Per HQRLMF");
                    TOTALW := PPEntryHQRMLF."Total Works Total Per HQRLMF";
                    PPEntryHQRMLF.CalcFields("Total PP Goods");
                    TotalPPG := PPEntryHQRMLF."Total PP Goods";
                    PPEntryHQRMLF.CalcFields("Total PP Services");
                    TotalPPS := PPEntryHQRMLF."Total PP Services";
                    PPEntryHQRMLF.CalcFields("Total PP Works");
                    TotalPPW := PPEntryHQRMLF."Total PP Works";


                end;

                PPEntryRegionsRMLF.Reset;
                PPEntryRegionsRMLF.SETRANGE(PPEntryRegionsRMLF."Procurement Plan ID", "Procurement Plan".Code);
                IF PPEntryRegionsRMLF.FindSet THEN BEGIN
                    PPEntryRegionsRMLF.CalcFields("Goods Total Per ProTypeR");
                    REGIONG := PPEntryRegionsRMLF."Goods Total Per ProTypeR";
                    PPEntryRegionsRMLF.CalcFields("Services Total Per ProTypeR");
                    REGIONS := PPEntryRegionsRMLF."Services Total Per ProTypeR";
                    PPEntryRegionsRMLF.CalcFields("Works Total Per ProTypeR");
                    REGIONW := PPEntryRegionsRMLF."Works Total Per ProTypeR";
                END;
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        RCRegionsRMLF: Record "Responsibility Center";
        RCHQRMLF: Record "Responsibility Center";
        RCHQGOK: Record "Responsibility Center";
        RCDONOR: Record "Responsibility Center";
        RegionNameRMLF: Text[200];
        PCODE: CODE[50];
        DepartmentNameHQRMLF: Text[200];
        DepartmentNameHQGOK: Text[200];
        DepartmentNameDonors: Text[200];
        TOTALregionG: Decimal;
        TOTALregionS: Decimal;
        TOTALregionW: Decimal;
        PPHQRLMF: Record "Procurement Plan Entry";
        totalS: Decimal;
        ppeximservices: decimal;
        ppeximworks: decimal;
        totalGHQ: Decimal;
        totalWHQ: Decimal;
        totalSHQ: Decimal;
        totalG: Decimal;
        totalW: Decimal;
        TotalPPG: Decimal;
        TotalPPS: Decimal;
        TotalPPW: Decimal;
        REGIONG: Decimal;
        REGIONS: Decimal;
        REGIONW: Decimal;

}

