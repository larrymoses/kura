#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59011 "Fleet Driver Card"
{
    //  DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Vehicle Drivers";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Driver; Driver)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; "Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Driver License Number"; "Driver License Number")
                {
                    ApplicationArea = Basic;
                }
                field("Licence Type"; "Licence Type")
                {
                    ApplicationArea = Basic;
                }
                field("Last License Renewal"; "Last License Renewal")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Interval"; "Renewal Interval")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Interval Value"; "Renewal Interval Value")
                {
                    ApplicationArea = Basic;
                }
                field("Next License Renewal"; "Next License Renewal")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Year Of Experience"; "Year Of Experience")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Grade Test"; Grade)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Active; Active)
                {
                    ApplicationArea = Basic;
                }
                field("Phone Number"; "Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; "Region Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control3; "Vehicle Accidents")
            {
                Editable = false;
                SubPageLink = Driver = field(Driver);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print Driver Report';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Drivers.Reset;
                    Drivers.SetRange(Drivers.Driver, Rec.Driver);
                    Report.Run(59016, true, true, Drivers);
                end;
            }
            action("Transport Requests Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Drivers.Reset;
                    Drivers.SetRange(Drivers.Driver, Rec.Driver);
                    Report.Run(59011, true, true, Drivers);
                end;
            }
        }
    }

    var
        Drivers: Record "Vehicle Drivers";
}

