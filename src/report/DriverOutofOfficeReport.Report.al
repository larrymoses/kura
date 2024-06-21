#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59029 "Driver Out of Office Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Driver Out of Office Report.rdlc';

    dataset
    {
        dataitem("Driver Out of Office Req";"Driver Out of Office Req")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(DocumentNo_DriverOutofOfficeReq;"Driver Out of Office Req"."Document No")
            {
            }
            column(DocumentDate_DriverOutofOfficeReq;Format("Driver Out of Office Req"."Document Date"))
            {
            }
            column(DriverNo_DriverOutofOfficeReq;"Driver Out of Office Req"."Driver No")
            {
            }
            column(DriverName_DriverOutofOfficeReq;"Driver Out of Office Req"."Driver Name")
            {
            }
            column(TripNo_DriverOutofOfficeReq;"Driver Out of Office Req"."Trip No")
            {
            }
            column(TripDescrption_DriverOutofOfficeReq;"Driver Out of Office Req"."Trip Descrption")
            {
            }
            column(TripStartingDate_DriverOutofOfficeReq;Format("Driver Out of Office Req"."Trip Starting Date"))
            {
            }
            column(TripDuration_DriverOutofOfficeReq;"Driver Out of Office Req"."Trip Duration")
            {
            }
            column(TripEndDate_DriverOutofOfficeReq;Format("Driver Out of Office Req"."Trip End Date"))
            {
            }
            column(VehicleRegNo_DriverOutofOfficeReq;"Driver Out of Office Req"."Vehicle Reg No")
            {
            }
            column(VehicleDescription_DriverOutofOfficeReq;"Driver Out of Office Req"."Vehicle Description")
            {
            }
            column(NoSeries_DriverOutofOfficeReq;"Driver Out of Office Req"."No Series")
            {
            }
            column(Status_DriverOutofOfficeReq;"Driver Out of Office Req".Status)
            {
            }
            column(CIName;CompanyInformation.Name)
            {
            }
            column(CIAddress;CompanyInformation.Address)
            {
            }
            column(CIAddress2;CompanyInformation."Address 2")
            {
            }
            column(CICity;CompanyInformation.City)
            {
            }
            column(CIPicture;CompanyInformation.Picture)
            {
            }
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
        CompanyInformation.CalcFields(CompanyInformation.Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
}
