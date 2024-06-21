#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59018 "Approved Fleet Requests List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Requisition Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Transport Requisition";
    SourceTableView = order(ascending)
                      where(Status = const(Approved), Closed = const(false));
    UsageCategory = Lists;
    Caption = 'Approved Transport Requisitions';

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
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Request";"Date of Request")
                {
                    ApplicationArea = Basic;
                }
                field("Requested By";"Requested By")
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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //CalcFields("Number of Assigned Drivers");
        //  SetFilter("Number of Assigned Drivers",'%1',0);
    end;

    trigger OnOpenPage()
    begin
        // CalcFields("Number of Assigned Drivers");
        // SetFilter("Number of Assigned Drivers",'%1',0);
    end;
}

