report 50007 "ITax Generator"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Monthly PAYE Export.rdlc';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Pay Period Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(Employee_Name; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
            {
            }
            column(PIN_Employee; Employee."P.I.N")
            {
            }
            column(TaxableIncome_Employee; Employee."Taxable Income")
            {
            }
            column(CummPAYE_Employee; Abs(Employee."Cumm. PAYE"))
            {
            }
            column(DateSpecified; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin

                CfMpr := 0;


                /*

                 IF EmpBank.GET("Employee's Bank","Bank Branch") THEN              Tax Deductible Amount
                    BankName:=EmpBank.Name;

                */

                Employee.CalcFields(Employee."Taxable Allowance", Employee."Tax Deductible Amount", Employee."Cumm. PAYE", Employee."Paye Arrears");
                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions", Employee."Taxable Income");
                Employee.CalcFields(Employee."Benefits-Non Cash", Employee."Total Savings", Employee."Retirement Contribution", Employee."Basic Salary", Employee."House Allowance1",
                Employee."Transport Allowance");

                Employee.CalcFields(Employee."Leave Allowance", Employee."Overtime Allowance", Employee."Directors Fees", Employee."Lump Sum", Employee."Other Allowance",
               Employee."Non Cash Benefit", Employee.MPR, Employee."Insurance Relief");


                if Employee."Cumm. PAYE" = 0 then begin

                    CurrReport.Skip
                end;
                TotalPaye := TotalPaye + Employee."Cumm. PAYE";
                TotalTaxable := TotalTaxable + Employee."Taxable Income";
                RecordNo := RecordNo + 1;
                Counter := Counter + 1;
                if PrintToExcel then
                    MakeExcelDataBody;

                if Counter > 1 then
                    Clear(CompInfo.Picture);

            end;

            trigger OnPostDataItem()
            begin

                if PrintToExcel then begin
                    MakeExcelFooter;
                    CreateExcelbook;
                end;
            end;

            trigger OnPreDataItem()
            begin



                CompInfo.Get;
                CoName := CompInfo.Name;
                CompInfo.CalcFields(Picture);
                if BeginDate = DateSpecified then
                    //Employee.SETRANGE(Status,Employee.Status::Active);
                    NoOfRecords := Count;
                DeptFilter := '';
                ProjFilter := '';
                SecLocFilter := '';
                NoFilter := '';
                if Employee.GetFilter("Global Dimension 1 Code") <> '' then
                    DeptFilter := 'Dept ' + Employee.GetFilter("Global Dimension 1 Code");
                if Employee.GetFilter("No.") <> '' then
                    NoFilter := 'No ' + Employee.GetFilter("No.");
                if Employee.GetFilter("Global Dimension 2 Code") <> '' then
                    ProjFilter := 'Proj ' + Employee.GetFilter("Global Dimension 2 Code");
                if Employee.GetFilter(Branch) <> '' then
                    SecLocFilter := 'Sec/Loc ' + Employee.GetFilter(Branch);

                SortBy := NoFilter + DeptFilter + ProjFilter + SecLocFilter;
                /*CUser:=USERID;
                GetGroup.GetUserGroup(CUser,GroupCode);
                SETRANGE(Employee."Posting Group",GroupCode);*/
                //

                MakeExcelHeader;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PrintToExcel; PrintToExcel)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print To Excel?';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        MonthlyPaye = 'MONTHLY PAYE REPORT';
        Period = 'PERIOD';
        PageCaption = 'Page';

    }

    trigger OnPreReport()
    begin
        DateSpecified := Employee.GetRangeMin("Pay Period Filter");
    end;

    var
        Addr: array[10, 30] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        ASSIGN: RECORD 69009;
        i: Integer;
        Transactions: Record "Assignment Matrix-X";
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        EMPL: DECIMAL;
        DateSpecified: Date;
        EndDate: Date;
        EmpBank: Record "Employee Bank AccountX";
        BankName: Text[30];
        BasicSalary: Decimal;
        TaxableAmt: Decimal;
        RightBracket: Boolean;
        NetPay: Decimal;
        PayPeriodRec: Record "Employee Bank AccountX";
        PayDeduct: Record "Assignment Matrix-X";
        EmpRec: Record Employee;
        EmpNo: Code[10];
        TaxableAmount: Decimal;
        PAYE: Decimal;
        ArrEarnings: array[10, 50] of Text[250];
        ArrDeductions: array[10, 50] of Text[250];
        Index: Integer;
        Index1: Integer;
        j: Integer;
        ArrEarningsAmt: array[10, 50] of Text[250];
        ArrDeductionsAmt: array[10, 50] of Text[250];
        Year: Integer;
        EmpArray: array[10, 15] of Decimal;
        HoldDate: Date;
        DenomArray: array[3, 11] of Text[50];
        NoOfUnitsArray: array[3, 11] of Integer;
        AmountArray: array[3, 11] of Decimal;
        PayModeArray: array[3] of Text[30];
        HoursArray: array[10, 50] of Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        CompInfo: Record "Company Information";
        CoName: Text[80];
        TotalTaxable: Decimal;
        TotalPaye: Decimal;
        TaxCode: Code[10];
        SortBy: Text[30];
        NoFilter: Text[40];
        DeptFilter: Text[30];
        ProjFilter: Text[30];
        SecLocFilter: Text[30];
        GrossPay: Decimal;
        RetireCont: Decimal;

        pension: decimal;
        nssf: decimal;
        retirecontribution: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        TotalQuarters: Decimal;
        GroupCode: Code[20];
        CUser: Code[20];
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Counter: Integer;
        Text002: label 'PAYE';
        Text001: label 'GMKH';


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := ROUND(AmountRemaining, 0.01);
        EndTax := false;

        TaxTable.SetRange("Table Code", TaxCode);

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if ROUND((TaxableAmount), 0.01) > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100
                    else begin
                        Tax := AmountRemaining * TaxTable.Percentage / 100;
                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        if not Employee."Pays tax?" then
            IncomeTax := 0;
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            PayPeriodtext := PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook('iTAX',Text002);
        //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */
        //cc
        // ExcelBuf.CreateBook('C:\DATA.xlsx', 'Location Inv Value');
        // ExcelBuf.WriteSheet('Location Inv Value', COMPANYNAME, UserId);
        // ExcelBuf.CloseBook();
        // ExcelBuf.OpenExcel();
        ExcelBuf.CreateNewBook('ITax Report');
        ExcelBuf.WriteSheet('ITax Report', COMPANYNAME, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename(StrSubstNo('ITaxReport_%1_%2', CurrentDateTime, UserId));
        ExcelBuf.OpenExcel();

        //commented 23082023
        // ExcelBuf.CreateBookAndOpenExcel('D:\iTAX.xlsx', Text002, Text001, COMPANYNAME, UserId);
        //   Error('');

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn(counter,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(Employee."No.",FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Employee."P.I.N", false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name", false, '', false, false, false, '@', 1);

        ExcelBuf.AddColumn('Resident', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('Primary Employee', false, '', false, false, false, '@', 1);

        ExcelBuf.AddColumn(Abs(Employee."Total Allowances"), false, '', false, false, false, '@', 1);//gross pay
        //ExcelBuf.AddColumn(Abs(Employee."House Allowance1"), false, '', false, false, false, '@', 1);//c
        ExcelBuf.AddColumn('0', false, '', false, false, false, '@', 1);//c
        ExcelBuf.AddColumn('0', false, '', false, false, false, '@', 1);//d
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//e
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//f
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//g
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//h
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//i
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//j
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//j1
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//j2
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//k
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//l
        ExcelBuf.AddColumn('Benefit not given', false, '', true, false, false, '@', 1);//m
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//n
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//o
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//p
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//q
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//r
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//s
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');
        //retirement contribution
        ExcelBuf.AddColumn(Employee."Retirement Contribution" - 1080, false, '', true, false, false, '@', 1);//s1
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//t
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//u
        ExcelBuf.AddColumn('0', false, '', true, false, false, '@', 1);//u1
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//v
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//w
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//x
        ExcelBuf.AddColumn(Employee.MPR, false, '', true, false, false, '@', 1);//x1
        ExcelBuf.AddColumn(Employee."Insurance Relief", false, '', true, false, false, '@', 1);//x2
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', 1);//y
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');

        ExcelBuf.AddColumn(Abs(Employee."Cumm. PAYE") + Abs(Employee."Paye Arrears"), false, '', false, false, false, '@', 1);//PAYE
        //ExcelBuf.AddColumn(EmpTotal,FALSE,'',FALSE,FALSE,FALSE,'@');


        //ExcelBuf.AddColumn(Id,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('CONTRIBUTIONS',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X".Amount),FALSE,'',FALSE,FALSE,FALSE,'@');
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin
        /*
        BlankFiller := PADSTR(' ',MAXSTRLEN(BlankFiller),' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTHLY P.A.Y.E ',FALSE,'',TRUE,FALSE,FALSE,'@');
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER PIN:'+Company."VAT Registration No.",FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NAME:'+UPPERCASE(COMPANYNAME),FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTH:'+
        UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')),FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        
        */

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('P.I.N NO', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('NAMES', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('a', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('b', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('GROSS PAY', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('c', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('d', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('e', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('f', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('TRANSPORT ALLOWANCE',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('g', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('TRANSPORT ALLOWANCE',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('h', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('i', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('j', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('j1', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('j2', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('k', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('l', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('m', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('n', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('o', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('p', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('q', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('r', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('s', false, '', true, false, false, '@', 1);
        //ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('s1', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('t', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('u', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('u1', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('v', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('w', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('x', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('x1', false, '', true, false, false, '@', 1);

        ExcelBuf.AddColumn('x2', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('y', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('PAYE', false, '', true, false, false, '@', 1);


        //ExcelBuf.AddColumn('PAYE AMOUNT',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('I.D NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('REMARKS',FALSE,'',TRUE,FALSE,FALSE,'@');

    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        /*
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('Employees :'+FORMAT(Counter),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(EmployeeTotal+EmployerTotal,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalTaxable,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(ABS(TotalPaye),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(TotalVoluntary,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(EmployeeTotal+EmployerTotal+TotalVoluntary,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(SumTotal,FALSE,'',FALSE,FALSE,FALSE,'');
        */

    end;
}



// {
//     Caption = 'ITax Generator';
//     dataset
//     {
//         dataitem(AssignmentMatrixX; "Assignment Matrix-X")
//         {
//             RequestFilterFields = "Payroll Period";
//             column(c; c) { }
//             column(d; d) { }
//             column(e; e) { }
//             column(f; f) { }
//             column(g; g) { }
//             column(h; h) { }
//             column(i; i) { }
//             column(j; j) { }
//             column(j1; j1) { }
//             column(j2; j2) { }
//             column(k; k) { }
//             column(l; l) { }
//             column(m; m) { }
//             column(n; n) { }
//             column(o; o) { }
//             column(p; p) { }
//             column(q; q) { }
//             column(r; r) { }
//             column(s; s) { }
//             column(s1; s1) { }
//             column(t; t) { }
//             column(u; u) { }
//             column(u1; u1) { }
//             column(v; v) { }
//             column(w; w) { }
//             column(x; x) { }
//             column(x1; x1) { }
//             column(x2; x2) { }
//             column(y; y) { }
//             column(PAYE; PAYE) { }
//             dataitem(Employee; Employee)
//             {
//                 DataItemLinkReference = AssignmentMatrixX;
//                 DataItemLink = "No." = field("Employee No");

//                 column(PINNumber_Employee; "PIN Number")
//                 {
//                 }
//                 column(EmployeeName; EmployeeName)
//                 {

//                 }
//                 column(GrossPay; "Total Allowances")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     EmployeeName := '';
//                     EmployeeName := Employee.FullName();
//                 end;
//             }
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }
//     }
//     var
//         EmployeeName: Text[100];
//         a: Label 'Resident';
//         b: Label 'Primary Employee';
//         c: Decimal;
//         d: Decimal;
//         e: Decimal;
//         f: Decimal;
//         g: Decimal;
//         h: Decimal;
//         i: Decimal;
//         j: Decimal;
//         j1: Decimal;
//         j2: Decimal;
//         k: Decimal;
//         l: Decimal;
//         m: Decimal;
//         n: Decimal;
//         o: Decimal;
//         p: Decimal;
//         q: Decimal;
//         r: Decimal;
//         s: Decimal;
//         s1: Decimal;
//         t: Decimal;
//         u: Decimal;
//         u1: Decimal;
//         v: Decimal;
//         w: Decimal;
//         x: Decimal;
//         x1: Decimal;
//         x2: Decimal;
//         y: Decimal;
//         PAYE: Decimal;

// }
