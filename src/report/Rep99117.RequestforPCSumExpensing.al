report 99117 "Request for PC Sum Expensing"
{
    ApplicationArea = All;
    Caption = 'Request for PC Sum Expensing';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/RequestForPCSumExpensing.rdl';
    dataset
    {
        dataitem(RequestforPCsumExpensing; "Request for PC sum Expensing")
        {
            column(DocumentNo; "Document No.")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(ProjectID; "Project ID")
            {
            }
            column(ProjectName; "Project Name")
            {
            }
            column(ContractorID; "Contractor ID")
            {
            }
            column(ContractorName; "Contractor Name")
            {
            }
            column(CITCommNo; "CIT Comm No.")
            {
            }
            column(FundingSource; "Funding Source")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(PurchaseContractID; "Purchase Contract ID")
            {
            }
            column(RegionID; "Region ID")
            {
            }
            column(TotalAmount;"Requested Total Amount" )
            {
            }
            column(Posted; Posted)
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
                DataItemLinkReference = RequestforPCsumExpensing;
                DataItemLink = "Document No." = field("Document No.");
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
        }

        actions
        {
        }
    }

    labels
    {
    }
    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
}
