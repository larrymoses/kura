#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59020 "Pending Requisition Card"
{
    // DeleteAllowed = false;
    // Editable = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    // PageType = Card;
    // SourceTable = "Transport Requisition";
    // SourceTableView = where(Status=filter("Pending Approval"));

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Transport Requisition No";"Transport Requisition No")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Commencement;Commencement)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Destination;Destination)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Vehicle Allocated";"Vehicle Allocated")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Driver Allocated";"Driver Allocated")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Requested By";"Requested By")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Date of Request";"Date of Request")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Vehicle Allocated by";"Vehicle Allocated by")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Opening Odometer Reading";"Opening Odometer Reading")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field(Status;Status)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Date of Trip";"Date of Trip")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Department;Department)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Driver Name";"Driver Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Responsibility Center";"Responsibility Center")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Loaded to WorkTicket";"Loaded to WorkTicket")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Time out";"Time out")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Time In";"Time In")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Journey Route";"Journey Route")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Time Requested";"Time Requested")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Closing Odometer Reading";"Closing Odometer Reading")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Work Ticket No";"Work Ticket No")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("No of Days Requested";"No of Days Requested")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Authorized  By";"Authorized  By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field(Position;Position)
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //         }
    //         group(Purpose)
    //         {
    //             field("Purpose of Trip";"Purpose of Trip")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Comments;Comments)
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //         }
    //         part("Transport Requisition Staff";"Travel Requisition Staff")
    //         {
    //             SubPageLink = "Req No"=field("Transport Requisition No");
    //         }
    //         part(Control5;"Non Staff Tavel Request")
    //         {
    //             SubPageLink = "Req No"=field("Transport Requisition No");
    //         }
    //     }
    // }

    // actions
    // {
    //     area(creation)
    //     {
    //         action(SendApprovalRequest)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Send A&pproval Request';
    //             Enabled = false;
    //             Image = SendApprovalRequest;
    //             Promoted = true;
    //             PromotedCategory = Category9;

    //             trigger OnAction()
    //             begin
    //                  TestField(Status,Status::Open);
    //                   TestField( Commencement);
    //                   TestField(Destination );
    //                   TestField("Date of Trip");
    //                   TestField("Purpose of Trip");

    //               //  if ApprovalsMgmt.CheckFleetApprovalsWorkflowEnabled(Rec) then
    //               //    ApprovalsMgmt.OnSendFleetForApproval(Rec);
    //             end;
    //         }
    //         action(CancelApprovalRequest)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Cancel Approval Re&quest';
    //             Image = Cancel;
    //             Promoted = true;
    //             PromotedCategory = Category9;

    //             trigger OnAction()
    //             begin
    //               //   if Status=Status::"Pending Approval" then
    //                 //ApprovalsMgmt.OnCancelFleetApprovalRequest(Rec);
    //             end;
    //         }
    //         action(Approvals)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Approvals';
    //             Image = Approvals;
    //             Promoted = true;
    //             PromotedCategory = New;
    //             PromotedIsBig = false;

    //             trigger OnAction()
    //             var
    //                 ApprovalEntries: Page "Approval Entries";
    //             begin

    //                  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
    //             end;
    //         }
    //     }
    // }

    // var
    //     TransportReqEditable: Boolean;
    //     CommencementEditable: Boolean;
    //     DensitationEditable: Boolean;
    //     VehicleEditable: Boolean;
    //     DriverEditable: Boolean;
    //     DriverNameEditable: Boolean;
    //     allocatedbyEditable: Boolean;
    //     DepartmentEditable: Boolean;
    //     DaterequestedEditable: Boolean;
    //     TimeRequestedEditable: Boolean;
    //     DateofTripEditable: Boolean;
    //     TimeoutEditable: Boolean;
    //     TimeInEditable: Boolean;
    //     JourneyEditable: Boolean;
    //     openingMileageEditable: Boolean;
    //     closingMileageEditable: Boolean;
    //     NoofDaysEditable: Boolean;
    //     loadedEditable: Boolean;
    //     workticketEditable: Boolean;
    //     purposeEditable: Boolean;
    //     authorisedEditable: Boolean;
    //     lines: Record "Travel Requisition Staff";
    //     line: Boolean;
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";


    // procedure updatecontrols()
    // begin
    //          if Status=Status::Open then begin
    //             TransportReqEditable:=false;
    //             CommencementEditable:=true;
    //             DensitationEditable:=true;
    //             VehicleEditable:=true;
    //             DriverEditable:=true;
    //             allocatedbyEditable:=false;
    //             closingMileageEditable:=false;
    //             DriverNameEditable:=false;
    //             DepartmentEditable:=false;
    //             loadedEditable:=false;
    //             workticketEditable:=false;
    //             DaterequestedEditable:=true;
    //             TimeRequestedEditable:=true;
    //             DateofTripEditable:=true;
    //             TimeoutEditable:=true;
    //             JourneyEditable:=true;
    //             openingMileageEditable:=true;
    //             NoofDaysEditable:=true;
    //             purposeEditable:=true;
    //             NoofDaysEditable:=true;
    //             purposeEditable:=true;
    //             authorisedEditable:=false;
    //            line:=true;
    //      end;
    //       if Status=Status::"Pending Approval" then begin
    //            TransportReqEditable:=false;
    //            CommencementEditable:=false;
    //            DensitationEditable:=false;
    //            VehicleEditable:=false;
    //            DriverEditable:=false;
    //            allocatedbyEditable:=false;
    //            closingMileageEditable:=false;
    //            DriverNameEditable:=false;
    //            DepartmentEditable:=false;
    //            loadedEditable:=false;
    //            workticketEditable:=false;
    //            DaterequestedEditable:=false;
    //            TimeRequestedEditable:=false;
    //            DateofTripEditable:=false;
    //            TimeoutEditable:=false;
    //            JourneyEditable:=false;
    //            openingMileageEditable:=false;
    //            NoofDaysEditable:=false;
    //            purposeEditable:=false;
    //            NoofDaysEditable:=false;
    //            purposeEditable:=false;
    //            authorisedEditable:=false;
    //            end;
    //         if Status=Status::Approved then begin
    //            TransportReqEditable:=false;
    //            CommencementEditable:=false;
    //            DensitationEditable:=false;
    //            VehicleEditable:=false;
    //            DriverEditable:=false;
    //            allocatedbyEditable:=false;
    //            closingMileageEditable:=false;
    //            DriverNameEditable:=false;
    //            DepartmentEditable:=false;
    //            loadedEditable:=true;
    //            workticketEditable:=true;
    //            DaterequestedEditable:=false;
    //            TimeRequestedEditable:=false;
    //            DateofTripEditable:=false;
    //            TimeoutEditable:=false;
    //            JourneyEditable:=false;
    //            openingMileageEditable:=false;
    //            NoofDaysEditable:=false;
    //            purposeEditable:=false;
    //            NoofDaysEditable:=false;
    //            purposeEditable:=false;
    //            authorisedEditable:=false;
    //            line:=false;
    //            end;

    //      if Status=Status::Rejected then begin
    //            TransportReqEditable:=false;
    //            CommencementEditable:=false;
    //            DensitationEditable:=false;
    //            VehicleEditable:=false;
    //            DriverEditable:=false;
    //            allocatedbyEditable:=false;
    //            closingMileageEditable:=false;
    //            DriverNameEditable:=false;
    //            DepartmentEditable:=false;
    //            loadedEditable:=false;
    //            workticketEditable:=false;
    //            DaterequestedEditable:=false;
    //            TimeRequestedEditable:=false;
    //            DateofTripEditable:=false;
    //            TimeoutEditable:=false;
    //            JourneyEditable:=false;
    //            openingMileageEditable:=false;
    //            NoofDaysEditable:=false;
    //            purposeEditable:=false;
    //            NoofDaysEditable:=false;
    //            purposeEditable:=false;
    //            authorisedEditable:=false;
    //            line:=false;
    //            end
    // end;
}

