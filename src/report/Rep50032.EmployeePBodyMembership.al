/// <summary>
/// Report Employee PBody Membership (ID 50032).
/// </summary>
report 50032 "Employee PBody Membership"
{
    Caption = 'Employees Registered to Professional Bodies';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EmployeePBodyMembership.rdl';
    dataset
    {
        dataitem(ProfessionalBodyMembers; ProfessionalBodyMembers)
        {
            RequestFilterFields = "Directorate Code", "Region Code", "Department Code", Position;
            column(DocumentNo; "Document No.")
            {
            }
            column(MembershipNo; "Membership No.")
            {
            }
            column(Name; Name)
            {
            }
            column(MembershipCategory; "Membership Category")
            {
            }
            column(Member; Member)
            {
            }
            column(Department; Department)
            {
            }
            column(Directorate; Directorate)
            {
            }
            column(CPDPointsRequired; "CPD Points Required")
            {
            }
            column(Designation; Designation)
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(AnnualFeePayable; "Annual Fee Payable")
            {
            }
            column(Practicing_Licence_No_;"Practicing Licence No.")
            {
            }
            column(NoProgramAttended;ProgramAttended)
            {
            }
            column(NoPointsAcquired;PointsAcquired)
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
            dataitem("Professional Bodies"; "Professional Bodies")
            {
                DataItemLink = "No." = field("Document No.");
                DataItemTableView = sorting("No.");
                column(No_; "No.")
                {

                }
                column(PBody_Name; Name)
                {

                }
            }

            trigger OnAfterGetRecord()
            var
                ConferenceMList: Record "Subscription Conference Lines";
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);

                ConferenceMList.Reset();
                ConferenceMList.SetRange(Member, ProfessionalBodyMembers.Member);
                if ConferenceMList.FindSet then begin
                    ProgramAttended := ConferenceMList.Count;
                    ConferenceMList.CalcSums("Points Earned");
                    PointsAcquired := ConferenceMList."Points Earned";
                end;
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
        ProgramAttended: Integer;
        PointsAcquired: Decimal;
}
