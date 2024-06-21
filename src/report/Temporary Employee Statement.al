report 69407 "Temporary Employee Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Temporary Employee Statement.rdlc';

    dataset
    {
        dataitem("Temporary Employee";"Temporary Employee")
        {
            RequestFilterFields = "No.","Date Filter";
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(CompanyInfo_Address;CompanyInfo.Address)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name;CompanyInfo.Name)
            {
            }
            column(CompanyInfo__Address_2_;CompanyInfo."Address 2")
            {
            }
            column(EmpFilter;EmpFilter)
            {
            }
            column(EmpDateFilter;EmpDateFilter)
            {
            }
            column(No_Employee;"Temporary Employee"."No.")
            {
            }
            column(FirstName_Employee;"Temporary Employee"."First Name")
            {
            }
            column(MiddleName_Employee;"Temporary Employee"."Middle Name")
            {
            }
            column(LastName_Employee;"Temporary Employee"."Last Name")
            {
            }
            column(Initials_Employee;"Temporary Employee".Initials)
            {
            }
            column(JobTitle_Employee;"Temporary Employee"."Job Title")
            {
            }
            column(SearchName_Employee;"Temporary Employee"."Search Name")
            {
            }
            column(Address_Employee;"Temporary Employee".Address)
            {
            }
            column(Address2_Employee;"Temporary Employee"."Address 2")
            {
            }
            column(City_Employee;"Temporary Employee".City)
            {
            }
            column(PostCode_Employee;"Temporary Employee"."Post Code")
            {
            }
            column(Balance_Employee;"Temporary Employee".Balance)
            {
            }
            column(Starting_Balance;StartBalAdjLCY)
            {
            }
            column(Closing_Balance;ClosingBalAdjLCY)
            {
            }
            column(EmpBalanceLCY_1;EmpBalanceLCY)
            {
            }
            dataitem("Employee Ledger Entry";"Employee Ledger Entry")
            {
                DataItemLink = "Employee No."=FIELD("No."),
                               "Posting Date"=FIELD("Date Filter");
                column(PostingDate_EmployeeLedgerEntry;"Employee Ledger Entry"."Posting Date")
                {
                }
                column(DocumentNo_EmployeeLedgerEntry;"Employee Ledger Entry"."Document No.")
                {
                }
                column(Description_EmployeeLedgerEntry;"Employee Ledger Entry".Description)
                {
                }
                column(Amount_EmployeeLedgerEntry;"Employee Ledger Entry".Amount)
                {
                }
                column(DebitAmount_EmployeeLedgerEntry;"Employee Ledger Entry"."Debit Amount")
                {
                }
                column(CreditAmount_EmployeeLedgerEntry;"Employee Ledger Entry"."Credit Amount")
                {
                }
                column(TotalDebits;TotalDebits)
                {
                }
                column(TotalCredits;TotalCredits)
                {
                }
                column(Totals;Totals)
                {
                }
                dataitem("Detailed Employee Ledger Entry";"Detailed Employee Ledger Entry")
                {
                    DataItemLink = "Employee Ledger Entry No."=FIELD("Entry No.");
                    DataItemTableView = SORTING("Employee Ledger Entry No.","Posting Date");

                    trigger OnAfterGetRecord()
                    begin
                        Correction := Correction + "Amount (LCY)";
                        EmpBalanceLCY := EmpBalanceLCY + "Amount (LCY)";
                    end;

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("Posting Date",EmpDateFilter);
                    end;
                }
                dataitem("Det Employee Ledger Entry2";"Detailed Employee Ledger Entry")
                {
                    DataItemLink = "Employee Ledger Entry No."=FIELD("Entry No.");
                    DataItemTableView = SORTING("Employee Ledger Entry No.","Posting Date");

                    trigger OnAfterGetRecord()
                    begin
                        ApplicationRounding := ApplicationRounding + "Amount (LCY)";
                        EmpBalanceLCY := EmpBalanceLCY + "Amount (LCY)";
                    end;

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("Posting Date",EmpDateFilter);
                    end;
                }
            }
            dataitem(Integer;Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number=CONST(1));

                trigger OnAfterGetRecord()
                begin
                    IF NOT EmpLedgEntryExists AND ((StartBalanceLCY = 0) OR ExcludeBalanceOnly) THEN BEGIN
                      StartBalanceLCY := 0;
                      CurrReport.SKIP;
                    END;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ClosingBalAdjLCY := 0;
                StartBalAdjLCY := 0;

                IF EmpDateFilter='' THEN
                  ERROR('You must include a date range')
                ELSE BEGIN
                  EmployeeLedgerEntry.RESET;
                  EmployeeLedgerEntry.SETRANGE("Employee No.","Temporary Employee"."No.");
                  EmployeeLedgerEntry.SETFILTER("Posting Date",'%1..%2',0D,NORMALDATE(GETRANGEMIN("Date Filter")) - 1);
                    IF EmployeeLedgerEntry.FINDSET THEN BEGIN
                    REPEAT
                      EmployeeLedgerEntry.CALCFIELDS("Amount (LCY)");

                      StartBalAdjLCY := StartBalAdjLCY+ EmployeeLedgerEntry."Amount (LCY)";
                    UNTIL EmployeeLedgerEntry.NEXT = 0;
                    END;

                //calculate the opening balance for the date
                  EmployeeLedgerEntry.RESET;
                  EmployeeLedgerEntry.SETRANGE("Employee No.","Temporary Employee"."No.");
                  EmployeeLedgerEntry.SETFILTER("Posting Date",'%1..%2',0D,NORMALDATE(GETRANGEMAX("Date Filter")) - 1);
                  IF EmployeeLedgerEntry.FINDSET THEN BEGIN
                    REPEAT
                      EmployeeLedgerEntry.CALCFIELDS("Amount (LCY)");
                      ClosingBalAdjLCY := ClosingBalAdjLCY+ EmployeeLedgerEntry."Amount (LCY)";
                    UNTIL EmployeeLedgerEntry.NEXT = 0;
                    END;
                END;



                CurrReport.PRINTONLYIFDETAIL :=  ExcludeBalanceOnly OR (StartBalanceLCY = 0);
                EmpBalanceLCY := StartBalanceLCY + StartBalAdjLCY;
                MinBal:=0;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                CurrReport.CREATETOTALS("Employee Ledger Entry"."Amount (LCY)",StartBalanceLCY, Correction, ApplicationRounding);

                IF CompanyInfo.GET() THEN
                CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

                Company.GET();
                Company.CALCFIELDS(Company.Picture);
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
        EmpFilter :="Temporary Employee".GETFILTERS;
        EmpDateFilter := "Temporary Employee".GETFILTER("Date Filter");

        WITH "Employee Ledger Entry" DO
          IF PrintAmountsInLCY THEN BEGIN
            AmountCaption := FIELDCAPTION("Amount (LCY)");
            RemainingAmtCaption := FIELDCAPTION("Remaining Amt. (LCY)");
          END ELSE BEGIN
            AmountCaption := FIELDCAPTION(Amount);
            RemainingAmtCaption := FIELDCAPTION("Remaining Amount");
          END;
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
        Text000: Label 'Period: %1';
        Employee_StatementCaptionLbl: Label 'Employee Statement';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        EmpBalanceLCY__1_Control40CaptionLbl: Label 'Balance (LCY)';
        Employee_No_CaptionLbl: Label 'Employee No.';
        NamesCaptionLbl: Label 'Names';
        Account_TypeCaptionLbl: Label 'Account Type';
        Staff_No_CaptionLbl: Label 'Staff No.';
        Adj__of_Opening_BalanceCaptionLbl: Label 'Adj. of Opening Balance';
        Total_BalanceCaptionLbl: Label 'Total Balance';
        Total_Balance_Before_PeriodCaptionLbl: Label 'Total Balance Before Period';
        Available_BalanceCaptionLbl: Label 'Available Balance';
        ContinuedCaptionLbl: Label 'Continued';
        ContinuedCaption_Control46Lbl: Label 'Continued';
        Company: Record "Company Information";
        ClosingBalAdjLCY: Decimal;
        TempString: Text;
        FromDate: Text;
        ToDate: Text;
}

