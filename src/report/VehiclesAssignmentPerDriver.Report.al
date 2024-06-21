#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59011 "Vehicles Assignment Per Driver"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Vehicles Assignment Per Driver.rdlc';
    PreviewMode = PrintLayout;
    ApplicationArea = Basic;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Vehicle Drivers"; "Vehicle Drivers")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(Driver_VehicleDrivers; "Vehicle Drivers".Driver)
            {
            }
            column(DriverName_VehicleDrivers; "Vehicle Drivers"."Driver Name")
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code")
            {
            }
            column(CI_City; CI.City)
            {
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(DriverLicenseNumber_VehicleDrivers; "Vehicle Drivers"."Driver License Number")
            {
            }
            dataitem("Vehicle Driver Allocation"; "Vehicle Driver Allocation")
            {
                DataItemLink = "Driver Code" = field(Driver);
                column(ReportForNavId_5; 5)
                {
                }
                column(RequisitionNumber_VehicleDriverAllocation; "Vehicle Driver Allocation"."Requisition Number")
                {
                }
                column(NumberofDays_VehicleDriverAllocation; "Vehicle Driver Allocation"."Number of Days")
                {
                }
                column(DateofTrip_VehicleDriverAllocation; "Vehicle Driver Allocation"."Date of Trip")
                {
                }
                column(TripEndDate_VehicleDriverAllocation; "Vehicle Driver Allocation"."Trip End Date")
                {
                }
                column(VehicleRegNo_VehicleDriverAllocation; "Vehicle Driver Allocation"."Registration Number")
                {
                }
                column(VehicleDescription_VehicleDriverAllocation; "Vehicle Driver Allocation"."Vehicle Description")
                {
                }
                dataitem("Transport Requisition"; "Transport Requisition")
                {
                    DataItemLink = "Transport Requisition No" = field("Requisition Number");
                    column(ReportForNavId_10; 10)
                    {
                    }
                    column(VehicleAllocated_TransportRequisition; "Transport Requisition"."Vehicle Allocated")
                    {
                    }
                    column(Destination_TransportRequisition; "Transport Requisition".Destination)
                    {
                    }
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

