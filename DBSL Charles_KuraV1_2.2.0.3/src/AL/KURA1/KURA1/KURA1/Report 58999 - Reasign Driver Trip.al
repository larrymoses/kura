report 58999 "Reasign Driver Trip"
{
    ProcessingOnly = true;
    ShowPrintStatus = false;

    dataset
    {
        dataitem("Vehicle Driver Allocation"; "Vehicle Driver Allocation")
        {

            trigger OnAfterGetRecord()
            var
                Body: Text;
            begin
                TravelReq.RESET;
                TravelReq.SETRANGE("Requisition Number", "Vehicle Driver Allocation"."Requisition Number");
                TravelReq.SETRANGE("Driver Code", "Vehicle Driver Allocation"."Driver Code");
                IF TravelReq.FINDFIRST THEN BEGIN
                    MESSAGE('Reasigning %1', TravelReq."Driver Name");
                    TravelReq."Reassigned?" := TRUE;
                    TravelReq."New Trip" := Req;
                    TravelReq."Date Reassigned" := TODAY;
                    TravelReq.MODIFY;
                    //TravelReq1.INIT;
                    TravelReq1."Driver Code" := TravelReq."Driver Code";
                    TravelReq1.VALIDATE("Driver Code");
                    TravelReq1."Requisition Number" := Req;
                    TravelReq1."Number of Days" := TravelReq."Number of Days";
                    TravelReq1."Date of Trip" := TravelDate;
                    TravelReq1.VALIDATE("Number of Days");
                    TravelReq1.VALIDATE("Date of Trip");
                    TravelReq1.INSERT();// THEN BEGIN
                    MESSAGE('%1 Reassigened to trip %2', TravelReq1."Driver Name", Req);
                    TransportRequisition.GET("Requisition Number");
                    TransportRequisitionNew.GET(Req);
                    IF Emp.GET("Vehicle Driver Allocation"."Driver Code") THEN BEGIN
                        Header := 'TRAVEL TRIP REASSIGNMENT NOTIFICATION';

                        IF Emp."E-Mail" <> '' THEN BEGIN
                            Body := '<br><br>'
                             + 'Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ','
                             + '<br><br>'
                             + 'Please note that you have been re-assigend to another trip as follows'// for the month of January 2014');
                             + '<br><br>'
                             + '<h1>Current Trip Details</h1>'
                             + '<br>'
                             + 'Trip requested by : ' + TransportRequisition."Employee Name"
                             + '<br>'
                             + 'Trip From: ' + TransportRequisition.Commencement + ' To ' + TransportRequisition.Destination + ' on ' + FORMAT(TransportRequisition."Date of Trip") + ' return date will be on ' + FORMAT(TransportRequisition."Trip End Date")
                             + '<br>'
                             + 'Vehicle Reg Number: ' + "Registration Number" + ' ' + "Vehicle Description"
                             + '<br>'
                             + '<br>'
                             + '<h1>New Trip Details</h1>'
                             + '<br>'
                             + 'Trip requested by : ' + TransportRequisitionNew."Employee Name"
                             + '<br>'
                             + 'Trip From: ' + TransportRequisitionNew.Commencement + ' To ' + TransportRequisitionNew.Destination + ' on ' + FORMAT(TransportRequisitionNew."Date of Trip") +
                                                 ' return date will be on ' + FORMAT(TransportRequisitionNew."Trip End Date")
                             + '<br>'
                             + '<br>'
                             + 'Kindly prepare adequately'
                             + '<br><br>'
                             + 'Thanks & Regards'
                             + '<br><br>'
                             + SenderName
                             + '<br><br>'
                             + '<HR>'
                             + 'This is a system generated mail.'
                             + '<br><br>'
                             + 'All Enquires regarding wages should be sent to HR@KERRA.go.ke'
                             + '<br><br>';
                            Mail.Create(Emp."E-Mail", Header, Body, true);
                            if Email.Send(Mail) then
                                MESSAGE('Mail sent to %1', Emp."E-Mail");
                        END;
                        //End email
                        //END;
                    END;
                END;
            end;

            trigger OnPreDataItem()
            begin
                IF Req = '' THEN
                    ERROR('Please select new trip');
                IF TravelDate = 0D THEN
                    ERROR('Please select new trip Date');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("New Trip To Assign")
                {
                    field("New Trip"; Req)
                    {
                        NotBlank = true;
                        TableRelation = "Transport Requisition"."Transport Requisition No" WHERE(Status = FILTER(Approved));
                    }
                    field("New Travel Date"; TravelDate)
                    {
                        NotBlank = true;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Req: Code[50];
        TravelReq: Record "Vehicle Driver Allocation";
        TravelReq1: Record "Vehicle Driver Allocation";
        TravelDate: Date;
        VehicleDrivers: Record "Vehicle Driver Allocation";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisitionNew: Record "Transport Requisition";
        DriverAllocation: Record "Vehicle Driver Allocation";
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HrEmployee: Record Employee;
        UserMgt: Codeunit "User Management";
        RespCenter: Record "Responsibility Center";
        drivers1: Record "Vehicle Drivers";
        ObjImprestMemo: Record "Imprest Memo";
        ObjTravelStaff: Record "Travel Requisition Staff";
        ObjProjMembers: Record "Project Members";
        ProgressWindow: Dialog;
        Filename: Text;

        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        VehicleDrivers1: Record "Vehicle Drivers";
        ProjectMembers: Record "Project Members";
        UserSetup: Record "User Setup";
        FleetSetup: Record "Fleet Management Setup";
        FleetVehicles: Record "Fleet Vehicles.";
        NoOfDrivers: Integer;
        ImprestMemo: Record "Imprest Memo";
        VehicleDrivers11: Record "Vehicle Drivers";
        Email: Codeunit Email;
        Mail: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        DocStream: Instream;
        Outs: Outstream;
        RecRef: RecordRef;
        fref: FieldRef;
        Body: Text;
}

