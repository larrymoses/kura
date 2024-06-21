
Page 59057 "Fleet Requisition Card Ap"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Transport Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Requisition No"; "Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(From; Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = CommencementEditable;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                    Editable = DensitationEditable;
                }
                field("Vehicle Allocated"; "Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleEditable;
                }
                field("Driver Allocated"; "Driver Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = DriverEditable;
                    LookupPageID = "Fleet Drivers List";
                }
                field("Driver Name"; "Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = DriverNameEditable;
                }
                field("Requested By"; "Requested By")
                {
                    ApplicationArea = Basic;
                    Editable = Requestedby;
                }
                field(Position; Position)
                {
                    ApplicationArea = Basic;
                    Editable = PositionEditable;
                }
                field("Vehicle Allocated by"; "Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                    Editable = allocatedbyEditable;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                    Editable = DepartmentEditable;
                }
                field("Date of Request"; "Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = DaterequestedEditable;
                }
                field("Time Requested"; "Time Requested")
                {
                    ApplicationArea = Basic;
                    Editable = TimeRequestedEditable;
                }
                field("Date of Trip"; "Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = DateofTripEditable;
                }
                field("Time out"; "Time out")
                {
                    ApplicationArea = Basic;
                    Editable = TimeoutEditable;
                }
                field("Time In"; "Time In")
                {
                    ApplicationArea = Basic;
                    Editable = TimeInEditable;
                }
                field("Journey Route"; "Journey Route")
                {
                    ApplicationArea = Basic;
                    Editable = JourneyEditable;
                }
                field("Opening Odometer Reading"; "Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = openingMileageEditable;
                    Visible = false;
                }
                field("Closing Odometer Reading"; "Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = closingMileageEditable;
                    Visible = false;
                }
                field("No of Days Requested"; "No of Days Requested")
                {
                    ApplicationArea = Basic;
                    Editable = NoofDaysEditable;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = RespEditable;
                }
                field("Loaded to WorkTicket"; "Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    Editable = loadedEditable;
                }
                field("Work Ticket No"; "Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = workticketEditable;
                    LookupPageID = "Daily Work Ticket List";
                }
                field("User Id"; "User Id")
                {
                    ApplicationArea = Basic;
                }
                field("Added On"; "Added On")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Purpose)
            {
                Editable = false;
                field("Purpose of Trip"; "Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = purposeEditable;
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                    Editable = commentsEditable;
                }
            }
            part("Transport Requisition Staff"; "Travel Requisition Staff")
            {
                Editable = line;
                SubPageLink = "Req No" = field("Transport Requisition No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;

                trigger OnAction()
                var
                //  ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin

                    TestField(Status, Status::Open);
                    TestField(Commencement);
                    TestField(Destination);
                    TestField("Date of Trip");
                    TestField("Purpose of Trip");
                    /*
                    IF ApprovalsMgmt.CheckTransportReqApprovalsWorkflowEnabled(Rec) THEN
                    ApprovalsMgmt.OnSendTransportReqForApproval(Rec);
                    */

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin
                    /*
                    ApprovalsMgmt.OnCancelTransportReqApprovalRequest(Rec)
                    */

                end;
            }
            action("Send SMS to Driver")
            {
                ApplicationArea = Basic;
                Image = Start;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*IF Status<>Status::Approved THEN BEGIN
                    ERROR('The status must be approved for you to notify the driver');
                    END ELSE BEGIN

                   SMSMessages.RESET;
                   IF SMSMessages.FIND('+') THEN BEGIN
                   iEntryNo:=SMSMessages."Entry No";
                   iEntryNo:=iEntryNo+1;
                   END ELSE BEGIN
                   iEntryNo:=1;
                   END;

                   SMSMessages.INIT;
                   SMSMessages."Com:=iEntryNo;
                   SMSMessages."Global Dimension 2":="Transport Requisition No";
                   SMSMessages.Account:=TODAY;
                   SMSMessages."Committed Amount":=TIME;
                   SMSMessages."Commitment Date":='DRIVERNOT';
                   SMSMessages.User:=USERID;
                   SMSMessages."Account Name":=TRUE;
                   SMSMessages."Account No.":="Transport Requisition No";
                   SMSMessages.InvoiceNo:=SMSMessages.InvoiceNo::"0";
                   SMSMessages."Document No":='Dear '+"Driver Name"+' you have a job to '+Destination+' on '+FORMAT("Date of Trip")+' at '+FORMAT("Time Requested");
                   IF HR.GET("Driver Allocated") THEN BEGIN
                   IF HR."Cellular Phone Number"<> '' THEN
                   SMSMessages."Commitment Type":=HR."Cellular Phone Number";
                   END;
                   SMSMessages.INSERT;

                   END;
                   */

                    Message('SMS Message sent succesfully');

                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols();
    end;

    var
        TransportReqEditable: Boolean;
        CommencementEditable: Boolean;
        DensitationEditable: Boolean;
        VehicleEditable: Boolean;
        DriverEditable: Boolean;
        DriverNameEditable: Boolean;
        allocatedbyEditable: Boolean;
        DepartmentEditable: Boolean;
        DaterequestedEditable: Boolean;
        TimeRequestedEditable: Boolean;
        DateofTripEditable: Boolean;
        TimeoutEditable: Boolean;
        TimeInEditable: Boolean;
        JourneyEditable: Boolean;
        openingMileageEditable: Boolean;
        closingMileageEditable: Boolean;
        NoofDaysEditable: Boolean;
        loadedEditable: Boolean;
        workticketEditable: Boolean;
        purposeEditable: Boolean;
        authorisedEditable: Boolean;
        lines: Record "Travel Requisition Staff";
        line: Boolean;
        Requestedby: Boolean;
        PositionEditable: Boolean;
        commentsEditable: Boolean;
        RespEditable: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SMSMessages: Record "Committment Entries";
        iEntryNo: Integer;
        HR: Record Employee;


    procedure updatecontrols()
    begin

        if Status = Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := true;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := true;
            TimeRequestedEditable := true;
            DateofTripEditable := true;
            TimeoutEditable := true;
            JourneyEditable := true;
            openingMileageEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            Requestedby := true;
            PositionEditable := true;
            authorisedEditable := false;
            line := true;
            commentsEditable := true;
            RespEditable := true;
        end else
            if Status = Status::"Pending Approval" then begin
                TransportReqEditable := false;
                CommencementEditable := false;
                DensitationEditable := false;
                VehicleEditable := true;
                DriverEditable := true;
                allocatedbyEditable := false;
                closingMileageEditable := false;
                DriverNameEditable := false;
                DepartmentEditable := false;
                loadedEditable := false;
                workticketEditable := false;
                DaterequestedEditable := false;
                TimeRequestedEditable := false;
                DateofTripEditable := false;
                TimeoutEditable := false;
                JourneyEditable := false;
                openingMileageEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                authorisedEditable := false;
                Requestedby := false;
                PositionEditable := false;
                commentsEditable := false;
                RespEditable := false;
                line := false;
            end else
                if Status = Status::Approved then begin
                    TransportReqEditable := false;
                    CommencementEditable := false;
                    DensitationEditable := false;
                    VehicleEditable := false;
                    DriverEditable := false;
                    allocatedbyEditable := false;
                    closingMileageEditable := true;
                    DriverNameEditable := false;
                    DepartmentEditable := false;
                    loadedEditable := true;
                    workticketEditable := true;
                    DaterequestedEditable := false;
                    TimeRequestedEditable := false;
                    DateofTripEditable := false;
                    TimeoutEditable := false;
                    TimeInEditable := true;
                    JourneyEditable := false;
                    openingMileageEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    authorisedEditable := false;
                    Requestedby := false;
                    PositionEditable := false;
                    commentsEditable := false;
                    RespEditable := false;

                    line := false;
                end else

                    if Status = Status::Rejected then begin
                        TransportReqEditable := false;
                        CommencementEditable := false;
                        DensitationEditable := false;
                        VehicleEditable := false;
                        DriverEditable := false;
                        allocatedbyEditable := false;
                        closingMileageEditable := false;
                        DriverNameEditable := false;
                        DepartmentEditable := false;
                        loadedEditable := false;
                        workticketEditable := false;
                        DaterequestedEditable := false;
                        TimeRequestedEditable := false;
                        DateofTripEditable := false;
                        TimeoutEditable := false;
                        TimeInEditable := false;
                        JourneyEditable := false;
                        openingMileageEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        authorisedEditable := false;
                        line := false;
                        Requestedby := false;
                        PositionEditable := false;
                        commentsEditable := false;
                        RespEditable := false;
                    end
    end;
}

