report 99128 ARWP
{
    RDLCLayout = './Layouts/ARWP.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(RAMWorkplanHeader; "RAM Workplan Header")
        {
            PrintOnlyIfDetail = true;
            //RequestFilterFields = "Paying Bank Account";
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
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
            column(Document_No; "Document No")
            {

            }
            column(Workplan_Type; Format("Workplan Type").ToUpper())
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Road_Planner_No; "Road Planner No")
            {

            }
            column(Road_Planner_Name; "Road Planner Name")
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Funding_Source_Type; "Funding Source Type")
            {

            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {

            }
            column(Shortcut_Dimension_5_Code; "Shortcut Dimension 5 Code")
            {

            }

            column(Budget_Ceiling_Amount; "Budget Ceiling Amount")
            {

            }
            column(Regional_Director_Name; "Regional Director Name")
            {

            }
            column(Consolidated; Consolidated)
            {

            }
            column(Financial_Year_Code; "Financial Year Code")
            {

            }
            dataitem("RAM Workplan Line"; "RAM Workplan Line")
            {
                DataItemLinkReference = RAMWorkplanHeader;
                DataItemLink = "Document No" = field("Document No"), "Workplan Type" = field("Workplan Type");
                column(Town; Town)
                {

                }
                column(Road_Code; "Road Code")
                {

                }
                column(Link_Name; "Link Name")
                {

                }
                column(Works_Type; "Works Type")
                {

                }
                column(RICS; RICS)
                {

                }
                column(Works_Type_Description; "Works Type Description")
                {

                }
                column(Project_Description; "Project Description")
                {

                }
                column(Estimated_Project_Cost; "Estimated Project Cost")
                {

                }
                column(Total_Incl_VAT; "Total Incl VAT")
                {

                }
                column(Package; Package)
                {

                }
                column(Region_Code; "Region Code")
                {

                }
                column(Region_Name; "Region Name")
                {

                }
                dataitem("Work Plan Bill Item"; "Work Plan Bill Item")
                {
                    DataItemLinkReference = "RAM Workplan Line";
                    DataItemLink = "Workplan No" = field("Document No"), "Workplan Type" = field("Workplan Type"), "Line No" = field("Line No"), "Region Code" = field("Region Code"), "Town Code" = field(Town);
                    column(Contract_Type; "Contract Type")
                    {

                    }
                    column(Bill_Item_Category_Code; "Bill Item Category Code")
                    {

                    }
                    column(Bill_Item; "Activity Code")
                    {

                    }
                    column(Unit_of_Measure_Code; "Unit of Measure Code")
                    {

                    }
                    column(Technology_Type; "Technology Type")
                    {

                    }
                    column(BillItemDescription; Description)
                    {

                    }
                    column(Currency_Code; "Currency Code")
                    {

                    }
                    column(Planned_Quantity; "Planned Quantity")
                    {

                    }
                    column(Unit_Cost_; "Engineer's Rate (Unit Cost)")
                    {

                    }
                    column(Line_Amount_Excl__VAT; "Line Amount Excl. VAT")
                    {

                    }
                    column(Line_Amount_Incl__VAT; "Line Amount Incl. VAT")
                    {

                    }
                    column(Line_Amount_Inc_VAT_LCY_; "Line Amount Inc VAT(LCY)")
                    {

                    }
                    column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                    {

                    }
                    column(VAT_Prod__Posting_Group; "VAT Prod. Posting Group")
                    {

                    }
                    column(VAT__; "VAT %")
                    {

                    }
                    column(VAT_Amount; "VAT Amount")
                    {

                    }
                }
                dataitem("RICS Lines"; "RICS Lines")
                {
                    DataItemLinkReference = "RAM Workplan Line";
                    DataItemLink = "Road Code" = field("Road Code"), "Document No." = field(RICS);

                    dataitem("RICS Detailed Line"; "RICS Detailed Line")
                    {
                        DataItemLinkReference = "RICS Lines";
                        DataItemLink = "Document No." = field("Document No."), "Road Code" = field("Road Code");
                        column(Start_Chainage_Km_; "Start Chainage(Km)")
                        {

                        }
                        column(End_Chainage_Km_; "End Chainage(Km)")
                        {

                        }
                        column(Road_Condition; "Road Condition")
                        {

                        }
                        column(Surface_Type; "Surface Type")
                        {

                        }
                        column(Kms; "End Chainage(Km)" - "Start Chainage(Km)")
                        {

                        }
                    }
                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields("Link Name", "Estimated Project Cost", "Total Incl VAT");
                end;
            }
            trigger OnAfterGetRecord()
            begin
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        if CompanyInfo.get() then
            CompanyInfo.CalcFields(Picture);
        if UserSetup.Get(UserId) then
            FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        Country: Text[50];
        CountryRegion: Record "Country/Region";
}
