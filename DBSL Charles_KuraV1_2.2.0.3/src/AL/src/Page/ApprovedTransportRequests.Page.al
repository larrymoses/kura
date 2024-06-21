#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59007 "Approved Transport Requests"
{
    CardPageID = "Fleet Requisition Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Transport Requisition";
    SourceTableView = order(ascending)
                      where(Status=filter(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("Driver Allocated";"Driver Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name";"Driver Name")
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
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

