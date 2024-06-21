page 60002 "HR Role Center"
{
    Caption = 'HR Role Center';
    PageType = RoleCenter;

    actions
    {

        area(Sections)
        {
            group("Company Information1")
            {
                Caption = 'Company Information';
                action("Company Information")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Company Information';
                    RunObject = page "Employee List";
                }
                action("Base Calendar Card")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Base Calendar Card';
                    RunObject = page "Base Calendar Card";
                }
            }
            group("Hr Planning Management")
            {
                Caption = 'Hr Planning Management';
                action("Positions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Positions';
                    RunObject = page "Positions";
                }
                action("Duty Stations")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Stations';
                    RunObject = page "Duty Stations";
                }
            }
            group("Employee Management")
            {

                action("Employees12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = page "Employee List-HR";
                }
                action("Employee List-Casual")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee List-Casual';
                    RunObject = page "Employee List-Casual";
                }

                action("Hardship Allowance Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Hardship Allowance Setup';
                    RunObject = page "Hardship Allowance Setup";
                }
                action("Employee Transfers History")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Transfers History';
                    RunObject = page "Employee Transfers History";
                }
                action("Staff Exit Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Staff Exit Setup';
                    RunObject = page "Staff Exit Setup";
                }
                group("Reports2")
                {
                    Caption = 'Reports and Analysis';
                    action("Employee List Per Region/Towns")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List Per Region/Towns';
                        RunObject = page "Employee List";
                    }
                    action("Employee - Absences by Causes1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        //   RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                    }
                    action("Employee - Alt. Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                    }
                    action("Employee - Birthdays1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                    }
                    action("Employee - Confidential Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                    }
                    action("Employee - Contracts1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                    }
                    action("Employee - Labels1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                    }
                    action("Employee - List1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                    }
                    action("Employee - Misc. Article Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                    }
                    action("Employee - Qualifications1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                    }
                    action("Employee - Relatives1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                    }
                    action("Employee - Staff Absences1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        // RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                    }
                    action("Staff Exits")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Exits';
                        RunObject = report "Staff Exits";
                    }

                }
            }
            group("Establishment")
            {
                Caption = 'Establishment';
                action("Board1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Board';
                    RunObject = page "Board List";
                }
                action("Legal Entities")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Legal Entities';
                    RunObject = page "Legal Entity List";
                }
                action("Directorates1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Directorates';
                    RunObject = page "Directorate List";
                }
                action("Departments")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Departments';
                    RunObject = page "Department List";
                }
                action("Terms of Service")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Terms of Service';
                    RunObject = page "Terms of Service";
                }
                action("Duty Station")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Station';
                    RunObject = page "Duty Station";
                }
                action("Job Grades")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Job Grades';
                    RunObject = page "Job Grades";
                }
                action("Designation Groups")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Designation Groups';
                    RunObject = page "Designation Groups";
                }
                action("Employee Work Shift")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Work Shift';
                    RunObject = page "Employee Work Shift";
                }
                action("Positions1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Positions';
                    RunObject = page "Positions";
                }
                action("Global Staff Establishment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Global Staff Establishment';
                    RunObject = page "Staff Establishment Plans";
                }
                action("Regions List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Regions List';
                    RunObject = page "Regions List";
                }
                action("Centers")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Centers';
                    RunObject = page "Center List";
                }
                action("Sections1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Sections';
                    RunObject = page "Section List";
                }
                action("Organization Hierarchy")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Organization Hierarchy';
                    RunObject = page "Organization Hierarchy";
                }
                action("Commitee Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Commitee Types';
                    RunObject = page "Commitee Types";
                }
                action("Domain Area")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Domain Area';
                    RunObject = page "Domain Area";
                }
                action("HR Committee Appointment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Committee Appointment List';
                    RunObject = page "HR Committee Appointment List";
                }
                group("Reports11")
                {
                    caption = 'Reports';
                    action("Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Establishment';
                        //   RunObject = report "Staff Establishment";
                    }
                    action("Detailed Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Detailed Staff Establishment';
                        //   RunObject = report "Detailed Staff Establishment";
                    }
                }


            }
            group("Recruitment  & Selection")
            {
                Caption = 'Recruitment  & Selection';
                group("Pre-Hire Preparation")
                {
                    action("HR Officers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Officers';
                        RunObject = page "HR Officers";
                    }
                    action("Recruitment Agencies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Agencies';
                        RunObject = page "Recruitment Agencies";
                    }
                    action("Hr Guiding Principle")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Hr Guiding Principle';
                        RunObject = page "Hr Guiding Principle";
                    }
                    action("HR Document Template")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Document Template';
                        RunObject = page "Document Template-HR";
                    }
                    action("Recruitment Reasons")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Reasons';
                        RunObject = page "Recruitment Reasons";
                    }
                    action("Job Boards")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Boards';
                        RunObject = page "Job Boards.";
                    }
                    action("Functional Recruitment Plans")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Functional Recruitment Plans';
                        RunObject = page "Functional Recruitment Plans";
                    }
                    action("Annual Recruitment Plans")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Recruitment Plans';
                        RunObject = page "Recruitment Plans";
                    }
                    action("Recruitment Requisitions")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Requisitions';
                        RunObject = page "Recruitment Requisitions";
                    }
                    action("Employer Information")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employer Profile';
                        RunObject = page "Company Information";
                    }
                    action("Employee List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = page "Employee List";
                    }
                    action("Qualifications Invetory")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Qualifications Inventory';
                        RunObject = page "Qualifications";
                    }
                    action("Created Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Created Vacancies';
                        RunObject = page "Created Vacancies";
                    }
                    action("Career Fair Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Career Fair Vouchers';
                        RunObject = page "Career Fair Vouchers";
                    }
                    action("Vacancy Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Vacancy Announcement Vouchers';
                        RunObject = page "Vacancy Announcement Vouchers";
                    }
                    action("Recruitment Agency Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Agency Vouchers';
                        RunObject = page "Recruitment Agency Vouchers";
                    }
                    action("Partially Filled Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Partially Filled Vacancies';
                        RunObject = page "Vacancies";
                    }
                    action("Fully Filled Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Fully Filled Vacancies';
                        RunObject = page "Vacancies";
                    }
                    action("Approved Vacancy Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Vacancy Announcement Vouchers';
                        RunObject = page "Approved Vacancy Ann Vouchers";
                    }
                    action("Published Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Published Announcement Vouchers';
                        RunObject = page "Published Ann Vouchers";
                    }
                    action("Declaration Setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Declaration Setup';
                        RunObject = page "Declaration Setup";
                    }
                    action("Close Ended Qn Type")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Close Ended Qn Type';
                        RunObject = page "Close Ended Qn Type";
                    }
                    action("Pre-Screening Templates")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Pre-Screening Templates';
                        RunObject = page "Pre-Screening Templates";
                    }
                    action("Job Grades11")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Grades';
                        RunObject = page "Job Grades";
                    }
                    action("Domain Area1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Domain Area';
                        RunObject = page "Domain Area";
                    }
                    group("reports123")
                    {
                        caption = 'Reports';

                        action("Detailed Manpower Plan")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Detailed Manpower Plan';
                            //  RunObject = report "Staff Establishment";
                        }
                        action("Recruitment  Requisition List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Recruitment  Requisition List';
                            //  RunObject = report "Staff Establishment";
                        }
                        action("Vacancies List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Vacancies List';
                            // RunObject = report "Vacancies List";
                        }
                        action("Vacancy Announcements List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Vacancy Announcements List';
                            // RunObject = report "Vacancy Announcements List";
                        }
                    }
                }
                group("Application & Selection")
                {
                    action("Candidates")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Candidates';
                        RunObject = page "Candidates";
                    }

                    action("Open Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Open Vacancies';
                        RunObject = page "Vacancies";
                        RunPageLink = "Approval Status" = filter(Open);
                    }
                    action("Job Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Applications';
                        RunObject = page "Job Applications";
                    }

                    action("Commitee Appointment Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Commitee Appointment Vouchers';
                        RunObject = page "Commitee Appointment Vouchers";
                    }
                    action("Shortlist Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Shortlist Vouchers';
                        RunObject = page "Candidate Shortlist Vouchers";
                    }

                    action("Interview Invitations")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Interview Invitations';
                        RunObject = page "Interview Invitations";
                    }
                    action("Interview Records")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Interview Records';
                        RunObject = page "Candidate Interview Records";
                    }
                    action("Consolidated Interview Records")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Consolidated Interview Records';
                        RunObject = page "Consolidated Interview Records";
                    }
                    action("Closed Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Vacancies';
                        RunObject = page "Vacancies";
                        RunPageLink = "Vacancy Status" = filter(Closed), "Approval Status" = filter(Released);
                    }
                    action("Rejected Job Offers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Rejected Job Offers';
                        RunObject = page "Rejected Job Offers";
                    }
                    group("Administration2121")
                    {
                        caption = 'Administration';
                        action("Job Board")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Job Board';
                            RunObject = page "Job Boards.";
                        }
                        action("Hobby Types")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hobby Types';
                            RunObject = page "Hobby Types";
                        }
                        action("Disability Code")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Disability Code';
                            RunObject = page "Disability Code";
                        }
                        action("Ethnic Groups")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Ethnic Groups';
                            RunObject = page "Ethnic Groups";
                        }
                        action("System Shortlisted Application")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'System Shortlisted Application';
                            RunObject = page "System Shortlisted Application";
                        }
                        action("Background Checks")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Background Checks';
                            RunObject = page "Background Checks";
                        }
                        action("Medical Check Reports")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Check Reports';
                            RunObject = page "Medical Check Reports";
                        }
                        action("Apptitude Question")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Apptitude Question';
                            RunObject = page "Apptitude Question";
                        }
                        action("Ability Test Responses")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Ability Test Responses';
                            RunObject = page "Ability Responses";
                        }
                        action("Interview Scoresheet Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Interview Scoresheet Templates';
                            RunObject = page "Interview Scoresheet Templates";
                        }

                        action("Medical History Setup")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical History Setup';
                            RunObject = page "Medical History Setup";
                        }
                        action("Medical Examination Type")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Examination Type';
                            RunObject = page "Medical Examination Type";
                        }
                        action("Referee Recommendation")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Referee Recommendation';
                            RunObject = page "Referee Recommendation";
                        }
                        action("Medical Check Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Check Templates';
                            RunObject = page "Medical Check Templates";
                        }
                        action("Shortlisting Score Code")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Shortlisting Score Code';
                            RunObject = page "Shortlisting Score Code";
                        }
                        action("Published Vacancies List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Published Vacancies List';
                            RunObject = page "All Published  Vacancies List";
                        }
                    }

                }
                group("Appointment & Onboarding")
                {
                    action("Employees23")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employees';
                        RunObject = page "Employee List";
                    }
                    action("Employee Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = page "Contract List";
                    }
                    action("Employment Offers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employment Offers';
                        RunObject = page "Employment Offers";
                    }
                    action("Terminated Employee Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Terminated Employee Contracts';
                        RunObject = page "Employee List";
                    }
                    action("Employee Statistics Groups1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Statistics Groups';
                        RunObject = page "Employee Statistics Groups";
                    }
                    action("Employee Contract Groups")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contract Groups';
                        RunObject = page "Employee Statistics Groups";
                    }

                }
            }
            group("Leave Management")
            {
                Caption = 'Leave Management';
                group("Setup")
                {
                    action("HR Leave Periods")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Leave Periods';
                        RunObject = page "HR Leave Periods";
                    }
                    action("Base Leave Calender")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Base Leave Calender';
                        RunObject = page "Base Calendar Card";
                    }
                    action("HR Leave Types")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Leave Types';
                        RunObject = page "HR Leave Types";
                    }

                    action("Leave Adjustment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Adjustment';
                        RunObject = page "HR Leave Adjustment";
                    }
                    action("Leave Batches")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Batches';
                        RunObject = page "HR Leave Batches";
                    }

                }

                group("Leave Management List")
                {
                    action("Leave Application")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Applications';
                        RunObject = page "Leave Applications List";
                    }
                    action("Leave Planner List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Planner List';
                        RunObject = page "Leave Planner List";
                    }
                    action("Employee Leave Balances")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Balances';
                        RunObject = page "Employee Leave Balances";
                    }

                    action("Approved Leave Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Leave Applications';
                        RunObject = page "Approved Leave Applications";
                    }
                    action("Posted Leave Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Posted Leave Applications';
                        RunObject = page "Posted Leave Applications..";
                    }
                }
                group("Leave Recall")
                {
                    action("Leave Recalls")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Recalls';
                        RunObject = page "Leave Application Recall";
                    }
                }
                group("Leave Plan")
                {
                    action("Leave Plan list")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Plans';
                        RunObject = page "Leave Planner List";
                    }
                    action("Leave Plan Report")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Plans Report';
                        RunObject = report "Leave Planner";
                    }
                }
                group("Reports999999")
                {
                    Caption = 'Reports';
                    // action("Leave Application Form")
                    // {
                    //     ApplicationArea = BasicHR;
                    //     Caption = 'Leave Application Form';
                    //     // RunObject = Report "Leave Application Form";
                    // }
                    action("Employee Leave Approval ")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Approval Report';
                        RunObject = Report "Leave Approval Report";
                    }
                    action("Employee Leave Balance")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Balances';
                        RunObject = Report "HR Leave Balance";
                    }
                    action("Employee Leave Allowance Payment Status")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Allowance Payment Status';
                        RunObject = Report "HR Leave Allowance Status";
                    }
                    // action("HR Leave Liability Report KURA")
                    // {
                    //     ApplicationArea = BasicHR;
                    //     Caption = 'HR Leave Liability Report KURA';
                    //     //RunObject = Report "HR Leave Liability Report KeRR";
                    // }
                }

            }
            group("Welfare Management")
            {
                Caption = 'Welfare Management';
                Image = HumanResources;
                action("Request Welfare Membership")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare Membership';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Membership";
                    ToolTip = 'Executes the Request Welfare Membership action.';
                }
                action("Welfare Members List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Members List';
                    Image = Employee;
                    RunObject = Page "Welfare Members List";
                    ToolTip = 'Executes the Welfare Members List action.';
                }
                action("Request Welfare benefit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare benefit';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Benefit";
                    ToolTip = 'Executes the Request Welfare benefit action.';
                }
                action("Welfare Contributions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Contributions';
                    Image = Employee;
                    RunObject = Page "Welfare Contributions";
                    ToolTip = 'Executes the Welfare Contributions action.';
                }
            }
            group("Discplinary Case Management")
            {
                Caption = 'Discplinary Case Management';
                action("Employee Discplinary List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Discplinary List';
                    RunObject = page "Hr New Discplinary List";
                }
                action("Discplinary Files List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Discplinary Files List';
                    RunObject = page "Hr Discplinary List";
                }

                action("Disciplinary Committee")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Committee';
                    RunObject = page "Disciplinary Committee";
                }
                action("Disciplinary Deduction Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Deduction Setup';
                    RunObject = page "Disciplinary Status";
                }
                group("Reports2323")
                {
                    Caption = 'Reports';
                    action("Disciplinary Cases Report")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report';
                        RunObject = report "HR Disciplinary Cases Report";
                    }
                    action("Disciplinary Cases Report per Employee")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report per Employee';
                        //RunObject = Report "HR Cases Report - Employee Bas";
                    }
                    action("Disciplinary Cases Report per Dept")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report per Dept';
                        //RunObject = Report "HR Cases Report - Dept Based";
                    }

                }


            }
            group("Overtime Management")
            {
                Caption = 'Overtime Management';
                action("Overtime List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime List';
                    RunObject = page "Overtime List";
                }
                action("Approved Overtime")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Approved Overtime';
                    RunObject = page "Approved Overtime List";
                }
                action("Overtime Report")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime Report';
                    //  RunObject = report "Overtime Report";
                }
                action("Overtime Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime Types';
                    RunObject = page "Overtime Types";
                }
            }
            group("Absence Registration")
            {
                Caption = 'Absence Registration';
                action("Causes of Absence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Absence';
                    RunObject = page "Causes of Absence";
                }
                action("Absence Registration12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";
                }
                action("Staff Absences")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Staff Absences';
                    RunObject = report "Employee - Staff Absences";
                }
                action("Employee Absences by Causes")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Absences by Causes';
                    RunObject = report "Employee - Absences by Causes";
                }
            }


            group("Group")
            {
                Caption = 'Employees';
                action("Employees")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = page "Employee List";
                }
                action("Absence Registration1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";

                }
                group("Group1")
                {
                    Caption = 'Reports';
                    action("Employee - Absences by Causes")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        //   RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                    }
                    action("Employee - Alt. Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                    }
                    action("Employee - Birthdays")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                    }
                    action("Employee - Confidential Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                    }
                    action("Employee - Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                    }
                    action("Employee - Labels")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                    }
                    action("Employee - List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                    }
                    action("Employee - Misc. Article Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                    }
                    action("Employee - Qualifications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                    }
                    action("Employee - Relatives")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                    }
                    action("Employee - Staff Absences")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        // RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                    }
                }
            }

            group("Group2")
            {
                Caption = 'Setup';
                action("Human Resources Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Setup';
                    RunObject = page "Human Resources Setup";
                }
                action("Human Resources Units of Measu")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Units of Measure';
                    RunObject = page "Human Res. Units of Measure";
                }
                action("Causes of Inactivity")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Inactivity';
                    RunObject = page "Causes of Inactivity";
                }
                action("Grounds for Termination")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Grounds for Termination';
                    RunObject = page "Grounds for Termination";
                }
                action("Unions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Unions';
                    RunObject = page "Unions";
                }
                action("Employment Contracts")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employment Contracts';
                    RunObject = page "Employment Contracts";
                }
                action("Relatives")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Relatives';
                    RunObject = page "Relatives";
                }
                action("Misc. Articles")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Misc. Articles';
                    RunObject = page "Misc. Articles";
                }
                action("Confidential")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Confidential';
                    RunObject = page "Confidential";
                }
                action("Qualifications")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Qualifications';
                    RunObject = page "Qualifications";
                }
                action("Employee Statistics Groups")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Statistics Groups';
                    RunObject = page "Employee Statistics Groups";
                }
            }
            group("Training Management")
            {
                Caption = 'Training Management';
                group("Training Setup")
                {
                    Caption = 'Training Setup';
                    action("Setups")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Setups';
                        RunObject = page 69314;
                    }
                    action("Training Goal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Goal';
                        RunObject = page 69304;
                    }
                    action("Training Domains")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Domains';
                        RunObject = page "Training Domains";
                    }
                    action("Training Courses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Courses';
                        RunObject = page "Training Courses Setup";
                    }
                    action("Rating Category setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Feedback Rating Category';
                        RunObject = page "Rating Category Setup";
                    }
                    action("Competency Perfomance Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page 80108;
                    }
                    action(RatingScales)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Rating Scales';
                        RunObject = page "Rating Scales";
                    }
                    action(CategoryRatingScale)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Category Rating Scale';
                        RunObject = page "Category Rating Scale";
                    }
                    action(TrainingNeedCategories)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Need Categories';
                        RunObject = page "Training Need Categories";
                    }
                }
                group("Training Needs Register")
                {
                    caption = 'Training Needs Register';
                    action(TrainingNeeds)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Needs';
                        RunObject = page 69309;

                    }
                    action("Training Needs Request")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Needs Requests';
                        RunObject = page "Training Need Requests";

                    }
                    action("Submitted Training Needs")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Training Needs';
                        RunObject = page 65152;

                    }
                }
                group("Training Planning")
                {
                    Caption = 'Training Planning';
                    action(TrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Plans';
                        RunObject = page 69194;

                    }
                    action(ApprovedTrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Training Plans';
                        RunObject = page 69199;

                    }

                }
                group("Training Application")
                {
                    caption = 'Training Applications';
                    action(TrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Application List';
                        RunObject = page 69220;
                    }
                    action(ApprovedTrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Training Applications';
                        RunObject = page 69280;
                    }
                    action(ProcessedTrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Processed Training Applications';
                        RunObject = page 69282;
                    }
                }
                group("Reports")
                {
                    caption = 'Reports';
                    action(AnnualTrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Training Plans';
                        // RunObject = report 69145;
                    }
                    action(TotalsTrainingsPerEmployee)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Totals Trainings Per Employee';
                        // RunObject = report 69111;
                    }
                    action(DepartmentalTraining)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Departmental Trainings';
                        // RunObject = report 69112;
                    }
                    action(AnnualTrainingPlansStatistics)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Training Plans Statistics';
                        // RunObject = report 69114;
                    }
                    action("TNA - Analysis Report")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'TNA - Analysis Report';
                        RunObject = Report 50025;
                    }
                    action("TNA - Per FY")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'TNA Per Employee';
                        RunObject = Report 50039;
                    }
                }

            }
            group("Performance Evaluation")
            {
                group(PSetups)
                {
                    Caption = 'Setups';
                    action("Appraisal Periods")
                    {
                        ApplicationArea = BasicHr;
                        Caption = 'Appraisal Periods';
                        Runobject = Page "Appraisal Periods";
                    }
                    action("Departmental Objectives")
                    {
                        ApplicationArea = BasicHr;
                        //RunObject = Page "Departments Objectives";
                        RunObject = Page "Functional Annual Workplans";
                        Caption = 'Departmental Objectives';

                    }
                    action(SPMGeneralSetup)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'SPM General Setup';
                        RunObject = Page "Strategy General Setup";
                    }
                    action("All Performance Contracts")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = Page "All Performance Contracts";
                    }
                }
                group("Standard Appraisal")
                {
                    action(StandardPerformanceAppraisal)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Standard Performance Appraisal';
                        RunObject = Page "Standard Perfomance Appraisal";
                    }
                    action("Standard Appraisal Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Standard Appraisal Evaluation';
                        RunObject = Page "Standard Appraisal-Evaluation";
                    }
                    action("Submitted Standard Appraisal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Standard Appraisal';
                        RunObject = Page "Standard Appraisal-Submitted";
                    }
                    action("Closed Standard Appraisal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Standard Appraisal';
                        RunObject = Page "Standard Appraisal-Closed";
                    }
                }
                group("Employee-Supervisor Appraisal")
                {
                    action("Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Self-Supervisor Appraisals';
                        RunObject = Page "Self-Supervisor Appraisals";
                    }
                    action("Self Supervisor Appraisals Under Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Self Supervisor Appraisals Under Evaluation';
                        RunObject = Page "Self-Supervisor Appraisals-E";
                    }
                    action("Submitted Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Self-Supervisor Appraisals';
                        RunObject = Page "Self-Supervisor Appraisals-Sub";
                    }
                    action("Closed Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Self-Supervisor Appraisals';
                        RunObject = Page "SelfSupervisorAppraisal-Closed";
                    }
                }
                group("360 Degree-Appraisal")
                {
                    action("360 Degree Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = '360 Degree Appraisals';
                        RunObject = Page "Group Appraisals";
                    }
                    action("Group Appraisals Under Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Group Appraisals Under Evaluation';
                        RunObject = Page "Group Appraisal-Evaluations";
                    }
                    action("Submitted Group Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Group Appraisals';
                        RunObject = Page "Group Appraisal-Submitted";
                    }

                }
                group(AppraisalReports)
                {
                    Caption = 'Reports';
                    Visible = false;
                }
            }
            group("Subscription & Continuous Development")
            {
                action("Subscription Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Setup';
                    RunObject = Page SubscriptionSetup;
                }
                group("Professional Bodies")
                {
                    action("Member Categories")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Member Categories';
                        RunObject = Page "Prof.BodyMembeshipCategories";
                    }
                    action("Professional Body")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Professional Bodies';
                        RunObject = Page "Professional Bodies List";
                    }
                    action("Membership Fees Req.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Open Membership Fee Req.';
                        RunObject = Page "Membership Fee Requisitions";
                    }
                    action("Pending Membership Fees Req.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Pending Membership Fee Req.';
                        RunObject = Page "Pending Membership Fees Req";
                    }
                    action("Approved Membership Fees Req.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Membership Fees Req.';
                        RunObject = Page "Approved Membership Fees Req.";
                    }
                    action("Subscription Conferences List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Subscription Conferences List';
                        RunObject = Page "Subscription Conferences";
                    }
                }
                group(SubscriptionReports)
                {
                    Caption = 'Reports';
                    action("Professional Bod")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Professional Bodies';
                        RunObject = Report "SProfessional Bodies Report";
                    }
                    action("Membership Professional Bod")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Membership to Professional Bodies';
                        RunObject = Report "Membership PBody Report";
                    }
                    action("Employee Professional Bod")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employees Registered to Professional Bodies';
                        RunObject = Report "Employee PBody Membership";
                    }
                    action("Paid Membership Fees")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Paid Membership Fees';
                        RunObject = Report "Paid PBody Membership Fees";
                    }
                    action("Conference Fees")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Conference Course Fees';
                        RunObject = Report "Conference Fees Report";
                    }
                }
            }
            group(PortalUser)
            {
                action("Puser")
                {
                    Visible = false;
                    ApplicationArea = BasicHR;
                    Caption = 'Portal User';
                    RunObject = page "Portal Users";
                }
            }
        }
    }
}
profile HRRoleCenter
{
    ProfileDescription = 'HR Profile';
    RoleCenter = "HR Role Center";
    Caption = 'Human Resources Role Center';
}
