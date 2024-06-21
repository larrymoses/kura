#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 72061 "Order to Commence List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Order to Commence List.rdlc';

    dataset
    {
        dataitem("Project Mobilization Header";"Project Mobilization Header")
        {
            DataItemTableView = where("Document Type"=filter("Order-To-Commence"),Posted=const(true));
            column(ReportForNavId_1; 1)
            {
            }
            column(PossessionofSiteDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Possession of Site Date"))
            {
            }
            column(DocumentNo_ProjectMobilizationHeader;"Project Mobilization Header"."Document No.")
            {
            }
            column(DocumentDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Document Date"))
            {
            }
            column(PurchaseContractID_ProjectMobilizationHeader;"Project Mobilization Header"."Purchase Contract ID")
            {
            }
            column(ProjectID_ProjectMobilizationHeader;"Project Mobilization Header"."Project ID")
            {
            }
            column(Description_ProjectMobilizationHeader;"Project Mobilization Header".Description)
            {
            }
            column(ContractorNo_ProjectMobilizationHeader;"Project Mobilization Header"."Contractor No.")
            {
            }
            column(ContractorName_ProjectMobilizationHeader;"Project Mobilization Header"."Contractor Name")
            {
            }
            column(AwardDate_ProjectMobilizationHeader;"Project Mobilization Header"."Award Date")
            {
            }
            column(AwardTendSumIncTaxesLCY_ProjectMobilizationHeader;"Project Mobilization Header"."Award Tend Sum Inc Taxes (LCY)")
            {
            }
            column(ProjectName_ProjectMobilizationHeader;"Project Mobilization Header"."Project Name")
            {
            }
            column(ProjectEngineerName_ProjectMobilizationHeader;"Project Mobilization Header"."Project Engineer Name")
            {
            }
            column(RegionID_ProjectMobilizationHeader;"Project Mobilization Header"."Region ID")
            {
            }
            column(DirectorateID_ProjectMobilizationHeader;"Project Mobilization Header"."Directorate ID")
            {
            }
            column(DepartmentID_ProjectMobilizationHeader;"Project Mobilization Header"."Department ID")
            {
            }
            column(AcknowledgementStatus_ProjectMobilizationHeader;"Project Mobilization Header"."Acknowledgement Status")
            {
            }
            column(OrdertoCommenceReference_ProjectMobilizationHeader;"Project Mobilization Header"."Order to Commence Reference")
            {
            }
            column(PossessionofSiteReference_ProjectMobilizationHeader;"Project Mobilization Header"."Possession of Site Reference")
            {
            }
            column(PossessionofSiteIssued_ProjectMobilizationHeader;"Project Mobilization Header"."Possession of Site Issued")
            {
            }
            column(CName;CompanyInformation.Name)
            {
            }
            column(CAddress;CompanyInformation.Address)
            {
            }
            column(CAddress2;CompanyInformation."Address 2")
            {
            }
            column(CCity;CompanyInformation.City)
            {
            }
            column(CPhoneNo;CompanyInformation."Phone No.")
            {
            }
            column(CPic;CompanyInformation.Picture)
            {
            }
            column(CEmail;CompanyInformation."E-Mail")
            {
            }
            column(CWebsite;CompanyInformation."Home Page")
            {
            }
            column(CurrentDate;Format(CurrentDate))
            {
            }
            column(PossessionofSiteStatus;PossessionofSiteStatus)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CurrentDate:=Today;
                 if "Project Mobilization Header"."Possession of Site Issued"=true then
                  PossessionofSiteStatus:=Possessionofsitestatus::Issued
                 else
                   PossessionofSiteStatus:=Possessionofsitestatus::"Pending Issuing";
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

    trigger OnInitReport()
    begin
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        PossessionofSiteStatus: Option Issued,"Pending Issuing";
        CurrentDate: Date;
}

