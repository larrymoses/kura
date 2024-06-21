#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50122 "tableextension50122" extends "Human Resources Setup"
{
    LookupPageID = "Human Resources Setup";
    DrillDownPageID = "Human Resources Setup";
    fields
    {
        field(50000; "Shift overtime rate"; Decimal)
        {
            MinValue = 0;
        }
        field(50001; "Holiday overtime rate"; Decimal)
        {
            MinValue = 0;
        }
        field(50002; "Housing Earned Limit"; Decimal)
        {
        }
        field(50003; "Pension Limit Percentage"; Decimal)
        {
        }
        field(50004; "Pension Limit Amount"; Decimal)
        {
        }
        field(50005; "Round Down"; Boolean)
        {
        }
        field(50006; "Working Hours"; Decimal)
        {
        }
        field(50008; "Payroll Rounding Precision"; Decimal)
        {
        }
        field(50009; "Payroll Rounding Type"; Option)
        {
            OptionMembers = Nearest,Up,Down;
        }
        field(50010; "Special Duty Table"; Code[10])
        {
            // TableRelation = Table26004012;
        }
        field(50011; "CFW Round Deduction code"; Code[20])
        {
            TableRelation = DeductionsX;
        }
        field(50012; "BFW Round Earning code"; Code[20])
        {
            TableRelation = EarningsX;
        }
        field(50013; "Company overtime hours"; Decimal)
        {
        }
        field(50014; "Loan Product Type Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50015; "Tax Relief Amount"; Decimal)
        {
        }
        field(50016; "General Payslip Message"; Text[100])
        {
        }
        field(50017; "Tax Table"; Code[10])
        {
            TableRelation = "Bracket Tablesx";
        }
        field(50018; "Corporation Tax"; Decimal)
        {
        }
        field(50020; "Incoming Mail Server"; Text[30])
        {
        }
        field(50021; "Outgoing Mail Server"; Text[30])
        {
        }
        field(50022; "Email Text"; Text[250])
        {
        }
        field(50023; "Sender User ID"; Text[30])
        {
        }
        field(50024; "Sender Address"; Text[100])
        {
        }
        field(50025; "Email Subject"; Text[100])
        {
        }
        field(50026; "Template Location"; Text[100])
        {
        }
        field(50027; "Applicants Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50028; "Leave Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50029; "Recruitment Needs Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50030; "Disciplinary Cases Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50031; "No. Of Days in Month"; Decimal)
        {
        }
        field(50032; "Transport Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50033; "Cover Selection Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50034; "Qualification Days (Leave)"; Decimal)
        {
        }
        field(50035; "Leave Allowance Code"; Code[10])
        {
            TableRelation = EarningsX;
        }
        field(50036; "Telephone Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50037; "Training Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50038; "Leave Recall Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50039; "Medical Claim Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50040; "Account No (Training)"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50041; "Training Evaluation Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50042; "Off Days Code"; Code[10])
        {
            TableRelation = "Leave Types";
        }
        field(50043; "Appraisal Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50044; "Leave Plan Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50045; "Keys Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50046; "Incidences Nos"; Code[10])
        {
        }
        field(50047; "Sick Of Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50048; "Conveyance Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50049; "Base Calender Code"; Code[20])
        {
            TableRelation = "Base Calendar".Code;
        }
        field(50050; "Membership No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50052; "Employee Absentism"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50053; "Overtime @1.5 Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50054; "Overtime @2.0 Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50055; "Lost Days Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50056; "Basic Salary Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50057; "NHIF Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50058; "Wages Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50059; "Net Pay Advance Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50060; "Overtime Claim @1.5"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50061; "Overtime Claim @2.0"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50062; "Overtime Recovery @1.5"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50063; "Overtime Recovery @2.0"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50064; "Lost Hrs Recovery"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50065; "Wages Claim"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50066; "Night Allowance Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50067; "Lost Days Refund"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50068; "Training Allowance"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50069; "Wages Recovery"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50070; "Functional Overtime@1.5"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50071; "Functional Overtime@2.0"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50072; "Pending Days"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50073; "Lost Days Recovery"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50074; "Tax Relief Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50075; "Salary Advance"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50076; "Interest on Advance Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50077; "Training Allowance Arrears"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50078; "Night Shift Allowance Amount"; Decimal)
        {
        }
        field(50079; "Unpaid Leave Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50080; "Annual Leave Days"; Decimal)
        {
            MaxValue = 30;
            MinValue = 0;
        }
        field(50082; "NSSF Tier I Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50083; "NSSF Tier II Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50084; "HR E-mail Address"; Text[150])
        {
        }
        field(50085; "Training Need Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50086; "Payroll Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50087; "Payroll Journal Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Payroll Journal Template"));
        }
        field(50088; "Base Calendar"; Code[10])
        {
            Description = '//to cater for Leave';
            TableRelation = "Base Calendar".Code;
        }
        field(50089; "Leave Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Template".Name;
        }
        field(50090; "Leave Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch".Name;
        }
        field(50091; "Leave Posting Period[FROM]"; Date)
        {
        }
        field(50092; "Leave Posting Period[TO]"; Date)
        {
        }
        field(50093; "Company Documents"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50094; "Leave Planner Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50095; "Training Application Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50096; "Quarterly Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50097; "Annual Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50098; "Gratuity Percentage"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(50099; "Gratuity Percentage."; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(69000; "Default Leave Posting Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
        }
        field(69001; "Default Leave Posting Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
        }
        field(69002; "Amount Per Hour"; Decimal)
        {
        }
        field(69003; "Overtime Payroll Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(69004; "Overtime Req Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(69005; "Employee Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(69006; "OP Paye Deduction %"; Decimal)
        {
        }
        field(69007; "Salary Voucher Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(69008; "Job Application Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69009; "Medical Claims Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69010; "Job Application No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69011; "Rating Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(69012; "Excess Pension Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX.Code;
        }
        field(69013; "NSSF Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69014; "Transfer Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69015; "Hardship Allowance Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX.Code;
        }
        field(69016; "Transfer Allowance Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX.Code;
        }
        field(69017; "Asset Transfer Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69018; "Disciplinary Committee Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69019; "Interns Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69020; "Temporary Employee Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69021; "Plaintiff Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69022; "Defendant Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69023; "Deputy Director HR Email"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69024; "Salary Icreament Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69025; "Legal Case Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69026; "Traning Planning Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69027; "Temp Tax Relief Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "EarningsX Temp-E".Code;
        }
        field(69028; "Temp NHIF Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69029; "Temp Net Pay Advance Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69030; "Temp NSSF Tier I Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69031; "Temp NSSF Tier II Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69032; " Regional HR E-mail Address"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(69033; "Temp Salary Voucher Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69034; "Training Expense Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(69035; "Manpower Planning Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69036; "Job Advert Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69037; "Leave Allowance Threshold"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69038; "Applicants Request  Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69039; "Applicant Profile Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69040; "Annual Training Plan"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Plan Header";
        }
        field(69041; "Annual Training Plan Name"; Text[100])
        {
            //CalcFormula = lookup("Training Plan Header".Description where(No = field("Annual Training Plan")));
            FieldClass = Normal;
        }
        field(69042; "Employee Payment Info Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69043; "HQ Responsibility Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(69044; "HQ Region RC"; Code[30])
        {
            TableRelation = "Responsibility Center";
        }
        field(69045; "Vacancy Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69046; "Gratuity PAYE graduated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(69047; "Gratuity Paid Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX;
        }
        field(69048; "Retirement Age (Yrs)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69049; "Notice Period Long Term"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(69050; "Notice Period Short Term"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(69550; "Succession Plan Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(69551; "Succession Template Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(69552; "Succession Log Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(69600; "Standard Recruitment Lead Time"; DateFormula)
        {
            Caption = 'Default Standard Recruitment Lead Time';
            DataClassification = ToBeClassified;
        }
        field(69601; "Expe Recruitment Lead Time"; DateFormula)
        {
            Caption = 'Default Expedited Recruitment Lead Time';
            DataClassification = ToBeClassified;
        }
        field(69602; "Strict Manpower Planning"; Boolean)
        {
            Caption = 'Disable Strict Manpower Planning';
            DataClassification = ToBeClassified;
        }
        field(69603; "Months for Recruiter Fees"; Decimal)
        {
            Caption = 'No. of Months for Recruiter Fees';
            DataClassification = ToBeClassified;
        }
        field(69604; "Recruiter Fees %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69605; "Recruitment Plan Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69606; "Recruitment Requsition Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69607; "Candidate No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69608; "Job Applicant No.s"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69609; "Direct Hire Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69610; "Apptitude Selection Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69611; "Final Interview  Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69612; "Final Shortlist  Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69613; "Functional Plan Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69614; "Commiitee Appoint Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69615; "Committee Terminate Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69616; "HR Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69617; "Prescreening Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69618; "Apptitude Question Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69619; "Medical Checks Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69620; "Ability Test Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69621; "Ability Test Invitation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69622; "Phone Interview Report Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69623; "Ability Test Response Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69624; "Shortlisting Voucher Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69625; "Interview Invitation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69626; "Background Checks Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69627; "Referee Recomm Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69628; "Prehire Medical Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69629; "Employment Offer Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69630; "Benefit Package Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69631; "Applicant Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69632; "Phone Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69633; "Scoresheet Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69634; "Interview Report Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69635; "Director Payroll Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69636; "Interview Docoument Path"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69637; "Interview Senior Signatory"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = users;
        }
        field(69638; "Interview Other Signatory"; Code[30])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = users;
        }
        field(69639; "Recruitment File Path"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(69640; "HR Committee Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(69641; "Leave Approval Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69642; "Insuarance Relief Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69643; "Insurance Document No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69644; "Don't Generate Payroll File"; Boolean)
        {
            
        }
        field(69645;"Current Leave Period"; Code[10])
        {
            TableRelation = "HR Leave Periods";
        }
        field(69646; "Retirements Notification Temp."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Email Reminders Header" where(Blocked = const(false));
        }
        field(69647; "Retirement Age PWD (Yrs)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69648; "Allow Appr. Create From"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(69649; "Allow Appr. Create To"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
}

