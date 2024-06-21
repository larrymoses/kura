/// <summary>
/// Report Leave Approval Report (ID 99097).
/// </summary>
report 99097 "Leave Approval Report"
{
    // ApplicationArea = All;
    Caption = 'Leave Approval Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/LeaveApproval.rdl';
    dataset
    {
        dataitem(HRLeaveApplications; "HR Leave Applications")
        {
            RequestFilterFields = "Employee No";
            column(EmployeeNo; "Employee No")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(LeaveType; "Leave Type")
            {
            }
            column(ApplicationDate; "Application Date")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(Status; Status)
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(DaysApplied; "Days Applied")
            {
            }
            column(Approveddays; "Approved days")
            {
            }
            column(ApproverComments; "Approver Comments")
            {
            }
            column(ApplicationCode; "Application Code")
            {
            }
            column(ApplicantComments; "Applicant Comments")
            {
            }
            column(RelieverName; "Reliever Name")
            {
            }
            column(Reliever; Reliever)
            {
            }
            column(CompanyName; CompanyInfo.Picture)
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
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("Application Code");
                DataItemLinkReference = HRLeaveApplications;
                DataItemTableView = sorting("Sequence No.");
                column(Approver_ID; "Approver ID")
                {

                }
                column(Sequence_No_; "Sequence No.")
                {

                }
                column(Approved_Date_time; "Last Date-Time Modified")
                {

                }
                column(Approval_Status; Status)
                {

                }
            }


            trigger OnAfterGetRecord()
            begin
                CalcFields("Employee Name");
                CompanyInfo.get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Shortcut Dimension 1 Code", RespCenter, CompanyInfo, CompanyAddr);
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
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
}
