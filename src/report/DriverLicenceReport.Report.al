#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59006 "Driver Licence Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Driver Licence Report.rdlc';

    dataset
    {
        dataitem("Vehicle Drivers";"Vehicle Drivers")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(NextLicenseRenewal_VehicleDrivers;"Vehicle Drivers"."Next License Renewal")
            {
            }
            column(LicenceType_VehicleDrivers;"Vehicle Drivers"."Licence Type")
            {
            }
            column(Driver_VehicleDrivers;"Vehicle Drivers".Driver)
            {
            }
            column(DriverName_VehicleDrivers;"Vehicle Drivers"."Driver Name")
            {
            }
            column(DriverLicenseNumber_VehicleDrivers;"Vehicle Drivers"."Driver License Number")
            {
            }
            column(LastLicenseRenewal_VehicleDrivers;Format("Vehicle Drivers"."Last License Renewal"))
            {
            }
            column(RenewalInterval_VehicleDrivers;"Vehicle Drivers"."Renewal Interval")
            {
            }
            column(RenewalIntervalValue_VehicleDrivers;"Vehicle Drivers"."Renewal Interval Value")
            {
            }
            column(NextRenewalDate_VehicleDrivers;Format("Vehicle Drivers"."Next License Renewal"))
            {
            }
            column(RegionCode_VehicleDrivers;"Vehicle Drivers"."Region Code")
            {
            }
            column(YearOfExperience_VehicleDrivers;"Vehicle Drivers"."Year Of Experience")
            {
            }
            column(PhoneNumber_VehicleDrivers;"Vehicle Drivers"."Phone Number")
            {
            }
            column(CI_Picture;CI.Picture)
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
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(RegionName;RegionName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Vehicle Drivers"."Region Code");
                if ResponsibilityCenter.FindSet then begin
                RegionName:=UpperCase(ResponsibilityCenter.Name);
                end;
            end;

            trigger OnPreDataItem()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Vehicle Drivers"."Region Code");
                if ResponsibilityCenter.FindSet then begin
                RegionName:=UpperCase(ResponsibilityCenter.Name);
                end;
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
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        RegionName: Text[250];
}
