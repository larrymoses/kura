report 50026 "Leave Planner"
{
    ApplicationArea = All;
    Caption = 'Leave Planner';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/LeavePlan.rdl';
    dataset
    {
        dataitem(HRLeavePlannerHeader; "HR Leave Planner Header")
        {
            RequestFilterFields = "Shortcut Dimension 3 Code", "Leave Period";
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
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
            column(ApplicationCode; "Application Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(Leave_Period; "Leave Period")
            {

            }
            column(Directorate;Directorate)
            {

            }
            column(DirName;DirName)
            {

            }
            column(DeptName;DeptName)
            {
                
            }
            dataitem("HR Leave Planner Lines"; "HR Leave Planner Lines")
            {
                DataItemLink = "Application Code"=field("Application Code"),"Shortcut Dimension 3 Code"=field("Shortcut Dimension 3 Code");
                DataItemLinkReference = HRLeavePlannerHeader;
                column(Employee_No; "Employee No")
                {

                }
                column(Employee_Name; "Employee Name")
                {

                }
                column(Leave_Type;"Leave Type")
                {

                }

                dataitem("Leave Plan Detailed Lines"; "Leave Plan Detailed Lines")
                {
                    DataItemLinkReference ="HR Leave Planner Lines";
                    DataItemLink = "Document No." =field("Application Code"),"Employee No."=field("Employee No");
                    DataItemTableView = where("Days Applied"=filter(<>0));
                    column(Start_Date; "Start Date")
                    {

                    }
                    column(End_Date; "End Date")
                    {

                    }
                    column(Days_Applied; "Days Applied")
                    {

                    }
                    column(Reliever; Reliever)
                    {

                    }
                    column(Reliever_Name; "Reliever Name")
                    {

                    }

                }
            }
            trigger OnAfterGetRecord()
            begin
                if CompanyInfo.get() then
                    CompanyInfo.CalcFields(Picture);
                if UserSetup.Get() then
                    FormatAddr.GetCompanyAddr(UserSetup."Region Code", RespCenter, CompanyInfo, CompanyAddr)
                else
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                RespCenter.Reset();
                RespCenter.SetRange(Code, HRLeavePlannerHeader.Directorate);
                if RespCenter.FindFirst then
                    DirName:= RespCenter.Name;

                RespCenter.Reset();
                RespCenter.SetRange(Code, HRLeavePlannerHeader."Shortcut Dimension 3 Code");
                if RespCenter.FindFirst then
                    DeptName:= RespCenter.Name;
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

    var
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        DirName: Text;
        DeptName: Text;
}
