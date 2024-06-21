#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59022 "Closed Fleet Req Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Transport Requisition";
    SourceTableView = order(ascending)
                      where(Closed=const(true));

    layout
    {
        area(content)
        {
            Group(General)
            {
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requested By"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requested By Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                    Editable = false;
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Commencement Code";Rec."Commencement Code")
                {
                    ApplicationArea = All;
                    Caption = 'From';
                    Editable = false;
                }
                field("Destination Code";Rec."Destination Code")
                {
                    ApplicationArea = All;
                    Caption = 'To';
                    Editable = false;
                }
                field("Type of Vehicle";Rec."Type of Vehicle")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No of Drivers"; Rec."No of Drivers")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    Editable = false;
                }
                field("No. of Staff";Rec."No. of Staff")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Reason for Cancelling")
            {
                // Visible = ReasonCancel;
                field("Reason for Reopening"; Rec."Reason for Reopening")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Cancelling';
                    Editable = true;
                    MultiLine = true;
                    ShowCaption = false;
                }
            }
            part(Control14; "Driver Vehicle Allocation")
            {
                Caption = 'Driver Vehicle Allocation';
                ApplicationArea = Basic;
                Editable = false;
                SubPageLink = "Requisition Number" = field("Transport Requisition No");
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Cancel Fleet Requsition")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Fleet Requisition';
                Image = Cancel;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    // ReasonCancel := true;
                    if Rec.Status = Rec.Status::Closed then
                        Error('Closed Requisitions cannot be canceled');
                    if Rec."Reason for Reopening" = '' then
                        Error('Make sure you state the reason for cancelling this requisition under purpose fast tab');

                    if Confirm('Are you sure you want to cancel this Fleet Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Cancelled;
                        Rec."Closed By" := UserId;
                        Rec."Date Closed" := Today;
                        Rec.Modify;
                        Message('Transport Requisition No %1 %2 Successfully', Rec."Transport Requisition No", Rec.Status);
                        CurrPage.Close;
                        FleetRequisitionCard.SendEmailNotificationC(Rec."Transport Requisition No", Rec."Employee No");
                end;
            }
        }
    }

    var
        ReasonCancel: Boolean;
        FleetRequisitionCard: Page "Fleet Requisition Card";
}

