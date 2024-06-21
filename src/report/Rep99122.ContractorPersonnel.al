report 99122 "Contractor Personnel"
{
    ApplicationArea = All;
    Caption = 'Contractor Personnel';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/ContractorPersonnel.rdl';
    dataset
    {
        dataitem(WEPContractorSubmission; "WEP Contractor Submission")
        {
            RequestFilterFields ="Document No";
            PrintOnlyIfDetail=true;
              column(CompanyPicture; CompanyInfo.Picture)
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
            column(DocumentNo; "Document No")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(ProjectNo; "Project No")
            {
            }
            column(ProjectName; "Project Name")
            {
            }
            column(ContractID; "Contract ID")
            {
            }
            column(ContractorNo; "Contractor No")
            {
            }
            column(ContractorName; "Contractor Name")
            {
            }
            column(ContractorAddress; "Contractor Address")
            {
            }
            column(ContractorAddress2; "Contractor Address 2")
            {
            }
            column(ContractorCity; "Contractor City")
            {
            }
            column(ContractorEmailAddress; "Contractor Email Address")
            {
            }
            column(WorkExecutionPlan; "Work Execution Plan")
            {
            }
            column(Assigned_To_;"Assigned To.")
            {

            }
            
            dataitem("WEP Contractor Team";"WEP Contractor Team")
            {
                DataItemLinkReference =WEPContractorSubmission;
                DataItemLink="Document No"=field("Document No");
                column(Name;Name)
                {

                }
                 column(ID_Number;"ID Number")
                {
                    
                }
                 column(Address;Address)
                {
                    
                }
                 column(Address_2;"Address 2")
                {
                    
                }
                 column(City;City)
                {
                    
                }
                 column(Post_Code;"Post Code")
                {
                    
                }
                 column(Email;Email)
                {
                    
                }
                 column(Country_Region_Code;"Country/Region Code")
                {
                    
                }
                 column(Telephone;Telephone)
                {
                    
                }
                 column(Role_Code;"Role Code")
                {
                    
                }
                 column(Designation;Designation)
                {
                    
                }
                 column(Staff_Category;"Staff Category")
                {
                    
                }
                 column(Effective_Date;"Effective Date")
                {
                    
                }
                 column(Expiry_Date;"Expiry Date")
                {
                    
                }
            }
            trigger OnAfterGetRecord()
            begin
               CompanyInfo.get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Global Dimension 1 Code", ResponsibilityCenter, CompanyInfo, CompanyAddr);
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
       CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        ResponsibilityCenter: Record "Responsibility Center";
}
