/// <summary>
/// Report SProfessional Bodies Report (ID 50030).
/// </summary>
report 50030 "SProfessional Bodies Report"
{
    // ApplicationArea = All;
    Caption = 'Professional Bodies Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SProfessionalBodies.rdl';
    // UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(ProfessionalBodies; "Professional Bodies")
        {
            DataItemTableView =  where(Blocked = const(false));
            RequestFilterFields = "No.";
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
            column(TotalCPDPointsRequired; "Total CPD Points Required")
            {
            }
            column(DueDate; "Due Date")
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
