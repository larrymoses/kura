#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69400 "Payroll Run Temp"
{
    ProcessingOnly = true;
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Temporary Employee";"Temporary Employee")
        {
            DataItemTableView = sorting("No.") where(Status=const(Active));
            RequestFilterFields = "No.","Posting Group";
            column(ReportForNavId_7528; 7528)
            {
            }

            trigger OnAfterGetRecord()
            begin
                  "Temporary Employee".SetRange("Temporary Employee"."Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
                  NETPAY3:=0;
                  CompRec.Get;
                  CompRec.TestField(CompRec."Temp Tax Relief Code");
                 "Temporary Employee".CalcFields("Temporary Employee".Branch,"Temporary Employee".Paypoint,"Temporary Employee"."Staffing Group","Temporary Employee".Department,Insurance);
                
                //NSSF 1 Deduction
                /*
                 Deductions.RESET;
                 Deductions.SETRANGE(Deductions.Code,CompRec."Temp NSSF Tier I Code");
                
                 IF Deductions.FIND('-') THEN BEGIN
                  Assignmatrix.RESET;
                  Assignmatrix.SETRANGE(Assignmatrix.Code,Deductions.Code);
                  Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SETRANGE(Assignmatrix."Employee No","Temporary Employee"."No.");
                
                  Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
                
                IF Assignmatrix.FIND('-') THEN BEGIN
                REPEAT
                
                //IF "Temporary Employee"."Skip NHIF Update"=FALSE THEN BEGIN
                  Assignmatrix.VALIDATE(Assignmatrix.Code);
                  Assignmatrix.MODIFY;
                
                //END;
                UNTIL Assignmatrix.NEXT=0;
                
                END;
                  // end of deletion
                END;
                */
                //NSSF 2 Deduction
                 Deductions.Reset;
                 Deductions.SetRange(Deductions.Code,CompRec."Temp NSSF Tier II Code");
                if Deductions.FindFirst() then begin
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix.Code,Deductions.Code);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",Month);
                    if Assignmatrix.FindFirst() then begin
                //MESSAGE('%1',Assignmatrix.Code);
                repeat
                
                
                //END;
                until Assignmatrix.Next=0;
                
                end else begin
                
                  Assignmatrix.Init;
                  Assignmatrix."Employee No":="Temporary Employee"."No.";
                  Assignmatrix.Type:=Assignmatrix.Type::Deduction;
                  Assignmatrix.Code:=Deductions.Code;
                  Assignmatrix.Validate(Code);
                  Assignmatrix."Payroll Period":=Month;
                  Assignmatrix."Department Code":="Temporary Employee"."Global Dimension 1 Code";
                  //Assignmatrix.Amount:=0;
                  //MESSAGE('Incometax=%1',IncomeTax);
                  //Assignmatrix.Paye:=TRUE;
                  //Assignmatrix."Taxable amount":=TaxableAmount;
                  //Assignmatrix."Less Pension Contribution":=RetireCont;
                  //Assignmatrix.Paye:=TRUE;
                  Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                  Assignmatrix."Posting Group Filter":="Temporary Employee"."Posting Group";
                  Assignmatrix."Profit Centre":="Temporary Employee"."Global Dimension 2 Code";
                  Assignmatrix."Salary Pointer":="Temporary Employee"."Salary Scale";
                  Assignmatrix.Branch:="Temporary Employee".Branch;
                  Assignmatrix."Pay Point":="Temporary Employee".Paypoint;
                  Assignmatrix."Staffing Group":="Temporary Employee"."Staffing Group";
                  Assignmatrix."Department Code":="Temporary Employee".Department;
                  Assignmatrix.Validate(Amount);
                  if Assignmatrix.Amount<>0 then
                   Assignmatrix.Insert;
                
                
                end;
                  // end of deletion
                end;
                
                if Assignmatrix2.Get("Temporary Employee"."No.",Assignmatrix2.Type::Payment
                ,CompRec."Temp Tax Relief Code",Month)=true then begin
                Assignmatrix2.Validate(Assignmatrix2.Code);
                Assignmatrix2.Modify
                end else begin
                
                Assignmatrix.Init;
                Assignmatrix.SetRange(Assignmatrix.Status,"Temporary Employee".Status::Active);
                Assignmatrix."Employee No":="Temporary Employee"."No.";
                Assignmatrix.Validate("Employee No");
                Assignmatrix."Payroll Period":=Month;
                Assignmatrix.Validate("Payroll Period");
                Assignmatrix.Type:=Assignmatrix.Type::Payment;
                Assignmatrix.Code:=CompRec."Temp Tax Relief Code";
                Assignmatrix.Validate(Code);
                //Assignmatrix.Amount:=-NETPAY3;
                Assignmatrix.Validate(Amount);
                  Assignmatrix."Posting Group Filter":="Temporary Employee"."Posting Group";
                  Assignmatrix."Profit Centre":="Temporary Employee"."Global Dimension 2 Code";
                  Assignmatrix.Branch:="Temporary Employee".Branch;
                  Assignmatrix."Pay Point":="Temporary Employee".Paypoint;
                  Assignmatrix."Staffing Group":="Temporary Employee"."Staffing Group";
                  Assignmatrix."Department Code":="Temporary Employee"."Department Name";
                  Assignmatrix."Salary Pointer":="Temporary Employee"."Salary Scale";
                  Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                  Assignmatrix.Insert;
                
                end;
                
                
                
                 Deductions.Reset;
                 Deductions.SetRange(Deductions."PAYE Code",true);
                 if Deductions.Find('-') then begin repeat
                 // Delete all Previous PAYE
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix.Code,Deductions.Code);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",Month);
                  if Assignmatrix.Find('-') then begin
                    repeat
                      Assignmatrix.Delete;
                    until Assignmatrix.Next=0;
                  end;
                  until Deductions.Next=0;
                end;
                
                // validate assigment matrix code incase basic salary change and update calculation based on basic salary
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period",Month);
                if Assignmatrix.Find('-') then begin
                 repeat
                   if Assignmatrix.Type=Assignmatrix.Type::Payment then begin
                    if Earnings.Get(Assignmatrix.Code) then begin
                     ///IF (Earnings."Calculation Method"=Earnings."Calculation Method"::"% of Basic pay") OR AULERIAH
                     if   (Earnings."Calculation Method"=Earnings."calculation method"::"% of Basic after tax") or
                        (Earnings."Calculation Method"=Earnings."calculation method"::"Based on Hourly Rate") then begin
                
                         Assignmatrix.Validate(Code);
                         Assignmatrix.Validate(Assignmatrix."Employee Voluntary");
                         Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);
                         Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                        Assignmatrix.Modify;
                      end;
                    end;
                   end;
                   if Assignmatrix.Retirement=false then begin
                   if Assignmatrix.Type=Assignmatrix.Type::Deduction then begin
                    if Deductions.Get(Assignmatrix.Code) then begin
                     if (Deductions."Calculation Method"=Deductions."calculation method"::"% of Basic Pay") or
                        (Deductions."Calculation Method"=Deductions."calculation method"::"Based on Hourly Rate") or
                        (Deductions."Calculation Method"=Deductions."calculation method"::"Based on Daily Rate ") then begin
                
                         Assignmatrix.Validate(Code);
                         Assignmatrix.Validate(Assignmatrix."Employee Voluntary" );
                         Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);
                         Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                        Assignmatrix.Modify;
                      end;
                    end;
                   end;
                   end;
                   if Assignmatrix.Type=Assignmatrix.Type::Deduction then begin
                    if Deductions.Get(Assignmatrix.Code) then begin
                     if (Deductions."Calculation Method"=Deductions."calculation method"::"Based on Table") then begin
                         //ERROR('Code %1', Assignmatrix.code);
                         Assignmatrix.Validate(Code);
                         Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);
                         Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                        Assignmatrix.Modify;
                      end;
                    end;
                   end;
                 until Assignmatrix.Next=0;
                end;
                
                
                
                //Assign Insurance Relief Daudi
                if "Temporary Employee".Insurance<>0 then
                 begin
                  Earnings.Reset;
                  Earnings.SetCurrentkey("Earning Type");
                  Earnings.SetRange("Earning Type",Earnings."earning type"::"Insurance Relief");
                   if Earnings.Find('-') then
                   begin
                   InsuranceAmount:=0;
                    InsuranceAmount:=Abs("Temporary Employee".Insurance*(Earnings.Percentage/100));
                    if InsuranceAmount>5000 then
                    InsuranceAmount:=Earnings."Maximum Limit";
                    Assignmatrix.Init;
                    Assignmatrix."Employee No":="Temporary Employee"."No.";
                    Assignmatrix.Type:=Assignmatrix.Type::Payment;
                    Assignmatrix.Code:=Earnings.Code;
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period":=Month;
                    Assignmatrix."Department Code":="Temporary Employee"."Global Dimension 1 Code";
                    Assignmatrix.Amount:=InsuranceAmount;
                    Assignmatrix."Posting Group Filter":="Temporary Employee"."Posting Group";
                    Assignmatrix."Profit Centre":="Temporary Employee"."Global Dimension 2 Code";
                    Assignmatrix.Branch:="Temporary Employee".Branch;
                    Assignmatrix."Salary Pointer":="Temporary Employee"."Salary Scale";
                    Assignmatrix."Pay Point":="Temporary Employee".Paypoint;
                    Assignmatrix."Staffing Group":="Temporary Employee"."Staffing Group";
                    Assignmatrix."Department Code":="Temporary Employee".Department;
                    Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                    Assignmatrix.Validate(Amount);
                    if (Assignmatrix.Amount<>0) and
                       (not Assignmatrix.Get(Assignmatrix."Employee No",Assignmatrix.Type,
                            Assignmatrix.Code,Assignmatrix."Payroll Period",Assignmatrix."Reference No")) then
                     Assignmatrix.Insert
                    else begin
                    InsuranceAmount:=Abs("Temporary Employee".Insurance*(Earnings.Percentage/100));
                    if InsuranceAmount>5000 then
                    InsuranceAmount:=Earnings."Maximum Limit";
                    Assignmatrix.Init;
                    Assignmatrix."Employee No":="Temporary Employee"."No.";
                    Assignmatrix.Type:=Assignmatrix.Type::Payment;
                    Assignmatrix.Code:=Earnings.Code;
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period":=Month;
                    Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                    Assignmatrix."Department Code":="Temporary Employee"."Global Dimension 1 Code";
                    Assignmatrix.Amount:=InsuranceAmount;
                    Assignmatrix."Posting Group Filter":="Temporary Employee"."Posting Group";
                    Assignmatrix."Profit Centre":="Temporary Employee"."Global Dimension 2 Code";
                    Assignmatrix."Salary Pointer":="Temporary Employee"."Salary Scale";
                    Assignmatrix.Branch:="Temporary Employee".Branch;
                    Assignmatrix."Pay Point":="Temporary Employee".Paypoint;
                    Assignmatrix."Staffing Group":="Temporary Employee"."Staffing Group";
                    Assignmatrix."Department Code":="Temporary Employee".Department;
                    Assignmatrix.Validate(Amount);
                    Assignmatrix.Modify;
                    end;
                   end;
                 end;
                //
                
                
                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code",true);
                if Deductions.Find('-') then begin
                
                  GetPaye.CalculateTaxableAmountTemp("Temporary Employee"."No.", Month,IncomeTax,TaxableAmount,RetireCont);
                // Create PAYE
                  Assignmatrix.Init;
                  Assignmatrix."Employee No":="Temporary Employee"."No.";
                  Assignmatrix.Type:=Assignmatrix.Type::Deduction;
                  Assignmatrix.Code:=Deductions.Code;
                  Assignmatrix.Validate(Code);
                  Assignmatrix."Payroll Period":=Month;
                  Assignmatrix."Department Code":="Temporary Employee"."Global Dimension 1 Code";
                  if IncomeTax>0 then
                  IncomeTax:=-IncomeTax;
                  Assignmatrix.Amount:=IncomeTax;
                  //MESSAGE('Incometax=%1',IncomeTax);
                  Assignmatrix.Paye:=true;
                  //MESSAGE('TaxableAmount=%1',TaxableAmount);
                  Assignmatrix."Taxable amount":=TaxableAmount;
                  Assignmatrix."Less Pension Contribution":=RetireCont;
                  Assignmatrix.Paye:=true;
                  Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                  Assignmatrix."Posting Group Filter":="Temporary Employee"."Posting Group";
                  Assignmatrix."Profit Centre":="Temporary Employee"."Global Dimension 2 Code";
                  Assignmatrix.Branch:="Temporary Employee".Branch;
                  Assignmatrix."Pay Point":="Temporary Employee".Paypoint;
                  Assignmatrix."Staffing Group":="Temporary Employee"."Staffing Group";
                  Assignmatrix."Department Code":="Temporary Employee".Department;
                  Assignmatrix."Salary Pointer":="Temporary Employee"."Salary Scale";
                  Assignmatrix.Validate(Amount);
                  if Assignmatrix.Amount<>0 then
                   Assignmatrix.Insert;
                 end else
                 Error('Must specify Paye Code under deductions');
                
                //Update Pay Mode
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period",Month);
                 if Assignmatrix.Find('-') then
                     repeat
                       if "Temporary Employee"."Payroll Pay Mode"<>Assignmatrix."Pay Mode" then
                         begin
                          Assignmatrix."Pay Mode":="Temporary Employee"."Payroll Pay Mode";
                          Assignmatrix.Modify;
                         end;
                     until Assignmatrix.Next=0;
                //
                
                if (("Temporary Employee"."Terminal Dues"=true) and ("Temporary Employee"."Pays tax?"=true)) then begin
                "Temporary Employee".SetRange("Temporary Employee"."Pay Period Filter",Month);
                "Temporary Employee".CalcFields("Temporary Employee"."Total Allowances","Temporary Employee"."Total Deductions");
                
                //NHIF deduction
                
                 Deductions.Reset;
                 Deductions.SetRange(Deductions.Code,CompRec."Temp NHIF Code");
                  if Deductions.Find('-') then begin
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix.Code,Deductions.Code);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",Month);
                if Assignmatrix.Find('-') then begin
                repeat
                  Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                  Assignmatrix.Validate(Assignmatrix.Code);
                  Assignmatrix.Modify;
                until Assignmatrix.Next=0;
                
                end;
                  // end of deletion
                end;
                
                NETPAY3:="Temporary Employee"."Total Allowances"+"Temporary Employee"."Total Deductions";
                
                if  NETPAY3<>0 then begin
                
                
                Assignmatrix.Init;
                Assignmatrix."Employee No":="Temporary Employee"."No.";
                Assignmatrix.Validate("Employee No");
                Assignmatrix."Payroll Period":=Month;
                Assignmatrix.Validate("Payroll Period");
                Assignmatrix.Type:=Assignmatrix.Type::Deduction;
                Assignmatrix.Code:=CompRec."Temp Net Pay Advance Code";
                Assignmatrix.Validate(Code);
                Assignmatrix.Amount:=-NETPAY3;
                Assignmatrix.Validate(Amount);
                Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                  Assignmatrix."Posting Group Filter":="Temporary Employee"."Posting Group";
                  Assignmatrix."Profit Centre":="Temporary Employee"."Global Dimension 2 Code";
                  Assignmatrix.Branch:="Temporary Employee".Branch;
                  Assignmatrix."Pay Point":="Temporary Employee".Paypoint;
                  Assignmatrix."Salary Pointer":="Temporary Employee"."Salary Scale";
                  Assignmatrix."Staffing Group":="Temporary Employee"."Staffing Group";
                  Assignmatrix."Department Code":="Temporary Employee".Department;
                
                
                if Assignmatrix2.Get(Assignmatrix."Employee No",Assignmatrix.Type::Deduction
                ,Assignmatrix.Code,Assignmatrix."Payroll Period")=true then
                Assignmatrix.Modify
                else
                Assignmatrix.Insert;
                end;
                
                //MESSAGE('%1',NETPAY3);
                //CurrReport.SKIP;
                end;
                
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix.Code,'869');
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",Month);
                  Assignmatrix.DeleteAll;
                
                
                 LoanBalance:=0;
                 LoanApplication.Reset;
                 LoanApplication.SetRange(LoanApplication."Employee No","Temporary Employee"."No.");
                 if LoanApplication.Find('-') then
                 repeat
                 if LoanType.Get(LoanApplication."Loan Product Type") then
                 begin
                 LoanApplication.SetRange(LoanApplication."Date filter",0D,LastMonth);
                 LoanApplication.CalcFields(LoanApplication."Total Repayment");
                 LoanBalance:=LoanApplication."Approved Amount"+LoanApplication."Total Repayment";
                 //MESSAGE('%1 Balance =%2',LoanApplication."Loan No",LoanBalance);
                
                
                 if LoanBalance<LoanApplication.Repayment then
                 begin
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix.Code,LoanType."Deduction Code");
                  Assignmatrix.SetRange("Reference No",LoanApplication."Loan No");
                  if Assignmatrix.Find('+') then
                  begin
                  if LoanBalance>0 then
                  Assignmatrix.Amount:=-LoanBalance
                  else
                  begin
                  Assignmatrix.Amount:=0;
                
                  end;
                  Assignmatrix."Next Period Entry":=false;
                
                  Assignmatrix.Modify;
                  end;
                
                
                 end;
                
                
                 if LoanType."Calculate Interest" then
                 begin
                
                 LoanApplication.SetRange(LoanApplication."Date filter",0D,LastMonth);
                 LoanApplication.CalcFields(LoanApplication."Total Repayment");
                 LoanBalance:=LoanApplication."Approved Amount"+LoanApplication."Total Repayment";
                 InterestAmt:=(LoanType."Interest Rate"/100)*LoanBalance;
                
                
                
                 if InterestAmt<>0 then
                 begin
                   Assignmatrix.Init;
                  Assignmatrix."Employee No":="Temporary Employee"."No.";
                  Assignmatrix.Type:=Assignmatrix.Type::Deduction;
                  Assignmatrix.Code:=LoanType."Interest Deduction Code";
                  Assignmatrix.Validate(Code);
                  Assignmatrix."Payroll Period":=Month;
                  Assignmatrix."Department Code":="Temporary Employee"."Global Dimension 1 Code";
                  Assignmatrix.Amount:=-InterestAmt;
                  Assignmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
                  Assignmatrix."Reference No":=LoanApplication."Loan No";
                  Assignmatrix."Posting Group Filter":="Temporary Employee"."Posting Group";
                
                  if not Assignmatrix.Get(Assignmatrix."Employee No",Assignmatrix.Type,Assignmatrix.Code,Assignmatrix."Payroll Period",
                  Assignmatrix."Reference No") then
                
                  Assignmatrix.Insert
                  else
                  begin
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix.Code,LoanType."Interest Deduction Code");
                  Assignmatrix.SetRange(Assignmatrix."Reference No",LoanApplication."Loan No");
                  if Assignmatrix.Find('-') then
                   begin
                   Assignmatrix.Amount:=-InterestAmt;
                   Assignmatrix.Modify;
                   end;
                  end;
                
                
                 end;
                 end;
                
                 if LoanApplication."Stop Loan" then
                 begin
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix.Code,LoanType."Deduction Code");
                  Assignmatrix.SetRange(Assignmatrix."Reference No",LoanApplication."Loan No");
                  Assignmatrix.DeleteAll;
                
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",DateSpecified);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix.Code,LoanType."Interest Deduction Code");
                  Assignmatrix.SetRange(Assignmatrix."Reference No",LoanApplication."Loan No");
                  Assignmatrix.DeleteAll;
                 end;
                 end;
                 until LoanApplication.Next=0;
                
                 //Validate Owner Occupier Amount....Fred
                //  Earnings.RESET;
                //  Earnings.SETRANGE(Earnings."Earning Type",Earnings."Earning Type"::"Owner Occupier");
                //  IF Earnings.FIND('-') THEN
                //    BEGIN
                //      Assignmatrix.RESET;
                //      Assignmatrix.SETRANGE(Assignmatrix.Code,Earnings.Code);
                //      Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Payment);
                //      Assignmatrix.SETRANGE(Assignmatrix."Employee No","Temporary Employee"."No.");
                //      Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
                //      IF Assignmatrix.FIND('-')THEN
                //        REPEAT
                //          Assignmatrix.VALIDATE(Code);
                //          Assignmatrix.MODIFY;
                //        UNTIL Assignmatrix.NEXT = 0;
                //    END;
                
                //calculate Gratuity for contract "Temporary Employee"s
                
                if "Temporary Employee"."Employement Terms"="Temporary Employee"."employement terms"::Contract then begin
                
                  Assignmatrix.Reset;
                  Assignmatrix.SetRange(Assignmatrix."Basic Salary Code",true);
                  Assignmatrix.SetRange(Assignmatrix.Type,Assignmatrix.Type::Payment);
                  Assignmatrix.SetRange(Assignmatrix."Employee No","Temporary Employee"."No.");
                  Assignmatrix.SetRange(Assignmatrix."Payroll Period",Month);
                
                if Assignmatrix.Find('-') then begin
                //MESSAGE('%1',Assignmatrix.Code);
                repeat
                
                //IF "Temporary Employee"."Skip NHIF Update"=FALSE THEN BEGIN
                CompRec.Get;
                 Assignmatrix."Gratuity Amount":=CompRec."Gratuity Percentage"/100*Assignmatrix.Amount;
                  //Assignmatrix.VALIDATE(Assignmatrix.Code);
                  Assignmatrix.Modify;
                
                //END;
                until Assignmatrix.Next=0;
                
                  end;
                  end;
                
                
                 Window.Update(1,"Temporary Employee"."First Name"+' '+"Temporary Employee"."Middle Name"+ ' '+"Temporary Employee"."Last Name");

            end;

            trigger OnPostDataItem()

            begin
                Assignmatrixv.Reset();
                Assignmatrixv.SetRange("Employee No", "No.");
                Assignmatrixv.SetRange("Payroll Period", "Pay Period Filter");
                if Assignmatrixv.FindSet() then begin
                    repeat
                        Assignmatrixv.Validate(Code);
                        Assignmatrixv.Modify();
                    until Assignmatrixv.Next() = 0;
                end;
                 Window.Close;
            end;

            trigger OnPreDataItem()
            begin
                EmployeeName := FullName();
                Window.Open('Calculating Payroll For ##############################1',EmployeeName);
                PayrollPeriod.SetRange(Closed,false);
                PayrollPeriod.SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
                if PayrollPeriod.Find('-') then
                 Month:=PayrollPeriod."Starting Date";
                LastMonth:=CalcDate('-1M',Month);
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
         UserSetup.Get(UserId);
         GetPayPeriod;
         //PayPeriodtext:=""Temporary Employee" PayrollX".GETFILTER("Pay Period Filter");
        // IF PayPeriodtext='' THEN
        // ERROR('Pay period must be specified for this report');

         //DateSpecified:="Temporary Employee".GETRANGEMIN("Temporary Employee"."Pay Period Filter");
         DateSpecified:=BeginDate;
         if PayPeriod.Get(DateSpecified,UserSetup."Purchase Resp. Ctr. Filter") then
         PayPeriodtext:=PayPeriod.Name;
         EndDate:=CalcDate('1M',DateSpecified-1);
          CompRec.Get;
          TaxCode:=CompRec."Tax Table";

        if not Confirm('You are about to run payroll for period %1 for Region %2, would you like to proceed?',true,DateSpecified,UserSetup."Purchase Resp. Ctr. Filter") then
          Error('Action Rejected');
        PayrollHeaderT.Reset;
        PayrollHeaderT.SetRange(PayrollHeaderT."Payroll Period",DateSpecified);
        PayrollHeaderT.SetFilter(PayrollHeaderT.Status,'<>%1',PayrollHeaderT.Status::Open);
        if PayrollHeaderT.FindFirst then
          Error('A %1 salary voucher %2 already exists for this pay period, this action is not permitted',PayrollHeaderT.Status,PayrollHeaderT."No.");
    end;

    var
        Assignmatrix: Record "Assignment Matrix-X Temp-E";
        Assignmatrixv: Record "Assignment Matrix-X Temp-E";
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
        EmpRec: Record "Temporary Employee";
        NetPay: Decimal;
        NetPay1: Decimal;
        Index: Integer;
        Intex: Integer;
        AmountRemaining: Decimal;
        PayPeriod: Record "Payroll PeriodXT";
        DenomArray: array [1,12] of Text[50];
        NoOfUnitsArray: array [1,12] of Integer;
        AmountArray: array [1,60] of Decimal;
        PayMode: Text[30];
        PayPeriodtext: Text[30];
        EndDate: Date;
        DaysinAmonth: Decimal;
        HoursInamonth: Decimal;
        Earnings: Record "EarningsX Temp-E";
        CfMpr: Decimal;
        Deductions: Record "DeductionsX Temp-E";
        NormalOvertimeHours: Decimal;
        WeekendOvertime: Decimal;
        PayrollPeriod: Record "Payroll PeriodXT";
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
        Ded: Record "DeductionsX Temp-E";
        Assmatrix: Record "Assignment Matrix-X Temp-E";
        LoanType: Record "Loan Product Type";
        LoanApplication: Record "Loan Application";
        LoanBalance: Decimal;
        InterestAmt: Decimal;
        RefNo: Code[20];
        LastMonth: Date;
        NextPointer: Code[10];
        UserRole: Record "Access Control";
        NETPAY3: Decimal;
        Assignmatrix2: Record "Assignment Matrix-X Temp-E";
        InsuranceAmount: Decimal;
        TemporaryEmployee: Record "Temporary Employee";
        UserSetup: Record "User Setup";
        PayrollHeaderT: Record "Payroll HeaderT";


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
          AmountRemaining:=TaxableAmount;
          //AmountRemaining:=ROUND(AmountRemaining,0.01);
          EndTax:=false;
          TaxTable.SetRange("Table Code",TaxCode);


          if TaxTable.Find('-') then
          begin
            repeat

             if AmountRemaining<=0 then
                EndTax:=true
             else
              begin
               //IF ROUND((TaxableAmount),0.01)>TaxTable."Upper Limit" THEN
                if TaxableAmount>TaxTable."Upper Limit" then
                Tax:=TaxTable."Taxable Amount"*TaxTable.Percentage/100

               else
               begin
                Tax:=AmountRemaining*TaxTable.Percentage/100;
                TotalTax:=TotalTax+Tax;
                EndTax:=true;
               end;
               if not EndTax then
               begin
               AmountRemaining:=AmountRemaining-TaxTable."Taxable Amount";
               TotalTax:=TotalTax+Tax;
               end;
              end;
            until (TaxTable.Next=0) or EndTax=true;
          end;
          TotalTax:=TotalTax;
          TotalTax:=PayrollRounding(TotalTax);
          IncomeTax:=-TotalTax;
          if not "Temporary Employee"."Pays tax?" then
          IncomeTax:=0;
    end;


    procedure GetPayPeriod()
    begin
         UserSetup.Get(UserId);
         PayPeriod.SetRange(PayPeriod."Close Pay",false);
         PayPeriod.SetRange(PayPeriod."Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
         if PayPeriod.Find('-') then
         begin
          //PayPeriodtext:=PayPeriod.Name;
          BeginDate:=PayPeriod."Starting Date";
         end;
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

            HRsetup.Get;
            if HRsetup."Payroll Rounding Precision"=0 then
               Error('You must specify the rounding precision under HR setup');

          if HRsetup."Payroll Rounding Type"=HRsetup."payroll rounding type"::Nearest then
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'=');

          if HRsetup."Payroll Rounding Type"=HRsetup."payroll rounding type"::Up then
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'>');

          if HRsetup."Payroll Rounding Type"=HRsetup."payroll rounding type"::Down then
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'<');
    end;


    procedure DefaultAssignment(EmployeeRec: Record "Temporary Employee")
    var
        ScaleBenefits: Record "Scale Benefits";
    begin
        GetPayPeriod;
         if BeginDate<>0D then
         begin
           Assmatrix.Init;
           Assignmatrix."Employee No" := "Temporary Employee"."No.";
           Assmatrix.Type:=Assmatrix.Type::Payment;
           Assmatrix."Payroll Period":=BeginDate;
           Assmatrix."Department Code":="Temporary Employee"."Global Dimension 1 Code";
           ScaleBenefits.Reset;
           ScaleBenefits.SetRange("Salary Scale","Temporary Employee"."Salary Scale");
           ScaleBenefits.SetRange("Salary Pointer","Temporary Employee".Present);
           if ScaleBenefits.Find('-') then
           begin
            repeat
             Assmatrix.Code:=ScaleBenefits."ED Code";
             Assmatrix.Validate(Code);
             Assmatrix.Amount:=ScaleBenefits.Amount;
             Assmatrix.Validate(Amount);
             if not Assmatrix.Get(Assmatrix."Employee No",Assmatrix.Type,Assmatrix.Code,Assmatrix."Payroll Period") then
              Assmatrix.Insert
             else begin
             Assmatrix.Code:=ScaleBenefits."ED Code";
             Assmatrix.Validate(Code);
             Assmatrix.Amount:=ScaleBenefits.Amount;
             Assmatrix.Validate(Amount);
             Assmatrix.Modify;
             end;
            until ScaleBenefits.Next=0;
           end;


          // Insert Deductions assigned to every "Temporary Employee"
         Ded.Reset;
         Ded.SetRange("Applies to All",true);
         if Ded.Find('-') then
         begin
          repeat
           Assmatrix.Init;
           Assmatrix."Employee No":="Temporary Employee"."No.";
           Assmatrix.Type:=Assmatrix.Type::Deduction;
           Assmatrix."Payroll Period":=BeginDate;
           Assmatrix."Department Code":="Temporary Employee"."Global Dimension 1 Code";
           Assmatrix.Code:=Ded.Code;
           Assmatrix."Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
           Assmatrix.Validate(Code);
           if not Assmatrix.Get(Assmatrix."Employee No",Assmatrix.Type,Assmatrix.Code,Assmatrix."Payroll Period") then
            Assmatrix.Insert
           else begin
            Assmatrix.Code:=Ded.Code;
            Assmatrix.Validate(Code);
           end;
          until Ded.Next=0;
          end;

        end;
        Message('Payroll processing completed');
    end;
}

