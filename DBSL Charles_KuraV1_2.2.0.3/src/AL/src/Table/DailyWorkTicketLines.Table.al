#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59009 "Daily Work Ticket Lines"
{
    DrillDownPageID = "Daily Work Ticket Lines";
    LookupPageID = "Daily Work Ticket Lines";

    fields
    {
        field(1;"Transport Requisition No";Code[20])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No" where (Status=filter(Approved|Closed));

            trigger OnValidate()
            begin
                    if  TransReq.Get("Transport Requisition No") then begin
                        Commencement:=TransReq.Commencement;
                        Destination:=TransReq.Destination;
                        "Vehicle Allocated":=TransReq."Vehicle Allocated";
                        "Driver Allocated":=TransReq."Driver Allocated";
                        "Date of Request":=TransReq."Date of Request";
                        "Opening Odometer Reading":=TransReq."Opening Odometer Reading";
                        TransReq."Loaded to WorkTicket":=true;
                         TransReq.Modify;
                    end;
            end;
        }
        field(2;Commencement;Text[30])
        {
        }
        field(3;Destination;Text[30])
        {
        }
        field(4;"Vehicle Allocated";Code[20])
        {
            TableRelation = "Fleet Vehicles."."FA Serial No";
        }
        field(5;"Driver Allocated";Code[20])
        {
        }
        field(7;"Date of Request";Date)
        {
        }
        field(9;"Opening Odometer Reading";Decimal)
        {
            DecimalPlaces = 0:0;

            trigger OnValidate()
            begin
                 "Total Kilometres":="Closing Odometer Reading"-"Opening Odometer Reading";
            end;
        }
        field(11;"Daily Work Ticket";Code[20])
        {
        }
        field(12;"Closing Odometer Reading";Decimal)
        {
            DecimalPlaces = 0:0;

            trigger OnValidate()
            begin

                     "Total Kilometres":="Closing Odometer Reading"-"Opening Odometer Reading";

            end;
        }
        field(15;"Total Kilometres";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(16;EntryNo;Integer)
        {
            AutoIncrement = true;
        }
        field(17;"Time out";Time)
        {
        }
        field(18;"Time In";Time)
        {
        }
        field(19;"Fuel Drawn(Litres)";Decimal)
        {
        }
        field(20;"Order No";Code[20])
        {
        }
        field(21;"Authorized By";Text[30])
        {
        }
        field(22;Position;Text[30])
        {
        }
        field(23;"Driver Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Transport Requisition No","Driver Allocated")
        {
            Clustered = true;
            SumIndexFields = "Total Kilometres";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
          /* WorkTktHder.RESET;
           WorkTktHder.SETRANGE(WorkTktHder."Daily Work Ticket","Daily Work Ticket");
           IF WorkTktHder.FIND('-') THEN BEGIN
              WorkTktHder.TESTFIELD(Status,WorkTktHder.Status::Open);
           END;
        
            IF  TransReq.GET("Transport Requisition No") THEN BEGIN
        
                 TransReq."Loaded to WorkTicket":=FALSE;
                 TransReq.MODIFY;
            END;*/

    end;

    trigger OnInsert()
    begin
          /* WorkTktHder.RESET;
           WorkTktHder.SETRANGE(WorkTktHder."Daily Work Ticket","Daily Work Ticket");
           IF WorkTktHder.FIND('-') THEN BEGIN
              IF "Vehicle Allocated"<>WorkTktHder."Vehicle Allocated" THEN
                 ERROR(Text001,WorkTktHder."Vehicle Allocated");
           END;*/

    end;

    var
        TransReq: Record "Transport Requisition";
}

