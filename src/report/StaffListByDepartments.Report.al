#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 50014 StaffListByDepartments
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/StaffListByDepartments.rdlc';
    Caption = ' Staff List By Departments';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Employee; Employee)
        {

            column(ReportForNavId_1; 1)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
            {
            }
            column(Initials_Employee; Employee.Initials)
            {
            }
            column(JobTitle_Employee; Employee."Job Title")
            {
            }

            column(Status_Employee; Employee.Status)
            {
            }
            column(GlobalDimension1Code_Employee; Employee."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Employee; Employee."Global Dimension 2 Code")
            {
            }
            column(Title_Employee; Employee.Title)
            {
            }
            column(SalaryScale_Employee; Employee."Salary Scale")
            {
            }

            column(DepartmentName_Employee; Employee."Department Name")
            {
            }

            column(DepartmentCode_Employee; Employee."Department Code")
            {
            }
            column(Gender; Employee."Gender")
            {
            }

            column(DirectorateCode_Employee; Employee."Directorate Code")
            {

            }
            column(Directorate_Head; "Directorate Head") { }
            column(HOD; HOD) { }
            column(RegionName; RegionName) { }
            column(DepartmentName; DepartmentName) { }
            column(DirectorateName; DirectorateName) { }

            trigger OnAfterGetRecord()
            var

            begin
                Responsibilitycenter.Reset();
                Responsibilitycenter.SetRange(Responsibilitycenter.Code, employee."Global Dimension 1 Code");
                if Responsibilitycenter.FindSet() then begin
                    RegionName := Responsibilitycenter.Name;
                end;
                Responsibilitycenter.Reset();
                Responsibilitycenter.SetRange(Responsibilitycenter.Code, employee."Directorate Code");
                if Responsibilitycenter.FindSet() then begin
                    DirectorateName := Responsibilitycenter.Name;
                end;
                Responsibilitycenter.Reset();
                Responsibilitycenter.SetRange(Responsibilitycenter.Code, employee."Department Code");
                if Responsibilitycenter.FindSet() then begin
                    DepartmentName := Responsibilitycenter.Name;
                end;
            end;
        }
    }



    var
        RegionName: Text[200];
        DirectorateName: Text[200];
        DepartmentName: text[200];
        Responsibilitycenter: Record "Responsibility Center";


}
