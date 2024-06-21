#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69043 "Payroll Admin Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1000000004; "Payroll Activities")
                {
                }
                systempart(Control1901420308; Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                }
                systempart(Control1901377608; MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            separator(Action1000000008)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group(Payslip)
            {
                Caption = 'Payslip';
                action("1 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '1 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    // The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    // PromotedIsBig = false;
                    RunObject = Report "1 Page Payslip";
                }
                action("2 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    // RunObject = Report "New Payslip";
                }
            }
            separator(Action1000000041)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group("Management Reports")
            {
                Caption = 'Management Reports';
                action("Master Roll Excel Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Excel Export';
                    Image = "Report";
                    RunObject = Report "Master Roll Excel Export";
                }
                action("Detailed E/D Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed E/D Report';
                    Image = "Report";
                    RunObject = Report "Master reporterx";
                }
                action("Loans Detailed Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loans Detailed Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Loans Detailed Report1";
                    Visible = false;
                }
                action("Loan Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loan Balances';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //   RunObject = Report "Loan Balances";
                    Visible = false;
                }
                action("Employee Payroll Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Payroll Analysis';
                    Image = "Report";
                    // RunObject = Report "Payroll Cost Analysis";
                }
                action("Employee/Employer Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee/Employer Deductions';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee/Employer Deductions";
                    //  Visible = false;
                }
                action("Employee Pay Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Pay Details';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Employee Pay Details";
                }
                action("Employee Payroll Pay File")
                {
                    ApplicationArea = Basic;
                    // Caption = 'ITax Generator';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = xmlport "Employee Payroll Pay File";
                }
                action("ITax Generator")
                {
                    ApplicationArea = Basic;
                    Caption = 'ITax Generator';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "ITax Generator";
                }
                action("Detailed Institutional ROUSA Report")
                {
                    ApplicationArea = Basic;
                    //Caption = 'ITax Generator';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Institutional Report_email";
                }
                action("Detailed Institutional ICEA Report")
                {
                    ApplicationArea = Basic;
                    //Caption = 'ITax Generator';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Institutional iCEA";
                }
                action("Net Pay Less Than 1/3")
                {
                    ApplicationArea = Basic;
                    //Caption = 'ITax Generator';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Net Pay Less Than 1/3";
                }
            }
            group(Statutory)
            {
                Caption = 'Statutory';
                action(NHIF)
                {
                    ApplicationArea = Basic;
                    Caption = 'NHIF';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report NHIF;
                }
                action(NSSF)
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "NSSF Reporting";
                }
                action("Housing Levy")
                {
                    ApplicationArea = Basic;
                    Caption = 'Housing Levy';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Housing Levy";
                }
                action("Monthly PAYE Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Monthly PAYE Export';
                    Image = "Report";
                    Promoted = false;
                  
                    RunObject = Report "Monthly PAYE Export";
                }
                action(P9A)
                {
                    ApplicationArea = Basic;
                    Caption = 'P9A';
                    Image = "Report";
                    Promoted = false;
                    
                    RunObject = Report "P9A Report";
                }
            }
            group("Payroll Reconcilliation")
            {
                Caption = 'Payroll Reconcilliation';
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Earnings Report";
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Deductions Report";
                }
                action("New Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Employees';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New Employees";
                }
                action("Employees Removed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Removed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employees Removed";
                }
                action("Payroll Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Summary";
                }
                action("Master Roll(Department)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll(Department)';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Master Roll(Departments)";
                }
                action("Master Roll(Salary Scale)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll(Salary Scale)';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee Grouped Scales";
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee Master Roll";
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Summary";
                }
                action("Payroll Reconciliation (Gross)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation(Gross)';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation(Gross)";
                }
                action("Payroll Reconciliation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Details';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Earnin";
                }
            }
        }
        area(embedding)
        {
          
            action("Employee List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List-P";
            }
            action("Pay Periods")
            {
                ApplicationArea = Basic;
                Caption = 'Pay Periods';
                Image = Employee;
                RunObject = Page "Pay Periods";
            }
            action(Earnings)
            {
                ApplicationArea = Basic;
                Caption = 'Earnings';
                Image = Employee;
                RunObject = Page Earnings;
            }
            action(Deductions)
            {
                ApplicationArea = Basic;
                Caption = 'Deductions';
                Image = Employee;
                RunObject = Page Deductions;
            }
            action("Salary Processing")
            {
                ApplicationArea = Basic;
                Caption = 'Salary Vouchers';
                Image = Loaners;
                RunObject = Page "Payroll Processing List";
            }
            action("Brackets Table")
            {
                ApplicationArea = Basic;
                Caption = 'Brackets Table';
                Image = Employee;
                RunObject = Page "Brackets Table";
            }
            action(Loans)
            {
                ApplicationArea = Basic;
                Caption = 'Loans';
                Image = Loaners;
                RunObject = Page Loans;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Employee;
                RunObject = Page Dimensions;
            }
            action("Employee Posting Group")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Posting Group';
                Image = Employee;
                RunObject = Page "Employee Posting Group";
            }
            action("Employee PGroups")
            {
                ApplicationArea = Basic;
                Caption = 'Employee PGroups';
                RunObject = Page "Employee PGroups";
            }
            action("Employee Bank List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Bank List';
                Image = Employee;
                RunObject = Page "Employee Bank List";
            }
            action("Loans Products")
            {
                ApplicationArea = Basic;
                Caption = 'Loans Products';
                Image = Loaners;
                RunObject = Page "Loan Products";
            }
        }
        area(sections)
        {
            group("Salary Advance")
            {
                action("Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Salary Advance List";
                }
                action("Approved Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Salary Advance List";
                }
                action("Posted  Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted  Salary Advance List";
                }
            }
            group("Management Approvals")
            {
                Caption = 'Management Approvals';
                Image = Confirm;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = ServiceAgreement;
                    RunObject = Page "Approval Entries";
                }
            }
        }
        area(processing)
        {
            group("Data Import")
            {
                Caption = 'Data Import';
                Image = Calculator;
                action("Earnings Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Earnings Import';
                    Image = Import;
                    RunObject = XMLport "Earnings Import";
                }
                action("Deductions Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions Import';
                    Image = Import;
                    RunObject = XMLport "Deductions Import";
                }
            }
            group("Payroll Processing")
            {
                Caption = 'Payroll Processing';
                Image = Calculator;
                action("Current Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Current Earnings/Deductions";
                }
                action("Run Payroll Run")
                {
                    ApplicationArea = Basic;
                    Caption = 'Run Payroll Run';
                    Image = Calculate;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Payroll Run";
                }
                action("Process Loan Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Loan Interest';
                    Image = Suggest;
                    Promoted = true;
                    PromotedIsBig = true;
                    //  RunObject = Report "Process Loan Interest";
                }
                action("Assign Default Earnings/Ded")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    Promoted = true;
                    PromotedIsBig = true;
                    // RunObject = Report "Assign Default Earning/Deducti";
                }
                action("Closed Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Closed Earnings/Deductions";
                }
            }
            group("Data Export")
            {
                Caption = 'Data Export';
                Image = Calculator;
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'EFT';
                    Image = Export;
                    //  RunObject = Report "EFT/SFI-Admin";
                }
                action("Send PDF Payslips")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send PDF Payslips';
                    Image = Export;
                    //   RunObject = Report "Send PDF Payslips";
                }
            }
        }
    }
}
profile HRAdministratorRoleCenter
{
    ProfileDescription = 'HR Administrator Role Center';
    RoleCenter = "Payroll Admin Role Center";
    Caption = 'HR Administrator Role Center';
}
