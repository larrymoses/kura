#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69006 "Close Pay period"
{
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            column(ReportForNavId_1213; 1213)
            {
            }

            trigger OnPostDataItem()
            begin

                if PayperiodStart <> StartingDate then
                    Error('Cannot Close this Pay period Without Closing the preceding ones')
                else begin
                    if PayPeriod.Get(StartingDate) then begin
                        PayPeriod."Close Pay" := true;
                        PayPeriod.Closed := true;
                        PayPeriod.CreateLeaveEntitlment(PayPeriod);
                        PayPeriod.Modify;
                        Message('The period has been closed');
                    end;
                end;

                // Go thru assignment matrix for loans and validate code
                NewPeriod := CalcDate('1M', PayperiodStart);
                Loan.Reset;
                if Loan.FindSet() then begin
                    repeat
                        AssMatrix.Reset;
                        AssMatrix.SetRange("Payroll Period", NewPeriod);
                        AssMatrix.SetRange(Code, Loan.Code);
                        if AssMatrix.FindSet() then begin
                            repeat
                                if EmpRec.Get("Assignment Matrix-X"."Employee No") then begin
                                    if (EmpRec.Status = EmpRec.Status::Active) then
                                        AssMatrix.Validate(Code);
                                    AssMatrix.Modify
                                end;
                            until AssMatrix.Next = 0;
                        end;
                    until Loan.Next = 0;
                end;
                //cc
                AssMatrix.Reset;
                AssMatrix.SetRange("Payroll Period", NewPeriod);
                AssMatrix.SetRange(Code, "Assignment Matrix-X".Code);
                if AssMatrix.FindSet() then begin
                    repeat
                        if EmpRec.Get("Assignment Matrix-X"."Employee No") then begin
                            if (EmpRec.Status = EmpRec.Status::Active) then
                                AssMatrix.Validate(Code);
                            AssMatrix.Modify
                        end;
                    until AssMatrix.Next = 0;
                end;

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
    var
        Newperiods: Date;
    begin
        if not Confirm('Please backup up before closing current period! OK to Proceed?') then
            Error('The period has not been closed');

        // PayrollRun.RUN;....//commented by Morris
        Newperiods := 0D;
        DeducePayPeriod;
        ClosePeriodTrans;
        UpdateSalaryPointers(PayperiodStart);
        CreateNewEntries(PayperiodStart);

        //kk -Validate next month instead of prev month
        Newperiods := CalcDate('1M', PayperiodStart);
        VALIDATEALLCODES(Newperiods);
        // Assigninsurancerelief(PayperiodStart);
    end;


    trigger OnPostReport()
    var
        Newperiods: Date;
    begin
        Newperiods := 0D;
        Newperiods := CalcDate('1M', PayperiodStart);
        VALIDATEALLCODES(Newperiods);
        //cc//  PayrollRun.RUN;
        CloseAssMatrix.Reset();
        CloseAssMatrix.SetRange("Payroll Period", StartingDate);
        if CloseAssMatrix.FindSet() then begin
            repeat
                CloseAssMatrix.Closed := true;
                CloseAssMatrix.Modify();
            until CloseAssMatrix.Next() = 0;
        end;
    end;

    var
        Proceed: Boolean;
        CurrentPeriodEnd: Date;
        DaysAdded: Code[10];
        PayPeriod: Record "Payroll PeriodX";
        StartingDate: Date;
        PayperiodStart: Date;
        LoansUpdate: Boolean;
        PayHistory: Record "Employee Ledger EntryX";
        EmpRec: Record Employee;
        TaxableAmount: Decimal;
        RightBracket: Boolean;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        NetPay: Decimal;
        Loan: Record "Loans transactionsX";
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        relief: Decimal;
        Outstanding: Decimal;
        CreateRec: Boolean;
        benefits: Record EarningsX;
        deductions: Record DeductionsX;
        InterestDiff: Decimal;
        Rounding: Boolean;
        PD: Record "Assignment Matrix-X";
        Pay: Record EarningsX;
        Ded: Record DeductionsX;
        TaxCode: Code[10];
        CfAmount: Decimal;
        TempAmount: Decimal;
        EmpRec1: Record Employee;
        Emprec2: Record Employee;
        NewPeriod: Date;
        AssMatrix: Record "Assignment Matrix-X";
        CloseAssMatrix: Record "Assignment Matrix-X";
        PayrollRun: Report "Payroll Run";
        Schedule: Record "Repayment Schedule";
        Window: Dialog;
        EmployeeName: Text[200];
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        LoanApplicationForm: Record "Loan Application";
        Discontinue: Boolean;


    /// <summary>
    /// GetCurrentPeriod.
    /// </summary>
    /// <param name="Payperiod">VAR Record "Payroll PeriodX".</param>
    procedure GetCurrentPeriod(var Payperiod: Record "Payroll PeriodX")
    begin
        CurrentPeriodEnd := Payperiod."Starting Date";
        StartingDate := CurrentPeriodEnd;
        CurrentPeriodEnd := CalcDate('1M', CurrentPeriodEnd - 1);
    end;


    /// <summary>
    /// DeducePayPeriod.
    /// </summary>
    procedure DeducePayPeriod()
    var
        PayPeriodRec: Record "Payroll PeriodX";
    begin
        PayPeriodRec.Reset;
        PayPeriodRec.SetRange(PayPeriodRec."Close Pay", false);
        if PayPeriodRec.Find('-') then
            PayperiodStart := PayPeriodRec."Starting Date";
    end;


    procedure ClosePeriodTrans()
    var
        EarnDeduct: Record "Assignment Matrix-X";
    begin
        EarnDeduct.Reset;
        EarnDeduct.SetRange(EarnDeduct."Payroll Period", PayperiodStart);
        if EarnDeduct.Find('-') then
            repeat
                EarnDeduct.Closed := true;
                EarnDeduct."Payroll Period" := PayperiodStart;
                EarnDeduct.Modify;
            until EarnDeduct.Next = 0;
    end;


    procedure CreateNewEntries(var CurrPeriodStat: Date)
    var
        PaymentDed: Record "Assignment Matrix-X";
        AssignMatrix: Record "Assignment Matrix-X";
    begin
        /*This function creates new entries for the next Payroll period which are accessible and editable
        by the user of the Payroll. It should ideally create new entries if the EmpRec is ACTIVE*/
        NewPeriod := CalcDate('1M', PayperiodStart);
        //MESSAGE('%1',PayperiodStart);
        Window.Open('Creating Next period entries ##############################1', EmployeeName);
        PaymentDed.Reset;
        PaymentDed.SetRange(PaymentDed."Payroll Period", PayperiodStart);
        PaymentDed.SetRange(PaymentDed."Next Period Entry", true);
        //PaymentDed.SETFILTER(PaymentDed.Amount, '<>%1',0);
        if PaymentDed.FindSet() then begin
            repeat
                CreateRec := true;
                AssignMatrix.Init;
                AssignMatrix."Employee No" := PaymentDed."Employee No";
                AssignMatrix.Type := PaymentDed.Type;
                AssignMatrix.Code := PaymentDed.Code;
                AssignMatrix."Department Code" := PaymentDed."Department Code";
                AssignMatrix."Reference No" := PaymentDed."Reference No";
                AssignMatrix.Retirement := PaymentDed.Retirement;
                AssignMatrix."Payroll Period" := CalcDate('1M', PayperiodStart);
                AssignMatrix.Amount := PaymentDed.Amount;
                AssignMatrix.Description := PaymentDed.Description;
                AssignMatrix."Salary Pointer" := EmpRec."Salary Scale";
                AssignMatrix.Taxable := PaymentDed.Taxable;
                AssignMatrix."Tax Deductible" := PaymentDed."Tax Deductible";
                AssignMatrix.Frequency := PaymentDed.Frequency;
                AssignMatrix."Pay Period" := PaymentDed."Pay Period";
                AssignMatrix."Non-Cash Benefit" := PaymentDed."Non-Cash Benefit";
                AssignMatrix.Quarters := PaymentDed.Quarters;
                AssignMatrix."No. of Units" := PaymentDed."No. of Units";
                AssignMatrix.Section := PaymentDed.Section;
                AssignMatrix."Basic Pay" := PaymentDed."Basic Pay";
                AssignMatrix."Salary Grade" := PaymentDed."Salary Grade";
                AssignMatrix."Department Code" := PaymentDed."Department Code";
                AssignMatrix."Employer Amount" := PaymentDed."Employer Amount";
                AssignMatrix."Department Code" := PaymentDed."Department Code";
                AssignMatrix."Next Period Entry" := PaymentDed."Next Period Entry";
                AssignMatrix."Posting Group Filter" := PaymentDed."Posting Group Filter";
                AssignMatrix."Loan Repay" := PaymentDed."Loan Repay";
                AssignMatrix.DebitAcct := PaymentDed.DebitAcct;
                AssignMatrix.CreditAcct := PaymentDed.CreditAcct;
                AssignMatrix."Basic Salary Code" := PaymentDed."Basic Salary Code";
                AssignMatrix."Normal Earnings" := PaymentDed."Normal Earnings";
                AssignMatrix."Tax Relief" := PaymentDed."Tax Relief";
                AssignMatrix."Insurance Code" := PaymentDed."Insurance Code";
                AssignMatrix."Is Insuarance?" := PaymentDed."Is Insuarance?";
                AssignMatrix."Is Personal Insurance" := PaymentDed."Is Personal Insurance";

                // IF PaymentDed."Department Code" ='' THEN
                //  BEGIN
                Emprec2.Reset;
                if Emprec2.Get(PaymentDed."Employee No") then begin
                    Emprec2.CalcFields(Emprec2.Department, Emprec2.Branch, Emprec2.Paypoint, Emprec2."Staffing Group");

                    //AssignMatrix."Department Code":=Emprec2."Global Dimension 1 Code";
                    AssignMatrix."Department Code" := Emprec2.Department;
                    AssignMatrix."Profit Centre" := Emprec2."Global Dimension 2 Code";
                    AssignMatrix.Branch := Emprec2.Branch;
                    AssignMatrix."Pay Point" := Emprec2.Paypoint;
                    AssignMatrix."Staffing Group" := Emprec2."Staffing Group";
                    AssignMatrix."Posting Group Filter" := Emprec2."Posting Group";
                end;
                //carry forward

                if deductions.Get(PaymentDed.Code) then begin

                    if PaymentDed."Closing Balance" > 0 then begin
                        AssignMatrix."Opening Balance" := PaymentDed."Closing Balance";
                        if deductions."Balance Type" = deductions."balance type"::Decreasing then begin
                            if PaymentDed."Closing Balance" <= Abs(AssignMatrix.Amount) then
                                AssignMatrix.Amount := -PaymentDed."Closing Balance"
                            else
                                AssignMatrix."Closing Balance" := PaymentDed."Closing Balance" + AssignMatrix.Amount;
                        end;

                        if deductions."Balance Type" = deductions."balance type"::Increasing then
                            AssignMatrix."Closing Balance" := PaymentDed."Closing Balance" - AssignMatrix.Amount;
                    end;
                end;

                //END EMM
                if EmpRec.Get(PaymentDed."Employee No") then begin
                    // AssignMatrix."Payroll Group":=EmpRec."Posting Group";


                    Window.Update(1, EmpRec."First Name" + ' ' + EmpRec."Middle Name" + ' ' + EmpRec."Last Name");
                    //KK
                    AssignMatrix.Validate(Code);
                    if (EmpRec.Status = EmpRec.Status::Active) and (CreateRec = true) then begin
                        if not AssignMatrix.Insert(true) then
                            AssignMatrix.Modify(true);
                    end;
                end;
            until PaymentDed.Next = 0;
            //cc
            //  AssignMatrix.Validate(Code);
        end;





        ///carry forward any Non-recurring deductions;;

        PaymentDed.Reset;
        PaymentDed.SetRange(PaymentDed."Payroll Period", PayperiodStart);
        PaymentDed.SetRange(PaymentDed."Next Period Entry", false);
        PaymentDed.SetFilter(PaymentDed."Closing Balance", '>%1', 0);
        if PaymentDed.Find('-') then begin
            repeat
                CreateRec := true;
                AssignMatrix.Init;
                AssignMatrix."Employee No" := PaymentDed."Employee No";
                AssignMatrix.Type := PaymentDed.Type;
                AssignMatrix.Code := PaymentDed.Code;
                //cc
                AssignMatrix.Validate(Code);
                AssignMatrix."Department Code" := PaymentDed."Department Code";
                AssignMatrix."Reference No" := PaymentDed."Reference No";
                AssignMatrix.Retirement := PaymentDed.Retirement;
                AssignMatrix."Payroll Period" := CalcDate('1M', PayperiodStart);
                AssignMatrix.Amount := PaymentDed.Amount;
                AssignMatrix.Description := PaymentDed.Description;
                AssignMatrix.Taxable := PaymentDed.Taxable;
                AssignMatrix."Tax Deductible" := PaymentDed."Tax Deductible";
                AssignMatrix.Frequency := PaymentDed.Frequency;
                AssignMatrix."Pay Period" := PaymentDed."Pay Period";
                AssignMatrix."Salary Pointer" := EmpRec."Salary Scale";
                AssignMatrix."Non-Cash Benefit" := PaymentDed."Non-Cash Benefit";
                AssignMatrix.Quarters := PaymentDed.Quarters;
                AssignMatrix."No. of Units" := PaymentDed."No. of Units";
                AssignMatrix.Section := PaymentDed.Section;
                AssignMatrix."Basic Pay" := PaymentDed."Basic Pay";
                AssignMatrix."Salary Grade" := PaymentDed."Salary Grade";
                AssignMatrix."Department Code" := PaymentDed."Department Code";
                AssignMatrix."Employer Amount" := PaymentDed."Employer Amount";
                AssignMatrix."Department Code" := PaymentDed."Department Code";
                AssignMatrix."Next Period Entry" := PaymentDed."Next Period Entry";
                AssignMatrix."Posting Group Filter" := PaymentDed."Posting Group Filter";
                AssignMatrix."Loan Repay" := PaymentDed."Loan Repay";
                AssignMatrix.DebitAcct := PaymentDed.DebitAcct;
                AssignMatrix.CreditAcct := PaymentDed.CreditAcct;
                AssignMatrix."Basic Salary Code" := PaymentDed."Basic Salary Code";
                AssignMatrix."Normal Earnings" := PaymentDed."Normal Earnings";

                AssignMatrix."Tax Relief" := PaymentDed."Tax Relief";

                // IF PaymentDed."Department Code" ='' THEN
                //  BEGIN
                Emprec2.Reset;
                if Emprec2.Get(PaymentDed."Employee No") then begin
                    Emprec2.CalcFields(Emprec2.Department, Emprec2.Branch, Emprec2.Paypoint, Emprec2."Staffing Group");

                    //AssignMatrix."Department Code":=Emprec2."Global Dimension 1 Code";
                    AssignMatrix."Department Code" := Emprec2.Department;
                    AssignMatrix."Profit Centre" := Emprec2."Global Dimension 2 Code";
                    AssignMatrix.Branch := Emprec2.Branch;
                    AssignMatrix."Pay Point" := Emprec2.Paypoint;
                    AssignMatrix."Staffing Group" := Emprec2."Staffing Group";
                    AssignMatrix."Posting Group Filter" := Emprec2."Posting Group";
                end;

                //carry forward
                if deductions.Get(PaymentDed.Code) then begin

                    if PaymentDed."Closing Balance" > 0 then begin
                        AssignMatrix."Opening Balance" := PaymentDed."Closing Balance";
                        if deductions."Balance Type" = deductions."balance type"::Decreasing then begin
                            if PaymentDed."Closing Balance" <= Abs(AssignMatrix.Amount) then
                                AssignMatrix.Amount := -PaymentDed."Closing Balance"
                            else
                                AssignMatrix."Closing Balance" := PaymentDed."Closing Balance" + AssignMatrix.Amount;
                        end;

                        if deductions."Balance Type" = deductions."balance type"::Increasing then
                            AssignMatrix."Closing Balance" := PaymentDed."Closing Balance" - AssignMatrix.Amount;
                    end;
                end;


                //END EMM
                if EmpRec.Get(PaymentDed."Employee No") then begin
                    // AssignMatrix."Payroll Group":=EmpRec."Posting Group";


                    Window.Update(1, EmpRec."First Name" + ' ' + EmpRec."Middle Name" + ' ' + EmpRec."Last Name");

                    if (EmpRec.Status = EmpRec.Status::Active) and (CreateRec = true) then begin
                        if not AssignMatrix.Insert(true) then
                            AssignMatrix.Modify(true);
                    end;
                end;
            until PaymentDed.Next = 0;
            //cc
        end;



        //end carry forward any Non-recurring deductions;;




        //Manage loans

        PaymentDed.Reset;
        PaymentDed.SetRange(PaymentDed."Payroll Period", NewPeriod);
        PaymentDed.SetRange(Type, PaymentDed.Type::Deduction);
        if PaymentDed.Find('-') then begin
            repeat
                if LoanApplicationForm.Get(PaymentDed."Reference No", PaymentDed.Code) then begin
                    LoanApplicationForm.SetRange(LoanApplicationForm."Date filter", 0D, PayperiodStart);
                    LoanApplicationForm.CalcFields(LoanApplicationForm."Total Repayment");
                    if (LoanApplicationForm."Approved Amount" + LoanApplicationForm."Total Repayment") = 0 then begin
                        Message('Loan %1 has expired', PaymentDed."Reference No");
                        PaymentDed.Delete;
                    end
                    else begin
                        if (LoanApplicationForm."Approved Amount" + LoanApplicationForm."Total Repayment") < LoanApplicationForm.Repayment then begin

                            LoanApplicationForm.CalcFields(LoanApplicationForm."Total Repayment");

                            PaymentDed.Amount := -(LoanApplicationForm."Approved Amount" + LoanApplicationForm."Total Repayment");
                            PaymentDed."Next Period Entry" := false;
                            PaymentDed.Modify;
                        end;

                    end;
                end;

            until PaymentDed.Next = 0;
        end;

    end;

    procedure VALIDATEALLCODES(var CurrPeriodStat: Date)
    var
        PaymentDed: Record "Assignment Matrix-X";
        AssignMatrix: Record "Assignment Matrix-X";
        empl: record employee;
        payments: record EarningsX;
    begin
        NewPeriod := CalcDate('1M', PayperiodStart);
        //MESSAGE('%1',PayperiodStart);
        Window.Open('Validating Next period entries ##############################1', EmployeeName);


        empl.Reset();
        EMPL.SETRANGE(EMPL."Pay Period Filter", NewPeriod);
        if empl.findset then begin
            repeat
                PaymentDed.Reset;
                PaymentDed.SetRange(PaymentDed."Payroll Period", NewPeriod);
                PaymentDed.SetRange(PaymentDed."Employee No", empl."No.");
                PaymentDed.setrange(PaymentDed."Insurance Code", TRUE);
                if PaymentDed.FindSet() then begin
                    repeat
                        if Empl.Get(PaymentDed."Employee No") then begin
                            // AssignMatrix."Payroll Group":=EmpRec."Posting Group";


                            Window.Update(1, Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name");
                        end;



                        PaymentDed.validate(code);
                        PaymentDed.Validate(Amount);
                        paymentded.modify(True);

                    until PaymentDed.next = 0;

                end;
                //insuran relief
                PaymentDed.Reset;
                PaymentDed.SetRange(PaymentDed."Payroll Period", NewPeriod);
                PaymentDed.SetRange(PaymentDed."Employee No", empl."No.");
                if PaymentDed.FindSet() then begin
                    repeat
                        payments.Reset();
                        payments.setrange(payments.code, PaymentDed.Code);
                        if payments.FindSet() then begin
                            if Payments."Calculation Method" = Payments."calculation method"::"% of Insurance Amount" then begin

                                if payments.get(PaymentDed.Code) then begin
                                    Empl.SetRange(Empl."Pay Period Filter", NewPeriod);
                                    Empl.CalcFields(Empl.Insurance);
                                    PaymentDed.Amount := Abs((Payments.Percentage / 100) * (Empl.Insurance));

                                    if Payments."Maximum Limit" < PaymentDed.Amount then
                                        PaymentDed.Amount := Payments."Maximum Limit";
                                    PaymentDed.Amount := PaymentDed.Amount;//round
                                    paymentded.modify(True);
                                end;                                    // MESSAGE('%1',Amount);
                            end;
                        end;
                        //  PaymentDed.validate(code);
                        paymentded.modify(True);

                    until PaymentDed.next = 0;
                end;
            until empl.next = 0;
        end;

        //all
        empl.Reset();
        EMPL.SETRANGE(EMPL."Pay Period Filter", NewPeriod);
        if empl.findset then begin
            repeat
                PaymentDed.Reset;
                PaymentDed.SetRange(PaymentDed."Payroll Period", NewPeriod);
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

    procedure Initialize()
    var
        InitEarnDeduct: Record "Assignment Matrix-X";
    begin

        InitEarnDeduct.SetRange(InitEarnDeduct.Closed, false);

        repeat
            InitEarnDeduct."Payroll Period" := PayperiodStart;
            InitEarnDeduct.Modify;
        until InitEarnDeduct.Next = 0;
    end;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := AmountRemaining;
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
        IncomeTax := -TotalTax;
    end;


    procedure CreateLIBenefit(var Employee: Code[10]; var BenefitCode: Code[10]; var ReducedBalance: Decimal)
    var
        PaymentDeduction: Record "Assignment Matrix-X";
        Payrollmonths: Record "Payroll PeriodX";
        allowances: Record EarningsX;
    begin
        PaymentDeduction.Init;
        PaymentDeduction."Employee No" := Employee;
        PaymentDeduction.Code := BenefitCode;
        PaymentDeduction.Type := PaymentDeduction.Type::Payment;
        PaymentDeduction."Payroll Period" := CalcDate('1M', PayperiodStart);
        PaymentDeduction.Amount := ReducedBalance * InterestDiff;
        PaymentDeduction."Non-Cash Benefit" := true;
        PaymentDeduction.Taxable := true;
        //PaymentDeduction."Next Period Entry":=TRUE;
        if allowances.Get(BenefitCode) then
            PaymentDeduction.Description := allowances.Description;
        if not PaymentDeduction.Insert(true) then
            PaymentDeduction.Modify(true);
        ;
    end;


    procedure CoinageAnalysis(var NetPay: Decimal) NetPay1: Decimal
    var
        Index: Integer;
        Intex: Integer;
        AmountArray: array[15] of Decimal;
        NoOfUnitsArray: array[15] of Integer;
        MinAmount: Decimal;
    begin
    end;


    /// <summary>
    /// UpdateSalaryPointers.
    /// </summary>
    /// <param name="PayrollPeriod">VAR Date.</param>
    procedure UpdateSalaryPointers(var PayrollPeriod: Date)
    var
        Emp: Record Employee;
        Emp2: Record Employee;
        RollingMonth: Integer;
        Pointer: code[50];
        PresentGrade: text[100];
        NextSalaryGrade: integer;
        Presentpointer: text[100];
        Nextpointer: text[100];
        presentSalaryGrade: Integer;
        CurrentGrade: Integer;
        NextGrade: Integer;
    begin
        //CC
        NewPeriod := CalcDate('1M', PayperiodStart);
        Emp.Reset;
        Emp.SetRange(Emp.Status, Emp.Status::Active);
        Emp.SETFILTER(Present, '<>%1', '');
        if Emp.Findset() then begin
            repeat
                //if Emp.Present = Emp.Halt then
                //  exit;
                if Emp."Incremental Month" <> 0D then begin
                    if NewPeriod = emp."Incremental Month" then begin
                        PresentPointer := copystr(emp.present, 2, 1);
                        PresentGrade := copystr(emp.present, 1, 1);
                        Evaluate(presentSalaryGrade, copystr(emp.present, 1, 1));
                        IF Emp.Present <> Emp.Halt then begin
                            Evaluate(NextSalaryGrade, copystr(emp.present, 1, 1));
                            //MOVE POINTERS
                            if Presentpointer = 'A' then Nextpointer := 'B';
                            if Presentpointer = 'B' then Nextpointer := 'C';
                            if Presentpointer = 'C' then Nextpointer := 'D';
                            if Presentpointer = 'D' then Nextpointer := 'E';
                            if Presentpointer = 'E' then Nextpointer := 'F';
                            if Presentpointer = 'F' then Nextpointer := 'G';
                            if Presentpointer = 'G' then Nextpointer := 'H';
                            if Presentpointer = 'H' then Nextpointer := 'I';
                            if Presentpointer = 'I' then Nextpointer := 'J';
                            if Presentpointer = 'J' then Nextpointer := 'K';

                            Emp.Present := copystr(emp.present, 1, 1) + Nextpointer;
                            Emp.Previous := format(NextSalaryGrade) + Presentpointer;
                            // Emp.Validate(Present);

                            //Emp.Modify(TRUE);
                        end;


                        //move grade
                        /* if Emp2.Get(Emp."No.") then begin

                         end;
                          if Emp.Present = Emp.Halt then begin
                              Evaluate(NextSalaryGrade, copystr(emp.present, 1, 1));
                              IF (Emp.Present <> '10J') and (Emp.Present = Emp.Previous) THEN BEGIN
                                  emp."Salary Scale" := 'GRADE ' + Format(NextSalaryGrade - 1);
                                  Emp.Present := Format(NextSalaryGrade - 1) + 'A';
                                  Emp.Previous := PresentGrade + presentpointer;
                                  // Emp.Validate(Present);
                                  Emp.Validate("Salary Scale");
                                  // Emp.Modify(TRUE);
                              END;
                              IF Emp.Present = '10J' THEN BEGIN
                                  emp."Salary Scale" := 'GRADE ' + '9';
                                  Emp.Present := '9A';
                                  Emp.Previous := PresentGrade + presentpointer;
                                  // Emp.Validate(Present);

                                  Emp.Validate("Salary Scale");
                                  //  Emp.Modify(TRUE);
                              END;
                          end;*/
                        //kk -Check if grade changed before modifying. If its different, retain same grade and pointers.
                        if Emp.Previous <> '' then
                            Evaluate(CurrentGrade, copystr(emp.Previous, 1, 1));
                        if emp.Present <> '' then
                        Evaluate(NextGrade, copystr(emp.Present, 1, 1));
                        if CurrentGrade = NextGrade then
                            Emp.Modify(TRUE);
                    end;
                end;
            until Emp.Next = 0;
        end;
    end;

    /// <summary>
    /// insurancerelief.
    /// </summary>
    /// <param name="PayperiodStarts">Date.</param>
    /// <param name="PayperiodStart">Date.</param>
    procedure Assigninsurancerelief(PayperiodStarts: Date)
    var
        Assignmatrix: Record "Assignment Matrix-X";
        Employee: record Employee;
        Earnings: record EarningsX;
        InsuranceAmount: decimal;
        InsuranceRelief: Decimal;
    begin
        //Assign Insurance Relief 
        NewPeriod := CalcDate('1M', PayperiodStarts);
        Assignmatrix.Reset();
        Assignmatrix.SetRange("Payroll Period", NewPeriod);
        if Assignmatrix.FindSet() then begin
            repeat
                Earnings.Reset;
                Earnings.SetRange(Code, Assignmatrix.code);
                Earnings.SetRange("Earning Type", Earnings."earning type"::"Insurance Relief");
                if Earnings.FindFirst() then begin
                    InsuranceAmount := Abs(GetInsuranceAmount(NewPeriod, Assignmatrix."Employee No"));
                    Assignmatrix.Amount := InsuranceAmount * (Earnings.Percentage / 100);
                    Assignmatrix.Modify();
                end;
            until Assignmatrix.Next() = 0;
        end;

    end;

    Procedure GetInsuranceAmount(PayPeriod: Date; EmpNo: Code[20]): Decimal
    var
        Insurance: Record "Assignment Matrix-X";
        InsAmount: Decimal;
    begin
        InsAmount := 0;
        Insurance.Reset();
        Insurance.SetRange("Employee No", EmpNo);
        Insurance.SetRange("Payroll Period", PayPeriod);
        Insurance.SetRange(Type, Insurance.Type::Deduction);
        Insurance.SetRange("Insurance Code", true);
        if Insurance.FindSet() then begin
            repeat
                InsAmount += Abs(Insurance.Amount);
                Insurance.CalcSums(Amount);
            until Insurance.Next() = 0;
            exit(InsAmount);
        end;
    end;
}


//excode
// Emp.RESET;
// //Emp.SETRANGE("No.",'208');
// Emp.SETRANGE(Emp.Status,Emp.Status::Active);
// Emp.SETFILTER(Present,'<>%1','');
// IF Emp.FIND('-') THEN
// BEGIN
// REPEAT

// {IF FORMAT(DATE2DMY(NewPeriod,2))=Emp."Incremental Month" THEN
// BEGIN} ///Commented by Morris 11.12.2020
// IF NewPeriod=Emp."Incremental Month" THEN
// BEGIN
// EVALUATE(Present,Emp.Present);
// EVALUATE(Halt,Emp.Halt);

// IF (Present+1)<Halt THEN
// BEGIN
// //MESSAGE('%1 %2',(Present+1),Halt);
// Emp.Previous:=FORMAT(Present);
// Emp.Present:=FORMAT(Present+1);
// //Emp.VALIDATE(Emp.Present);
// Emp.MODIFY;
// END;
// END;
