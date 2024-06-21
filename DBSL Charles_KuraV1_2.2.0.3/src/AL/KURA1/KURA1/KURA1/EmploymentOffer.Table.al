#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69728 "Employment Offer"
{

    fields
    {
        field(1;"Offer ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Panel Interview Report ID";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.","Application No.");
                if JobApplications.FindFirst then begin
                  "Candidate No.":=JobApplications."Candidate No.";
                  "First Name":=JobApplications."First Name";
                  "Middle Name":=JobApplications."Middle Name";
                  "Last Name":=JobApplications."Last Name";
                  "Phone No.":=JobApplications."Phone No.";
                  "Mobile Phone No.":=JobApplications."Mobile Phone No.";
                  Email:=JobApplications."E-Mail";
                  "Birth Date":=JobApplications."Birth Date";
                  "Tax Regitration(PIN)":=JobApplications."PIN Registration";
                  Gender:=JobApplications.Gender;
                  "Passport No.":=JobApplications."Passport No.";
                  "ID Number":=JobApplications."ID Number";
                  "Vacancy ID":=JobApplications."Vacancy Id";
                  Validate("Vacancy ID");

                  end
            end;
        }
        field(5;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"External Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Employment Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Payroll Start Period";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX";
        }
        field(9;"Offer Expiration Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Offer Acceptance Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pending,Accepted,Rejected';
            OptionMembers = Pending,Accepted,Rejected;
        }
        field(11;"Candidate Response Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"First Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Last Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16;Address;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Address 2";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;City;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Post Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Country/Region Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Mobile Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Birth Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Female,Male,Other';
            OptionMembers = ,Female,Male,Other;
        }
        field(26;"ID Number";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Passport No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Tax Regitration(PIN)";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Lead HR Officer";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if RecruitmentRequisition.Get("Vacancy ID") then
                  begin
                "Position ID":=RecruitmentRequisition."Position ID";
                "Terms of Service":=RecruitmentRequisition."Default Terms of Service Code";
                "Work Location Details":=RecruitmentRequisition."Work Location Details";
                "Seniority Level":=RecruitmentRequisition."Seniority Level";
                "Employment Type":=RecruitmentRequisition."Employment Type";
                Region:=RecruitmentRequisition.Region;
                Department:=RecruitmentRequisition.Department;
                Directorate:=RecruitmentRequisition.Directorate;
                "Job Title/Designation":=RecruitmentRequisition."Job Title/Designation";
                "Funding Source ID":=RecruitmentRequisition."Funding Source ID";
                "Job No.":=RecruitmentRequisition."Job No.";
                "Job Title/Designation":=RecruitmentRequisition."Job Title/Designation";
                "Task No.":=RecruitmentRequisition."Job Task No.";
                "Dimension Set ID":=RecruitmentRequisition."Dimension Set ID";
                "Job Grade ID":=RecruitmentRequisition."Job Grade ID";
                "Overall Appointment Authority":=RecruitmentRequisition."Overall Appointment Authority";
                "Hierarchically Reports To":=RecruitmentRequisition."Hierarchically Reports To";
                "Functionally Reports To":=RecruitmentRequisition."Functionally  Reports To";
                "Funding Source ID":=RecruitmentRequisition."Funding Source ID";
                "Work Location Details":=RecruitmentRequisition."Work Location Details";
                Positions.Reset;
                Positions.SetRange("Position ID",RecruitmentRequisition."Position ID");
                if Positions.FindSet then begin
                "Work Shift":=Positions."Default Work Shift";
                 Description:=Positions."Job Title"+'  Employment offer';
                "Work Shift Description":=Positions."Work Shift Description";
                "Designation Group":=Positions."Designation Group";
                "Gross Pay":=Positions."Average Monthly Salary (LCY)";
                  end;

                  end;
            end;
        }
        field(31;"Position ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Job Title/Designation";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Duty Station ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";
        }
        field(34;"Work Location Details";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(35;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(36;Department;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(37;Region;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Dimension Set ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Job No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Task No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Funding Source ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(42;"Designation Group";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Hierarchically Reports To";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Functionally Reports To";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Job Grade ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Overall Appointment Authority";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(47;"Seniority Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive;
        }
        field(48;"Terms of Service";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(49;"Employment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
        field(50;"Pay Frequency";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Monthly Payroll,Daily Wage';
            OptionMembers = ,"Monthly Payroll","Daily Wage";
        }
        field(51;"Work Shift";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Work Shift";

            trigger OnValidate()
            begin
                if EmployeeWorkShift.Get("Work Shift") then
                  "Work Shift Description":=EmployeeWorkShift.Description;
            end;
        }
        field(52;"Work Shift Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(53;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(54;"Gross Pay";Decimal)
        {
            CalcFormula = sum("Employment Offer Compensation"."Line Amount" where ("Offer ID"=field("Offer ID")));
            FieldClass = FlowField;
        }
        field(55;"Employee No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(56;"Employee Contract No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(57;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled,Closed';
            OptionMembers = Active,Cancelled,Closed;
        }
        field(58;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(59;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Offer ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EmployeeWorkShift: Record "Employee Work Shift";
        JobApplications: Record "Job Applications";
        RecruitmentRequisition: Record "Recruitment Requisition Header";
        Positions: Record "Company Positions";
}

