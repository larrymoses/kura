report 99129 "Employee Aging Report"
{
    ApplicationArea = All;
    Caption = 'Employee Aging Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/EmployeeAging.rdl';
    dataset
    {
        dataitem(Employee; Employee)
        {
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
            column(No_; "No.")
            {

            }
            column(Name; FullName)
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Global_Dimension_1_Name; CustomFunction.DimensionName(1, "Global Dimension 1 Code"))
            {

            }
            column(Balance; Balance)
            {

            }
            column(OneToThirty; "1-30")
            {

            }
            column(ThirtyOneToSixty; "31-60")
            {

            }
            column(SixtyOneToNinety; "61-90")
            {

            }
            column(AboveNinety; ">90")
            {

            }
            column(Total; Total)
            {

            }
            trigger OnAfterGetRecord()
            begin
                "1-30" := 0;
                "31-60" := 0;
                "61-90" := 0;
                ">90" := 0;
                Total := 0;
                CalcFields(Balance);
                Emp.Reset();
                Emp.SetRange("No.", "No.");
                Emp.SetRange("Date Filter", ReportDate - 30, ReportDate - 1);
                if Emp.FindSet() then begin
                    Emp.CalcFields(Balance);
                    "1-30" := Emp.Balance;
                end;
                Emp.Reset();
                Emp.SetRange("No.", "No.");
                Emp.SetRange("Date Filter", ReportDate - 30, ReportDate - 1);
                if Emp.FindSet() then begin
                    Emp.CalcFields(Balance);
                    "31-60" := Emp.Balance;
                end;
                Emp.Reset();
                Emp.SetRange("No.", "No.");
                Emp.SetRange("Date Filter", ReportDate - 90, ReportDate - 61);
                if Emp.FindSet() then begin
                    Emp.CalcFields(Balance);
                    "61-90" := Emp.Balance;
                end;
                Emp.Reset();
                Emp.SetRange("No.", "No.");
                Emp.SetFilter("Date Filter", '>%1', ReportDate - 90);
                if Emp.FindSet() then begin
                    Emp.CalcFields(Balance);
                    ">90" := Emp.Balance;
                end;

            end;

            trigger OnPreDataItem()
            begin
                if ReportDate = 0D then
                    ReportDate := Today;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                    field(ReportDate; ReportDate)
                    {
                        Caption = 'Date';
                        ApplicationArea = All;
                    }
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
        CustomFunction: Codeunit "Custom Function";
        "1-30": Decimal;
        "31-60": Decimal;
        "61-90": Decimal;
        ">90": Decimal;
        Total: Decimal;
        ReportDate: Date;
        Emp: Record Employee;
         ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        Country: Text[50];
        CountryRegion: Record "Country/Region";
}


