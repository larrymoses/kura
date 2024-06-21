#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59016 "Daily Work Ticket Lines"
{
    PageType = ListPart;
    SourceTable = "Daily Work Ticket Lines";

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
                field("Vehicle Allocated";"Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Allocated";"Driver Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Request";"Date of Request")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer Reading";"Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Odometer Reading";"Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Total Kilometres";"Total Kilometres")
                {
                    ApplicationArea = Basic;
                }
                field(EntryNo;EntryNo)
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
                field("Fuel Drawn(Litres)";"Fuel Drawn(Litres)")
                {
                    ApplicationArea = Basic;
                }
                field("Order No";"Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Authorized By";"Authorized By")
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name";"Driver Name")
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

