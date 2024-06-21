/// <summary>
/// Report Employee Disciplinary Cases (ID 50036).
/// </summary>
report 50036 "Employee Disciplinary Cases"
{
    Caption = 'Employee Disciplinary Cases';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EmpDisciplinaryCases.rdl';
    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Shortcut Dimension 3 Code", "Directorate Code", Position;
            column(No; "No.")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(DirectorateCode; "Directorate Code")
            {
            }
            column(CurrentPositionID; "Current Position ID")
            {
            }
            column(Position; Position)
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(Workstation; Workstation)
            {
            }
            column(Gender; Gender)
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(No_of_Disciplinary_Cases;"No of Disciplinary Cases")
            {

            }
            column(EmpFullName;EmpFullName)
            {
                
            }
            column(Job_Title;"Job Title")
            {

            }
            column(DirectorateName;DirectorateName)
            {

            }
            column(DepartmentName;DepartmentName)
            {

            }
            column(RegionName;RegionName)
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
            column(CompanyMotto; CompanyInformation.Motto)
            {
            }
            dataitem("HR Disciplinary Cases";"HR Disciplinary Cases")
            {
                DataItemLink = "Employee No" = field("No.");
                DataItemLinkReference = Employee;
                DataItemTableView = sorting("Employee No", "Case Number");
                column(Case_Number;"Case Number")
                {

                }
                column(Employee_No;"Employee No")
                {

                }
                column(Date_of_Complaint;"Date of Complaint")
                {

                }
                column(Type_of_Disciplinary_Case;"Type of Disciplinary Case")
                {

                }
                column(Case_Description;"Case Description")
                {

                }
                column(Accuser;Accuser)
                {

                }
                column(Witness;Witness)
                {

                }
                column(Area_of_Incident;"Area of Incident")
                {

                }
                column(Other_Persons_Involved;"Other Persons Involved")
                {

                }
                column(Status;Status)
                {

                }
                column(Date_to_Respond;"Date to Respond")
                {

                }
                column(Response_to_Show_Cause;"Response to Show Cause")
                {

                }
                column(Disciplinary_Hearing;"Disciplinary Hearing")
                {

                }
                column(Disciplinary_Hearing_Date;"Disciplinary Hearing Date")
                {

                }
                column(Disciplinary_Remarks;"Disciplinary Remarks")
                {

                }
                column(Hearing_Venue;"Hearing Venue")
                {

                }
                column(Action_Taken;"Action Taken")
                {

                }
                column(Action_Taken_Date;"Action Taken Date")
                {

                }
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);

                EmpFullName := Employee.FullName();
                Employee.CalcFields("No of Disciplinary Cases");

                ResponsibilityCenter1.Reset();
                ResponsibilityCenter1.SetRange(Code, Employee."Directorate Code");
                if ResponsibilityCenter1.FindFirst() then
                    DirectorateName := ResponsibilityCenter1.Name;

                ResponsibilityCenter2.Reset();
                ResponsibilityCenter2.SetRange(Code, Employee."Shortcut Dimension 3");
                if ResponsibilityCenter2.FindFirst() then
                    DepartmentName := ResponsibilityCenter2.Name;
                
                ResponsibilityCenter3.Reset();
                ResponsibilityCenter3.SetRange(Code, Employee."Global Dimension 1 Code");
                if ResponsibilityCenter3.FindFirst() then
                    RegionName := ResponsibilityCenter3.Name;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        ResponsibilityCenter1: Record "Responsibility Center";
        ResponsibilityCenter2: Record "Responsibility Center";
        ResponsibilityCenter3: Record "Responsibility Center";
        EmpFullName: Text;
        DirectorateName: Text;
        DepartmentName: Text;
        RegionName: Text;
}
