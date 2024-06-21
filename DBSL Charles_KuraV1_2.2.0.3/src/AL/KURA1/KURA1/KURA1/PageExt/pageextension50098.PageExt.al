#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50098 "pageextension50098" extends "Human Resources Setup"
{

    //Unsupported feature: Property Modification (InsertAllowed) on ""Human Resources Setup"(Page 5233)".


    //Unsupported feature: Property Modification (DeleteAllowed) on ""Human Resources Setup"(Page 5233)".

    layout
    {
        // modify(Control1900000007)
        // {
        //     Visible = false;
        // }
        modify(Control1900383207)
        {
            Visible = false;
        }
        modify(Control1905767507)
        {
            Visible = false;
        }
        addafter("Base Unit of Measure")
        {
            field("Rating Nos."; Rec."Rating Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Applicants Nos."; Rec."Applicants Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Training Request Nos"; Rec."Training Request Nos")
            {
                ApplicationArea = Basic;
            }
            field("Training Application Nos."; Rec."Training Application Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Traning Planning Nos"; Rec."Traning Planning Nos")
            {
                ApplicationArea = Basic;
            }

            field("Training Evaluation Nos"; Rec."Training Evaluation Nos")
            {
                ApplicationArea = Basic;
            }
            field("Annual Training Plan"; Rec."Annual Training Plan")
            {
                ApplicationArea = Basic;
            }
            field("Annual Training Plan Name"; Rec."Annual Training Plan Name")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("HQ Responsibility Center"; Rec."HQ Responsibility Center")
            {
                ApplicationArea = Basic;
            }
            field("HQ Region RC"; Rec."HQ Region RC")
            {
                ApplicationArea = Basic;
            }
            field("Medical Claims Nos"; Rec."Medical Claims Nos")
            {
                ApplicationArea = Basic;
            }
            field("Leave Application Nos."; Rec."Leave Application Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Appraisal Nos"; Rec."Appraisal Nos")
            {
                ApplicationArea = Basic;
            }
            field("Allow Appr. Create From";Rec."Allow Appr. Create From")
            {
                ApplicationArea = Basic;
                Caption = 'Allow Create Appraisal From';
            }
            field("Allow Appr. Create To";Rec."Allow Appr. Create To")
            {
                ApplicationArea = Basic;
                Caption = 'Allow Create Appraisal To';
            }
            field("Training Allowance"; Rec."Training Allowance")
            {
                ApplicationArea = Basic;
            }
            field("Base Calendar"; Rec."Base Calendar")
            {
                ApplicationArea = Basic;
            }
            field("Base Calender Code"; Rec."Base Calender Code")
            {
                ApplicationArea = Basic;
            }
            field("Leave Template"; Rec."Leave Template")
            {
                ApplicationArea = Basic;
            }
            field("Leave Batch"; Rec."Leave Batch")
            {
                ApplicationArea = Basic;
            }
            field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
            {
                ApplicationArea = Basic;
            }
            field("Leave Recall Nos"; Rec."Leave Recall Nos")
            {
                ApplicationArea = Basic;
            }
            field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
            {
                ApplicationArea = Basic;
            }
            field("Leave Approval Days"; Rec."Leave Approval Days")
            {
                ApplicationArea = Basic;
            }
            field("Leave Allowance Threshold"; Rec."Leave Allowance Threshold")
            {
                ApplicationArea = Basic;
            }
            field("Company Documents"; Rec."Company Documents")
            {
                ApplicationArea = Basic;
            }
            field("Gratuity Percentage."; Rec."Gratuity Percentage.")
            {
                ApplicationArea = Basic;
            }
            field("Gratuity PAYE graduated"; Rec."Gratuity PAYE graduated")
            {
                ApplicationArea = Basic;
            }
            field("Gratuity Paid Code"; Rec."Gratuity Paid Code")
            {
                ApplicationArea = Basic;
            }
            field("Leave Planner Nos."; Rec."Leave Planner Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Quarterly Appraisal Nos."; Rec."Quarterly Appraisal Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Annual Appraisal Nos."; Rec."Annual Appraisal Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Plaintiff Nos"; Rec."Plaintiff Nos")
            {
                ApplicationArea = Basic;
            }
            field("Defendant Nos"; Rec."Defendant Nos")
            {
                ApplicationArea = Basic;
            }
            field("Training Need Nos."; Rec."Training Need Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Training Allowance Arrears"; Rec."Training Allowance Arrears")
            {
                ApplicationArea = Basic;
            }
            field("Annual Leave Days"; Rec."Annual Leave Days")
            {
                ApplicationArea = Basic;
            }
            field("Insurance Document No."; Rec."Insurance Document No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Application Nos"; Rec."Job Application Nos")
            {
                ApplicationArea = Basic;
            }
            field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
            {
                ApplicationArea = Basic;
            }
            field("HR E-mail Address"; Rec."HR E-mail Address")
            {
                ApplicationArea = Basic;
            }
            field("Legal Case Nos"; Rec."Legal Case Nos")
            {
                ApplicationArea = Basic;
            }
            field("Applicants Request  Nos"; Rec."Applicants Request  Nos")
            {
                ApplicationArea = Basic;
            }
            field("Director Payroll Nos"; Rec."Director Payroll Nos")
            {
                ApplicationArea = Basic;
            }
            field("Employee Payment Info Nos"; Rec."Employee Payment Info Nos")
            {
                ApplicationArea = Basic;
                Visible = true;
            }
            group("Payroll Setups")
            {
                Caption = 'Payroll Setups';
                field("Tax Table"; Rec."Tax Table")
                {
                    ApplicationArea = Basic;
                }
                field("Excess Pension Code"; Rec."Excess Pension Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Add Back';
                }
                field("Payroll Rounding Type"; Rec."Payroll Rounding Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Rounding Precision"; Rec."Payroll Rounding Precision")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Percentage"; Rec."Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Amount"; Rec."Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("General Payslip Message"; Rec."General Payslip Message")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("NHIF Code"; Rec."NHIF Code")
                {
                    ApplicationArea = Basic;
                }
                field("Net Pay Advance Code"; Rec."Net Pay Advance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Days"; Rec."Pending Days")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Relief Code"; Rec."Tax Relief Code")
                {
                    ApplicationArea = Basic;
                }
                field("Insuarance Relief Percentage"; Rec."Insuarance Relief Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("Interest on Advance Code"; Rec."Interest on Advance Code")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF Tier I Code"; Rec."NSSF Tier I Code")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF Tier II Code"; Rec."NSSF Tier II Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Journal Template"; Rec."Payroll Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Journal Batch"; Rec."Payroll Journal Batch")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Voucher Nos"; Rec."Salary Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Gratuity Percentage"; Rec."Gratuity Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Icreament Nos"; Rec."Salary Icreament Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Don't Generate Payroll File"; Rec."Don't Generate Payroll File")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Recruitment Setups")
            {
                Caption = 'Recruitment Setups';
                field("Standard Recruitment Lead Time"; Rec."Standard Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Expe Recruitment Lead Time"; Rec."Expe Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Strict Manpower Planning"; Rec."Strict Manpower Planning")
                {
                    ApplicationArea = Basic;
                }
                field("Months for Recruiter Fees"; Rec."Months for Recruiter Fees")
                {
                    ApplicationArea = Basic;
                }
                field("Recruiter Fees %"; Rec."Recruiter Fees %")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment File Path"; Rec."Recruitment File Path")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Nos."; Rec."Recruitment Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Succession Plan Nos"; Rec."Succession Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Succession Template Nos"; Rec."Succession Template Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Succession Log Nos"; Rec."Succession Log Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Requsition Nos."; Rec."Recruitment Requsition Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy Nos."; Rec."Vacancy Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Applicant No.s"; Rec."Job Applicant No.s")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Hire Nos."; Rec."Direct Hire Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Apptitude Selection Nos."; Rec."Apptitude Selection Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Final Interview  Nos."; Rec."Final Interview  Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Final Shortlist  Nos."; Rec."Final Shortlist  Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Profile Nos"; Rec."Applicant Profile Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Functional Plan Nos."; Rec."Functional Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Commiitee Appoint Nos."; Rec."Commiitee Appoint Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Terminate Nos."; Rec."Committee Terminate Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("HR Template Nos."; Rec."HR Template Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Prescreening Template Nos."; Rec."Prescreening Template Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Apptitude Question Nos."; Rec."Apptitude Question Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Medical Checks Template Nos."; Rec."Medical Checks Template Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Nos."; Rec."Ability Test Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Invitation Nos."; Rec."Ability Test Invitation Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Report Nos."; Rec."Phone Interview Report Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Response Nos."; Rec."Ability Test Response Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Shortlisting Voucher Nos."; Rec."Shortlisting Voucher Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Invitation Nos."; Rec."Interview Invitation Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Background Checks Nos."; Rec."Background Checks Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Referee Recomm Nos."; Rec."Referee Recomm Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Prehire Medical Nos."; Rec."Prehire Medical Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Offer Nos."; Rec."Employment Offer Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Benefit Package Nos."; Rec."Benefit Package Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Scoresheet Template Nos."; Rec."Scoresheet Template Nos.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Overtime Setup")
            {
                field("Overtime Payroll Code"; Rec."Overtime Payroll Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("HR Setups")
            {
                field("Transfer Nos"; Rec."Transfer Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Hardship Allowance Code"; Rec."Hardship Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer Allowance Code"; Rec."Transfer Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Allowance Code"; Rec."Leave Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Current Leave Period";Rec."Current Leave Period")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Transfer Nos"; Rec."Asset Transfer Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Interns Nos"; Rec."Interns Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Temporary Employee Nos"; Rec."Temporary Employee Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Temp Salary Voucher Nos."; Rec."Temp Salary Voucher Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Manpower Planning Nos."; Rec."Manpower Planning Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Advert Nos."; Rec."Job Advert Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Retirement Age (Yrs)"; Rec."Retirement Age (Yrs)")
                {
                    ApplicationArea = Basic;
                }
                field("Retirement Age PWD (Yrs)";Rec."Retirement Age PWD (Yrs)")
                {
                    ApplicationArea = Basic;
                }
                field("Retirements Notification Temp."; Rec."Retirements Notification Temp.")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Period Long Term"; Rec."Notice Period Long Term")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Period Short Term"; Rec."Notice Period Short Term")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Committee Nos"; Rec."Disciplinary Committee Nos")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Exchequer Project Setup")
            {
                Caption = 'Temporal Staff Payroll Setups';
                field("Temp Tax Relief Code"; Rec."Temp Tax Relief Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp NHIF Code"; Rec."Temp NHIF Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp Net Pay Advance Code"; Rec."Temp Net Pay Advance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp NSSF Tier I Code"; Rec."Temp NSSF Tier I Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp NSSF Tier II Code"; Rec."Temp NSSF Tier II Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

#pragma implicitwith restore

