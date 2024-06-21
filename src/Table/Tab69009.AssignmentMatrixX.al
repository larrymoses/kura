#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69009 "Assignment Matrix-X"
{
    DataCaptionFields = "Employee No", Description;
    DrillDownPageID = Payments_Deductions;
    LookupPageID = Payments_Deductions;

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Empl.Get("Employee No") then begin
                    Empl.CalcFields(Branch, Paypoint, "Staffing Group", Department);

                    "Posting Group Filter" := Empl."Posting Group";
                    "Profit Centre" := Empl."Global Dimension 2 Code";
                    Branch := Empl.Branch;
                    "Department Code" := Empl.Department;
                    "Pay Point" := Empl.Paypoint;
                    "Staffing Group" := Empl."Staffing Group";
                    "Salary Grade" := Empl."Salary Scheme Category";
                    "Salary Pointer" := Empl.Present;
                    //"Basic Pay":=Empl."Basic Pay";
                    if Empl."Posting Group" = '' then
                        Error('Assign  %1  %2 a posting group before assigning any earning or deduction', Empl."First Name", Empl."Last Name");
                    "Pay Mode" := Empl."Payroll Pay Mode";

                    // IF Empl.Status<>Empl.Status::Active THEN
                    // ERROR('Can only assign Earnings and deductions to Active Employees Please confirm if '+ //
                    // '%1 %2 is an Active Employee',Empl."First Name",Empl."Last Name");
                end;
            end;
        }
        field(2; Type; Option)
        {
            NotBlank = false;
            OptionMembers = Payment,Deduction,"Saving Scheme",Loan;
        }
        field(3; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type = const(Payment)) EarningsX
            else
            if (Type = const(Deduction)) DeductionsX
            else
            if (Type = const(Loan)) "Loan Application"."Loan No" where("Employee No" = field("Employee No"));

            trigger OnValidate()
            begin

                //cc
                if rec."Is Personal Insurance" then
                    exit;

                HRSetup.Get;
                GetPayPeriod;
                //"Payroll Period":=PayStartDate;
                "Pay Period" := PayPeriodText;

                //*********************Allowances Calculation rules etc***************//
                if Type = Type::Payment then begin
                    if Payments.Get(Code) then begin
                        // check if blocked
                        if Payments.Block = true then
                            Error(' Earning Blocked');
                        "Time Sheet" := Payments."Time Sheet";
                        Description := Payments.Description;
                        rec."Basic Salary Code" := Payments."Basic Salary Code";
                        "Effective End Date" := Payments."End Date";
                        "Effective Start Date" := Payments."Start Date";
                        if Payments."Earning Type" = Payments."earning type"::"Tax Relief" then
                            "Tax Relief" := true;

                        "Non-Cash Benefit" := Payments."Non-Cash Benefit";
                        Quarters := Payments.Quarters;
                        //Paydeduct:=Payments."End Date";
                        Taxable := Payments.Taxable;
                        "Tax Deductible" := Payments."Reduces Tax";
                        if Payments."Pay Type" = Payments."pay type"::Recurring then
                            "Next Period Entry" := true;
                        //assign basic based on salary scale
                        if Empl.Get("Employee No") then begin
                            /*SalarySteps.SETRANGE(SalarySteps."Salary Grade",Empl."Salary Scale");
                            SalarySteps.SETRANGE(SalarySteps."Salary Pointer",Empl.pres);
                            SalarySteps.SETRANGE(SalarySteps.Code,Code);
                            */
                        end;

                        if Payments."Fluctuation Type" = Payments."fluctuation type"::"Non-Fluctuating" then
                            "Non-Fluctuating" := true;
                        "Basic Salary Code" := Payments."Basic Salary Code";
                        "Basic Pay Arrears" := Payments."Basic Pay Arrears";
                        "Negative Earning" := Payments."Negative Earning";
                        if Payments."Earning Type" = Payments."earning type"::"Normal Earning" then
                            "Normal Earnings" := true
                        else
                            "Normal Earnings" := false;

                        if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then begin
                            if Payments."Flat Amount" <> 0 then
                                Amount := Payments."Flat Amount";
                        end;




                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                                Empl.CalcFields(Empl.Basic, Empl."Basic Arrears");
                                //Amount:=Payments.Percentage/100* (Empl.Basic-Empl."Basic Arrears");
                                // MESSAGE('Basic Pay %1 & Basic Arrears %2',FORMAT(Empl.Basic),FORMAT(Empl."Basic Arrears"));

                                Amount := Abs((Payments.Percentage / 100 * (Empl.Basic - Empl."Basic Arrears")) - Payments."Deduct From Pension");
                                //         MESSAGE('Amount to be paid %1',FORMAT(Amount));
                                "Employer Amount" := (Payments."Percentage Employer" / 100 * (Empl.Basic - Empl."Basic Arrears")) - Payments."Deduct From Pension";
                                if Amount <> 0 then begin
                                    if (Payments."Maximum Limit" <> 0) and (Payments."Maximum Limit" < Amount) then begin
                                        Amount := Payments."Maximum Limit";
                                    end;
                                end;

                                Amount := PayrollRounding(Amount);//round

                                //          IF Payments."Negative Earning"=TRUE THEN
                                //          Amount:=Amount*-1;

                                /*//added 08/08/19 for excess pension
                                IF Payments."Calculate Excess Pension" = TRUE THEN
                                BEGIN
                                  AssignMatrix.INIT;
                                  AssignMatrix.Code := HRSetup."Excess Pension Code";
                                  AssignMatrix.VALIDATE( AssignMatrix.Code);
                                  AssignMatrix."Employee No" := Empl."No.";
                                  AssignMatrix.VALIDATE( AssignMatrix."Employee No");
                                  AssignMatrix.Amount := (((Payments.Percentage/100* (Empl.Basic-Empl."Basic Arrears"))-Payments."Deduct From Pension")+
                                  ((Payments."Percentage Employer"/100* (Empl.Basic-Empl."Basic Arrears"))-Payments."Deduct From Pension")) - HRSetup."Pension Limit Amount";
                                  //MESSAGE('%1 pensin%2',AssignMatrix.Amount,HRSetup."Pension Limit Amount");
                                  IF  (AssignMatrix.Amount + HRSetup."Pension Limit Amount") > HRSetup."Pension Limit Amount" THEN
                                  BEGIN

                                    AssignMatrix.INSERT(TRUE);
                                  END;
                                END; */

                            end;
                        end;

                        //cc
                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic pay" then begin
                            if payments."Earning Type" = Payments."Earning Type"::Gratuity then begin
                                if Empl.Get("Employee No") then begin
                                    Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                                    Empl.CalcFields(Empl.Basic, Empl."Basic Arrears");
                                    Amount := Payments.Percentage / 100 * Empl.Basic;
                                    Amount := PayrollRounding(Amount);//round
                                                                      //  Message('%1..%2', Code, empl.basic);
                                                                      //  message('%1', PayStartDate);
                                end;
                            end;
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic after tax" then begin
                            if Empl.Get("Employee No") then begin
                                HRSetup.Get;
                                if HRSetup."Company overtime hours" <> 0 then
                                    Amount := ("No. of Units" * Empl."Hourly Rate" * Payments."Overtime Factor");//HRSetup."Company overtime hours";
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then begin
                                Amount := "No. of Units" * Empl."Daily Rate";//*Payments."Overtime Factor";
                                if Payments."Overtime Factor" <> 0 then
                                    Amount := "No. of Units" * Empl."Daily Rate" * Payments."Overtime Factor";

                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;


                        //kugun
                        //insurance relief

                        if Payments."Calculation Method" = Payments."calculation method"::"% of Insurance Amount" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                Empl.CalcFields(Empl.Insurance);
                                //MESSAGE('%1',Empl.Insurance);

                                Amount := Abs((Payments.Percentage / 100) * (Empl.Insurance));

                                if Payments."Maximum Limit" < Amount then
                                    Amount := Payments."Maximum Limit";

                                // MESSAGE('%1',Amount);
                                Amount := PayrollRounding(Amount);//round
                                                                  // MESSAGE('%1',Amount);
                            end;
                        end;


                        if Payments."Earning Type" = Payments."earning type"::"Owner Occupier" then begin
                            if Empl.Get("Employee No") then begin
                                Empl."Home Ownership Status" := Empl."home ownership status"::"Owner Occupier";
                                Empl.Modify;
                            end;
                        end;



                        if Payments."Calculation Method" = Payments."calculation method"::"% of Gross pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                Empl.CalcFields(Basic, Empl."Total Allowances1");
                                Amount := ((Payments.Percentage / 100) * (Empl.Basic + Empl."Total Allowances1"));
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;
                        if Payments."Calculation Method" = Payments."calculation method"::"% of Taxable income" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange("Pay Period Filter", PayStartDate);
                                Empl.CalcFields(Empl."Taxable Allowance");
                                Amount := ((Payments.Percentage / 100) * (Empl."Basic Pay" + Empl."Taxable Allowance"));
                                Amount := PayrollRounding(Amount);//round
                                                                  //IF "Value of Quarters">Amount THEN
                                                                  // Amount:="Value of Quarters";
                            end;
                        end;
                        if Payments."Reduces Tax" then begin
                            //Amount:=-Amount;
                            Amount := PayrollRounding(Amount);//round
                        end;
                        //Home Owner Occupier Interest ...Fred
                        //     IF Payments."Earning Type" = Payments."Earning Type"::"Owner Occupier"  THEN
                        //              BEGIN
                        //
                        //                RepaymentS.RESET;
                        //                RepaymentS.SETRANGE(RepaymentS."Repayment Date","Payroll Period");
                        //                RepaymentS.SETRANGE(RepaymentS."Employee No","Employee No");
                        //                RepaymentS.SETFILTER(RepaymentS.Paid,'%1',FALSE);
                        //                RepaymentS.CALCSUMS("Monthly Interest");
                        //                IF RepaymentS."Monthly Interest" > 0  THEN
                        //                  BEGIN
                        //                    IF RepaymentS."Monthly Interest" > Payments."Maximum Limit" THEN
                        //                      Amount:= PayrollRounding(Payments."Maximum Limit")
                        //                    ELSE
                        //                      Amount := PayrollRounding(RepaymentS."Monthly Interest");
                        //                    Amount := ABS(Amount);
                        //                  END;
                        //
                        //              END;

                    end;
                end;

                //*********Deductions****************************************
                if Type = Type::Deduction then begin
                    if Deductions.Get(Code) then begin
                        if Deductions.Block = true then
                            Error('Deduction Blocked');
                        "Is Personal Insurance" := Deductions."Is Personal Insurance";
                        Description := Deductions.Description;
                        "G/L Account" := Deductions."G/L Account";
                        "Tax Deductible" := Deductions."Tax deductible";
                        Retirement := Deductions."Pension Scheme";
                        Shares := Deductions.Shares;
                        Paye := Deductions."PAYE Code";
                        "Insurance Code" := Deductions."Insurance Code";
                        "Main Deduction Code" := Deductions."Main Deduction Code";
                        "Company Advance" := Deductions."Company Advance";
                        "Advance Interest" := Deductions."Advance Interest";
                        "Effective Start Date" := Deductions."Start date";
                        "Effective End Date" := Deductions."End Date";
                        "PAYE Arrears" := Deductions."PAYE Arrears Code";

                        if Deductions.Type = Deductions.Type::Recurring then
                            "Next Period Entry" := true;
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Flat Amount" then begin
                            if Deductions."Flat Amount" <> 0 then
                                Amount := Deductions."Flat Amount";
                            if Deductions."Flat Amount Employer" <> 0 then
                                "Employer Amount" := Deductions."Flat Amount Employer";
                        end;
                        if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                                Empl.CalcFields(Empl.Basic, "Retirement Contribution", "SSF Employer to Date");
                                Amount := Deductions.Percentage / 100 * Empl.Basic;
                                Amount := PayrollRounding(Amount);//round
                                "Employer Amount" := (Deductions."Percentage Employer" / 100 * Empl.Basic) * -1;
                                "Employer Amount" := PayrollRounding("Employer Amount");//round
                                "Gratuity Amount" := PayrollRounding("Gratuity Amount");
                                //  Message('%1..%2', Code, empl.basic);
                                // message('%1', empl."Pay Period Filter");

                                //added 08/08/19 for excess pension

                                if Deductions."Calculate Excess Pension" = true then begin
                                    AssignMatrix.Init;
                                    AssignMatrix.Code := HRSetup."Excess Pension Code";
                                    AssignMatrix.Validate(AssignMatrix.Code);
                                    AssignMatrix."Employee No" := Empl."No.";
                                    AssignMatrix.Validate(AssignMatrix."Employee No");
                                    AssignMatrix.Amount := (((Deductions.Percentage / 100 * (Empl.Basic - Empl."Basic Arrears")) - Deductions."Deduct From Pension") +
                                    ((Deductions."Percentage Employer" / 100 * (Empl.Basic - Empl."Basic Arrears")) - Deductions."Deduct From Pension")) + HRSetup."NSSF Amount" - HRSetup."Pension Limit Amount" + 1080 * 2;

                                    //MESSAGE('Total Pension amount %1 pensin %2',AssignMatrix.Amount,HRSetup."Pension Limit Amount");
                                    if (AssignMatrix.Amount + HRSetup."Pension Limit Amount") > HRSetup."Pension Limit Amount" then begin

                                        AssignMatrix.Insert(true)
                                    end;
                                end;

                                //pension amount may exceed the maximum limit but the additional amount is tax
                                //MESSAGE('%1',Empl.Basic);
                                /*
                                IF Deductions."Maximum Amount"<> 0 THEN BEGIN
                                IF ABS(Amount) > Deductions."Maximum Amount" THEN
                                 Amount:=Deductions."Maximum Amount";
                                 "Employer Amount":=Deductions."Percentage Employer"/100*Empl.Basic;
                                 //Employer amount should not have maximum pension deduction
                                 {
                                   IF "Employer Amount">Deductions."Maximum Amount" THEN
                              "Employer Amount":=Deductions."Maximum Amount";
                                 }
                                 */
                                //end of Employer pension
                                "Employer Amount" := PayrollRounding("Employer Amount");//round
                                                                                        // Added by Lob

                            end;
                        end;
                        //End of addition

                        if Deductions.CoinageRounding = true then begin
                            //     HRSetup.GET();
                            //     Maxlimit:=HRSetup."Pension Limit Amount";
                            Retirement := Deductions.CoinageRounding;
                            if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay" then
                                "Employer Amount" := Deductions.Percentage / 100 * Empl."Basic Pay"
                            else
                                "Employer Amount" := Deductions."Flat Amount";
                            "Employer Amount" := PayrollRounding("Employer Amount");//round
                        end;

                        //end of uganda requirement addition

                        //  IF "Employer Amount" > Deductions."Maximum Amount" THEN
                        //     "Employer Amount":=Deductions."Maximum Amount";
                        Amount := PayrollRounding(Amount);//round
                        "Employer Amount" := PayrollRounding("Employer Amount");//round
                    end;

                    //added for Uganda requirements
                    // added by Lob vega
                    if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin
                        if Empl.Get("Employee No") then begin
                            Empl.CalcFields(Empl."Total Allowances1");
                            Amount := ((Deductions.Percentage / 100) * (Empl."Basic Pay" + Empl."Total Allowances1"));
                            "Employer Amount" := ((Deductions.Percentage / 100) * (Empl."Basic Pay" + Empl."Total Allowances1"));
                            Amount := PayrollRounding(Amount);
                            "Employer Amount" := PayrollRounding("Employer Amount");
                        end;
                    end;
                    //added for BM requirements
                    if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay+Hse Allowance" then begin
                        if Empl.Get("Employee No") then begin
                            //SalarySteps.GET(Empl."Salary Steps",SalarySteps.Level::"Level 1",Empl."Salary Scheme Category");
                            //Amount:=((Deductions.Percentage/100)* (Empl."Basic Pay"+SalarySteps."House allowance"));
                            //"Employer Amount":=((Deductions.Percentage/100)*(Empl."Working Days Per Year"+SalarySteps."House allowance"));
                            Amount := PayrollRounding(Amount);
                            "Employer Amount" := PayrollRounding("Employer Amount");
                        end;
                    end;
                    //
                    //cc

                    // ///remove nega
                    // if Type = Type::Deduction then
                    //     Amount := -Amount;

                    //addition for %of Gross
                    IF Deductions."Calculation Method" = Deductions."Calculation Method"::"% of Gross Pay" THEN BEGIN
                        IF Empl.GET("Employee No") THEN BEGIN


                            Empl.SETRANGE(Empl."Pay Period Filter", PayStartDate);
                            Empl.CALCFIELDS(Basic, Empl."Total Allowances1");
                            Amount := Deductions.Percentage / 100 * (Empl."Total Allowances1");
                            Amount := PayrollRounding(Amount);//round
                            "Employer Amount" := Deductions."Percentage Employer" / 100 * (Empl."Total Allowances1");
                            "Employer Amount" := PayrollRounding("Employer Amount");//round


                        END;
                    END;

                    //ENd Addition for %of gross
                    //*******New Addition*******************
                    if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin

                        HRSetup.Get;
                        GetPayPeriod;
                        Empl.Reset;
                        Empl.SetRange(Empl."No.", "Employee No");
                        Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                        Empl.CalcFields(Empl."Total Allowances1", Empl.Basic, "Non-Fluctuating Allowance");
                        // used gross pay new requirement for NHIF changed by Linus
                        //GetBracket(Deductions."Deduction Table",Empl."Total Allowances1");

                        //adjusted by kugun to use taxable allawance
                        //MESSAGE('NHIF CODE %1 AND DEDUCTION CODE %2',HRSetup."NHIF Code",Deductions.Code);
                        if HRSetup."NHIF Code" = Deductions.Code then
                            GetBracket(Deductions."Deduction Table", Empl."Total Allowances1");
                        //NSSF Tier I
                        if HRSetup."NSSF Tier I Code" = Deductions.Code then
                            // GetBracketNSSF1(Deductions."Deduction Table", Empl."Non-Fluctuating Allowance");

                            GetBracketNSSF1(Deductions."Deduction Table", Empl."Total Allowances1");

                        //NSSF Tier II
                        if HRSetup."NSSF Tier II Code" = Deductions.Code then
                            //GetBracketNSSF2(Deductions."Deduction Table", Empl."Non-Fluctuating Allowance");
                            GetBracketNSSF2(Deductions."Deduction Table", Empl."Total Allowances1");

                        // END;

                        Amount := -TableAmount;
                        // "Employer Amount" := -TableAmount;
                        //nssf emp
                        if Deductions."Pension Scheme" then
                            "Employer Amount" := TableAmount
                        else
                            "Employer Amount" := 0;
                    end;

                    //*******Upto here

                    //END;
                    Validate(Amount);
                end;
                /*
              //*********Special Deductions.....Loans,Staff welfare,Union Dues etc....Keep track*****
               IF (Type=Type::Deduction) THEN BEGIN
                IF Deductions.GET(Code) THEN
                BEGIN
                IF Deductions.Loan=TRUE THEN BEGIN
                IF Loan.GET(Rec.Code,Rec."Employee No") THEN BEGIN
                     Description:=Deductions.Description;
                     "G/L Account":=Deductions."G/L Account";
                    "Tax Deductible":=Deductions."Tax deductible";
                    "Effective Start Date":=Loan."Repayment Begin Date";
                    "Effective End Date":=Loan."Repayment End Date";
                     {****New addition to take care of compound interest***}
                     Loan.CALCFIELDS(Loan."Cumm. Period Repayments1");
                     ReducedBal:=Loan."Loan Amount"-Loan."Cumm. Period Repayments1";
                     InterestAmt:=Loan."Interest Rate"/(100);
                     InterestAmt:=-ReducedBal*InterestAmt;
                     Amount:=-Loan."Period Repayments"+InterestAmt;
                     "Interest Amount":=InterestAmt;
                     "Period Repayment":=Loan."Period Repayments";
                     {****ENDS HERE*****}
                     "Initial Amount":=Loan."Loan Amount";
                     "Outstanding Amount":=Loan."Loan Amount"+Loan."Amount Paid"+Rec.Amount;
                     "Loan Repay":=TRUE;
                     InterestDiff:=((Loan."External Interest Rate"-Loan."Interest Rate")/(12*100));
                  //**LOW INTEREST RATE CALCULATION
                     IF Deductions."Loan Type"=Deductions."Loan Type"::"Low Interest Benefit" THEN
                     BEGIN
                     Benefits.RESET;
                     //Benefits.SETRANGE(Benefits."Low Interest Benefit",TRUE);
                     IF Benefits.FIND('-') THEN
                                CreateLIBenefit("Employee No",Benefits."Tax Band",ReducedBal)
                      ELSE
                      ERROR('Low Interest Rate Benefit has not been defined in the Earnings Setup please');
                   END;

                   END
                 ELSE
                 ERROR('EMPLOYEE %1  HAS NOT TAKEN THIS TYPE OF LOAN -Loan Code-- %2',"Employee No",Deductions.Code );


                END;

                VALIDATE(Amount);
                END;

                END;
               */

                // Added for Loan deductions

                if (Type = Type::Loan) then begin
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No", Code);
                    LoanApp.SetRange(LoanApp."Employee No", "Employee No");
                    if LoanApp.Find('-') then begin
                        if LoanProductType.Get(LoanApp."Loan Product Type") then
                            Description := LoanProductType.Description;
                        Amount := -LoanApp.Repayment;
                        Validate(Amount);
                    end;

                end;
                //**********END**************************************************************************
                if "Effective End Date" <> 0D then begin
                    if "Payroll Period" > "Effective End Date" then;
                    //ERROR('The effective end date %1 has already lapsed...',"Effective End Date");
                end;
                if "Effective Start Date" <> 0D then begin
                    if "Payroll Period" < "Effective Start Date" then;
                    // ERROR('The effective Start date %1 for this earning has not yet arrived...',"Effective Start Date");
                end;
                //*********************based on salary scale*****************
                Emp.Reset;
                Emp.SetRange("No.", "Employee No");
                if Emp.FindFirst then begin
                    ScaleBenefits.Reset;
                    ScaleBenefits.SetRange(ScaleBenefits."ED Code", Code);
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer", Emp.Present);
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Scale", Emp."Salary Scale");
                    if ScaleBenefits.FindFirst then begin
                        Amount := ScaleBenefits.Amount;
                    end;
                end;
                //
            end;
        }
        field(5; "Effective Start Date"; Date)
        {
        }
        field(6; "Effective End Date"; Date)
        {
        }
        field(7; "Payroll Period"; Date)
        {
            NotBlank = false;
            TableRelation = "Payroll PeriodX"."Starting Date";
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = true;

            trigger OnValidate()
            begin

                if PayPeriod.Get("Payroll Period") then
                    "Pay Period" := PayPeriod.Name;
            end;
        }
        field(8; Amount; Decimal)
        {
            DecimalPlaces = 0 : 4;

            trigger OnValidate()
            begin
                if (Type = Type::Payment) then
                    if Payments.Get(Code) then
                        if Payments."Reduces Tax" then begin
                            //Amount:=-Amount;
                        end;
                //Amount:=-Amount;
                if "Negative Earning" = true then begin
                    if Amount > 0 then
                        Error('Earning must not be positive');

                end else begin
                    if (Type = Type::Payment) then
                        if Amount < 0 then
                            Error('Earning must not be negative');

                end;

                if (Type = Type::Deduction) then begin
                    //IF Empl.GET("Employee No") THEN
                    //BEGIN
                    //IF Empl."Pays tax?"=TRUE THEN

                    if Deductions.Get(Code) then begin

                        if Deductions."Both Signs" = false then begin
                            if Amount > 0 then
                                Amount := -Amount;


                            //update closing Balance;

                            if Deductions."Balance Type" = Deductions."balance type"::Decreasing then
                                "Closing Balance" := "Opening Balance" + Amount;
                            if Deductions."Balance Type" = Deductions."balance type"::Increasing then
                                "Closing Balance" := "Opening Balance" - Amount;
                            //END;

                            //end update closing balance

                        end;
                    end;

                end;
                //END;
                //TESTFIELD(Closed,FALSE);
                //Added
                if "Loan Repay" = true then begin
                    if Loan.Get(Rec.Code, Rec."Employee No") then begin
                        Loan.CalcFields(Loan."Cumm. Period Repayments");
                        "Period Repayment" := Abs(Amount) + "Interest Amount";
                        "Initial Amount" := Loan."Loan Amount";
                        // MESSAGE('amount %1  Cul repayment %2',Amount,Loan."Cumm. Period Repayments1");
                        "Outstanding Amount" := Loan."Loan Amount" - Loan."Cumm. Period Repayments";
                    end;
                end;
                Amount := PayrollRounding(Amount);
                if "Manual Entry" then begin
                    if Empl.Get("Employee No") then begin
                        Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                        Empl.CalcFields(Empl."Total Allowances1", Empl."Total Deductions");
                        /*
                        IF ((Empl."Total Allowances"+Empl."Total Deductions")+Amount)<0 THEN
                        ERROR('Assigning this deduction for Employee %1 will result in a negative pay, Total allowances=%2 Total deductions=%3'
                        ,"Employee No",Empl."Total Allowances",Empl."Total Deductions");
                         */
                    end;
                end;

                if not "Manual Entry" then begin
                    if Empl.Get("Employee No") then begin
                        Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");

                        Empl.CalcFields(Empl."Total Allowances1", Empl."Total Deductions");

                        /*IF ((Empl."Total Allowances1"+Empl."Total Deductions"))<0 THEN
                        MESSAGE('Assigning this deduction for Employee %1 will result in a negative pay, Total allowances=%2 Total deductions=%3'
                        ,"Employee No",Empl."Total Allowances1",Empl."Total Deductions");
                        */
                    end;
                end;

            end;
        }
        field(9; Description; Text[80])
        {

            trigger OnValidate()
            begin
                //TESTFIELD(Closed,FALSE);
            end;
        }
        field(10; Taxable; Boolean)
        {

            trigger OnValidate()
            begin
                //TESTFIELD(Closed,FALSE);
            end;
        }
        field(11; "Tax Deductible"; Boolean)
        {

            trigger OnValidate()
            begin
                //TESTFIELD(Closed,FALSE);
            end;
        }
        field(12; Frequency; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(13; "Pay Period"; Text[30])
        {
        }
        field(14; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(15; "Basic Pay"; Decimal)
        {
        }
        field(16; "Employer Amount"; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                //TESTFIELD(Closed,FALSE);
            end;
        }
        field(17; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(18; "Next Period Entry"; Boolean)
        {
        }
        field(19; "Posting Group Filter"; Code[20])
        {
            TableRelation = "Employee Posting GroupX";

            trigger OnValidate()
            begin

                if EmpPostingGrp.Get("Posting Group Filter") then begin
                    "Payroll Grouping" := EmpPostingGrp."Payroll Group";
                end;
                TestField(Closed, false);
            end;
        }
        field(20; "Initial Amount"; Decimal)
        {
        }
        field(21; "Outstanding Amount"; Decimal)
        {
        }
        field(22; "Loan Repay"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(23; Closed; Boolean)
        {
            Editable = true;
        }
        field(24; "Salary Grade"; Code[30])
        {
            CalcFormula = lookup(Employee."Salary Scale" where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(25; "Tax Relief"; Boolean)
        {
        }
        field(26; "Interest Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(27; "Period Repayment"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(28; "Non-Cash Benefit"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(29; Quarters; Boolean)
        {
        }
        field(30; "No. of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                HRSetup.Get;
                if Type = Type::Payment then begin
                    if Payments.Get(Code) then begin
                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic after tax" then begin
                            if Empl.Get("Employee No") then
                                if HRSetup."Company overtime hours" <> 0 then
                                    Amount := (Empl."Hourly Rate" * "No. of Units" * Payments."Overtime Factor") * HRSetup."Company overtime hours"
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then
                                Amount := "No. of Units" * Empl."Daily Rate";
                            if Payments."Overtime Factor" <> 0 then
                                Amount := "No. of Units" * Empl."Daily Rate" * Payments."Overtime Factor"

                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then begin
                            if Empl.Get("Employee No") then
                                Amount := "No. of Units" * Payments."Total Amount";
                        end;


                    end;
                end;

                //*****Deductions
                if Type = Type::Deduction then begin
                    if Deductions.Get(Code) then begin
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then
                                Amount := -"No. of Units" * Empl."Hourly Rate"
                        end;

                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Daily Rate " then begin
                            if Empl.Get("Employee No") then
                                Amount := -"No. of Units" * Empl."Daily Rate"
                        end;

                        if Deductions."Calculation Method" = Deductions."calculation method"::"Flat Amount" then begin
                            if Empl.Get("Employee No") then
                                Amount := -"No. of Units" * Deductions."Flat Amount";
                        end;

                    end;
                end;
                TestField(Closed, false);
            end;
        }
        field(31; Section; Code[20])
        {
        }
        field(33; Retirement; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(34; CFPay; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(35; BFPay; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(36; "Opening Balance"; Decimal)
        {

            trigger OnValidate()
            begin

                if (Type = Type::Deduction) then
                    //IF "Opening Balance">0 THEN
                    //"Opening Balance":=-"Opening Balance";

                    if Deductions."Balance Type" = Deductions."balance type"::Decreasing then begin

                        "Closing Balance" := "Opening Balance" + Amount;
                        //AssignMatrix.MODIFY;
                    end;
                if Deductions."Balance Type" = Deductions."balance type"::Increasing then begin
                    "Closing Balance" := "Opening Balance" - Amount;
                    /*
                     AssignMatrix."Opening Balance":=ABS(AssignMatrix."Opening Balance")+amt;
                     AssignMatrix."Closing Balance":=amt-AssignMatrix.Amount;
                     AssignMatrix.MODIFY;
                     */
                end;

                TestField(Closed, false);

            end;
        }
        field(37; DebitAcct; Code[20])
        {
        }
        field(38; CreditAcct; Code[20])
        {
        }
        field(39; Shares; Boolean)
        {
        }
        field(40; "Show on Report"; Boolean)
        {
        }
        field(41; "Earning/Deduction Type"; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(42; "Time Sheet"; Boolean)
        {
        }
        field(43; "Basic Salary Code"; Boolean)
        {
        }
        field(44; "Payroll Group"; Code[20])
        {
            TableRelation = "Employee Posting GroupX".Code;
        }
        field(45; Paye; Boolean)
        {
        }
        field(46; "Taxable amount"; Decimal)
        {
        }
        field(47; "Less Pension Contribution"; Decimal)
        {
        }
        field(48; "Monthly Personal Relief"; Decimal)
        {
        }
        field(49; "Normal Earnings"; Boolean)
        {
            Editable = false;
        }
        field(50; "Monthly Self Contribution"; Decimal)
        {
        }
        field(51; "Monthly Self Cummulative"; Decimal)
        {
        }
        field(52; "Company Monthly Contribution"; Decimal)
        {
        }
        field(53; "Company Cummulative"; Decimal)
        {
        }
        field(54; "Main Deduction Code"; Code[20])
        {
        }
        field(55; "Opening Balance Company"; Decimal)
        {
        }
        field(56; "Insurance Code"; Boolean)
        {
        }
        field(57; "Reference No"; Code[50])
        {
        }
        field(58; "Manual Entry"; Boolean)
        {
        }
        field(59; "Salary Pointer"; Code[20])
        {
        }
        field(60; "Employee Voluntary"; Decimal)
        {

            trigger OnValidate()
            begin
                //Amount:=-(ABS(Amount)+"Employee Voluntary");
            end;
        }
        field(61; "Employer Voluntary"; Decimal)
        {
        }
        field(62; "Loan Product Type"; Code[20])
        {
            TableRelation = "Loan Product Type".Code;
        }
        field(63; "June Paye"; Decimal)
        {
        }
        field(64; "June Taxable Amount"; Decimal)
        {
        }
        field(65; "June Paye Diff"; Decimal)
        {
        }
        field(66; "Gratuity PAYE"; Decimal)
        {

            trigger OnValidate()
            begin
                if Paye = true then
                    Modify;
            end;
        }
        field(67; "Basic Pay Arrears"; Boolean)
        {
        }
        field(68; "Negative Earning"; Boolean)
        {
        }
        field(69; "No. Of Hours"; Decimal)
        {

            trigger OnValidate()
            begin
                /*Emp.GET("Employee No");
                
                Emp.TESTFIELD(Emp."Posting Group");
                
                EmpPostingGrp.GET(Emp."Posting Group");
                
                HRSetup.GET;
                HRSetup.TESTFIELD(HRSetup."Overtime @1.5 Code");
                HRSetup.TESTFIELD(HRSetup."Overtime @2.0 Code");
                //HRSetup.TESTFIELD(HRSetup."Absence Code");
                
                if Code=HRSetup."Overtime @1.5 Code" then begin
                HRSetup.TESTFIELD(HRSetup."Basic Salary Code");
                IF AssignMatrix.GET(."Employee No","Assignment Matrix-X".Type::Payment,HRSetup."Basic Salary Code",
                "Assignment Matrix-X"."Payroll Period") THEN BEGIN
                
                //AssignMatrix2.INIT;
                VALIDATE("Assignment Matrix-X"."Employee No");
                Type:="Assignment Matrix-X".Type::Payment;
                //"Assignment Matrix-X".Code:=HRSetup."Overtime @1.5 Code";
                //"Assignment Matrix-X".VALIDATE(Code);
                
                //"Assignment Matrix-X".Amount:=ROUND(("Assignment Matrix-X"."No. Of Hours"/225*AssignMatrix.Amount*1.5),1);
                Amount:=ROUND(("Assignment Matrix-X"."No. Of Hours"/EmpPostingGrp."Overtime Base Hrs"
                *AssignMatrix.Amount*1.5),1);
                "Assignment Matrix-X".VALIDATE(Amount);
                "Assignment Matrix-X".INSERT;
                
                END;
                
                end;
                */

            end;
        }
        field(70; "Profit Centre"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROFITCTR'));
        }
        field(71; Branch; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCH'));
        }
        field(72; "Pay Point"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PAYPOINT'));
        }
        field(73; "Staffing Group"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('STAFFINGGRP'));
        }
        field(74; "Days Worked/Lost"; Decimal)
        {
        }
        field(75; "Closing Balance"; Decimal)
        {
        }
        field(76; "Closing Balance Company"; Decimal)
        {
        }
        field(77; "Company Advance"; Boolean)
        {
        }
        field(78; "Advance Interest"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(79; "Payroll Grouping"; Option)
        {
            Editable = false;
            FieldClass = Normal;
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(80; Rank; Option)
        {
            OptionCaption = 'ADMIN';
            OptionMembers = ADMIN;
        }
        field(81; "First Name"; Text[30])
        {
            CalcFormula = lookup(Employee."First Name" where("No." = field("Employee No")));
            Caption = 'First Name';
            FieldClass = FlowField;
        }
        field(82; "Middle Name"; Text[30])
        {
            CalcFormula = lookup(Employee."Middle Name" where("No." = field("Employee No")));
            Caption = 'Middle Name';
            FieldClass = FlowField;
        }
        field(83; "Last Name"; Text[30])
        {
            CalcFormula = lookup(Employee."Last Name" where("No." = field("Employee No")));
            Caption = 'Last Name';
            FieldClass = FlowField;
        }
        field(84; "KRA Classification"; Option)
        {
            OptionCaption = ' ,Basic,HouseAllowance,TransportAllowance,Leave,OT,DirectorsFees,LumpSum,Others,NonCashBenefit,MPR,InsuranceRelief';
            OptionMembers = " ",Basic,HouseAllowance,TransportAllowance,Leave,OT,DirectorsFees,LumpSum,Others,NonCashBenefit,MPR,InsuranceRelief;
        }
        field(85; "Non-Fluctuating"; Boolean)
        {
            Editable = false;
        }
        field(86; "Loan No"; Code[20])
        {
        }
        field(87; Interest; Boolean)
        {
        }
        field(88; "Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
        }
        field(89; "Gratuity Amount"; Decimal)
        {
        }
        field(50000; "Hours 1.5"; Integer)
        {
        }
        field(50001; "Hours 2.0"; Integer)
        {
        }
        field(50002; "Leave Days"; Integer)
        {
        }
        field(50003; "Employee Name"; Text[100])
        {
            CalcFormula = lookup(Employee.Initials where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(50004; interest2; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where("Payroll Period" = field("Payroll Period"),
                                                                     "Employee No" = field("Employee No"),
                                                                     "Loan No" = field("Loan No"),
                                                                     Type = filter(Deduction),
                                                                     Interest = filter(true)));
            FieldClass = FlowField;
        }
        field(50005; MainLoanCode; Code[50])
        {
            CalcFormula = lookup("Loan Product Type"."Deduction Code" where("Interest Deduction Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(50006; Lostdays; Integer)
        {
        }
        field(50007; Status; enum "Employee Status") { }
        field(50008; "OP Deduction"; Boolean)
        {
            CalcFormula = lookup(DeductionsX."OP Deduction" where(Code = field(Code)));
            FieldClass = FlowField;
        }
        field(65000; "Job No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(65001; "Job Task No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));
        }
        field(65002; Honoraria; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65003; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee No"),
                                                                  Code = field(Code)));
            FieldClass = FlowField;
        }
        field(65004; SACCO; Boolean)
        {
            CalcFormula = lookup(DeductionsX.SACCO where(Code = field(Code)));
            FieldClass = FlowField;
        }
        field(65005; "Is Insuarance?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65006; "Show on Payslip Information"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65007; "Total Icea Employer Amount"; decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where(Type = const(Deduction),
                                                                             Code = const('D056'),
                                                                             "Payroll Period" = field("Payroll Period")
                                                                            ));

        }
        field(65008; "Is Personal Insurance"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65009; "PAYE Arrears"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Employee No", Type, "Code", "Payroll Period", "Reference No")
        {
            Clustered = true;
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Closing Balance";
        }
        key(Key2; "Employee No", Taxable, "Tax Deductible", Retirement, "Non-Cash Benefit", "Tax Relief", "Non-Fluctuating")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key3; Type, "Code", "Posting Group Filter")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key4; "Non-Cash Benefit")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key5; Quarters)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key6; "Non-Cash Benefit", Taxable)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key7; Type, Retirement)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key8; "Department Code", "Payroll Period", "Code")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key9; "Employee No", Shares)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key10; Closed, "Code", Type, "Employee No")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key11; "Show on Report")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key12; "Employee No", "Code", "Payroll Period", "Next Period Entry")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key13; "Opening Balance")
        {
        }
        key(Key14; "Department Code", "Payroll Period", Type, "Code")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key15; "Basic Salary Code", "Basic Pay Arrears")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key16; Paye)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Taxable amount";
        }
        key(Key17; "Employee No", "Payroll Period", Type, "Non-Cash Benefit", "Normal Earnings")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Taxable amount";
        }
        key(Key18; "Posting Group Filter")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Taxable amount";
        }
        key(Key19; "Payroll Period", Type, "Code", "Payroll Grouping", "Department Code", Branch, "Profit Centre", Rank, "Posting Group Filter")
        {
            SumIndexFields = Amount;
        }
        key(Key20; Type, "Employee No", "Payroll Period", "Insurance Code")
        {
            SumIndexFields = Amount;
        }
        key(Key21; Description)
        {
            SumIndexFields = Amount;
        }
        key(Key22; "KRA Classification")
        {
            SumIndexFields = Amount;
        }
        key(Key23; "Tax Relief", "Employee No", "KRA Classification", Amount, "Non-Cash Benefit")
        {
            SumIndexFields = Amount;
        }
        key(Key24; "Payroll Period")
        {
            SumIndexFields = Amount;
        }
        key(Key25; "Employee No", "Payroll Period")
        {
            SumIndexFields = "Closing Balance";
        }
        key(Key26; Interest, Type, "Employee No", "Loan Product Type")
        {
            SumIndexFields = Amount;
        }
        key(Key27; "Department Code", "Posting Group Filter", "Payroll Period", Type)
        {
            SumIndexFields = "Employer Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        // TESTFIELD(Closed,FALSE);
        //
        // IF Paye THEN
        // ERROR('You cannot manually delete P.A.Y.E');
    end;

    trigger OnInsert()
    begin
        TestField(Closed, false);//Hapa

    end;

    trigger OnModify()
    begin

        // TESTFIELD(Closed,FALSE);
        //
        // IF Paye THEN
        // ERROR('You cannot manually edit or change P.A.Y.E');
        // IF CFPay THEN
        // ERROR('You cannot manually edit or change Carry Forward pay');
        //
        // IF BFPay THEN
        // ERROR('You cannot manually edit or change Brought Forward pay');
    end;

    trigger OnRename()
    begin
        //TESTFIELD(Closed,FALSE);//Hapa
    end;

    var
        Payments: Record EarningsX;
        Deductions: Record DeductionsX;
        Paydeduct: Decimal;
        Empl: Record Employee;
        PayPeriod: Record "Payroll PeriodX";
        Loan: Record "Loans transactionsX";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        TableAmount: Decimal;
        Basic: Decimal;
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        HRSetup: Record "Human Resources Setup";
        Maxlimit: Decimal;
        Benefits: Record BracketsX;
        InterestDiff: Decimal;
        SalarySteps: Record "Assignment Matrix-X";
        LoanProductType: Record "Loan Product Type";
        LoanApp: Record "Loan Application";
        "reference no": Record "Assignment Matrix-X";
        Emp: Record Employee;
        EmpPostingGrp: Record "Employee Posting GroupX";
        AssignMatrix: Record "Assignment Matrix-X";
        AddBackNSSF: Decimal;
        RepaymentS: Record "Repayment Schedule";
        ScaleBenefits: Record "Scale Benefits";
        AdvancePayment: Record "Advance Payment";
        ScaleBenefits1: Record "Scale Benefits";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Starting Date";
        PayPeriodText := PayPeriod.Name;
    end;


    procedure GetBracket(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX;
    begin
        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin
            repeat
                if ((BasicPay >= BracketTable."Lower Limit") and (BasicPay <= BracketTable."Upper Limit")) then
                    TableAmount := BracketTable.Amount;
            until BracketTable.Next = 0;
        end;
        //ELSE
        //MESSAGE('The Brackets have not been defined');
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
        PaymentDeduction."Payroll Period" := PayStartDate;
        PaymentDeduction.Amount := ReducedBalance * InterestDiff;
        PaymentDeduction."Non-Cash Benefit" := true;
        PaymentDeduction.Taxable := true;
        //PaymentDeduction."Next Period Entry":=TRUE;
        if allowances.Get(BenefitCode) then
            PaymentDeduction.Description := allowances.Description;
        PaymentDeduction.Insert;
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


    procedure FullName(): Text[100]
    begin
        CalcFields("First Name", "Middle Name", "Last Name");
        if "Middle Name" = '' then
            exit("First Name" + ' ' + "Last Name")
        else
            exit("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;


    procedure GetBracketNSSF1(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX;
    begin
        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin
            repeat
                //IF ((BasicPay>=BracketTable."Lower Limit") AND (BasicPay<=BracketTable."Upper Limit")) THEN
                //TableAmount:=BasicPay*BracketTable.Percentage/100;
                if (BasicPay >= BracketTable."Upper Limit") then
                    TableAmount := BracketTable."Upper Limit" * BracketTable.Percentage / 100
                else
                    TableAmount := BasicPay * BracketTable.Percentage / 100;

            until BracketTable.Next = 0;
        end;

        //MESSAGE('%1',TableAmount);

        //ELSE
        //MESSAGE('The Brackets have not been defined');
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
                    //cc to change back 25082023  AssignmentMatrixX.CalcSums("Employer Amount");
                    ActualCont := Abs(AssignmentMatrixX.Amount);
                    EmployerCont := 0;//Abs(AssignmentMatrixX."Employer Amount");
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
                    //cc to change back 25082023  AssignmentMatrixX.CalcSums("Employer Amount");
                    ActualCont := Abs(AssignmentMatrixX.Amount);
                    EmployerCont := 0;//Abs(AssignmentMatrixX."Employer Amount");
                    //   ExcessP:=ABS(Employee."Employee Contribution")+ABS(Employee."Employer Contribution")-HRSetup."Pension Limit Amount";
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

    /*procedure GetBracketNSSF2(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX;
    begin


        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin
            repeat
                if ((BasicPay >= BracketTable."Lower Limit") and (BasicPay < BracketTable."Upper Limit")) then
                    TableAmount := (BasicPay - BracketTable."Lower Limit" + 1) * BracketTable.Percentage / 100;
                if (BasicPay >= BracketTable."Upper Limit") then
                    TableAmount := (BracketTable."Upper Limit" - BracketTable."Lower Limit" + 1) * BracketTable.Percentage / 100;

            until BracketTable.Next = 0;
        end;


        //ELSE
        //MESSAGE('The Brackets have not been defined');
    end;*/
    procedure GetBracketNSSF2(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX;
    begin
        BracketTable.SETRANGE(BracketTable."Table Code", TableCode);
        IF BracketTable.FIND('-') THEN BEGIN
            REPEAT
                IF ((BasicPay >= BracketTable."Lower Limit") AND (BasicPay < BracketTable."Upper Limit")) THEN BEGIN
                    TableAmount := (BasicPay - BracketTable."Lower Limit" + 1) * BracketTable.Percentage / 100;
                    IF TableAmount <> BracketTable.Amount THEN
                        TableAmount := BracketTable.Amount;
                END ELSE
                    IF (BasicPay >= BracketTable."Upper Limit") THEN BEGIN
                        TableAmount := (BracketTable."Upper Limit" - BracketTable."Lower Limit" + 1) * BracketTable.Percentage / 100;
                    END;
            UNTIL BracketTable.NEXT = 0;
        END;
    end;
}

