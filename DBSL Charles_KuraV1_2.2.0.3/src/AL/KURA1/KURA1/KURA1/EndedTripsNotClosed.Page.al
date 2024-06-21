#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59138 "Ended Trips Not Closed"
{
    ApplicationArea = Basic;
    Caption = 'Assigned Not Closed Fleet Requests';
    CardPageID = "Fleet Requisition Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Transport Requisition";
    SourceTableView = order(ascending)
                      where(Status=const(Approved));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected;Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Transport Requisition No";"Transport Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(Commencement;Commencement)
                {
                    ApplicationArea = Basic;
                }
                field(Destination;Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Requested By";"Requested By")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Request";"Date of Request")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Allocated by";"Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                }
                field("Number of Assigned Drivers";"Number of Assigned Drivers")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer Reading";"Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Trip";"Date of Trip")
                {
                    ApplicationArea = Basic;
                }
                field("Purpose of Trip";"Purpose of Trip")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Loaded to WorkTicket";"Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                }
                field("Time out";"Time out")
                {
                    ApplicationArea = Basic;
                }
                field("Time In";"Time In")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route";"Journey Route")
                {
                    ApplicationArea = Basic;
                }
                field("Time Requested";"Time Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Odometer Reading";"Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Work Ticket No";"Work Ticket No")
                {
                    ApplicationArea = Basic;
                }
                field("No of Days Requested";"No of Days Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Authorized  By";"Authorized  By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Close Multiple Trips")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TransportReq.Reset;
                    TransportReq.SetRange(TransportReq.Status,TransportReq.Status::Approved);
                    TransportReq.SetRange(TransportReq.Selected,true);
                    SelectedNo := TransportReq.Count();
                    if SelectedNo = 0 then
                      Error('No record selected..')
                    else
                    if Confirm('Are you sure you want to Bulk close %1 Records?',true,SelectedNo) then begin
                      TransportReqs.Reset;
                      TransportReqs.SetRange(TransportReqs.Status,TransportReqs.Status::Approved);
                      TransportReqs.SetRange(TransportReqs.Selected,true);
                      if TransportReqs.Find('-') then begin
                        repeat
                          TransportReqs.Status := TransportReqs.Status::Closed;
                          TransportReqs.Selected := false;
                          TransportReqs.Modify;
                        until TransportReqs.Next=0;
                        Message('%1 Records Closed',SelectedNo);
                      end;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        SetFilter("Trip End Date",'>=%1',Today);
    end;

    trigger OnOpenPage()
    begin
        CalcFields("Number of Assigned Drivers");
        SetFilter("Number of Assigned Drivers",'<>%1',0);
        TransportReq.Reset;
        TransportReq.SetRange(TransportReq.Selected,true);
        if TransportReq.Find('-') then begin
          repeat
            TransportReq.Selected := false;
            TransportReq.Modify;
          until TransportReq.Next=0
        end;
    end;

    var
        TransportReq: Record "Transport Requisition";
        SelectedNo: Integer;
        TransportReqs: Record "Transport Requisition";
}

