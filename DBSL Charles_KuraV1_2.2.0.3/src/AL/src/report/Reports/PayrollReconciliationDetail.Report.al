#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69301 "Payroll Reconciliation Detail"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Reconciliation Detail.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            column(ReportForNavId_2; 2)
            {
            }
            column(FullName;Employee.FullName)
            {
            }
            column(No_Employee;Employee."No.")
            {
            }
            column(CompanyInfoName;CompanyInfo.Name)
            {
            }
            column(CompanyInfoPicture;CompanyInfo.Picture)
            {
            }
            dataitem(EarningsX;EarningsX)
            {
                DataItemLink = "Employee Code"=field("No.");
                PrintOnlyIfDetail = false;
                RequestFilterFields = "Pay Period Filter","Posting Group Filter";
                column(ReportForNavId_1000000000; 1000000000)
                {
                }
                column(EarningsX_Code;EarningsX.Code)
                {
                }
                column(EarningsX_Description;EarningsX.Description)
                {
                }
                column(ThisMonthVal;ThisMonthVal)
                {
                }
                column(EmployeeCode_EarningsX;EarningsX."Employee Code")
                {
                }
                column(LastMonthVal;LastMonthVal)
                {
                }
                column(Difference;Difference)
                {
                }
                column(Thismonth;Thismonth)
                {
                }
                column(Lastmonth;Lastmonth)
                {
                }
                column(SerialNo1;SerialNo)
                {
                }
                column(TotalEmployees;TotalEmployees)
                {
                }
                column(TotalEmployeesLastMonth;TotalEmployeesLastMonth)
                {
                }
                column(NetPayThisMonth;NetPayThisMonth)
                {
                }
                column(NetPayLastMonth;NetPayLastMonth)
                {
                }
                column(Difference2;Difference)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //SerialNo:=0;
                    CompanyInfo.Get;
                    CompanyInfo.CalcFields(Picture);

                    if EarningsX."Non-Cash Benefit"=true then
                    CurrReport.Skip;


                    //Earn.RESET;
                    //earningsx.SETRANGE(earningsx.Code,EarningsX.Code);
                    EarningsX.SetRange(EarningsX."Pay Period Filter",Thismonth);
                    //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                    //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                    //IF EarningsX.FINDFIRST THEN
                    EarningsX.CalcFields(EarningsX."Total Amount");
                    ThisMonthVal:=EarningsX."Total Amount";
                    TotalEarnThisMonth:=TotalEarnThisMonth+ThisMonthVal;

                    //Earn.RESET;
                    //Earn.SETRANGE(Earn.Code,EarningsX.Code);
                    EarningsX.SetRange(EarningsX."Pay Period Filter",Lastmonth);
                    //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                    //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                    //IF EarningsX.FINDFIRST THEN
                    EarningsX.CalcFields(EarningsX."Total Amount");

                    LastMonthVal:=EarningsX."Total Amount";
                    TotalEarnLastMonth:=TotalEarnLastMonth+LastMonthVal;

                    Difference:=ThisMonthVal-LastMonthVal;

                    //IF  (ThisMonthVal=0) AND (LastMonthVal=0) THEN

                    if  (Difference=0) then
                    CurrReport.Skip;

                    SerialNo:=SerialNo+1;
                end;

                trigger OnPreDataItem()
                begin
                    TotalEmployees:=0;
                    TotalEmployeesLastMonth:=0;
                    Employee1.Reset;
                    Employee1.SetRange(Employee1."Pay Period Filter",Thismonth);

                    if Employee1.FindFirst then begin
                      repeat
                        Employee1.CalcFields(Employee1."Total Allowances1",Employee1."Total Deductions");
                    if Employee1."Total Allowances1">0 then
                    TotalEmployees:=TotalEmployees+1;
                    until Employee1.Next=0;
                    end;

                    Employee1.Reset;
                    Employee1.SetRange(Employee1."Pay Period Filter",Lastmonth);

                    if Employee1.FindFirst then begin
                      repeat
                        Employee1.CalcFields(Employee1."Total Allowances1",Employee1."Total Deductions");
                    if Employee1."Total Allowances1">0 then
                    TotalEmployeesLastMonth:=TotalEmployeesLastMonth+1;
                        until Employee1.Next=0;
                    end;

                    NetPayThisMonth:=0;
                    NetPayLastMonth:=0;
                    Difference:=0;

                    CompanyInfo.Get;
                    CompanyInfo.CalcFields(Picture);


                    Employee1.Reset;
                    Employee1.SetRange(Employee1."Pay Period Filter",Thismonth);

                    if Employee1.FindFirst then begin
                      repeat
                        Employee1.CalcFields(Employee1."Total Allowances1",Employee1."Total Deductions");
                    NetPayThisMonth:=NetPayThisMonth+Employee1."Total Allowances1"+Employee1."Total Deductions";
                    until Employee1.Next=0;
                    end;

                    Employee1.Reset;
                    Employee1.SetRange(Employee1."Pay Period Filter",Lastmonth);

                    if Employee1.FindFirst then begin
                      repeat
                        Employee1.CalcFields(Employee1."Total Allowances1",Employee1."Total Deductions");
                    NetPayLastMonth:=NetPayLastMonth+Employee1."Total Allowances1"+Employee1."Total Deductions";
                        until Employee1.Next=0;
                    end;

                    Difference:=NetPayThisMonth-NetPayLastMonth;
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

    trigger OnPreReport()
    begin

         Thismonth:=EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
         Lastmonth:=CalcDate('-1M',Thismonth);
         CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        EmpName: Text[230];
        Emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        Thismonth: Date;
        Lastmonth: Date;
        LastMonthVal: Decimal;
        Difference: Decimal;
        PostingGrp: Code[100];
        ThisMonthVal: Decimal;
        Thismonth1: Date;
        Lastmonth1: Date;
        LastMonthVal1: Decimal;
        Difference1: Decimal;
        ThisMonthVal1: Decimal;
        EmpName1: Text;
        NetPayThisMonth: Decimal;
        NetPayLastMonth: Decimal;
        CompanyInfo: Record "Company Information";
        SerialNo: Integer;
        SerialNo2: Integer;
        SerialNo3: Integer;
        Earn: Record EarningsX;
        TotalEarnThisMonth: Decimal;
        TotalDedThisMonth: Decimal;
        TotalEarnLastMonth: Decimal;
        TotalDedLastMonth: Decimal;
        Ded: Record DeductionsX;
        EarningFilter: Text[200];
        TotalEmployees: Integer;
        TotalEmployeesLastMonth: Integer;
        Employee1: Record Employee;
}

