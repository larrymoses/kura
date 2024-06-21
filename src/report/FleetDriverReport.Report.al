#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59016 "Fleet Driver Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fleet Driver Report.rdlc';
    PreviewMode = PrintLayout;

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
            column(LastLicenseRenewal_VehicleDrivers; "Vehicle Drivers"."Last License Renewal")
            {
            }
            column(RenewalInterval_VehicleDrivers; "Vehicle Drivers"."Renewal Interval")
            {
            }
            column(RenewalIntervalValue_VehicleDrivers; "Vehicle Drivers"."Renewal Interval Value")
            {
            }
            column(NextLicenseRenewal_VehicleDrivers; "Vehicle Drivers"."Next License Renewal")
            {
            }
            column(YearOfExperience_VehicleDrivers; "Vehicle Drivers"."Year Of Experience")
            {
            }
            column(RegionName; RegionName)
            {
            }
            column(RegionCode_VehicleDrivers; "Vehicle Drivers"."Region Code")
            {
            }
            column(Active_VehicleDrivers; "Vehicle Drivers".Active)
            {
            }
            column(LicenceType_VehicleDrivers; "Vehicle Drivers"."Licence Type")
            {
            }
            column(PhoneNumber_VehicleDrivers; "Vehicle Drivers"."Phone Number")
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
                column(RegistrationNumber_VehicleDriverAllocation; "Vehicle Driver Allocation"."Registration Number")
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
            dataitem("Vehicle Accident Details"; "Vehicle Accident Details")
            {
                DataItemLink = Driver = field(Driver);
                column(ReportForNavId_12; 12)
                {
                }
                column(RegNo_VehicleAccidentDetails; "Vehicle Accident Details".RegNo)
                {
                }
                column(Accidentdate_VehicleAccidentDetails; "Vehicle Accident Details"."Accident date")
                {
                }
                column(AccidentDetails_VehicleAccidentDetails; "Vehicle Accident Details"."Accident Details")
                {
                }
                column(No_VehicleAccidentDetails; "Vehicle Accident Details".No)
                {
                }
                column(PoliceAbstractNo_VehicleAccidentDetails; "Vehicle Accident Details"."Police Abstract No")
                {
                }
                column(DriverNames_VehicleAccidentDetails; "Vehicle Accident Details"."Driver Names")
                {
                }
                column(VehicleDescription_VehicleAccidentDetails; "Vehicle Accident Details"."Vehicle Description")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Vehicle Drivers"."Region Code");
                if ResponsibilityCenter.FindSet then
                    RegionName := ResponsibilityCenter.Name;
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
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        RegionName: Text;
        ResponsibilityCenter: Record "Responsibility Center";
}
