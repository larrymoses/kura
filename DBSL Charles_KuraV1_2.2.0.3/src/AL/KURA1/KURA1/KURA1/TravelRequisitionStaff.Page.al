
/// <summary>
/// Page Travel Requisition Staff (ID 59017).
/// </summary>

Page 59017 "Travel Requisition Staff"
{
    CardPageID = "Fleet Requisition Card";
    PageType = ListPart;
    SourceTable = "Travel Requisition Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Req No"; Rec."Req No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Employee List";
                    TableRelation = Employee;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                }
                field("Reassigned?"; Rec."Reassigned?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Trip"; Rec."New Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Reassigned"; Rec."Date Reassigned")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Reassign to Another Trip")
                {
                    ApplicationArea = Basic;
                    Image = Refresh;

                    trigger OnAction()
                    begin
                        if Rec."Employee No" = '' then
                            Error('No employee selected..');
                        TransportReq.Reset;
                        TransportReq.SetRange("Transport Requisition No", Rec."Req No");
                        if TransportReq.FindSet then begin
                            if TransportReq.Status = TransportReq.Status::Approved then
                                Error('You cannot reassign employee on a trip to another trip');

                        end;
                        if Rec."Reassigned?" = true then
                            Error('The employee has already been reassigned to another trip');
                        TravelRequ.Reset;
                        TravelRequ.SetRange("Employee No", Rec."Employee No");
                        TravelRequ.SetRange("Req No", Rec."Req No");
                        if Dialog.Confirm('Are you sure you want to reasign %1 to another trip?', true, Rec."Employee Name") then
                            Report.Run(59000, true, true, TravelRequ);
                    end;
                }
            }
        }
    }

    var
        TravelRequ: Record "Travel Requisition Staff";
        TransportReq: Record "Transport Requisition";
}



