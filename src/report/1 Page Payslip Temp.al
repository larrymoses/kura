report 69401 "1 Page Payslip Temp"
{
    // ArrEarnings[1,1]
    // ArrEarningsAmt[1,1]
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/1 Page Payslip Temp.rdlc';


    dataset
    {
        dataitem("Temporary Employee";"Temporary Employee")
        {
            RequestFilterFields = "Pay Period Filter","No.","Global Dimension 1 Code";
            column(CoRec_Picture;CoRec.Picture)
            {
            }
            column(CoName;CoName)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____;UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')))
            {
            }
            column(Addr_1__1_;Addr[1][1])
            {
            }
            column(Addr_1__2_;Addr[1][2])
            {
            }
            column(DeptArr_1_1_;DeptArr[1,1])
            {
            }
            column(Message2_1_1_;Message2[1,1])
            {
            }
            column(Message1;Message1)
            {
            }
            column(STRSUBSTNO__Date__1__2__TODAY_TIME_;STRSUBSTNO('Date %1 %2',TODAY,TIME))
            {
            }
            column(USERID;USERID)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            dataitem(Integer;Integer)
            {
                DataItemTableView = SORTING(Number);
                column(ArrEarnings_1_Number_;ArrEarnings[1,Number])
                {
                }
                column(ArrEarningsAmt_1_Number_;ArrEarningsAmt[1,Number])
                {
                }
                column(BalanceArray_1_Number_;BalanceArray[1,Number])
                {
                }
                column(ArrHeadings;ArrHeadings[Number])
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SETRANGE(Number,1,i-1);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                
                 CLEAR(Addr);
                 CLEAR(DeptArr);
                 CLEAR(BasicPay);
                 CLEAR(EmpArray);
                 CLEAR(ArrEarnings);
                 CLEAR(ArrEarningsAmt);
                 CLEAR(BalanceArray);
                 CLEAR(ArrHeadings);
                 GrossPay:=0;
                 TotalDeduction:=0;
                 Totalcoopshares:=0;
                 Totalnssf:=0;
                 NetPay:=0;
                 i:=1;
                 j:=1;
                
                 Addr[1][1]:="Temporary Employee"."No.";
                 Addr[1][2]:="Temporary Employee"."First Name"+' '+"Temporary Employee"."Last Name";
                 // get Department Name
                 DimVal.RESET;
                 DimVal.SETRANGE(DimVal.Code,"Temporary Employee"."Global Dimension 1 Code");
                 DimVal.SETRANGE("Global Dimension No.",1);
                 IF DimVal.FIND('-') THEN
                 DeptArr[1,1]:=DimVal.Name;
                
                // Get Earnings
                Earn.RESET;
                Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Normal Earning");
                Earn.SETRANGE(Earn."Non-Cash Benefit",FALSE);
                IF Earn.FIND('-') THEN BEGIN
                 REPEAT
                  AssignMatrix.RESET;
                  AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                  AssignMatrix.SETRANGE(Type,AssignMatrix.Type::Payment);
                  AssignMatrix.SETRANGE(AssignMatrix."Employee No","Temporary Employee"."No.");
                  AssignMatrix.SETRANGE(Code,Earn.Code);
                  IF AssignMatrix.FIND('-') THEN BEGIN
                   REPEAT
                    ArrEarnings[1,i]:=AssignMatrix.Description;
                    EVALUATE(ArrEarningsAmt[1,i],FORMAT(AssignMatrix.Amount));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                
                    GrossPay:=GrossPay+AssignMatrix.Amount;
                     i:=i+1;
                   UNTIL AssignMatrix.NEXT=0;
                  END;
                 UNTIL Earn.NEXT=0;
                 END;
                
                    ArrEarnings[1,i]:='GROSS PAY';
                    EVALUATE(ArrEarningsAmt[1,i],FORMAT(GrossPay));
                    ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                    j:=j+1;
                    ArrHeadings[i]:=j;
                    i:=i+1;
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                
                    i:=i+1;
                   // Deductions
                    ArrEarnings[1,i]:='Deductions';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                
                    i:=i+1;
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                    i:=i+1;
                
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETRANGE(Type,AssignMatrix.Type::Deduction);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No","Temporary Employee"."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,TRUE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                      ArrEarnings[1,i]:=AssignMatrix.Description;
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                    END;
                
                    i:=i+1;
                
                    //Loans
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No","Temporary Employee"."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                      LoanBalances.RESET;
                      LoanBalances.SETRANGE("Loan No",AssignMatrix."Reference No");
                      LoanBalances.SETRANGE("Deduction Code",AssignMatrix.Code);
                       IF LoanBalances.FIND('-') THEN BEGIN
                          CASE LoanBalances."Interest Calculation Method" OF
                           LoanBalances."Interest Calculation Method"::" ",
                           LoanBalances."Interest Calculation Method"::"Reducing Balance",
                           LoanBalances."Interest Calculation Method"::"Flat Rate":
                            BEGIN
                            IF Deduct.GET(AssignMatrix.Code) THEN
                             IF Deduct."Show Balance" THEN
                             BEGIN
                             LoanBalances.SETRANGE(LoanBalances."Date filter",0D,DateSpecified);
                
                              LoanBalances.CALCFIELDS(LoanBalances."Total Repayment",Receipts);
                              BalanceArray[1,i]:=(LoanBalances."Approved Amount"+LoanBalances."Total Repayment"-ABS(LoanBalances.Receipts));
                             END;
                            //For Each Loan Show the interest amount separately:
                             //Principal:
                             ArrEarnings[1,i]:=AssignMatrix.Description;
                             EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                             ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                             /*
                             //Interest:
                             i:=i+1;
                             ArrEarnings[1,i]:=AssignMatrix.Description+'-Interest';
                             EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix."Loan Interest")));
                             ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                             */
                            END;
                            ELSE
                             BEGIN
                
                            IF Deduct.GET(AssignMatrix.Code) THEN
                             IF Deduct."Show Balance" THEN
                             BEGIN
                             LoanBalances.SETRANGE(LoanBalances."Date filter",0D,DateSpecified);
                
                              LoanBalances.CALCFIELDS(LoanBalances."Total Repayment",Receipts);
                              BalanceArray[1,i]:=(LoanBalances."Approved Amount"+LoanBalances."Total Repayment"-ABS(LoanBalances.Receipts));
                             END;
                
                              //Show Principal only:
                              ArrEarnings[1,i]:=AssignMatrix.Description;
                              EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                              ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                             END;
                          END;
                      END ELSE BEGIN
                        //ArrEarnings[1,i]:=AssignMatrix.Description+' '+AssignMatrix."Insurance No";
                        ArrEarnings[1,i]:=AssignMatrix.Description;
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                        ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                
                      END;
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                
                     IF Deduct.GET(AssignMatrix.Code) THEN
                     BEGIN
                      IF Deduct."Show Balance" THEN
                      BEGIN
                      LoanBalances.RESET;
                      LoanBalances.SETRANGE(LoanBalances."Loan No",AssignMatrix."Reference No");
                      LoanBalances.SETRANGE(LoanBalances."Deduction Code",AssignMatrix.Code);
                     IF LoanBalances.FIND('-') THEN
                     BEGIN
                
                     LoanBalances.SETRANGE(LoanBalances."Date filter",0D,DateSpecified);
                
                     LoanBalances.CALCFIELDS(LoanBalances."Total Repayment",Receipts);
                      CASE LoanBalances."Interest Calculation Method" OF
                        LoanBalances."Interest Calculation Method"::"Reducing Balance":
                        BEGIN
                         //i:=i-1;
                         //BalanceArray[1,i]:=(LoanBalances."Approved Amount"+LoanBalances."Total Repayment");
                         //i:=1+1;
                        END;
                       ELSE
                        BalanceArray[1,i]:=(LoanBalances."Approved Amount"+LoanBalances."Total Repayment"-ABS(LoanBalances.Receipts));
                      END;
                     END
                     ELSE
                     BEGIN
                      Deduct.SETRANGE(Deduct."Employee Filter","Temporary Employee"."No.");
                      Deduct.SETRANGE(Deduct."Pay Period Filter",DateSpecified);          //Share Top Up Added Below
                      Deduct.CALCFIELDS(Deduct."Total Amount",Deduct."Total Amount Employer","Total Closing Balance","Total Closing Balance Employer");
                      BalanceArray[1,i]:=ABS(Deduct."Total Closing Balance")+ABS(Deduct."Total Closing Balance Employer");
                
                      END;
                     END;
                     END;
                
                
                      i:=i+1;
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                
                    ArrEarnings[1,i]:='TOTAL DEDUCTIONS';
                    EVALUATE(ArrEarningsAmt[1,i],FORMAT(TotalDeduction));
                    ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                        i:=i+1;
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                    i:=i+1;
                   // Net Pay
                    ArrEarnings[1,i]:='NET PAY';
                    NetPay:=GrossPay-TotalDeduction;
                    EVALUATE(ArrEarningsAmt[1,i],FORMAT(NetPay));
                    ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                    i:=i+1;
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                    i:=i+1;
                    // taxation
                    ArrEarnings[1,i]:='Taxations';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                    i:=i+1;
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                    i:=i+1;
                    // Non Cash Benefits
                   Earn.RESET;
                   Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Normal Earning");
                   Earn.SETRANGE(Earn."Non-Cash Benefit",TRUE);
                    IF Earn.FIND('-') THEN BEGIN
                     REPEAT
                      AssignMatrix.RESET;
                      AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                      AssignMatrix.SETRANGE(Type,AssignMatrix.Type::Payment);
                      AssignMatrix.SETRANGE(AssignMatrix."Employee No","Temporary Employee"."No.");
                      AssignMatrix.SETRANGE(AssignMatrix."Basic Salary Code",FALSE);
                      AssignMatrix.SETRANGE(Code,Earn.Code);
                      IF AssignMatrix.FIND('-') THEN BEGIN
                       REPEAT
                        ArrEarnings[1,i]:=AssignMatrix.Description;
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(AssignMatrix.Amount));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                
                        i:=i+1;
                       UNTIL AssignMatrix.NEXT=0;
                      END;
                     UNTIL Earn.NEXT=0;
                    END;
                
                    // end of non cash
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETRANGE(Type,AssignMatrix.Type::Deduction);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No","Temporary Employee"."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,TRUE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                      ArrEarnings[1,i]:='Pension contribution benefit';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix."Less Pension Contribution")));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                     TaxableAmt:=0;
                     PAYE:=0;
                     TaxableAmt:=AssignMatrix."Taxable amount";
                      PAYE:=AssignMatrix.Amount;
                     //MESSAGE('%1',PAYE);
                    END;
                
                    //added by Daudi for PWD taxable limit
                
                
                    //end of PWD
                
                
                
                    i:=i+1;
                   /*
                    Earn.RESET;
                    Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Owner Occupier");
                    IF Earn.FIND('-') THEN BEGIN
                     REPEAT
                      AssignMatrix.RESET;
                      AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                      AssignMatrix.SETRANGE(Type,AssignMatrix.Type::Payment);
                      AssignMatrix.SETRANGE(AssignMatrix."Employee No","Temporary Employee"."No.");
                      AssignMatrix.SETRANGE(AssignMatrix."Basic Salary Code",FALSE);
                      AssignMatrix.SETRANGE(Code,Earn.Code);
                      IF AssignMatrix.FIND('-') THEN BEGIN
                       REPEAT
                        ArrEarnings[1,i]:=AssignMatrix.Description;
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(AssignMatrix.Amount));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                
                       i:=i+1;
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                   UNTIL Earn.NEXT=0;
                  END;
                  */
                  // Taxable amount
                      ArrEarnings[1,i]:='Taxable Amount';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(TaxableAmt)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                
                      i:=i+1;
                      ArrEarnings[1,i]:='Tax Charged';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(PAYE)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                
                    i:=i+1;
                
                // Relief
                    Earn.RESET;
                    Earn.SETFILTER(Earn."Earning Type",'%1|%2|%3',Earn."Earning Type"::"Tax Relief",
                    Earn."Earning Type"::"Insurance Relief",Earn."Earning Type"::"Owner Occupier");
                    IF Earn.FIND('-') THEN BEGIN
                     REPEAT
                      AssignMatrix.RESET;
                      AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                      AssignMatrix.SETRANGE(Type,AssignMatrix.Type::Payment);
                      AssignMatrix.SETRANGE(AssignMatrix."Employee No","Temporary Employee"."No.");
                      AssignMatrix.SETRANGE(AssignMatrix."Basic Salary Code",FALSE);
                      AssignMatrix.SETRANGE(Code,Earn.Code);
                      IF AssignMatrix.FIND('-') THEN BEGIN
                       REPEAT
                
                        ArrEarnings[1,i]:=AssignMatrix.Description;
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                        ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                        i:=i+1;
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                   UNTIL Earn.NEXT=0;
                  END;
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                
                     i:=i+1;
                       //Information
                    ArrEarnings[1,i]:='Information';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                    i:=i+1;
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                
                i:=i+1;
                Ded.RESET;
                Ded.SETRANGE(Ded."Tax deductible",TRUE);
                Ded.SETRANGE(Ded."Pay Period Filter",DateSpecified);
                Ded.SETRANGE(Ded."Employee Filter","Temporary Employee"."No.");
                Ded.SETRANGE(Ded."Show on Payslip Information",TRUE);
                IF Ded.FIND('-') THEN
                REPEAT
                //MESSAGE('fOUND');
                Ded.CALCFIELDS(Ded."Total Amount",Ded."Total Amount Employer");
                IF Ded."Total Amount Employer"<>0 THEN
                 BEGIN
                  ArrEarnings[1,i]:=Ded.Description+'(Employer)';
                  EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Ded."Total Amount Employer")));
                  ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                  i:=i+1;
                 END;
                 /* ArrEarnings[1,i]:=Ded.Description;
                  EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Ded."Total Amount")));
                  ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                  i:=i+1;*/
                
                
                
                UNTIL Ded.NEXT=0;
                
                
                
                
                
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                     i:=i+1;
                    ArrEarnings[1,i]:='Employee Details';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                    // Employee details
                     i:=i+1;
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                     i:=i+1;
                
                    ArrEarnings[1,i]:='P.I.N';
                    ArrEarningsAmt[1,i]:="Temporary Employee"."P.I.N";
                
                    i:=i+1;
                
                
                    "Temporary Employee".CALCFIELDS("Bank Name","Bank Branch Name");
                    ArrEarnings[1,i]:='Employee Bank';
                    ArrEarningsAmt[1,i]:="Temporary Employee"."Bank Name";
                
                    i:=i+1;
                    ArrEarnings[1,i]:='Bank Branch';
                    ArrEarningsAmt[1,i]:="Temporary Employee"."Bank Branch Name";
                
                    i:=i+1;
                    ArrEarnings[1,i]:='NSSF No';
                    ArrEarningsAmt[1,i]:="Temporary Employee"."Social Security No.";
                    i:=i+1;
                    ArrEarnings[1,i]:='NHIF No';
                    ArrEarningsAmt[1,i]:="Temporary Employee"."N.H.I.F No";
                    i:=i+1;
                
                    ArrEarnings[1,i]:='Additional Details';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                    // Employee details
                     i:=i+1;
                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                
                     i:=i+1;
                
                    ArrEarnings[1,i]:='RetirementDate';
                    ArrEarningsAmt[1,i]:=FORMAT("Temporary Employee"."Retirement Date");
                    i:=i+1;
                    i:=i+1;
                    IF AdvoMessage <> '' THEN BEGIN
                      j:=j+1;
                      ArrHeadings[i]:=j;
                      ArrEarnings[1,i]:=AdvoMessage;
                      i:=i+1;
                      i:=i+1;
                    END;
                    ArrEarnings[1,i]:='*******End of Payslip********';

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
        Payslip = 'Pay Slip';
        EmpNoCaption = 'Employee No:';
        NameCaption = 'Name:';
        DeptCaption = 'Dept:';
        EarningsCaption = 'Earnings';
        AmountCaption = 'Amount';
        CopyCaption = 'Copy';
    }

    trigger OnPreReport()
    begin
        
            PayPeriodtext:="Temporary Employee".GETFILTER("Pay Period Filter");
            EVALUATE(PayrollMonth,FORMAT(PayPeriodtext));
              PayrollMonthText:=FORMAT(PayrollMonth,1,4);
           PayPeriod.RESET;
           PayPeriod.SETFILTER("Starting Date",'=%1',PayrollMonth);
           IF PayPeriod.FIND('-') THEN
            AdvoMessage := PayPeriod."Advocacy Message";
             /*
               IF PayPeriod.Closed<>TRUE THEN BEGIN
                   Usersetup.RESET;
                   Usersetup.SETRANGE("User ID",USERID);
                   Usersetup.SETRANGE("Payroll View",FALSE);
                   IF Usersetup.FIND('-') THEN BEGIN
                     ERROR('You are not allowed to access this payslip yet');//Prevent generation of an incomplete payslip
                   END;
           END;
           */
          IF PayPeriodtext='' THEN
          ERROR('Pay period must be specified for this report');
          CoRec.GET;
          CoName:=CoRec.Name;
          CoRec.CALCFIELDS(Picture);
          EVALUATE(DateSpecified,FORMAT(PayPeriodtext));
        
          CompRec.GET;
          Message2[1,1]:=CompRec."General Payslip Message";

    end;

    var
        EMPLOYEE_NO_CaptionLbl: Label 'EMPLOYEE NO:';
        N_S_S_F_NO_CaptionLbl: Label 'N.S.S.F NO:';
        PAY_SLIPCaptionLbl: Label 'PAY SLIP';
        P_I_N_NO_CaptionLbl: Label 'P.I.N NO:';
        N_H_I_F_NO_CaptionLbl: Label 'N.H.I.F NO:';
        NAME_CaptionLbl: Label 'NAME:';
        I_D_NO_CaptionLbl: Label 'I.D NO:';
        EARNINGSCaptionLbl: Label 'EARNINGS';
        EmptyStringCaptionLbl: Label '*********************************************************';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        DEPARTMENT_CaptionLbl: Label 'DEPARTMENT:';
        BRANCH_CaptionLbl: Label 'BRANCH:';
        PAYPOINT_CaptionLbl: Label 'PAYPOINT:';
        Addr: array [10,100] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        PayPeriod: Record "Payroll PeriodXT";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        DateSpecified: Date;
        EndDate: Date;
        EmpBank: Record "Employee Bank AccountX";
        BankName: Text[250];
        BasicSalary: Decimal;
        TaxableAmt: Decimal;
        RightBracket: Boolean;
        NetPay: Decimal;
        PayPeriodRec: Record "Payroll PeriodXT";
        PayDeduct: Record "Assignment Matrix-X Temp-E";
        EmpRec: Record "Temporary Employee";
        EmpNo: Code[10];
        TaxableAmount: Decimal;
        PAYE: Decimal;
        ArrEarnings: array [3,100] of Text[250];
        ArrDeductions: array [3,100] of Text[250];
        Index: Integer;
        Index1: Integer;
        j: Integer;
        ArrEarningsAmt: array [3,100] of Text[250];
        ArrDeductionsAmt: array [3,100] of Decimal;
        Year: Integer;
        EmpArray: array [10,15] of Decimal;
        HoldDate: Date;
        DenomArray: array [3,12] of Text[50];
        NoOfUnitsArray: array [3,12] of Integer;
        AmountArray: array [3,12] of Decimal;
        PayModeArray: array [3] of Text[30];
        HoursArray: array [3,60] of Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        TaxCode: Code[10];
        HoursBal: Decimal;
        Pay: Record "EarningsX Temp-E";
        Ded: Record "DeductionsX Temp-E";
        HoursArrayD: array [3,60] of Decimal;
        BankBranch: Text[30];
        CoName: Text;
        retirecontribution: Decimal;
        EarngingCount: Integer;
        DeductionCount: Integer;
        EarnAmount: Decimal;
        GrossTaxCharged: Decimal;
        DimVal: Record "Dimension Value";
        Department: Text[60];
        LowInterestBenefits: Decimal;
        SpacePos: Integer;
        NetPayLength: Integer;
        AmountText: Text[30];
        DecimalText: Text[30];
        DecimalAMT: Decimal;
        InsuranceRelief: Decimal;
        InsuranceReliefText: Text[30];
        PayrollCodeunit: Codeunit "Payroll3";
        IncometaxNew: Decimal;
        NewRelief: Decimal;
        TaxablePayNew: Decimal;
        InsuranceReliefNew: Decimal;
        TaxChargedNew: Decimal;
        finalTax: Decimal;
        TotalBenefits: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        "Employee Payroll": Record "Temporary Employee";
        PayMode: Text[30];
        Intex: Integer;
        NetPay1: Decimal;
        Principal: Decimal;
        Interest: Decimal;
        Desc: Text[50];
        dedrec: Record "DeductionsX Temp-E";
        RoundedNetPay: Decimal;
        diff: Decimal;
        CFWD: Decimal;
        Nssfcomptext: Text[30];
        Nssfcomp: Decimal;
        LoanDesc: Text[60];
        LoanDesc1: Text[60];
        Deduct: Record "DeductionsX Temp-E";
        OriginalLoan: Decimal;
        LoanBalance: Decimal;
        Message1: Text[250];
        Message2: array [3,1] of Text[250];
        DeptArr: array [3,1] of Text[60];
        BasicPay: array [3,1] of Text[250];
        InsurEARN: Decimal;
        HasInsurance: Boolean;
        RoundedAmt: Decimal;
        TerminalDues: Decimal;
        Earn: Record "EarningsX Temp-E";
        AssignMatrix: Record "Assignment Matrix-X Temp-E";
        RoundingDesc: Text[60];
        BasicChecker: Decimal;
        CoRec: Record "Company Information";
        GrossPay: Decimal;
        TotalDeduction: Decimal;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        GetPaye: Codeunit Payroll3;
        PayeeTest: Decimal;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        Totalcoopshares: Decimal;
        LoanBal: Decimal;
        LoanBalances: Record "Loan Application";
        TotalRepayment: Decimal;
        Totalnssf: Decimal;
        Totalpension: Decimal;
        Totalprovid: Decimal;
        BalanceArray: array [3,100] of Decimal;
        PensionContribution: Decimal;
        ArrHeadings: array [100] of Integer;
        tRelief: Date;
        HRsetup: Record "Human Resources Setup";
        PayperiodDate: Date;
        Usersetup: Record "Company Information";
        AdvoMessage: Text;

    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;

    procedure GetPayPeriod()
    begin
    end;

    procedure GetTaxBracket1(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;

    procedure CoinageAnalysis(var NetPay: Decimal;var ColNo: Integer)
    var
        Index: Integer;
        Intex: Integer;
    begin
    end;

    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

            HRsetup.GET;
            IF HRsetup."Payroll Rounding Precision"=0 THEN
               ERROR('You must specify the rounding precision under HR setup');

          IF HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Nearest THEN
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'=');

          IF HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Up THEN
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'>');

          IF HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Down THEN
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'<');
    end;

    procedure ChckRound(var AmtText: Text[30]) ChckRound: Text[30]
    var
        LenthOfText: Integer;
        DecimalPos: Integer;
        AmtWithoutDec: Text[30];
        DecimalAmt: Text[30];
        Decimalstrlen: Integer;
    begin
        LenthOfText:=STRLEN(AmtText);
        DecimalPos:=STRPOS(AmtText,'.');
        IF DecimalPos=0 THEN BEGIN
         AmtWithoutDec:=AmtText;
         DecimalAmt:='.00';
        END ELSE BEGIN
         AmtWithoutDec:=COPYSTR(AmtText,1,DecimalPos-1);
         DecimalAmt:=COPYSTR(AmtText,DecimalPos+1,2);
         Decimalstrlen:=STRLEN(DecimalAmt);
        IF Decimalstrlen<2 THEN BEGIN
          DecimalAmt:='.' +DecimalAmt+'0';
         END ELSE
           DecimalAmt:='.' +DecimalAmt
        END;
        ChckRound:=AmtWithoutDec+DecimalAmt;
    end;
}

