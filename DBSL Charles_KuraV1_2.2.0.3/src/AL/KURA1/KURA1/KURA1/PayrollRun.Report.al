#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69004 "Payroll Run"
{
    ProcessingOnly = true;
    UsageCategory = Tasks;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") where(Status = const(Active));
            RequestFilterFields = "No.", "Posting Group", "Pay Period Filter";
            column(ReportForNavId_7528; 7528)
            {
            }

            trigger OnAfterGetRecord()
            begin

                NETPAY3 := 0;
                CompRec.Get;
                CompRec.TestField(CompRec."Tax Relief Code");
                Employee.CalcFields(Employee.Branch, Employee.Paypoint, Employee."Staffing Group", Employee.Department, Insurance, IsInsuarence);

                Deductions.Reset;
                Deductions.SetRange(Deductions.Code, CompRec."NSSF Tier II Code");

                if Deductions.Find('-') then begin

                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

                    if Assignmatrix.Find('-') then begin
                        //MESSAGE('%1',Assignmatrix.Code);
                        repeat

                            //IF Employee."Skip NHIF Update"=FALSE THEN BEGIN
                            Assignmatrix.Validate(Assignmatrix.Code);
                            Assignmatrix.Modify;

                        //END;
                        until Assignmatrix.Next = 0;

                    end else begin

                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Type := Assignmatrix.Type::Deduction;
                        Assignmatrix.Code := Deductions.Code;
                        Assignmatrix.Validate(Code);
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";

                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;
                        Assignmatrix.Validate(Amount);
                        if Assignmatrix.Amount <> 0 then
                            Assignmatrix.Insert;


                    end;

                end;
                /*
                IF Assignmatrix2.GET(Employee."No.",Assignmatrix2.Type::Payment
                ,CompRec."Tax Relief Code",Month)=TRUE THEN BEGIN
                Assignmatrix2.VALIDATE(Assignmatrix2.Code);
                Assignmatrix2.MODIFY
                END ELSE BEGIN
                
                //to be uncommented after january payroll
                Assignmatrix.INIT;
                Assignmatrix.SETRANGE(Assignmatrix.Status,Employee.Status::Active);
                Assignmatrix."Employee No":=Employee."No.";
                Assignmatrix.VALIDATE("Employee No");
                Assignmatrix."Payroll Period":=Month;
                Assignmatrix.VALIDATE("Payroll Period");
                Assignmatrix.Type:=Assignmatrix.Type::Payment;
                Assignmatrix.Code:=CompRec."Tax Relief Code";
                Assignmatrix.VALIDATE(Code);
                //Assignmatrix.Amount:=-NETPAY3;
                Assignmatrix.VALIDATE(Amount);
                  Assignmatrix."Posting Group Filter":=Employee."Posting Group";
                  Assignmatrix."Profit Centre":=Employee."Global Dimension 2 Code";
                  Assignmatrix.Branch:=Employee.Branch;
                  Assignmatrix."Pay Point":=Employee.Paypoint;
                  Assignmatrix."Staffing Group":=Employee."Staffing Group";
                  Assignmatrix."Department Code":=Employee."Department Name";
                  Assignmatrix."Salary Pointer":=Employee."Salary Scale";
                  Assignmatrix.INSERT;
                
                END;
                
                */

                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                if Deductions.Find('-') then begin
                    // Delete all Previous PAYE
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                    Assignmatrix.DeleteAll;
                    // end of deletion
                end;

                // validate assigment matrix code incase basic salary change and update calculation based on basic salary
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.FindSet() then begin
                    repeat
                        if Assignmatrix.Type = Assignmatrix.Type::Payment then begin
                            if Earnings.Get(Assignmatrix.Code) then begin
                                if (Earnings."Calculation Method" = Earnings."calculation method"::"% of Basic pay") //OR
                                                                                                                     //       (Earnings."Calculation Method"=Earnings."Calculation Method"::"% of Basic after tax") OR
                                                                                                                     //        (Earnings."Calculation Method"=Earnings."Calculation Method"::"Based on Hourly Rate")
                                    then begin

                                    Assignmatrix.Validate(Code);
                                    Assignmatrix.Validate(Assignmatrix."Employee Voluntary");
                                    //Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);
                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;
                        if Assignmatrix.Retirement = false then begin
                            if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
                                if Deductions.Get(Assignmatrix.Code) then begin
                                    if (Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay") or
                                       (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Hourly Rate") or
                                       (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Daily Rate ") then begin

                                        Assignmatrix.Validate(Code);
                                        Assignmatrix.Validate(Assignmatrix."Employee Voluntary");
                                        // Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);

                                        Assignmatrix.Modify;
                                    end;
                                end;
                            end;
                        end;
                        if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
                            if Deductions.Get(Assignmatrix.Code) then begin
                                if (Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table") then begin

                                    Assignmatrix.Validate(Code);
                                    Assignmatrix.Amount := ROUND(Assignmatrix.Amount, 1);

                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;
                    until Assignmatrix.Next = 0;
                end;


                //Assign Insurance Relief Daudi//CC
                if Employee.Insurance <> 0 then begin
                    //MESSAGE('This in Total Insurance %1',FORMAT(Employee.Insurance));
                    Earnings.Reset;
                    Earnings.SetCurrentkey("Earning Type");
                    Earnings.SetRange("Earning Type", Earnings."earning type"::"Insurance Relief");
                    if Earnings.Find('-') then begin
                        InsuranceAmount := 0;
                        InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                        //MESSAGE('Insurance amount is %1 for employee %2',InsuranceAmount,Employee."No.");
                        if InsuranceAmount > 5000 then
                            InsuranceAmount := Earnings."Maximum Limit";
                        // MESSAGE('Maximum limit is %1',Earnings."Maximum Limit");
                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Type := Assignmatrix.Type::Payment;
                        Assignmatrix.Code := Earnings.Code;
                        Assignmatrix.Validate(Code);
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                        Assignmatrix.Amount := InsuranceAmount;
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;
                        Assignmatrix.Validate(Amount);
                        if (Assignmatrix.Amount <> 0) and
                           (not Assignmatrix.Get(Assignmatrix."Employee No", Assignmatrix.Type,
                                Assignmatrix.Code, Assignmatrix."Payroll Period", Assignmatrix."Reference No")) then
                            Assignmatrix.Insert
                        else begin
                            InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                            if InsuranceAmount > 5000 then
                                InsuranceAmount := Earnings."Maximum Limit";
                            Assignmatrix.Init;
                            Assignmatrix."Employee No" := Employee."No.";
                            Assignmatrix.Type := Assignmatrix.Type::Payment;
                            Assignmatrix.Code := Earnings.Code;
                            Assignmatrix.Validate(Code);
                            Assignmatrix."Payroll Period" := Month;
                            Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                            Assignmatrix.Amount := InsuranceAmount;
                            Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                            Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                            Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                            Assignmatrix.Branch := Employee.Branch;
                            Assignmatrix."Pay Point" := Employee.Paypoint;
                            Assignmatrix."Staffing Group" := Employee."Staffing Group";
                            Assignmatrix."Department Code" := Employee.Department;
                            Assignmatrix.Validate(Amount);
                            Assignmatrix.Modify;
                        end;
                    end;
                end;



                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                if Deductions.Find('-') then begin
                    GetPaye.CalculateTaxableAmount(Employee."No.", Month, IncomeTax, TaxableAmount, RetireCont);
                    // Create PAYE
                    Assignmatrix.Init;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Type := Assignmatrix.Type::Deduction;
                    Assignmatrix.Code := Deductions.Code;
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                    if IncomeTax > 0 then
                        IncomeTax := -IncomeTax;
                    Assignmatrix.Amount := IncomeTax;
                    //cc
                    //   MESSAGE('Incometax=%1', IncomeTax);
                    Assignmatrix.Paye := true;
                    ///   MESSAGE('TaxableAmount=%1', TaxableAmount);
                    Assignmatrix."Taxable amount" := TaxableAmount;
                    Assignmatrix."Less Pension Contribution" := RetireCont;
                    Assignmatrix.Paye := true;
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee.Department;
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Validate(Amount);
                    if Assignmatrix.Amount <> 0 then
                        Assignmatrix.Insert;
                end else
                    Error('Must specify Paye Code under deductions');

                //Update Pay Mode
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then
                    repeat
                        if Employee."Payroll Pay Mode" <> Assignmatrix."Pay Mode" then begin
                            Assignmatrix."Pay Mode" := Employee."Payroll Pay Mode";
                            Assignmatrix.Modify;
                        end;
                    until Assignmatrix.Next = 0;
                //

                if ((Employee."Terminal Dues" = true) and (Employee."Pays tax?" = true)) then begin
                    Employee.SetRange(Employee."Pay Period Filter", Month);
                    Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions", IsInsuarence);

                    //NHIF deduction

                    Deductions.Reset;
                    Deductions.SetRange(Deductions.Code, CompRec."NHIF Code");
                    if Deductions.Find('-') then begin
                        Assignmatrix.Reset;
                        Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                        Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                        Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                        Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                        if Assignmatrix.Find('-') then begin
                            repeat
                                Assignmatrix.Validate(Assignmatrix.Code);
                                Assignmatrix.Modify;
                            until Assignmatrix.Next = 0;

                        end;
                        // end of deletion
                    end;

                    NETPAY3 := Employee."Total Allowances" + Employee."Total Deductions";


                    if NETPAY3 <> 0 then begin


                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Validate("Employee No");
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix.Validate("Payroll Period");
                        Assignmatrix.Type := Assignmatrix.Type::Deduction;
                        Assignmatrix.Code := CompRec."Net Pay Advance Code";
                        Assignmatrix.Validate(Code);
                        Assignmatrix.Amount := -NETPAY3;
                        Assignmatrix.Validate(Amount);
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;


                        if Assignmatrix2.Get(Assignmatrix."Employee No", Assignmatrix.Type::Deduction
                        , Assignmatrix.Code, Assignmatrix."Payroll Period") = true then
                            Assignmatrix.Modify
                        else
                            Assignmatrix.Insert;
                    end;

                    //MESSAGE('%1',NETPAY3);
                    //CurrReport.SKIP;
                end;

                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix.Code, '869');
                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                Assignmatrix.DeleteAll;

                LoanBalance := 0;
                LoanApplication.Reset;
                LoanApplication.SetRange(LoanApplication."Employee No", Employee."No.");
                if LoanApplication.Find('-') then
                    repeat
                        if LoanType.Get(LoanApplication."Loan Product Type") then begin
                            LoanApplication.SetRange(LoanApplication."Date filter", 0D, LastMonth);
                            LoanApplication.CalcFields(LoanApplication."Total Repayment");
                            LoanBalance := LoanApplication."Approved Amount" + LoanApplication."Total Repayment";
                            //MESSAGE('%1 Balance =%2',LoanApplication."Loan No",LoanBalance);


                            if LoanBalance < LoanApplication.Repayment then begin
                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
                                Assignmatrix.SetRange("Reference No", LoanApplication."Loan No");
                                if Assignmatrix.Find('+') then begin
                                    if LoanBalance > 0 then
                                        Assignmatrix.Amount := -LoanBalance
                                    else begin
                                        Assignmatrix.Amount := 0;

                                    end;
                                    Assignmatrix."Next Period Entry" := false;

                                    Assignmatrix.Modify;
                                end;


                            end;


                            if LoanType."Calculate Interest" then begin

                                LoanApplication.SetRange(LoanApplication."Date filter", 0D, LastMonth);
                                LoanApplication.CalcFields(LoanApplication."Total Repayment");
                                LoanBalance := LoanApplication."Approved Amount" + LoanApplication."Total Repayment";
                                InterestAmt := (LoanType."Interest Rate" / 100) * LoanBalance;



                            end;

                            if LoanApplication."Stop Loan" then begin
                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
                                Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                Assignmatrix.DeleteAll;

                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
                                Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                Assignmatrix.DeleteAll;
                            end;
                        end;
                    until LoanApplication.Next = 0;



                //CC

                // //calculate Gratuity for contract employees

                if (Employee."Employement Terms" = Employee."employement terms"::Contract) and (Employee."Employee Category" <> Employee."Employee Category"::Intern) then begin

                    Earnings.Reset;
                    Earnings.SetRange(EARNINGS."Earning Type", EARNINGS."Earning Type"::Gratuity);
                    if EARNINGS.FindSet() then begin
                        Assignmatrix.Reset;
                        Assignmatrix.SetRange(Assignmatrix.Code, EARNINGS.Code);
                        Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                        Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                        Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                        if Assignmatrix.Find('-') then begin
                            // MESSAGE('%1', Assignmatrix.Code);
                            repeat
                                Assignmatrix.Validate(Assignmatrix.Code);
                                Assignmatrix.Modify;
                            until Assignmatrix.Next = 0;

                        end else begin

                            Assignmatrix.Init;
                            Assignmatrix."Employee No" := Employee."No.";
                            Assignmatrix.Type := Assignmatrix.Type::Payment;
                            Assignmatrix.Code := EARNINGS.Code;
                            Assignmatrix.Validate(Code);
                            Assignmatrix."Payroll Period" := Month;
                            Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                            Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                            Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                            Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                            Assignmatrix.Branch := Employee.Branch;
                            Assignmatrix."Pay Point" := Employee.Paypoint;
                            Assignmatrix."Staffing Group" := Employee."Staffing Group";
                            Assignmatrix."Department Code" := Employee.Department;
                            Assignmatrix.Validate(Amount);
                            if Assignmatrix.Amount <> 0 then
                                Assignmatrix.Insert;
                        end;

                    end;
                end;
                Gratuity();



                Window.Update(1, Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");

            end;

            trigger OnPostDataItem()
            begin
                Window.Close;
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Payroll For ##############################1', EmployeeName);
                PayrollPeriod.SetRange(Closed, false);
                if PayrollPeriod.Find('-') then
                    Month := PayrollPeriod."Starting Date";
                LastMonth := CalcDate('-1M', Month);
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

    trigger OnPreReport()
    begin
        GetPayPeriod;

        DateSpecified := BeginDate;
        if PayPeriod.Get(DateSpecified) then
            PayPeriodtext := PayPeriod.Name;
        EndDate := CalcDate('1M', DateSpecified - 1);
        CompRec.Get;
        TaxCode := CompRec."Tax Table";

    end;

    var
        NextInt: Integer;
        ScaleBenefits: Record "Scale Benefits";
        SalaryPointers: Record "Salary Pointers";
        SalaryPointers1: Record "Salary Pointers";
        AssmatrixT: Record "Assignment Matrix-X Temp-E";
        Assignmatrix: Record "Assignment Matrix-X";
        BeginDate: Date;
        DateSpecified: Date;
        BasicSalary: Decimal;
        TaxableAmount: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        IncomeTax: Decimal;
        relief: Decimal;
        EmpRec: Record Employee;
        NetPay: Decimal;
        NetPay1: Decimal;
        Index: Integer;
        Intex: Integer;
        AmountRemaining: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodT: Record "Payroll PeriodXT";
        DenomArray: array[1, 12] of Text[50];
        NoOfUnitsArray: array[1, 12] of Integer;
        AmountArray: array[1, 60] of Decimal;
        PayMode: Text[30];
        PayPeriodtext: Text[30];
        EndDate: Date;
        DaysinAmonth: Decimal;
        HoursInamonth: Decimal;
        Earnings: Record EarningsX;
        CfMpr: Decimal;
        Deductions: Record DeductionsX;
        NormalOvertimeHours: Decimal;
        WeekendOvertime: Decimal;
        PayrollPeriod: Record "Payroll PeriodX";
        Window: Dialog;
        EmployeeName: Text[230];
        NoOfDays: Integer;
        Month: Date;
        GetPaye: Codeunit Payroll3;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        ScalePointer: Record "Salary Pointers2";
        SalaryScale: Record "Salary Scales2";
        CurrentMonth: Integer;
        CurrentMonthtext: Text[30];
        HseAllow: Record "House Allowance Matrix2";
        Ded: Record DeductionsX;
        Assmatrix: Record "Assignment Matrix-X";
        LoanType: Record "Loan Product Type";
        LoanApplication: Record "Loan Application";
        LoanBalance: Decimal;
        InterestAmt: Decimal;
        RefNo: Code[20];
        LastMonth: Date;
        NextPointer: Code[10];
        UserRole: Record "Access Control";
        NETPAY3: Decimal;
        Assignmatrix2: Record "Assignment Matrix-X";
        InsuranceAmount: Decimal;

        //CC
        gratuityamounts: Decimal;
        MatrixEntry: RECORD "Assignment Matrix-X";
        HRSETUP: Record "Human Resources Setup";

        AddbackAmount: Decimal;

    procedure VALIDATEALLCODES(var CurrPeriodStat: Date)
    var
        PaymentDed: Record "Assignment Matrix-X";
        AssignMatrix: Record "Assignment Matrix-X";
        empl: record employee;
    begin
        Window.Open('Validating Next period entries ##############################1', EmployeeName);


        empl.Reset();
        EMPL.SETRANGE(EMPL."Pay Period Filter", BEGINDATE);
        if empl.findset then begin
            repeat
                PaymentDed.Reset;
                PaymentDed.SetRange(PaymentDed."Payroll Period", BEGINDATE);
                PaymentDed.SetRange(PaymentDed."Employee No", empl."No.");
                PaymentDed.setrange(PaymentDed."Insurance Code", TRUE);
                if PaymentDed.FindSet() then begin
                    repeat
                        if Empl.Get(PaymentDed."Employee No") then begin
                            // AssignMatrix."Payroll Group":=EmpRec."Posting Group";


                            Window.Update(1, Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name");
                        end;

                        PaymentDed.validate(code);
                        paymentded.modify(True);

                    until PaymentDed.next = 0;
                END;
                //ALL
                PaymentDed.Reset;
                PaymentDed.SetRange(PaymentDed."Payroll Period", BEGINDATE);
                PaymentDed.SetRange(PaymentDed."Employee No", empl."No.");

                if PaymentDed.FindSet() then begin
                    repeat
                        if Empl.Get(PaymentDed."Employee No") then begin
                            // AssignMatrix."Payroll Group":=EmpRec."Posting Group";


                            Window.Update(1, Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name");
                        end;

                        PaymentDed.validate(code);
                        paymentded.modify(True);

                    until PaymentDed.next = 0;

                end;

            until empl.next = 0;
        end;
    end;

    procedure gratuity()
    var
        empl: record "Employee";
        BASIC: DECIMAL;
    begin
        //  GetPayPeriod();
        empl.Reset();
        Empl.SetRange(empl."No.", Employee."No.");
        EMPL.SETRANGE(EMPL."Pay Period Filter", BEGINDATE);
        empl.setrange(empl."Employement Terms", Empl."employement terms"::Contract);
        empl.SetFilter("Employee Category",'<>%1',empl."Employee Category"::Intern);
        if empl.findset then
            repeat
                //BASIC
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix.Code, 'E001');
                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                Assignmatrix.SetRange(Assignmatrix."Employee No", Empl."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", BeginDate);
                IF Assignmatrix.FINDSET THEN
                    BASIC := Assignmatrix.AMOUNT;
                Earnings.Reset;
                Earnings.SetRange(EARNINGS."Earning Type", EARNINGS."Earning Type"::Gratuity);
                if EARNINGS.FindSet() then begin

                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, EARNINGS.Code);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Empl."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", BeginDate);
                    if Assignmatrix.FindSET then begin
                        //  MESSAGE('%1..%2..%3', Assignmatrix.Code, Basic, empl."No.");
                        repeat
                            Assignmatrix.Validate(Assignmatrix.Code);
                            Assignmatrix.Modify;
                        until Assignmatrix.Next = 0;

                    end else begin

                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Empl."No.";
                        Assignmatrix.Type := Assignmatrix.Type::Payment;
                        Assignmatrix.Code := EARNINGS.Code;
                        Assignmatrix."Payroll Period" := BeginDate;
                        Assignmatrix."Department Code" := Empl."Global Dimension 1 Code";
                        Assignmatrix."Posting Group Filter" := Empl."Posting Group";
                        Assignmatrix."Profit Centre" := Empl."Global Dimension 2 Code";
                        Assignmatrix."Salary Pointer" := Empl."Salary Scale";
                        Assignmatrix.Branch := Empl.Branch;
                        Assignmatrix."Pay Point" := Empl.Paypoint;
                        Assignmatrix."Staffing Group" := Empl."Staffing Group";
                        Assignmatrix."Department Code" := Empl.Department;
                        Assignmatrix.Amount := 0.31 * basic;
                        Assignmatrix.validate(Amount);
                        //  Assignmatrix.Validate(Assignmatrix.Code);
                        Assignmatrix.Insert(true);
                    end;

                end;

            until empl.next = 0;
    end;

    procedure insurancerelief()
    begin
        //Assign Insurance Relief Daudi//CC
        if Employee.Insurance <> 0 then begin
            //MESSAGE('This in Total Insurance %1',FORMAT(Employee.Insurance));
            Earnings.Reset;
            Earnings.SetCurrentkey("Earning Type");
            Earnings.SetRange("Earning Type", Earnings."earning type"::"Insurance Relief");
            if Earnings.Find('-') then begin
                InsuranceAmount := 0;
                InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                //MESSAGE('Insurance amount is %1 for employee %2',InsuranceAmount,Employee."No.");
                if InsuranceAmount > 5000 then
                    InsuranceAmount := Earnings."Maximum Limit";
                // MESSAGE('Maximum limit is %1',Earnings."Maximum Limit");
                Assignmatrix.Init;
                Assignmatrix."Employee No" := Employee."No.";
                Assignmatrix.Type := Assignmatrix.Type::Payment;
                Assignmatrix.Code := Earnings.Code;
                Assignmatrix.Validate(Code);
                Assignmatrix."Payroll Period" := Month;
                Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                Assignmatrix.Amount := InsuranceAmount;
                Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                Assignmatrix.Branch := Employee.Branch;
                Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                Assignmatrix."Pay Point" := Employee.Paypoint;
                Assignmatrix."Staffing Group" := Employee."Staffing Group";
                Assignmatrix."Department Code" := Employee.Department;
                Assignmatrix.Validate(Amount);
                if (Assignmatrix.Amount <> 0) and
                   (not Assignmatrix.Get(Assignmatrix."Employee No", Assignmatrix.Type,
                        Assignmatrix.Code, Assignmatrix."Payroll Period", Assignmatrix."Reference No")) then
                    Assignmatrix.Insert
                else begin
                    InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                    if InsuranceAmount > 5000 then
                        InsuranceAmount := Earnings."Maximum Limit";
                    Assignmatrix.Init;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Type := Assignmatrix.Type::Payment;
                    Assignmatrix.Code := Earnings.Code;
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                    Assignmatrix.Amount := InsuranceAmount;
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee.Department;
                    Assignmatrix.Validate(Amount);
                    Assignmatrix.Modify;
                end;
            end;
        end;
    end;

    procedure CalculateAddBack(EmployeeCode: Code[30]; PayPeriod: Date) AddBackValue: Decimal
    var
        AssignmentMatrixX: Record "Assignment Matrix-X";
        AddBackAmount: Decimal;
        AssignmentMatrixX1: Record "Assignment Matrix-X";
        EmployeeDet: Record Employee;
        ActualCont: Decimal;
        EmployerCont: Decimal;
        HRSetup: Record "Human Resources Setup";
    begin
        EmployeeDet.Reset;
        EmployeeDet.SetRange("No.", EmployeeCode);
        if EmployeeDet.FindFirst then begin
            if EmployeeDet."Employement Terms" = EmployeeDet."employement terms"::Contract then begin
                AssignmentMatrixX.Reset;
                AssignmentMatrixX.SetRange("Employee No", EmployeeDet."No.");
                // AssignmentMatrixX.SETRANGE(Code,DedCode);
                AssignmentMatrixX.SetRange("Payroll Period", PayPeriod);
                AssignmentMatrixX.SetRange(Retirement, true);
                if AssignmentMatrixX.FindSet then begin
                    AssignmentMatrixX.CalcSums(Amount);
                    AssignmentMatrixX.CalcSums("Employer Amount");
                    ActualCont := Abs(AssignmentMatrixX.Amount);
                    EmployerCont := Abs(AssignmentMatrixX."Employer Amount");
                end;

                HRSetup.Get;
                if ActualCont < HRSetup."Pension Limit Amount" then
                    AddBackValue := ActualCont;
                if ActualCont > HRSetup."Pension Limit Amount" then
                    AddBackValue := HRSetup."Pension Limit Amount";


                exit(AddBackValue);
            end
            else begin
                AssignmentMatrixX.Reset;
                AssignmentMatrixX.SetRange("Employee No", EmployeeDet."No.");
                // AssignmentMatrixX.SETRANGE(Code,DedCode);
                AssignmentMatrixX.SetRange("Payroll Period", PayPeriod);
                AssignmentMatrixX.SetRange(Retirement, true);
                if AssignmentMatrixX.FindSet then begin
                    AssignmentMatrixX.CalcSums(Amount);
                    AssignmentMatrixX.CalcSums("Employer Amount");
                    ActualCont := Abs(AssignmentMatrixX.Amount);
                    EmployerCont := Abs(AssignmentMatrixX."Employer Amount");
                end;
                HRSetup.Get;
                //cc test
                //IF ActualCont<HRSetup."Pension Limit Amount" THEN
                //    AddBackValue:=EmployerCont-(HRSetup."Pension Limit Amount"-ActualCont);

                if ActualCont < HRSetup."Pension Limit Amount" then begin
                    if EmployerCont > HRSetup."Pension Limit Amount" then
                        AddBackValue := EmployerCont - (HRSetup."Pension Limit Amount" - ActualCont);
                end;

                if ActualCont > HRSetup."Pension Limit Amount" then
                    AddBackValue := EmployerCont;
                exit(AddBackValue);
            end
        end;
    end;

    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        //AmountRemaining:=ROUND(AmountRemaining,0.01);
        EndTax := false;
        TaxTable.SetRange("Table Code", TaxCode);


        if TaxTable.Find('-') then begin
            repeat

                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    //IF ROUND((TaxableAmount),0.01)>TaxTable."Upper Limit" THEN
                    if TaxableAmount > TaxTable."Upper Limit" then
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
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
            // Message('%1', BeginDate);
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


    procedure DefaultAssignment(EmployeeRec: Record Employee)
    var
        ScaleBenefits: Record "Scale Benefits";
    begin
        GetPayPeriod;
        if BeginDate <> 0D then begin
            Assmatrix.Init;
            Assmatrix."Employee No" := EmployeeRec."No.";
            Assmatrix.Type := Assmatrix.Type::Payment;
            Assmatrix."Payroll Period" := BeginDate;
            Assmatrix."Department Code" := EmployeeRec."Global Dimension 1 Code";
            ScaleBenefits.Reset;
            ScaleBenefits.SetRange("Salary Scale", EmployeeRec."Salary Scale");
            ScaleBenefits.SetRange("Salary Pointer", EmployeeRec.Present);
            if ScaleBenefits.Find('-') then begin
                repeat
                    Assmatrix.Code := ScaleBenefits."ED Code";
                    Assmatrix.Validate(Code);
                    Assmatrix.Amount := ScaleBenefits.Amount;
                    Assmatrix.Validate(Amount);
                    if not Assmatrix.Get(Assmatrix."Employee No", Assmatrix.Type, Assmatrix.Code, Assmatrix."Payroll Period") then
                        Assmatrix.Insert
                    else begin
                        Assmatrix.Code := ScaleBenefits."ED Code";
                        Assmatrix.Validate(Code);
                        Assmatrix.Amount := ScaleBenefits.Amount;
                        Assmatrix.Validate(Amount);
                        Assmatrix.Modify;
                    end;
                until ScaleBenefits.Next = 0;
            end;

            //CC
            // Insert Deductions assigned to every employee
            Ded.Reset;
            Ded.SetRange("Applies to All", true);
            if Ded.Find('-') then begin
                repeat
                    Assmatrix.Init;
                    Assmatrix."Employee No" := EmployeeRec."No.";
                    Assmatrix.Type := Assmatrix.Type::Deduction;
                    Assmatrix."Payroll Period" := BeginDate;
                    Assmatrix."Department Code" := EmployeeRec."Global Dimension 1 Code";
                    Assmatrix.Code := Ded.Code;
                    Assmatrix.Validate(Code);
                    if not Assmatrix.Get(Assmatrix."Employee No", Assmatrix.Type, Assmatrix.Code, Assmatrix."Payroll Period") then
                        Assmatrix.Insert
                    else begin
                        Assmatrix.Code := Ded.Code;
                        Assmatrix.Validate(Code);
                    end;
                until Ded.Next = 0;
            end;

        end;
    end;


    procedure DefaultAssignmentTemp(EmployeeRec: Record "Temporary Employee")
    var
        ScaleBenefits: Record "Scale Benefits";
    begin
        GetPayPeriodT;
        if BeginDate <> 0D then begin
            AssmatrixT.Init;
            AssmatrixT."Employee No" := EmployeeRec."No.";
            AssmatrixT.Type := AssmatrixT.Type::Payment;
            AssmatrixT."Payroll Period" := BeginDate;
            AssmatrixT."Department Code" := EmployeeRec."Global Dimension 1 Code";
            ScaleBenefits.Reset;
            ScaleBenefits.SetRange("Salary Scale", EmployeeRec."Salary Scale");
            ScaleBenefits.SetRange("Salary Pointer", EmployeeRec.Present);
            if ScaleBenefits.Find('-') then begin
                repeat
                    AssmatrixT.Code := ScaleBenefits."ED Code";
                    AssmatrixT.Validate(Code);
                    AssmatrixT.Amount := ScaleBenefits.Amount;
                    AssmatrixT.Validate(Amount);
                    if not AssmatrixT.Get(AssmatrixT."Employee No", AssmatrixT.Type, AssmatrixT.Code, AssmatrixT."Payroll Period") then
                        AssmatrixT.Insert
                    else begin
                        AssmatrixT.Code := ScaleBenefits."ED Code";
                        AssmatrixT.Validate(Code);
                        AssmatrixT.Amount := ScaleBenefits.Amount;
                        AssmatrixT.Validate(Amount);
                        AssmatrixT.Modify;
                    end;
                until ScaleBenefits.Next = 0;
            end;
        end;
    end;
    //CC
    procedure UpdatedScaleBenefit(EmployeeRec: Record "Employee")
    var
        ScaleBenefits: Record "Scale Benefits";
    begin
        GetPayPeriodT;
        if BeginDate <> 0D then begin
            AssmatrixT.Init;
            AssmatrixT."Employee No" := EmployeeRec."No.";
            AssmatrixT.Type := AssmatrixT.Type::Payment;
            AssmatrixT."Payroll Period" := BeginDate;
            AssmatrixT."Department Code" := EmployeeRec."Global Dimension 1 Code";
            ScaleBenefits.Reset;
            ScaleBenefits.SetRange("Salary Scale", EmployeeRec."Salary Scale");
            ScaleBenefits.SetRange("Salary Pointer", EmployeeRec.Present);
            if ScaleBenefits.Find('-') then begin
                repeat
                    AssmatrixT.Code := ScaleBenefits."ED Code";
                    AssmatrixT.Validate(Code);
                    AssmatrixT.Amount := ScaleBenefits.Amount;
                    AssmatrixT.Validate(Amount);
                    if not AssmatrixT.Get(AssmatrixT."Employee No", AssmatrixT.Type, AssmatrixT.Code, AssmatrixT."Payroll Period") then
                        AssmatrixT.Insert
                    else begin
                        AssmatrixT.Code := ScaleBenefits."ED Code";
                        AssmatrixT.Validate(Code);
                        AssmatrixT.Amount := ScaleBenefits.Amount;
                        AssmatrixT.Validate(Amount);
                        AssmatrixT.Modify;
                    end;
                until ScaleBenefits.Next = 0;
            end;


            // Insert Deductions assigned to every employee
            Ded.Reset;
            Ded.SetRange("Applies to All", true);
            if Ded.Find('-') then begin
                repeat
                    AssmatrixT.Init;
                    AssmatrixT."Employee No" := EmployeeRec."No.";
                    AssmatrixT.Type := AssmatrixT.Type::Deduction;
                    AssmatrixT."Payroll Period" := BeginDate;
                    AssmatrixT."Department Code" := EmployeeRec."Global Dimension 1 Code";
                    AssmatrixT.Code := Ded.Code;
                    AssmatrixT.Validate(Code);
                    if not AssmatrixT.Get(AssmatrixT."Employee No", AssmatrixT.Type, AssmatrixT.Code, AssmatrixT."Payroll Period") then
                        AssmatrixT.Insert
                    else begin
                        AssmatrixT.Code := Ded.Code;
                        AssmatrixT.Validate(Code);
                    end;
                until Ded.Next = 0;
            end;

        end;
    end;


    procedure GetPayPeriodT()
    begin
        PayPeriodT.SetRange(PayPeriodT."Close Pay", false);
        if PayPeriodT.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriodT."Starting Date";
        end;
    end;
}

