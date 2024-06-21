#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59022 "Driver/Vehicle Allocation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/DriverVehicle Allocation.rdlc';

    dataset
    {
        dataitem("Vehicle Drivers";"Vehicle Drivers")
        {
            column(ReportForNavId_10; 10)
            {
            }
            column(Driver_VehicleDrivers;"Vehicle Drivers".Driver)
            {
            }
            dataitem("Vehicle Driver Allocation";"Vehicle Driver Allocation")
            {
                DataItemLink = "Driver Code"=field(Driver);
                column(ReportForNavId_5; 5)
                {
                }
                column(RequisitionNumber_VehicleDriverAllocation;"Vehicle Driver Allocation"."Requisition Number")
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
                column(DateofTrip_VehicleDriverAllocation;Format("Vehicle Driver Allocation"."Date of Trip"))
                {
                }
                column(TripEndDate_VehicleDriverAllocation;Format("Vehicle Driver Allocation"."Trip End Date"))
                {
                }
                column(RegistrationNumber_VehicleDriverAllocation;"Vehicle Driver Allocation"."Registration Number")
                {
                }
                column(VehicleDescription_VehicleDriverAllocation;"Vehicle Driver Allocation"."Vehicle Description")
                {
                }
                column(ImprestAmount;ImprestAmount)
                {
                }
                dataitem("Transport Requisition";"Transport Requisition")
                {
                    DataItemLink = "Transport Requisition No"=field("Requisition Number");
                    DataItemTableView = where("Type of Trip"=filter(Safari));
                    column(ReportForNavId_1; 1)
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
                    column(PurposeofTrip_TransportRequisition;"Transport Requisition"."Purpose of Trip")
                    {
                    }
                    column(ApprovedImprestMemo_TransportRequisition;"Transport Requisition"."Approved Imprest Memo")
                    {
                    }
                    column(Subject_TransportRequisition;"Transport Requisition".Subject)
                    {
                    }
                    column(TypeofTrip_TransportRequisition;"Transport Requisition"."Type of Trip")
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

                trigger OnAfterGetRecord()
                begin
                    ProjectMembers.Reset;
                    ProjectMembers.SetRange(ProjectMembers."No.","Vehicle Driver Allocation"."Driver Code");
                    ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.","Transport Requisition"."Approved Imprest Memo");
                    if ProjectMembers.FindSet then begin
                      ImprestAmount:=ProjectMembers.Entitlement;
                    end;
                end;
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

    trigger OnPreReport()
    begin
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        ImprestAmount: Decimal;
        ProjectMembers: Record "Project Members";
}
