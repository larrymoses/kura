/// <summary>
/// Report Standard Performance Appraisal (ID 50022).
/// </summary>
report 50022 "Standard Performance Appraisal"
{
    ApplicationArea = All;
    Caption = 'Standard Performance Appraisal';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Standard Performance Appraisal.rdl';

    dataset
    {
        dataitem(PerfomanceEvaluation; "Perfomance Evaluation")
        {
            DataItemTableView = order(ascending);
            RequestFilterFields = No;

            column(Employee_No_; "Employee No.")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(Supervisor_Name; "Supervisor Name")
            {
            }
            column(No; No)
            {
            }
            column(Review_Period; "Review Period")
            {
            }
            column(Department;Department)
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {

            }
            column(CompanyAddress2; CompanyAddr[2])
            {

            }
            column(CompanyAddress3; CompanyAddr[3])
            {

            }
            column(CompanyAddress4; CompanyAddr[4])
            {

            }
            column(CompanyAddress5; CompanyAddr[5])
            {

            }
            column(CompanyAddress6; CompanyAddr[6])
            {

            }
            column(CompanyAddress7; CompanyAddr[7])
            {

            }
            column(CompanyAddress8; CompanyAddr[8])
            {

            }
            dataitem("Appraisal Periods"; "Appraisal Periods")
            {
                DataItemLink = Period = field("Review Period");
                DataItemLinkReference = PerfomanceEvaluation;
                DataItemTableView = sorting(Period) order(ascending);

                column(Start_Date; "Start Date")
                {
                }
                column(End_Date; "End Date")
                {
                }
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = "No." = field("Employee No.");
                DataItemLinkReference = PerfomanceEvaluation;
                DataItemTableView = sorting("No.") order(ascending);

                column(Salary_Scale; "Salary Scale")
                {
                }
                column(Workstation; Workstation)
                {
                }
                column(Current_Duty_Station; "Current Duty Station")
                {
                }
                column(Current_Terms_of_Service; "Current Terms of Service")
                {
                }
            }
            dataitem("Directorate Responsibility Center"; "Responsibility Center")
            {
                DataItemLink = Code = field(Directorate);
                DataItemLinkReference = PerfomanceEvaluation;
                DataItemTableView = sorting(Code) order(ascending);

                column(Directorate_Name; Name)
                {
                }
            }
            dataitem("Department Responsibility Center"; "Responsibility Center")
            {
                DataItemLink = Code = field(Department);
                DataItemLinkReference = PerfomanceEvaluation;
                DataItemTableView = sorting(Code) order(ascending);

                column(Department_Name; Name)
                {
                }
            }
            dataitem("Departmental Objectives Lines"; "Departmental Objectives Lines")
            {
                DataItemLink = "Department Code" = field(Department), "Appraisal Period" = field("Review Period");
                DataItemLinkReference = PerfomanceEvaluation;
                DataItemTableView = sorting("Appraisal Period", "Department Code", "Line No.") order(ascending);

                column(Objective; Objective)
                {
                }
                column(Description; Description)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
                ;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
}
