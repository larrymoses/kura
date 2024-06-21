#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
//Page 69076 "HR Manager Role Center"
//{
// Caption = 'Role Center';
// PageType = RoleCenter;

// layout
// {
//     area(rolecenter)
//     {
//         group(Control1900724808)
//         {
//             part(Control19046520 08; "HR Manager Activities")
//             {
//             }
//             systempart(Control10000000 50;MyNotes)
//             {
//             }
//             systempart(Control19014203 08;Outlook)
//             {
//             }
//         }
//         group(Control1900724708)
//         {
//             part(Control 21;"My Job Queue")
//             {
//                 Visible = false;
//             }
//         }
//     }
// }

// actions
// {
//     area(reporting)
//     {
//         separator(Action1000000008)
//         {
//             Caption = 'Tasks';
//             IsHeader = true;
//         }
//         group(Payslip)
//         {
//             Caption = 'Payslip';
//             action("1 Page Payslip")
//             {
//                 ApplicationArea = Basic;
//                 Caption = '1 Page Payslip';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "New Payslipx";
//             }
//             action("2 Page Payslip")
//             {
//                 ApplicationArea = Basic;
//                 Caption = '2 Page Payslip';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "New 2 page Payslip";
//             }
//             action("3 Page Payslip")
//             {
//                 ApplicationArea = Basic;
//                 Caption = '3 Page Payslip';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "New 3 page Payslipx";
//             }
//         }
//         separator(Action1000000041)
//         {
//             Caption = 'Tasks';
//             IsHeader = true;
//         }
//         group("Employee Management Reports")
//         {
//             Caption = 'Employee Management Reports';
//             Visible = true;
//             action("Employee Phone Numbers")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Phone Numbers';
//                 Image = "Report";
//                 RunObject = Report "Employee - Phone Nos.";
//             }
//             action("Employee Addresses")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Addresses';
//                 Image = "Report";
//                 RunObject = Report "Employee - Addresses";
//             }
//             action("Employee Labels")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Labels';
//                 Image = "Report";
//                 RunObject = Report "Employee - Labels";
//             }
//             action("Employee Statements")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Statements';
//                 Image = "Report";
//                 RunObject = Report "Employee Statement";
//             }
//             action("Employee Birthdays")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Birthdays';
//                 Image = "Report";
//                 RunObject = Report "Employee - Birthdays";
//             }
//             action("Employee Qualifications")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Qualifications';
//                 Image = "Report";
//                 RunObject = Report "Employee - Qualifications";
//             }
//             action("Employees Leaving")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employees Leaving';
//                 Image = "Report";
//                 RunObject = Report "Employees Leaving Payroll";
//             }
//             action("Employee Relatives")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Relatives';
//                 Image = "Report";
//                 RunObject = Report "Employee - Relatives";
//             }
//             action("Employee List")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee List';
//                 Image = "Report";
//                 RunObject = Report "Employee - List";
//             }
//             action("New Employees Joining")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'New Employees Joining';
//                 Image = "Report";
//                 RunObject = Report "Employees Joining Payroll";
//             }
//         }
//         group("Leave Management")
//         {
//             Caption = 'Leave Management';
//             Visible = true;
//             action("Leave Statistics")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Statistics';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "HR Leave Statistics";
//             }
//             action("Leave Statement")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Statement';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "HR Leave Statement";
//             }
//             action("Leave Application List")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Application List';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "Leave Trend Analysis";
//             }
//             action("Leave Application Form")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Application Form';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "Leave Application Form";
//             }
//         }
//         group("Absense Management")
//         {
//             Caption = 'Absense Management';
//             Visible = true;
//             action("Employee Absences by Causes")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Absences by Causes';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "Employee - Absences by Causes";
//             }
//             action("Employee Staff Absence Report")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Staff Absence Report';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "Employee - Staff Absences";
//             }
//         }
//     }
//     area(embedding)
//     {
//         group(Positions)
//         {
//             Caption = 'Positions';
//         }
//         action(Action1000000007)
//         {
//             ApplicationArea = Basic;
//             Caption = 'Employee List';
//             Image = Employee;
//             RunObject = Page "Employee List-HR";
//         }
//         group(Leave)
//         {
//             Caption = 'Leave';
//             action("Leave Balances")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Balances';
//                 Image = Employee;
//                 RunObject = Page "Leave Balances";
//             }
//             action("Posted Leave Days")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Posted Leave Days';
//                 Image = Employee;
//                 RunObject = Page "Posted Leave Days";
//                 Visible = false;
//             }
//         }
//     }
//     area(sections)
//     {
//         group("Employee Self Service")
//         {
//             Caption = 'Employee Self Service';
//             Image = HumanResources;
//             action("Leave Applications")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Applications';
//                 Image = ServiceAgreement;
//                 RunObject = Page "Leave Applications List";
//                 RunPageView = sorting("Application Code")
//                               order(descending);
//             }
//             action("Approved Leave Applications")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Approved Leave Applications';
//                 Image = ServiceAgreement;
//                 RunObject = Page "Approved Leave Applications";
//             }
//         }
//         group("Management Approvals")
//         {
//             Caption = 'Management Approvals';
//             Image = Confirm;
//             action("Approval Entries")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Approval Entries';
//                 Image = ServiceAgreement;
//                 RunObject = Page "Approval Entries";
//             }
//         }
//         group(Administration)
//         {
//             Caption = 'Administration';
//             Image = Administration;
//             action(Dimensions)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Dimensions';
//                 Image = Employee;
//                 RunObject = Page Dimensions;
//             }
//             action("Human Resources Setup")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Human Resources Setup';
//                 Image = AccountingPeriods;
//                 RunObject = Page "HR Setup List";
//             }
//             action("Employee Posting Group")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Posting Group';
//                 Image = AccountingPeriods;
//                 RunObject = Page "Employee Posting Group";
//             }
//             action("Leave Types")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Types';
//                 Image = AccountingPeriods;
//                 RunObject = Page "Leave Types";
//             }
//             action("Human Res. Units of Measure")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Human Res. Units of Measure';
//                 Image = AccountingPeriods;
//                 RunObject = Page "Human Res. Units of Measure";
//             }
//             action("Registration Codes")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Registration Codes';
//                 RunObject = Page "Causes of Absence";
//             }
//             action("Causes of Inactivity")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Causes of Inactivity';
//                 Image = Currency;
//                 RunObject = Page "Causes of Inactivity";
//             }
//             action("Grounds for Termination")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Grounds for Termination';
//                 Image = AccountingPeriods;
//                 RunObject = Page "Grounds for Termination";
//             }
//             action(Unions)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Unions';
//                 RunObject = Page Unions;
//             }
//             action("Employment Contracts")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employment Contracts';
//                 Image = Currency;
//                 RunObject = Page "Employment Contracts";
//             }
//             action(Relatives)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Relatives';
//                 Image = Employee;
//                 RunObject = Page Relatives;
//             }
//             action("Misc. Articles")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Misc. Articles';
//                 RunObject = Page "Misc. Articles";
//             }
//             action(Confidential)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Confidential';
//                 RunObject = Page Confidential;
//             }
//             action(Qualifications)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Qualifications';
//                 Image = Currency;
//                 RunObject = Page Qualifications;
//             }
//             action("Pay Periods")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Pay Periods';
//                 Image = Currency;
//                 RunObject = Page "Pay Periods";
//             }
//             action("Employee Statistics Groups")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Employee Statistics Groups';
//                 Image = Employee;
//                 RunObject = Page "Employee Statistics Groups";
//             }
//         }
//     }
//     area(processing)
//     {
//         group("Company Information")
//         {
//             Caption = 'Company Information';
//             action(Action1000000020)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Company Information';
//                 Image = "company information";
//                 Promoted = false;
//                 RunObject = Page "Company Information";
//             }
//             action(Comittees)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Comittees';
//                 Image = Customer;
//                 Promoted = false;
//                 RunObject = Page "Director Payroll Header";
//             }
//             action("Committee Members")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Committee Members';
//                 Image = Relatives;
//                 Promoted = false;
//                 RunObject = Page "ApprovedDirector Payroll Lines";
//             }
//             action("Rules and Regulations")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Rules and Regulations';
//                 Image = Permission;
//                 Promoted = false;
//                 RunObject = Page "Director Payroll Lines";
//             }
//             action("Company Activities")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Company Activities';
//                 Image = "Action";
//                 Promoted = false;
//                 RunObject = Page "AprovedDirector Payroll Header";
//             }
//             action("Company Calendar")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Company Calendar';
//                 Image = AbsenceCalendar;
//                 Promoted = false;
//                 RunObject = Page "Base Calendar Card";
//             }
//         }
//         group("Man Power Planning")
//         {
//             Caption = 'Man Power Planning';
//             Image = Calculator;
//             action(Action1000000029)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Positions';
//                 Image = Category;
//                 Promoted = false;
//                 RunObject = Page "Job Application Card";
//             }
//             action("Vacant Positions")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Vacant Positions';
//                 Image = Category;
//                 RunObject = Page "Staff Requisition Card";
//             }
//             action("Over Staffed Positions")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Over Staffed Positions';
//                 Image = Category;
//                 RunObject = Page "Staff Requisition Lines";
//             }
//             action("Jobs Supervised")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Jobs Supervised';
//                 Image = Hierarchy;
//                 Promoted = false;
//                 RunObject = Page "Staff Establishment Plan Lines";
//                 Visible = false;
//             }
//             action("Job Responsibility")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Job Responsibility';
//                 Image = ResourceSkills;
//                 Promoted = false;
//                 RunObject = Page "Manpower Task Lines";
//             }
//             action("Job Specification")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Job Specification';
//                 Image = Skills;
//                 Promoted = false;
//                 RunObject = Page "Manpower Plan List";
//             }
//             action("Job Working Relationship")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Job Working Relationship';
//                 Image = Allocations;
//                 Promoted = false;
//                 RunObject = Page "Manpower Plan Statistics";
//                 Visible = false;
//             }
//         }
//         group(ActionGroup1000000023)
//         {
//             Caption = 'Leave Management';
//             Image = Calculator;
//             action(Action1000000061)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Balances';
//                 Image = Balance;
//                 RunObject = Page "Leave Balances";
//             }
//             action("Accrue Annual Leave")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Accrue Annual Leave';
//                 Image = Calculate;
//                 Promoted = false;
//                 //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedIsBig = false;
//                 RunObject = Report "Accrue Leave";
//                 Visible = false;
//             }
//             action("Leave Posting Journal")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Leave Posting Journal';
//                 Image = GLJournal;
//                 RunObject = Page "Leave Posting Journal";
//                 Visible = false;
//             }
//             action("HR Leave Adjustment")
//             {
//                 ApplicationArea = Basic;
//                 RunObject = Page "HR Leave Adjustment";
//             }
//         }
//         group("Disciplinary Management")
//         {
//             Caption = 'Disciplinary Management';
//             Image = Calculator;
//         }
//         group(Absence)
//         {
//             Caption = 'Absence';
//             action("Absence Registration")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Absence Registration';
//                 Image = Absence;
//                 RunObject = Page "Absence Registration";
//             }
//         }
//         group(Training)
//         {
//             Caption = 'Training';
//             action("Training Needs")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Training Needs';
//                 Image = Forecast;
//                 RunObject = Page "Training Needs";
//                 Visible = false;
//             }
//         }
//     }
// }
//}

