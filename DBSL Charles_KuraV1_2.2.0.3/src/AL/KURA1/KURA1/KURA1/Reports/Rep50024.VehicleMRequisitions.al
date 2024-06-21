/// <summary>
/// Report Vehicle Requisitions (ID 50024).
/// </summary>
report 50024 "Vehicle M Requisitions"
{
    ApplicationArea = All;
    Caption = 'Fleet Maintenance Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/VehicleRequisition.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header Archive")
        {
            RequestFilterFields = "PP Planning Category", "Buy-from Vendor No.";
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = filter(Order),Status = filter(Released));
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.")
            {
            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(Buy_from_Vendor_Name_2; "Buy-from Vendor Name 2")
            {
            }
            column(Requester_ID; "Requester ID")
            {
            }
            column(Request_By_Name; "Request-By Name")
            {
            }
            column(Procurement_Plan_ID; "Procurement Plan ID")
            {
            }
            column(Procurement_Plan_Entry_No; "Procurement Plan Entry No")
            {
            }
            column(PP_Planning_Category; "PP Planning Category")
            {
            }
            column(PP_Funding_Source_ID; "PP Funding Source ID")
            {
            }
            column(PP_Total_Budget; "PP Total Budget")
            {
            }
            column(PP_Total_Available_Budget; "PP Total Available Budget")
            {
            }
            column(PP_Total_Commitments; "PP Total Commitments")
            {
            }
            column(Total_PRN_Amount; "Total PRN Amount")
            {
            }
            column(Total_PRN_Amount__LCY_; "Total PRN Amount (LCY)")
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
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
                ;

                PurchaseHeader.SetRange("Document Date", StartDate, EndDate);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'End Date';
                    }
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
        StartDate: Date;
        EndDate: Date;
}
