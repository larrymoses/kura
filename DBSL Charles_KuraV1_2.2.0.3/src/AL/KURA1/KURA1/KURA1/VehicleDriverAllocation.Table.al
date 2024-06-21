
/// <summary>
/// Table Vehicle Driver Allocation (ID 59020).
/// </summary>
Table 59020 "Vehicle Driver Allocation"
{

    fields
    {
        field(1; "Requisition Number"; Code[30])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No";
        }
        field(2; "Driver Code"; Code[30])
        {
            TableRelation = Employee."No." where("Driver?" = const(true));
            trigger OnValidate()
            var
                Emp: Record Employee;
                Err001: Label 'Driver %1 is currently unavailable.';
            begin
                GetTransReqHeader();

                if CheckDriverAvailability("Driver Code", TransportReq."Date of Trip", TransportReq."Trip End Date") = true then
                    Error(Err001, Rec."Driver Code");

                if Emp.Get("Driver Code") then begin
                    "Driver Name" := Emp.FullName();
                end;
            end;
        }
        field(3; "Driver Name"; Text[100])
        {

        }
        field(4; "Number of Days"; Integer)
        {
            Editable = false;
        }
        field(7; "Reassigned?"; Boolean)
        {

        }
        field(8; "New Trip"; Code[100])
        {

        }
        field(9; "Date of Trip"; Date)
        {
            Editable = false;
        }
        field(10; "Status"; enum "Purchase Document Status")
        {

        }
        field(11; "Trip End Date"; Date)
        {
            Editable = false;
        }
        field(12; "Date Reassigned"; Date)
        {

        }
        field(13; "Requisition Status"; Enum "Employee Status")
        {

        }
        field(14; "Registration Number"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";
            trigger OnValidate()
            var
                FleetVehicle: Record "Fleet Vehicles.";
                Err002: Label 'The Vehicle with the Registration No. %1 is currently unavailable.';
            begin

                GetTransReqHeader();

                if CheckVehicleAvailability("Registration Number", TransportReq."Date of Trip", TransportReq."Trip End Date") = true then
                    Error(Err002, Rec."Registration Number");

                FleetVehicle.Reset();
                FleetVehicle.SetRange("Registration No.", Rec."Registration Number");
                if FleetVehicle.FindFirst() then begin
                    Rec."Vehicle Description" := FleetVehicle.Description;
                end;
            end;
        }
        field(15; "Vehicle Description"; Text[100])
        {

        }
        field(16; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(key1; "Requisition Number", "Driver Code", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        DriverAllocation.Reset();
        DriverAllocation.SetRange("Requisition Number", Rec."Requisition Number");
        if DriverAllocation.FindLast then
            "Line No." := DriverAllocation."Line No.";

        GetTransReqHeader();

        "Date of Trip" := TransportReq."Date of Trip";
        "Number of Days" := TransportReq."No of Days Requested";
        "Trip End Date" := TransportReq."Trip End Date";
        
    end;

    var
        DriverAllocation: Record "Vehicle Driver Allocation";
        TransportReq: Record "Transport Requisition";


    local procedure GetTransReqHeader()
    begin
        TransportReq.Reset();
        TransportReq.SetRange("Transport Requisition No", Rec."Requisition Number");
        TransportReq.FindFirst();
    end;

    local procedure CheckDriverAvailability(DriverCode: Code[20]; var StartDate: Date; var EndDate: Date): Boolean
    begin
        DriverAllocation.Reset();
        DriverAllocation.SetRange("Driver Code", DriverCode);
        DriverAllocation.SetFilter("Date of Trip", '<=%1', StartDate);
        DriverAllocation.SetFilter("Trip End Date", '>=%1', EndDate);
        if DriverAllocation.FindSet then repeat
            TransportReq.Reset();
            TransportReq.SetRange("Transport Requisition No", DriverAllocation."Requisition Number");
            TransportReq.FindFirst();
            if TransportReq.Closed then begin
                exit(true);
            end;
        until DriverAllocation.Next() = 0;
    end;

    local procedure CheckVehicleAvailability(VehicleCode: Code[20]; var StartDate: Date; var EndDate: Date): Boolean
    begin
        DriverAllocation.Reset();
        DriverAllocation.SetRange("Registration Number", VehicleCode);
        DriverAllocation.SetFilter("Date of Trip", '<=%1', StartDate);
        DriverAllocation.SetFilter("Trip End Date", '>=%1', EndDate);
        if DriverAllocation.FindSet then repeat
            TransportReq.Reset();
            TransportReq.SetRange("Transport Requisition No", DriverAllocation."Requisition Number");
            TransportReq.FindFirst();
            if TransportReq.Closed then begin
                exit(true);
            end;
        until DriverAllocation.Next() = 0;
    end;
}