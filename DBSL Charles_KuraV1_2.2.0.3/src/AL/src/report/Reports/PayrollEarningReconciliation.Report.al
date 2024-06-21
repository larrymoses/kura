#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 50010 "Payroll Reconciliation(Gross)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Reconciliation Earnin.rdlc';

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Pay Period Filter", "Posting Group Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(EarningsX_Code; Code)
            {
            }
            column(EarningsX_Description; Description)
            {
            }
            trigger OnAfterGetRecord()
            begin
                DepTotals := 0;
                // DepName := "Dimension Value".Code + ' GROSS PAY';
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);

                /*
                AssMatrix.RESET
                AssMatrix.SETRANGE(AssMatrix."Payroll Period",PayPeriod);
                AssMatrix.SETRANGE(AssMatrix."Department Code","Dimension Value".Code);
                AssMatrix.
                
                */


                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                EarnRec.SetRange(EarnRec."Pay Period Filter", PayPeriod);
                //EarnRec.SETRANGE(EarnRec."Department Filter","Dimension Value".Code);

                if EarnRec.Find('-') then begin
                    repeat
                        EarnRec.CalcFields(EarnRec."Total Amount");
                        DepTotals := DepTotals + EarnRec."Total Amount";
                        TotalGross := TotalGross + EarnRec."Total Amount";
                    until EarnRec.Next = 0;
                end;

                if DepTotals = 0 then
                    CurrReport.Skip;

            end;
        }


        dataitem(Employee; Employee)
        {
            column(ReportForNavId_1000000001; 1000000001)
            {
            }
            column(EmployeeNo; Employee."No.")
            {
            }
            column(ThisMonthVal; ThisMonthVal)
            {
            }
            column(EmpName; EmpName)
            {
            }
            column(LastMonthVal; LastMonthVal)
            {
            }
            column(Difference; Difference)
            {
            }
            column(GrossPay; GrossPay)
            { }
            column(GrossPayLast; GrossPayLast)
            { }
            column(diffgross; diffgross) { }
            column(ThisMonth; Thismonth)
            {
            }
            column(LastMonth; Lastmonth)
            {
            }
            column(SerialNo1; SerialNo)
            {
            }

            trigger OnAfterGetRecord()
            begin
                SerialNo := 0;

                EmpName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                // END;
                ThisMonthVal := 0;
                GrossPay := 0;
                GrossPayLast := 0;
                DiffGross := 0;
                LastMonthVal := 0;
                Difference := 0;

                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                if PostingGrp <> '' then
                    Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                if Assignmat.FindFirst then
                    ThisMonthVal := Assignmat.Amount;

                //Total Gross
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Employee Code", Employee."No.");
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                EarnRec.SetRange(EarnRec."Pay Period Filter", Thismonth);
                //EarnRec.SETRANGE(EarnRec."Payroll Grouping Filter",EarnRec."Payroll Grouping Filter"::Management);

                if EarnRec.Find('-') then begin
                    repeat
                        EarnRec.CalcFields(EarnRec."Total Amount");
                        GrossPay := GrossPay + EarnRec."Total Amount";
                    until EarnRec.Next = 0;
                end;

                EarnRec.SetRange(EarnRec."Employee Code", Employee."No.");
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                EarnRec.SetRange(EarnRec."Pay Period Filter", Lastmonth);
                //EarnRec.SETRANGE(EarnRec."Payroll Grouping Filter",EarnRec."Payroll Grouping Filter"::Management);

                if EarnRec.Find('-') then begin
                    repeat
                        EarnRec.CalcFields(EarnRec."Total Amount");
                        GrossPayLast := GrossPay + EarnRec."Total Amount";
                    until EarnRec.Next = 0;
                end;

                diffgross := grosspay - grosspaylast;


                /*

                   ELSE
                   BEGIN
                   Assignmat.RESET;
                   Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                   Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                   Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                   Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                   IF Assignmat.FIND('+') THEN
                   LastMonthVal:=Assignmat.Amount;

                   END;

                */
                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                if PostingGrp <> '' then
                    Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                if Assignmat.FindFirst then
                    LastMonthVal := Assignmat.Amount;

                Difference := ThisMonthVal - LastMonthVal;
                /*IF  Difference=0 THEN
                CurrReport.SKIP;*/
                if (ThisMonthVal = 0) and (LastMonthVal = 0) and (Difference = 0) then begin
                    Difference := 0;
                    CurrReport.Skip;
                end;
                SerialNo := SerialNo + 1;

            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);
                CompanyN := CompanyInfo.Name;
            end;
        }

        dataitem(DeductionsX; DeductionsX)
        {
            PrintOnlyIfDetail = true;
            column(ReportForNavId_1000000002; 1000000002)
            {
            }
            column(DeductionsX_Code; Code)
            {
            }
            column(DeductionsX_Description; Description)
            {
            }
            dataitem(Employee1; Employee)
            {
                column(ReportForNavId_1000000003; 1000000003)
                {
                }
                column(EmployeeNo1; Employee1."No.")
                {
                }
                column(ThisMonthVal1; ThisMonthVal)
                {
                }
                column(EmpName1; EmpName)
                {
                }
                column(LastMonthVal1; LastMonthVal)
                {
                }
                column(Difference1; Difference)
                {
                }
                column(ThisMonth1; Thismonth)
                {
                }
                column(LastMonth1; Lastmonth)
                {
                }
                column(SerialNo2; SerialNo2)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    EmpName := Employee1."First Name" + ' ' + Employee1."Middle Name" + ' ' + Employee1."Last Name";

                    // END;
                    ThisMonthVal := 0;
                    LastMonthVal := 0;
                    Difference := 0;

                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee1."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, DeductionsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                    if PostingGrp <> '' then
                        Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.Find('-') then
                        ThisMonthVal := Assignmat.Amount;
                    /*
                    
                       ELSE
                       BEGIN
                       Assignmat.RESET;
                       Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                       Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                       Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                       Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                       IF Assignmat.FIND('+') THEN
                       LastMonthVal:=Assignmat.Amount;
                    
                       END;
                    
                    */
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee1."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, DeductionsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                    if PostingGrp <> '' then
                        Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.Find('-') then
                        LastMonthVal := Assignmat.Amount;

                    Difference := ThisMonthVal - LastMonthVal;

                    /*IF  Difference=0 THEN
                    CurrReport.SKIP;*/
                    if (ThisMonthVal = 0) and (LastMonthVal = 0) and (Difference = 0) then begin
                        Difference := 0;
                        CurrReport.Skip;
                    end;
                    SerialNo2 := SerialNo2 + 1;

                end;
            }

            trigger OnAfterGetRecord()
            begin
                SerialNo2 := 0;
            end;

            trigger OnPostDataItem()
            begin
                //SerialNo:=0;
            end;

            trigger OnPreDataItem()
            begin
                //SerialNo:=0;
            end;
        }
        dataitem(Employee2; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter", "No.", "Posting Group";
            column(ReportForNavId_7528; 7528)
            {
            }
            column(EmployeeNo2; Employee2."No.")
            {
            }
            column(NetPayThisMonth; NetPayThisMonth)
            {
            }
            column(EmpName2; EmpName)
            {
            }
            column(NetPayLastMonth; NetPayLastMonth)
            {
            }
            column(Difference2; Difference)
            {
            }
            column(ThisMonth2; Thismonth)
            {
            }
            column(LastMonth2; Lastmonth)
            {
            }
            column(SerialNo3; SerialNo3)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                MaxIteration = 1;
                column(ReportForNavId_3; 3)
                {
                }
                column(CompanyInfoName; CompanyInfo.Name)
                {
                }
                column(CompanyInfoPicture; CompanyInfo.Picture)
                {
                }
                column(COMPANYN; CompanyN)
                {
                }

                trigger OnPreDataItem()
                begin
                    // Integer.SETRANGE(Number,1,i);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                EmpName := Employee2."First Name" + ' ' + Employee2."Middle Name" + ' ' + Employee2."Last Name";

                NetPayThisMonth := 0;
                NetPayLastMonth := 0;
                Difference := 0;

                Employee2.SetRange(Employee2."Pay Period Filter", Thismonth);
                Employee2.CalcFields(Employee2."Total Allowances1", Employee2."Total Deductions", Employee2."Total Statutory");

                NetPayThisMonth := Employee2."Total Allowances1";//+ Employee2."Total Deductions";


                Employee2.SetRange(Employee2."Pay Period Filter", Lastmonth);
                Employee2.CalcFields(Employee2."Total Allowances1", Employee2."Total Deductions", Employee2."Total Statutory");

                NetPayLastMonth := Employee2."Total Allowances1";//+ Employee2."Total Deductions";

                Difference := NetPayThisMonth - NetPayLastMonth;

                IF Difference = 0 THEN
                    CurrReport.SKIP;

                if (ThisMonthVal = 0) and (LastMonthVal = 0) and (Difference = 0) then begin
                    Difference := 0;
                    CurrReport.Skip;
                end;
                SerialNo3 := SerialNo3 + 1;

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

    trigger OnPostReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin

        Thismonth := EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
        Lastmonth := CalcDate('-1M', Thismonth);
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
        CompanyN: Code[250];
        DepName: Text[100];
        PayPeriod: Date;
        AssMatrix: Record 69009;
        EarnRec: Record 69005;
        DepTotals: Decimal;
        TotalGross: Decimal;
        diffgross: decimal;
        DeductionTotals: Decimal;
        NetPay: Decimal;
        Totalded: Decimal;
        Ded: Record 69006;
        GrossPay: Decimal;
        GrossPayLast: Decimal;
        PayPeriodX: Record 69000;
        Year: Integer;
        PayPeriodtext1: Text[100];
        HoldDate: Date;
        reportmonth: Integer;
        reportmonth2: Text[100];
        reportdate: Date;
        reportdate2: Integer;
        monthh: Text[100];
        filterr: Text[100];
        // CompanyInfo: Record "Company Information";
        EarningTotals: Decimal;
}

