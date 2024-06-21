#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59059 "M&E Role Center"
{
    Caption = 'Strategy And Economic Planning Role Center', Comment = '{Dependency=Match,"ProfileDescription_ACCOUNTINGMANAGER"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {

            group(Control1900724808)
            {
                part(Control99; "Finance Performance")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control1902304208; "M&E  Activities")
                {
                    ApplicationArea = Basic, Suite;
                }

            }

            group(Control1900724708)
            {
                part(Control103; "Trailing Sales Orders Chart")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control106; "My Job Queue")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control100; "Cash Flow Forecast Chart")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = FALSE;
                }
                part(Control1902476008; "My Vendors")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = FALSE;
                }
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control108; "Report Inbox Part")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = FALSE;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            // action("&G/L Trial Balance")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = '&G/L Trial Balance';
            //     Image = "Report";
            //     RunObject = Report "Trial Balance";
            //     ToolTip = 'View, print, or send a report that shows the balances for the general ledger accounts, including the debits and credits. You can use this report to ensure accurate accounting practices.';
            // }
            // action("&Bank Detail Trial Balance")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = '&Bank Detail Trial Balance';
            //     Image = "Report";
            //     RunObject = Report "Bank Acc. - Detail Trial Bal.";
            //     ToolTip = 'View, print, or send a report that shows a detailed trial balance for selected bank accounts. You can use the report at the close of an accounting period or fiscal year.';
            // }
            // action("&Account Schedule")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = '&Account Schedule';
            //     Image = "Report";
            //     RunObject = Report "Account Schedule";
            //     ToolTip = 'Open an account schedule to analyze figures in general ledger accounts or to compare general ledger entries with general ledger budget entries.';
            // }
            // action("Bu&dget")
            // {
            //     ApplicationArea = Suite;
            //     Caption = 'Bu&dget';
            //     Image = "Report";
            //     RunObject = Report Budget;
            //     ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
            // }
            // action("Trial Bala&nce/Budget")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Trial Bala&nce/Budget';
            //     Image = "Report";
            //     RunObject = Report "Trial Balance/Budget";
            //     ToolTip = 'View a trial balance in comparison to a budget. You can choose to see a trial balance for selected dimensions. You can use the report at the close of an accounting period or fiscal year.';
            // }
            // action("Trial Balance by &Period")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Trial Balance by &Period';
            //     Image = "Report";
            //     RunObject = Report "Trial Balance by Period";
            //     ToolTip = 'Show the opening balance by general ledger account, the movements in the selected period of month, quarter, or year, and the resulting closing balance.';
            // }
            // action("&Fiscal Year Balance")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = '&Fiscal Year Balance';
            //     Image = "Report";
            //     RunObject = Report "Fiscal Year Balance";
            //     ToolTip = 'View, print, or send a report that shows balance sheet movements for selected periods. The report shows the closing balance by the end of the previous fiscal year for the selected ledger accounts. It also shows the fiscal year until this date, the fiscal year by the end of the selected period, and the balance by the end of the selected period, excluding the closing entries. The report can be used at the close of an accounting period or fiscal year.';
            // }
            // action("Balance Comp. - Prev. Y&ear")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Balance Comp. - Prev. Y&ear';
            //     Image = "Report";
            //     RunObject = Report "Balance Comp. - Prev. Year";
            //     ToolTip = 'View a report that shows your company''s assets, liabilities, and equity compared to the previous year.';
            // }
            // action("&Closing Trial Balance")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = '&Closing Trial Balance';
            //     Image = "Report";
            //     RunObject = Report "Closing Trial Balance";
            //     ToolTip = 'View, print, or send a report that shows this year''s and last year''s figures as an ordinary trial balance. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
            // }
            // separator(Action49)
            // {
            // }
            // action("Cash Flow Date List")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Cash Flow Date List';
            //     Image = "Report";
            //     RunObject = Report "Cash Flow Date List";
            //     ToolTip = 'View forecast entries for a period of time that you specify. The registered cash flow forecast entries are organized by source types, such as receivables, sales orders, payables, and purchase orders. You specify the number of periods and their length.';
            // }
            // separator(Action115)
            // {
            // }
            // action("Aged Accounts &Receivable")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Aged Accounts &Receivable';
            //     Image = "Report";
            //     RunObject = Report "Aged Accounts Receivable";
            //     ToolTip = 'View an overview of when your receivables from customers are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            // }
            // action("Aged Accounts Pa&yable")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Aged Accounts Pa&yable';
            //     Image = "Report";
            //     RunObject = Report "Aged Accounts Payable";
            //     ToolTip = 'View an overview of when your payables to vendors are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            // }
            // action("Reconcile Cus&t. and Vend. Accs")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Reconcile Cus&t. and Vend. Accs';
            //     Image = "Report";
            //     RunObject = Report "Reconcile Cust. and Vend. Accs";
            //     ToolTip = 'View if a certain general ledger account reconciles the balance on a certain date for the corresponding posting group. The report shows the accounts that are included in the reconciliation with the general ledger balance and the customer or the vendor ledger balance for each account and shows any differences between the general ledger balance and the customer or vendor ledger balance.';
            // }
            // separator(Action53)
            // {
            // }
            // action("&VAT Registration No. Check")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = '&VAT Registration No. Check';
            //     Image = "Report";
            //     RunObject = Report "VAT Registration No. Check";
            //     ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
            // }
            // action("VAT E&xceptions")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'VAT E&xceptions';
            //     Image = "Report";
            //     RunObject = Report "VAT Exceptions";
            //     ToolTip = 'View the VAT entries that were posted and placed in a general ledger register in connection with a VAT difference. The report is used to document adjustments made to VAT amounts that were calculated for use in internal or external auditing.';
            // }
            // action("VAT &Statement")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'VAT &Statement';
            //     Image = "Report";
            //     RunObject = Report "VAT Statement";
            //     ToolTip = 'View a statement of posted VAT and calculate the duty liable to the customs authorities for the selected period.';
            // }
            // action("VAT Reconciliation")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'VAT Reconciliation';
            //     Image = "Report";
            //     RunObject = Report "G/L - VAT Reconciliation";
            //     ToolTip = 'Verify that the VAT amounts on the VAT statements match the amounts from the G/L entries.';
            // }
            // action("VAT - VIES Declaration Tax Aut&h")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'VAT - VIES Declaration Tax Aut&h';
            //     Image = "Report";
            //     RunObject = Report "VAT- VIES Declaration Tax Auth";
            //     ToolTip = 'View information to the customs and tax authorities for sales to other EU countries/regions. If the information must be printed to a file, you can use the VAT- VIES Declaration Disk report.';
            // }
            // action("VAT - VIES Declaration Dis&k")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'VAT - VIES Declaration Dis&k';
            //     Image = "Report";
            //     RunObject = Report "VAT- VIES Declaration Disk";
            //     ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
            // }
            // action("EC Sales &List")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'EC Sales &List';
            //     Image = "Report";
            //     RunObject = Report "EC Sales List";
            //     ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
            // }
            // separator(Action60)
            // {
            // }
            // action("&Intrastat - Checklist")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = '&Intrastat - Checklist';
            //     Image = "Report";
            //     RunObject = Report "Intrastat - Checklist";
            //     ToolTip = 'View a checklist that you can use to find possible errors before printing and also as documentation for what is printed. You can use the report to check the Intrastat journal before you use the Intrastat - Make Disk Tax Auth batch job.';
            // }
            // action("Intrastat - For&m")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Intrastat - For&m';
            //     Image = "Report";
            //     RunObject = Report "Intrastat - Form";
            //     ToolTip = 'View all the information that must be transferred to the printed Intrastat form.';
            // }
            // separator(Action4)
            // {
            // }
            // action("Cost Accounting P/L Statement")
            // {
            //     ApplicationArea = CostAccounting;
            //     Caption = 'Cost Accounting P/L Statement';
            //     Image = "Report";
            //     RunObject = Report "Cost Acctg. Statement";
            //     ToolTip = 'View the credit and debit balances per cost type, together with the chart of cost types.';
            // }
            // action("CA P/L Statement per Period")
            // {
            //     ApplicationArea = CostAccounting;
            //     Caption = 'CA P/L Statement per Period';
            //     Image = "Report";
            //     RunObject = Report "Cost Acctg. Stmt. per Period";
            //     ToolTip = 'View profit and loss for cost types over two periods with the comparison as a percentage.';
            // }
            // action("CA P/L Statement with Budget")
            // {
            //     ApplicationArea = CostAccounting;
            //     Caption = 'CA P/L Statement with Budget';
            //     Image = "Report";
            //     RunObject = Report "Cost Acctg. Statement/Budget";
            //     ToolTip = 'View a comparison of the balance to the budget figures and calculates the variance and the percent variance in the current accounting period, the accumulated accounting period, and the fiscal year.';
            // }
            // action("Cost Accounting Analysis")
            // {
            //     ApplicationArea = CostAccounting;
            //     Caption = 'Cost Accounting Analysis';
            //     Image = "Report";
            //     RunObject = Report "Cost Acctg. Analysis";
            //     ToolTip = 'View balances per cost type with columns for seven fields for cost centers and cost objects. It is used as the cost distribution sheet in Cost accounting. The structure of the lines is based on the chart of cost types. You define up to seven cost centers and cost objects that appear as columns in the report.';
            // }
        }
        area(embedding)
        {
            action("M&E list")
            {
                ApplicationArea = Basic;
                RunObject = Page "User Planning  list";
            }
            group("planning setup1")
            {
                Caption = 'Planning Setup';
                action("Organization Hierachy")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 80023;
                }
                action("Intervention Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Intervention Setup";
                }
                action("Respondent Category Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Respondent Category Setup";
                }
                action("ExtentOfAgreementMeasureSetup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agreement Measure Setup';
                    RunObject = Page ExtentOfAgreementMeasureSetup;
                }
                action("ExtentOfAgreementMeasureSetup1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agreement Measure On Impact Setup';
                    RunObject = Page ExtentOfAgrtMeasureOISetup;
                }
                action("Strategy General Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 80036;
                }
                action("Performance Evaluation Template")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 80045;
                }
                // action("Competency Perfomance Template")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page 80108;
                // }
                action("Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 80063;
                }
                action("Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 80060;
                }

            }
            group("Draft Documents")
            {
                action("Strategic Plans")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Strategic Plans';
                    RunObject = Page "Corporate Strategic Plans";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Departmental Annual Workplans")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Departmental Annual Workplans';
                    RunObject = Page "Functional Annual Workplans";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }

                action("Annual Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Consolidated Annual Work Plans';
                    RunObject = Page "Annual Strategy Workplans";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Board Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Annual Workplan';
                    RunObject = Page "Board/Executive PCs";
                    Visible = false;

                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("DG/CEO Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'DG/CEO Annual Workplan';
                    RunObject = Page "CEO/Corporate PCs";
                    Visible = FALSE;
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Functional Objective Templates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Functional Objective Templates';
                    RunObject = Page 80080;
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }


            }
            group(Documents)
            {
                action("Directors Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Directors Annual Workplan';
                    RunObject = Page "Directors Perfomance Contracts";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Department/Region Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Department/Region Annual Workplan';
                    RunObject = Page 80366;

                }
                action("Principal Officer Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sections Annual Workplan';
                    RunObject = Page 80409;
                }
                action("Senior Officer Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80411;

                }
                action("Staff Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80082;

                }
            }
            group("Budget Allignment")
            {
                action("Budget Allignment List")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page "Budget Consolidation List";
                }
            }
            group(Archive)
            {
                action("Approved Annual Plan")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 99450;

                }
                action("Approved Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80193;

                }
                action("Approved Departmental Workplans")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page "Approved Dept Annual Workplans";
                }

                action("Approved Annual Work Plans")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80197;

                }

                action("Approved Board Annual Work Plans")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 99408;
                    Visible = false;

                }
                action("Approved Functional Objective Templates")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80361;

                }
                action("Appoved Directors Annual Workplans")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80379;

                }
                action("Approved Departmental/Region Annual Workplans")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80378;


                }
                // action("Approved  Strategic Plans")
                // {
                //     ApplicationArea = Basic, Suite;
                //     // Caption ='Functional Objective Template';
                //     RunObject = Page 80193;

                // }
                action("Approved Staff Annual Workplan")
                {
                    ApplicationArea = Basic, Suite;
                    // Caption ='Functional Objective Template';
                    RunObject = Page 80363;

                }
            }
            // group("Regional Staff PCs")
            // {

            //     action("Reginal Staff Score Card")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         // Caption ='Functional Objective Template';
            //         RunObject = Page "Regional Staff Scorecards";

            //     }
            // }
            group("PerfomanceMonitoring")
            {
                Caption = 'Perfomance Monitoring';
                group("Performance Updates")
                {
                    action("Perfomance Daily Logs")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Perfomance Quaterly Logs';
                        RunObject = Page 80100;

                    }

                    action("Approved Performance Updates")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Performance Updates';
                        RunObject = Page 80383;

                    }
                    action("Posted Performance Updat nes")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Performance Updates';
                        RunObject = Page 80200;

                    }
                    action("Monitoring Lists")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Project Monitoring Lists';
                        RunObject = Page "Monitoring List ";
                        RunPageView = where(Status = filter(Open | "Pending Approval"));

                    }
                    action("Archived Monitoring List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Archived Project Monitoring List';
                        RunObject = Page "Monitoring List ";
                        RunPageView = where(Status = filter(Released));


                    }

                }
            }
            group("PerfomanceReporting")
            {
                Caption = 'Perfomance Reporting';
                group("Perfomance Reporting")
                {
                    action("Perfomance Reporting List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'DCS Perfomance Reporting';
                        RunObject = Page 80550;

                    }
                }
            }

            group("Performance Contract")
            {
                group("Draft PC Document")

                {
                    action(" Departmental Draft PC")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page 80497;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Organizational Draft PC")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Organizational PCs";
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                }
                group("Approved PC Document")

                {
                    action("Approved Departmental PC")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page 80501;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Approved Organizational PC")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page 80499;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                }
                group("Cascading  PC Document")

                {
                    action("Corporate Performance Contract")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page 80048;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Directorate Performance Contract")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page 80469;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Departmental Performance Contract")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page 80470;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Approved Performance Contract")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page 80363;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                }


            }
            group(Projects)
            {
                Caption = 'Projects';
                action("Planned Projects")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Projects';
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter(Planned));
                }
                action("Ongoing Projects")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Projects';
                    Image = ApplyEntries;
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter(Ongoing));
                }
                action("Completed/Under DLP Projects")
                {
                    AccessByPermission = TableData "Bank Export/Import Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Completed/Under DLP Projects';
                    Image = Import;
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter("Completed/Under DLP"));
                    ToolTip = 'To start the process of reconciling new payments, import a bank feed or electronic file containing the related bank transactions.';
                }
                action("Projects Under PBRM")
                {
                    AccessByPermission = TableData "Payment Registration Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Projects Under PBRM';
                    Image = Payment;
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter("Under PBRM"));
                    ToolTip = 'Process your customer payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post the payments.';
                }
                action("Completed Projects")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Completed Projects';
                    Image = SuggestVendorPayments;
                    RunObject = Page "Job List";
                    RunPageView = where(Status = filter(Completed));
                    ToolTip = 'Opens vendor ledger entries for all vendors with invoices that have not been paid yet.';
                }
            }



        }
        area(sections)
        {
            //cc//////////////////////
            // group("Cash Flow")
            // {
            //     Caption = 'Cash Flow';
            //     action("Cash Flow Forecasts")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Cash Flow Forecasts';
            //         RunObject = Page "Cash Flow Forecast List";
            //         ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
            //     }
            //     action("Chart of Cash Flow Accounts")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Chart of Cash Flow Accounts';
            //         RunObject = Page "Chart of Cash Flow Accounts";
            //         ToolTip = 'View a chart contain a graphical representation of one or more cash flow accounts and one or more cash flow setups for the included general ledger, purchase, sales, services, or fixed assets accounts.';
            //     }
            //     action("Cash Flow Manual Revenues")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Cash Flow Manual Revenues';
            //         RunObject = Page "Cash Flow Manual Revenues";
            //         ToolTip = 'Record manual revenues, such as rental income, interest from financial assets, or new private capital to be used in cash flow forecasting.';
            //     }
            //     action("Cash Flow Manual Expenses")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Cash Flow Manual Expenses';
            //         RunObject = Page "Cash Flow Manual Expenses";
            //         ToolTip = 'Record manual expenses, such as salaries, interest on credit, or planned investments to be used in cash flow forecasting.';
            //     }
            // }
            // group("Posted Documents")
            // {
            //     Caption = 'Posted Documents';
            //     Image = FiledPosted;
            //     action("Posted Sales Invoices")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Posted Sales Invoices';
            //         Image = PostedOrder;
            //         RunObject = Page "Posted Sales Invoices";
            //         ToolTip = 'Open the list of posted sales invoices.';
            //     }
            //     action("Posted Sales Credit Memos")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Posted Sales Credit Memos';
            //         Image = PostedOrder;
            //         RunObject = Page "Posted Sales Credit Memos";
            //         ToolTip = 'Open the list of posted sales credit memos.';
            //     }
            //     action("Posted Purchase Invoices")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Posted Purchase Invoices';
            //         RunObject = Page "Posted Purchase Invoices";
            //         ToolTip = 'Open the list of posted purchase invoices.';
            //     }
            //     action("Posted Purchase Credit Memos")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Posted Purchase Credit Memos';
            //         RunObject = Page "Posted Purchase Credit Memos";
            //         ToolTip = 'Open the list of posted purchase credit memos.';
            //     }
            //     action("Issued Reminders")
            //     {
            //         ApplicationArea = Suite;
            //         Caption = 'Issued Reminders';
            //         Image = OrderReminder;
            //         RunObject = Page "Issued Reminder List";
            //         ToolTip = 'View the list of issued reminders.';
            //     }
            //     action("Issued Fin. Charge Memos")
            //     {
            //         ApplicationArea = Suite;
            //         Caption = 'Issued Fin. Charge Memos';
            //         Image = PostedMemo;
            //         RunObject = Page "Issued Fin. Charge Memo List";
            //         ToolTip = 'View the list of issued finance charge memos.';
            //     }
            //     action("G/L Registers")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'G/L Registers';
            //         Image = GLRegisters;
            //         RunObject = Page "G/L Registers";
            //         ToolTip = 'View posted G/L entries.';
            //     }
            //     action("Cost Accounting Registers")
            //     {
            //         ApplicationArea = CostAccounting;
            //         Caption = 'Cost Accounting Registers';
            //         RunObject = Page "Cost Registers";
            //         ToolTip = 'Get an overview of all cost entries sorted by posting date. ';
            //     }
            //     action("Cost Accounting Budget Registers")
            //     {
            //         ApplicationArea = CostAccounting;
            //         Caption = 'Cost Accounting Budget Registers';
            //         RunObject = Page "Cost Budget Registers";
            //         ToolTip = 'Get an overview of all cost budget entries sorted by posting date. ';
            //     }
            // }
            // group(Administration)
            // {
            //     Caption = 'Administration';
            //     Image = Administration;
            //     action("Account Schedules")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Account Schedules';
            //         RunObject = Page "Account Schedule Names";
            //         ToolTip = 'Get insight into the financial data stored in your chart of accounts. Account schedules analyze figures in G/L accounts, and compare general ledger entries with general ledger budget entries. For example, you can view the general ledger entries as percentages of the budget entries. Account schedules provide the data for core financial statements and views, such as the Cash Flow chart.';
            //     }
            //     action(Dimensions)
            //     {
            //         ApplicationArea = Dimensions;
            //         Caption = 'Dimensions';
            //         Image = Dimensions;
            //         RunObject = Page Dimensions;
            //         ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
            //     }
            // }
            ///////////////////cccc//////////////////////////////
        }
        area(processing)
        {
            // separator(Action64)
            // {
            //     Caption = 'Tasks';
            //     IsHeader = true;
            // }
            // separator(Action67)
            // {
            // }
            // action("Analysis &Views")
            // {
            //     ApplicationArea = Dimensions;
            //     Caption = 'Analysis &Views';
            //     Image = AnalysisView;
            //     RunObject = Page "Analysis View List";
            //     ToolTip = 'Analyze amounts in your general ledger by their dimensions using analysis views that you have set up.';
            // }
            // action("Analysis by &Dimensions")
            // {
            //     ApplicationArea = Dimensions;
            //     Caption = 'Analysis by &Dimensions';
            //     Image = AnalysisViewDimension;
            //     RunObject = Page "Analysis by Dimensions";
            //     ToolTip = 'Analyze activities using dimensions information.';
            // }
            // action("Adjust E&xchange Rates")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Adjust E&xchange Rates';
            //     Ellipsis = true;
            //     Image = AdjustExchangeRates;
            //     RunObject = Report "Adjust Exchange Rates";
            //     ToolTip = 'Adjust general ledger, customer, vendor, and bank account entries to reflect a more updated balance if the exchange rate has changed since the entries were posted.';
            // }
            // separator(Action73)
            // {
            // }
            // action("Calc. and Pos&t VAT Settlement")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Calc. and Pos&t VAT Settlement';
            //     Image = SettleOpenTransactions;
            //     RunObject = Report "Calc. and Post VAT Settlement";
            //     ToolTip = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account. For every VAT posting group, the batch job finds all the VAT entries in the VAT Entry table that are included in the filters in the definition window.';
            // }
            // separator(Action89)
            // {
            //     Caption = 'History';
            //     IsHeader = true;
            // }
            // action("Navi&gate")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Navi&gate';
            //     Image = Navigate;
            //     RunObject = Page Navigate;
            //     ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';
            // }
            //cc
        }
    }
}

