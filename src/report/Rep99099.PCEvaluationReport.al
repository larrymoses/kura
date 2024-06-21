report 99099 "PC Evaluation Report"
{
    ApplicationArea = All;
    Caption = 'PC Evaluation Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PCEvaluationReport.rdl';
    dataset
    {
        dataitem(RequestforPCsumExpensing; "Request for PC sum Expensing")
        {
            column(DocumentNo; "Document No.")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(ProjectID; "Project ID")
            {
            }
            column(PurchaseContractID; "Purchase Contract ID")
            {
            }
            column(RegionID; "Region ID")
            {
            }
            column(Posted; Posted)
            {
            }
            column(ContractorID; "Contractor ID")
            {
            }
            column(FundingSource; "Funding Source")
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
            dataitem("Request for PC Sum Lines"; "Request for PC Sum Lines")
            {
                DataItemLink = "Document No." = field("Document No."), "Document Type" = field("Document Type");
                DataItemLinkReference = RequestforPCsumExpensing;
                column(Project_ID; "Project ID")
                {

                }
                column(Job_Planning_Line_No_; "Job Planning Line No.")
                {

                }
                column(Bill_Item_No_; "Bill Item No.")
                {

                }
                column(Bill_Item_Description; "Bill Item Description")
                {

                }
                column(Billed_Quantity; "Billed Quantity")
                {

                }
                column(Requested_Quantity; "Requested Quantity")
                {

                }
                column(Rate; Rate)
                {

                }
                column(Total_Requested_Amount; "Total Requested Amount")
                {

                }
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Region ID", ResponsibilityCenter, CompanyInformation, CompanyAddr);
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
