/// <summary>
/// Report Employee Statements (ID 50017).
/// </summary>
report 50017 "Employee Statements"
{
    Caption = 'Employee Statements';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employeestatements.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Global Dimension 1 Code", Balance;

            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo__Address_2_; CompanyInfo."Address 2")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyMotto; CompanyInfo.Motto)
            {
            }
            column(DocumentTitle; DocumentTitle)
            {

            }
            column(Dimension1Name; Codefactory.DimensionName(1, "Global Dimension 1 Code")
            )
            {

            }
            column(Dimension2Name; Codefactory.DimensionName(2, "Global Dimension 2 Code")
            )
            {

            }
            column(EmpFilter; EmpFilter)
            {
            }
            column(EmpDateFilter; EmpDateFilter)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(EmployeeName; Employee.FullName())
            {
            }

            column(JobTitle_Employee; Employee."Job Title")
            {
            }
            column(SearchName_Employee; Employee."Search Name")
            {
            }
            column(Address_Employee; Employee.Address)
            {
            }
            column(Address2_Employee; Employee."Address 2")
            {
            }
            column(City_Employee; Employee.City)
            {
            }
            column(PostCode_Employee; Employee."Post Code")
            {
            }
            column(Balance_Employee; ClosingBalance)
            {
            }
            column(Starting_Balance; StartBalAdjLCY)
            {
            }
            column(Closing_Balance; ClosingBalAdjLCY)
            {
            }
            column(EmpBalanceLCY_1; EmpBalanceLCY)
            {
            }
            column(OpeningBalance; OpeningBalance)
            {

            }
            column(Total; Total)
            {

            }
            column(Issued; Issued)
            {

            }
            column(Surrendered; Surrendered)
            {

            }

            column(Totals; Totals)
            {
            }
            column(Surrender_Due_Date; SurrenderDueDate)
            {

            }
          /*  dataitem(Payments;payments)
            {
                DataItemLink = "Account No."=field("No.");
                DataItemLinkReference=Employee;
                DataItemTableView= where("Account Type"=const(Employee),Posted=const(true),Surrendered=const(false));
                column(Actual_Amount_Spent;"Actual Amount Spent")
                {

                }
                column(No_;"No.")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields("Actual Amount Spent","Remaining Amount");
                end;
            }*/

            /*  dataitem("Employee Ledger Entry"; "Employee Ledger Entry")
              {
                  DataItemLink = "Employee No." = field("No."), "Posting Date" = field("Date Filter");
                  DataItemTableView = where(Reversed = filter(false));

                  column(PostingDate_EmployeeLedgerEntry; "Employee Ledger Entry"."Posting Date")
                  {
                  }
                  column(DocumentNo_EmployeeLedgerEntry; "Employee Ledger Entry"."Document No.")
                  {
                  }
                  column(Description_EmployeeLedgerEntry; "Employee Ledger Entry".Description)
                  {
                  }
                  column(Amount_EmployeeLedgerEntry; "Employee Ledger Entry".Amount)
                  {
                  }
                  column(DebitAmount_EmployeeLedgerEntry; "Employee Ledger Entry"."Debit Amount")
                  {
                  }
                  column(CreditAmount_EmployeeLedgerEntry; "Employee Ledger Entry"."Credit Amount")
                  {
                  }
                  column(TotalDebits; TotalDebits)
                  {
                  }
                  column(TotalCredits; TotalCredits)
                  {
                  }
                  column(RunningBalance; RunningBalance)
                  {
                  }
                  // column(Total; Total)
                  // {

                  // }

                  dataitem("Detailed Employee Ledger Entry"; "Detailed Employee Ledger Entry")
                  {
                      DataItemLink = "Employee Ledger Entry No." = field("Entry No."), "Employee No." = field("Employee No.");
                      DataItemTableView = sorting("Employee Ledger Entry No.", "Posting Date");

                      trigger OnAfterGetRecord()
                      begin
                          Correction := Correction + "Amount (LCY)";
                          EmpBalanceLCY := EmpBalanceLCY + "Amount (LCY)";
                      end;

                      trigger OnPreDataItem()
                      begin
                          SetFilter("Posting Date", EmpDateFilter);
                      end;
                  }
                  dataitem("Det Employee Ledger Entry2"; "Detailed Employee Ledger Entry")
                  {
                      DataItemLink = "Employee Ledger Entry No." = field("Entry No.");
                      DataItemTableView = sorting("Employee Ledger Entry No.", "Posting Date");

                      trigger OnAfterGetRecord()
                      begin
                          ApplicationRounding := ApplicationRounding + "Amount (LCY)";
                          EmpBalanceLCY := EmpBalanceLCY + "Amount (LCY)";
                      end;

                      trigger OnPreDataItem()
                      begin
                          SetFilter("Posting Date", EmpDateFilter);
                      end;
                  }

                  trigger OnAfterGetRecord()
                  begin

                      CurrentAmount := "Employee Ledger Entry".Amount;
                      RunningBalance := CurrentAmount + RunningBalance + StartBalAdjLCY;
                      //MESSAGE('%1-%2',CurrentAmount,RunningBalance);
                  end;

                  trigger OnPreDataItem()
                  begin
                      RunningBalance := 0;
                      SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                  end;
              }*/


            trigger OnAfterGetRecord()
            begin

                CalcFields(Balance);
                Issued := 0;
                Surrendered := 0;


                //RunningBalance:=0;

                EmpLedger.Reset();
                EmpLedger.SetRange("Employee No.", "No.");
                EmpLedger.SetFilter("Posting Date", '..%1', StartDate);
                if EmpLedger.FindSet() then begin
                    repeat
                        EmpLedger.CalcFields(Amount);
                        OpeningBalance := EmpLedger.Amount;
                    until EmpLedger.next() = 0;
                end;

                EmpLedger.Reset();
                EmpLedger.SetRange("Employee No.", "No.");
                EmpLedger.SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                if EmpLedger.FindSet() then begin
                    repeat
                        EmpLedger.CalcFields("Credit Amount", "Debit Amount", Amount);
                        Issued += Abs(EmpLedger."Credit Amount");
                        Surrendered += Abs(EmpLedger."Debit Amount");
                        Total += EmpLedger.Amount;
                    until EmpLedger.next() = 0;
                end;
                Emp.Reset();
                Emp.SetRange("No.", "No.");
                if Emp.findSet() then begin
                    Emp.CalcFields(Balance);
                    ClosingBalance := Emp.Balance;
                end;
            end;

            trigger OnPreDataItem()
            begin



                if CompanyInfo.Get() then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);

                Company.Get();
                Company.CalcFields(Company.Picture);
                SetFilter("Date Filter", '%1..%2', StartDate, EndDate);
                if (StartDate = 0D) or (EndDate = 0D) then
                    error('You must input a date filter');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                Group(Filters)
                {
                    ShowCaption = false;
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = Basic;
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }


    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        // EmpFilter := Employee.GetFilters;
        //EmpDateFilter := Employee.GetFilter("Date Filter");


    end;

    var
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
        EmpFilter: Text[250];
        EmpDateFilter: Text[30];
        EmpAmount: Decimal;
        EmpRemainAmount: Decimal;
        EmpBalanceLCY: Decimal;
        EmpEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        StartBalAdjLCY: Decimal;
        Correction: Decimal;
        ApplicationRounding: Decimal;
        ExcludeBalanceOnly: Boolean;
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        EmpLedgEntryExists: Boolean;
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        EmpCurrencyCode: Code[10];
        CompanyInfo: Record "Company Information";
        MinBal: Decimal;
        UsersID: Record User;
        TotalDebits: Decimal;
        TotalCredits: Decimal;
        Totals: Decimal;
        Text000: label 'Period: %1';
        Employee_StatementCaptionLbl: label 'Employee Statement';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        All_amounts_are_in_LCYCaptionLbl: label 'All amounts are in LCY';
        EmpBalanceLCY__1_Control40CaptionLbl: label 'Balance (LCY)';
        Employee_No_CaptionLbl: label 'Employee No.';
        NamesCaptionLbl: label 'Names';
        Account_TypeCaptionLbl: label 'Account Type';
        Staff_No_CaptionLbl: label 'Staff No.';
        Adj__of_Opening_BalanceCaptionLbl: label 'Adj. of Opening Balance';
        Total_BalanceCaptionLbl: label 'Total Balance';
        Total_Balance_Before_PeriodCaptionLbl: label 'Total Balance Before Period';
        Available_BalanceCaptionLbl: label 'Available Balance';
        ContinuedCaptionLbl: label 'Continued';
        ContinuedCaption_Control46Lbl: label 'Continued';
        Company: Record "Company Information";
        ClosingBalAdjLCY: Decimal;
        TempString: Text;
        FromDate: Text;
        ToDate: Text;
        RunningBalance: Decimal;
        CurrentAmount: Decimal;
        DocumentTitle: Label 'EMPLOYEES STATEMENT';
        Codefactory: Codeunit "Custom Function";
        OpeningBalance: Decimal;
        Issued: Decimal;
        Surrendered: Decimal;
        Total: Decimal;
        Emp: Record Employee;
        StartDate: Date;
        EndDate: Date;
        EmpLedger: Record "Employee Ledger Entry";
        SurrenderDueDate: Date;
        ClosingBalance: Decimal;


    /// <summary>
    /// DimensionName.
    /// </summary>
    /// <param name="DimensionNo">Integer.</param>
    /// <param name="DimensionCode">Code[20].</param>
    /// <returns>Return value of type Text.</returns>
    procedure DimensionName(DimensionNo: Integer; DimensionCode: Code[20]): Text
    var
        DimensionValues: Record "Dimension Value";
    begin
        DimensionValues.Reset();
        DimensionValues.SetRange("Global Dimension No.", DimensionNo);
        DimensionValues.SetRange(Code, DimensionCode);
        if DimensionValues.FindFirst() then
            exit(DimensionValues.Name);
    end;


}

