#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59018 "Transport Requisition Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Transport Requisition Report.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Transport Requisition";"Transport Requisition")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CI_Picture;CI.Picture)
            {
            }
            column(TransportRequisitionNo_TransportRequisition;"Transport Requisition"."Transport Requisition No")
            {
            }
            column(Commencement_TransportRequisition;"Transport Requisition".Commencement)
            {
            }
            column(Destination_TransportRequisition;"Transport Requisition".Destination)
            {
            }
            column(RequestedBy_TransportRequisition;"Transport Requisition"."Requested By")
            {
            }
            column(DateofRequest_TransportRequisition;"Transport Requisition"."Date of Request")
            {
            }
            column(DateofTrip_TransportRequisition;"Transport Requisition"."Date of Trip")
            {
            }
            column(PurposeofTrip_TransportRequisition;"Transport Requisition"."Purpose of Trip")
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;CI.Name)
            {
            }
            dataitem("Travel Requisition Staff";"Travel Requisition Staff")
            {
                DataItemLink = "Req No"=field("Transport Requisition No");
                DataItemTableView = sorting("Req No", "Employee No", EntryNo);
                column(ReportForNavId_9; 9)
                {
                }
                column(EmployeeNo_TravelRequisitionStaff;"Travel Requisition Staff"."Employee No")
                {
                }
                column(EmployeeName_TravelRequisitionStaff;"Travel Requisition Staff"."Employee Name")
                {
                }
                column(NoOfDays_TravelRequisitionStaff;"Transport Requisition"."No of Days Requested")
                {
                }
                column(TripEndDate_TravelRequisitionStaff;"Transport Requisition"."Trip End Date")
                {
                }
                column(Position_TravelRequisitionStaff;"Travel Requisition Staff".Position)
                {
                }
            }
            dataitem("Travel Requisition Non Staff";"Travel Requisition Non Staff")
            {
                DataItemLink = "Req No"=field("Transport Requisition No");
                DataItemTableView = sorting("Req No", "ID No");
                column(ReportForNavId_13; 13)
                {
                }
                column(IDNo_TravelRequisitionNonStaff;"Travel Requisition Non Staff"."ID No")
                {
                }
                column(Name_TravelRequisitionNonStaff;"Travel Requisition Non Staff".Name)
                {
                }
                column(Position_TravelRequisitionNonStaff;"Travel Requisition Non Staff".Position)
                {
                }
                column(PhoneNumber_TravelRequisitionNonStaff;"Travel Requisition Non Staff"."Phone Number")
                {
                }
                column(Designation_TravelRequisitionNonStaff;"Travel Requisition Non Staff".Designation)
                {
                }
            }
            dataitem("Vehicle Driver Allocation";"Vehicle Driver Allocation")
            {
                DataItemLink = "Requisition Number"=field("Transport Requisition No");
                DataItemTableView = sorting("Requisition Number", "Driver Code", "Line No.");
                column(ReportForNavId_18; 18)
                {
                }
                column(DriverCode_VehicleDriverAllocation;"Vehicle Driver Allocation"."Driver Code")
                {
                }
                column(DriverName_VehicleDriverAllocation;"Vehicle Driver Allocation"."Driver Name")
                {
                }
                column(NumberofDays_VehicleDriverAllocation;"Vehicle Driver Allocation"."Number of Days")
                {
                }
                column(RegistrationNumber_VehicleDriverAllocation;"Vehicle Driver Allocation"."Registration Number")
                {
                }
                column(VehicleDescription_VehicleDriverAllocation;"Vehicle Driver Allocation"."Vehicle Description")
                {
                }
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
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}
