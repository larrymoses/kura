/// <summary>
/// Report Paid PBody Membership Fees (ID 50033).
/// </summary>
report 50033 "Paid PBody Membership Fees"
{
    Caption = 'Paid PBody Membership Fees';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PaidPBodyMembershipFees.rdl';

    dataset
    {
        dataitem("Membership Fees Requisitions";"Membership Fees Requisitions")
        {
            DataItemTableView = sorting("No.") where(Status = filter(Approved));
            column(No_;"No.")
            {
            }
            column(Description;Description)
            {

            }
            column(Request_By_No_;"Request-By No.")
            {

            }
            column(Request_By_Name;"Request-By Name")
            {

            }
            column(Request_Date;"Request Date")
            {

            }
            column(Total_Fees;"Total Fees")
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
            dataitem("Professional Body Lines";"Professional Body Lines")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");
                column(Document_No_;"Document No.")
                {

                }
                column(Professional_Body_No_;"Professional Body No.")
                {

                }
                column(Professional_Body_Name;"Professional Body Name")
                {

                }
                column(Amount__Fees_;"Amount (Fees)")
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
}
