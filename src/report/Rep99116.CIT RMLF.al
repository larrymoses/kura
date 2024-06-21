/// <summary>
/// Report CIT RMLF (ID 99116).
/// </summary>
report 99116 "CIT RMLF"
{
    ApplicationArea = All;
    Caption = 'CIT RMLF';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CIT RMLF.rdl';
    WordLayout = './Layouts/CIT RMLF.docx';
    dataset
    {
        dataitem(IFSTenderCommittee; "IFS Tender Committee")
        {
            column(Document_No_; "Document No.")
            {

            }
            column(Committee_Type; "Committee Type")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Project_ID; "Project ID")
            {

            }
            column(Project_Name; "Project Name")
            {

            }
            column(Appointment_Effective_Date; "Appointment Effective Date")
            {

            }
            column(Appointing_Authority; "Appointing Authority")
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
            dataitem("IFS Tender Committee Member"; "IFS Tender Committee Member")
            {
                DataItemLinkReference = IFSTenderCommittee;
                DataItemLink = "Document No." = field("Document No."),
                              "Committee Type" = field("Committee Type");

                column(Role; Role)
                {

                }
                column(Member_No_; "Member No.")
                {

                }
                column(Member_Name; "Member Name")
                {

                }
                column(Member_Email; "Member Email")
                {

                }
                column(ID_Passport_No; "ID/Passport No")
                {

                }
                column(Staff__No_; "Staff  No.")
                {

                }
                column(Destination; Destination)
                {

                }
                column(Total_Amount; "Total Amount")
                {

                }
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Shortcut Dimension 1 Code", ResponsibilityCenter, CompanyInformation, CompanyAddr);
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
