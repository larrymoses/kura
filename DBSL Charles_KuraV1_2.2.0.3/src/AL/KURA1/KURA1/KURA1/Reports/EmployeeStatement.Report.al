#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57016 "Employee Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Statement.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Date Filter";

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
            column(EmpFilter; EmpFilter)
            {
            }
            column(EmpDateFilter; EmpDateFilter)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
            {
            }
            column(Initials_Employee; Employee.Initials)
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
            column(Balance_Employee; Employee.Balance)
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
            dataitem("Employee Ledger Entry"; "Employee Ledger Entry")
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
                column(Totals; Totals)
                {
                }
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
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));


                trigger OnAfterGetRecord()
                begin
                    if not EmpLedgEntryExists and ((StartBalanceLCY = 0) or ExcludeBalanceOnly) then begin
                        StartBalanceLCY := 0;
                        CurrReport.Skip;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ClosingBalAdjLCY := 0;
                StartBalAdjLCY := 0;

                if EmpDateFilter = '' then
                    Error('You must include a date range')
                else begin
                    EmployeeLedgerEntry.Reset;
                    EmployeeLedgerEntry.SetRange("Employee No.", Employee."No.");
                    EmployeeLedgerEntry.SetFilter("Posting Date", '%1..%2', 0D, NormalDate(GetRangeMin("Date Filter")));
                    if EmployeeLedgerEntry.FindSet then begin
                        repeat
                            EmployeeLedgerEntry.CalcFields("Amount (LCY)");

                            StartBalAdjLCY := StartBalAdjLCY + EmployeeLedgerEntry."Amount (LCY)";
                        until EmployeeLedgerEntry.Next = 0;
                    end;

                    //calculate the opening balance for the date
                    EmployeeLedgerEntry.Reset;
                    EmployeeLedgerEntry.SetRange("Employee No.", Employee."No.");
                    EmployeeLedgerEntry.SetFilter("Posting Date", '%1..%2', 0D, NormalDate(GetRangemax("Date Filter")));
                    if EmployeeLedgerEntry.FindSet then begin
                        repeat
                            EmployeeLedgerEntry.CalcFields("Amount (LCY)");
                            ClosingBalAdjLCY := ClosingBalAdjLCY + EmployeeLedgerEntry."Amount (LCY)";
                        until EmployeeLedgerEntry.Next = 0;
                    end;


                end;
                CurrReport.PrintonlyIfDetail := ExcludeBalanceOnly or (StartBalanceLCY = 0);
                EmpBalanceLCY := StartBalanceLCY + StartBalAdjLCY;
                MinBal := 0;

                //RunningBalance:=0;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;
                CurrReport.CreateTotals("Employee Ledger Entry"."Amount (LCY)", StartBalanceLCY, Correction, ApplicationRounding);

                if CompanyInfo.Get() then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);

                Company.Get();
                Company.CalcFields(Company.Picture);
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
        EmpFilter := Employee.GetFilters;
        EmpDateFilter := Employee.GetFilter("Date Filter");

        with "Employee Ledger Entry" do
            if PrintAmountsInLCY then begin
                AmountCaption := FieldCaption("Amount (LCY)");
                RemainingAmtCaption := FieldCaption("Remaining Amt. (LCY)");
            end else begin
                AmountCaption := FieldCaption(Amount);
                RemainingAmtCaption := FieldCaption("Remaining Amount");
            end;
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
}

