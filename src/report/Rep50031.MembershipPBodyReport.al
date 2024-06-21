/// <summary>
/// Report Membership PBody Report (ID 50031).
/// </summary>
report 50031 "Membership PBody Report"
{
    Caption = 'Membership to Professional Body';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/MembershipPBody.rdl';
    dataset
    {
        dataitem(ProfessionalBodyMembers; ProfessionalBodyMembers)
        {
            RequestFilterFields = "Directorate Code", "Region Code", "Department Code", Position;

            column(Document_No_; "Document No.")
            {

            }
            column(Membership_No_; "Membership No.")
            {

            }
            column(Member; Member)
            {

            }
            column(Member_Name; Name)
            {

            }
            column(Membership_Category; "Membership Category")
            {

            }
            column(Department; Department)
            {

            }
            column(Designation; Designation)
            {

            }
            column(Directorate; Directorate)
            {

            }
            column(Position; Position)
            {

            }
            column(Annual_Fee_Payable; "Annual Fee Payable")
            {

            }
            column(CPD_Points_Required; "CPD Points Required")
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
            dataitem(ProfessionalBodies; "Professional Bodies")
            {
                RequestFilterFields = "No.";
                DataItemLink = "No." = field("Document No.");

                column(No; "No.")
                {
                }
                column(Name; Name)
                {
                }
                column(NoofMembers; "No. of Members")
                {
                }
                column(TotalFeesPayable; "Total Fees Payable")
                {
                }
                column(DueDate; "Due Date")
                {
                }
                column(TotalCPDPointsRequired; "Total CPD Points Required")
                {
                }
            }

            trigger OnAfterGetRecord()
            var
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
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
