#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65138 "ME  Role Center"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'M&E  Role Center', Comment = '{Dependency=Match,"ProfileDescription_SMALLBUSINESS"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control46; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control42; "Grant Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            // part(Control40;"Help And Chart Wrapper")
            // {
            //     AccessByPermission = TableData "Assisted Setup"=I;
            //     ApplicationArea = Basic,Suite;
            //     Caption = '';
            //     ToolTip = 'Specifies the view of your business assistance';
            // }
            part(Control23; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Favorite Accounts';
            }
            part(Control22; "Trial Balance")
            {
                AccessByPermission = TableData "G/L Entry" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Control20; "Power BI Report Spinner Part")
            {
                AccessByPermission = TableData "Power BI User Configuration" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control19; "Team Member Activities No Msgs")
            {
                ApplicationArea = Suite;
            }
            part(Control16; "O365 Link to Financials")
            {
                ApplicationArea = Invoicing;
                Caption = ' ';
            }
            part(Control7; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Items")
            {
                ApplicationArea = Basic;
                Promoted = true;
                RunObject = XMLport "Import Items";
                Visible = false;
            }
            action("User Task List")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Tasks';
                RunObject = Page "User Task List";
            }
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action("Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    Image = New;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Memo";
                    RunPageMode = Create;
                }
                // action("Imprest Requisition")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Imprest Requisition';
                //     Image = NewDocument;
                //     Promoted = false;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Process;
                //     RunObject = Page "Imprest Requisition";
                //     RunPageMode = Create;
                // }
                action("Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Surrender";
                    RunPageMode = Create;
                }
                action("Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Leave Applications Card";
                    RunPageMode = Create;
                }
                action("Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Purchase Requisition Header";
                    RunPageMode = Create;
                }
            }
        }
        area(processing)
        {
            group(Reports)
            {
                Caption = 'Reports';
                group("Financial Reports")
                {
                    Caption = 'Financial Reports';
                    Image = ReferenceData;
                    action("Balance Sheet")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Balance Sheet";
                        ToolTip = 'View your company''s assets, liabilities, and equity.';
                    }
                    action("Income Statement")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Income Statement";
                        ToolTip = 'View your company''s income and expenses.';
                    }
                    action("Statement of Cash Flows")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Cash Flows';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Statement of Cashflows";
                        ToolTip = 'View a financial statement that shows how changes in balance sheet accounts and income affect the company''s cash holdings, displayed for operating, investing, and financing activities respectively.';
                    }
                    action("Statement of Retained Earnings")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Retained Earnings';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Retained Earnings Statement";
                        ToolTip = 'View a report that shows your company''s changes in retained earnings for a specified period by reconciling the beginning and ending retained earnings for the period, using information such as net income from the other financial statements.';
                    }
                }
                group("Management Reports")
                {
                    Caption = 'Management Reports';
                    Image = ReferenceData;
                    //     action("Corporate Strategic Plan")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Corporate Strategic Plan";
                    //     }
                    //     action("Annual Strategy Workplan")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Annual Strategy Workplan";
                    //     }
                    //     action("Research Center Grants")
                    //     {
                    //         ApplicationArea = Basic;
                    //         Caption = 'Grants Per Research Center';
                    //         RunObject = Report "Research Center Grants";
                    //     }
                    //     action("Research Center Projects")
                    //     {
                    //         ApplicationArea = Basic;
                    //         Caption = 'Projects Per Research Center';
                    //         RunObject = Report "Research Center Projects";
                    //     }
                    //     action("Research Center Profiles")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Research Center Profile";
                    //     }
                    //     action("Researcher Profile")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Researcher Profile";
                    //     }
                    // }
                    // group("Procurement Reports")
                    // {
                    //     Caption = 'Procurement Reports';
                    //     Image = ReferenceData;
                    //     action("Agpo Tenders")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Agpo Tenders";
                    //     }
                    //     action("Contracts Awarded")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Contracts Awarded";
                    //     }
                    //     action("Issue Voucher")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Issue Voucher";
                    //     }
                    //     action("Goods Received Note ")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Goods Received Note";
                    //     }
                    //     action("Destruction Certificate ")
                    //     {
                    //         ApplicationArea = Basic;
                    //         RunObject = Report "Destruction Certificate";
                    //     }
                }
                group("Hr Reports")
                {
                    Caption = 'Hr Reports';
                    Image = ReferenceData;
                    action("Employee - Absences by Causes")
                    {
                        ApplicationArea = Basic;
                        // RunObject = Report "Employee - Absences by Causes";
                    }
                    action("Employee - Qualifications ")
                    {
                        ApplicationArea = Basic;
                        // RunObject = Report "Employee - Qualifications";
                    }
                    // action("Positions (Occupied)")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = Report "Positions (Occupied)";
                    // }
                    // action("Position (Vacant)")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = Report "Position (Vacant)";
                    // }
                }
                group("Self Service Reports")
                {
                    Caption = 'Self Service Reports';
                    Image = ReferenceData;
                    // action(Action37)
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Imprest Memo';
                    //     Image = "Report";
                    //     RunObject = Report "Imprest Memo";
                    // }
                    // action("Imprest Requisition")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Imprest Requisition';
                    //     Image = "Report";
                    //     RunObject = Report "Imprest Requisition";
                    // }
                    // action(Action35)
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Imprest Surrender';
                    //     Image = "Report";
                    //     RunObject = Report "Imprest Surrender";
                    // }
                    separator(Action33)
                    {
                    }
                    // action(" Leave Application Print Out")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = ' Leave Application Print Out';
                    //     Image = "Report";
                    //     RunObject = Report "Leave Application Form";
                    //     Visible = false;
                    // }
                    separator(Action31)
                    {
                    }
                }
            }
        }
        area(reporting)
        {
            group("Excel Reports")
            {
                Caption = 'Excel Reports';
                Image = Excel;
                action(ExcelTemplatesBalanceSheet)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance Sheet';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Codeunit "Run Template Balance Sheet";
                    ToolTip = 'Open a spreadsheet that shows your company''s assets, liabilities, and equity.';
                }
                action(ExcelTemplateIncomeStmt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Income Statement';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Codeunit "Run Template Income Stmt.";
                    ToolTip = 'Open a spreadsheet that shows your company''s income and expenses.';
                }
                action(ExcelTemplateCashFlowStmt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Statement';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Codeunit "Run Template CashFlow Stmt.";
                    ToolTip = 'Open a spreadsheet that shows how changes in balance sheet accounts and income affect the company''s cash holdings.';
                }
                action(ExcelTemplateTrialBalance)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Trial Balance';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Codeunit "Run Template Trial Balance";
                    ToolTip = 'Open a spreadsheet that shows a summary trial balance by account.';
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action("Legal Entity")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Legal Entity';
                RunObject = Page "Legal Entity List";
                ToolTip = 'Legal Entity List ';
            }
            action(Board)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Board';
                RunObject = Page "Board List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(Directorates)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Directorates';
                RunObject = Page "Directorate List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Research Center List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Research Centers';
                RunObject = Page "Center List";
                ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
            }
            action("Department List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Departments';
                Image = BankAccount;
                RunObject = Page "Department List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action("Research Program List")
            {
                ApplicationArea = Basic;
                Caption = 'Research Programs';
                RunObject = Page "Research Program List";
            }
        }
        area(sections)
        {
            group(Finance)
            {
                Caption = 'Finance';
                Image = Journals;
                ToolTip = 'Collect and make payments, prepare statements, and reconcile bank accounts.';
                action("Chart of Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
                }
                action("G/L Budgets")
                {
                    ApplicationArea = Suite;
                    Caption = 'G/L Budgets';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "G/L Budget Names";
                    ToolTip = 'View summary information about the amount budgeted for each general ledger account in different time periods.';
                }
                action("Procurement Plans List ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Plan';
                    RunObject = Page "Procurement Plans List";
                }
                action("Account Schedules")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Schedules';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Account Schedule Names";
                    ToolTip = 'Get insight into the financial data stored in your chart of accounts. Account schedules analyze figures in G/L accounts, and compare general ledger entries with general ledger budget entries. For example, you can view the general ledger entries as percentages of the budget entries. Account schedules provide the data for core financial statements and views, such as the Cash Flow chart.';
                }
            }
            group("Cash Management")
            {
                Caption = 'Cash Management';
                ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.';
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Bank Acc. Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Acc. Statements';
                    Image = BankAccountStatement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account Statement List";
                    ToolTip = 'View statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
                }
            }
            group("Grants Management")
            {
                Caption = 'Grants Management';
                Image = Sales;
                ToolTip = 'Make quotes, orders, and credit memos to customers. Manage customers and view transaction history.';
                action("Open External funding Announcement")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Open External Calls";
                }
                action("Open Internal funding Announcement")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Open Internal Calls";
                }
                action("External Research Proposals ")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "External Research Proposals";
                }
                action("Internal Research Proposals")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Internal Research Proposals";
                }
                action("Open Projects ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ongoing Projects ';
                    RunObject = Page "Open Projects";
                }
                action("Closed Projects ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Projects ';
                    RunObject = Page "Closed Projects";
                }
            }
            group("M&E")
            {
                Caption = 'M&E';
                action("Corporate Strategic Plans")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Corporate Strategic Plans";
                }
                action("Annual Strategy Workplans")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Annual Strategy Workplans";
                }
            }
            group("My Request")
            {
                Caption = 'My Request';
                action("Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memos';
                    RunObject = Page "Imprest Memos";
                }
                action("<Page Project Imprest Requisition>")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Requisitions';
                    Image = Quote;
                    RunObject = Page "Imprest Requisitions";
                }
                action("My Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Store Requisitions';
                    Image = Document;
                    RunObject = Page "Store Requisitions";
                }
                action("My Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Surrenders';
                    Image = Document;
                    RunObject = Page "Imprest Surrenders";
                }
                action("My Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Leave Applications';
                    Image = ServiceCode;
                    RunObject = Page "Leave Applications List";
                }
                action("ICT Helpdesk Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Helpdesk Request';
                    Enabled = false;
                    Image = SendTo;
                    RunObject = Page "ICT Helpdesk Request List";
                    Visible = false;
                }
                action("My Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Purchase Requisitions';
                    Image = Loaners;
                    RunObject = Page "Purchase Requisitions List";
                }
                action("Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Fleet Requisition List";
                }
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                }
            }
            group("My Approved Requests")
            {
                action("My Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Approved Leave Applications";
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Memos";
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Surrenders";
                }
                action("Approved Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    // RunObject = Page "Approved Purchase Requisition";
                }
            }
        }
    }
}

