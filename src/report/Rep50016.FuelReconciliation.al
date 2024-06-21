/// <summary>
/// Report Fuel Reconciliation Total (ID 50016).
/// </summary>
report 50016 "Fuel Reconciliation"
{
    // ApplicationArea = All;
    Caption = 'Fuel Reconciliation';
    // UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/FuelReconciliation.rdl';
    dataset
    {
        dataitem(FuelMaintenanceRequisition; "Fuel & Maintenance Requisition")
        {
            column(VehicleRegNo; "Vehicle Reg No")
            {
            }
            column(Fuel_Card_No_;"Fuel Card No.")
            {
            }
            column(Request_Date;"Request Date")
            {
            }
            column(Total_Price_of_Fuel;"Total Price of Fuel")
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
