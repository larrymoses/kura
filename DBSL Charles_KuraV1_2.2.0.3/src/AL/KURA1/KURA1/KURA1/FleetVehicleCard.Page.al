#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59001 "Fleet Vehicle Card"
{
    //  DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Vehicles.";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; "Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("FA Serial No"; "FA Serial No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fixed Asset List";
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Search Description"; "Search Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsible Employee"; "Responsible Employee")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Grounded; Blocked)
                {
                    ApplicationArea = Basic;
                    Caption = 'Grounded';
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; "Research Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Location';
                }
                field("Vehicle Status"; "Vehicle Status")
                {
                    ApplicationArea = Basic;
                }
                field("Odometer Reading"; "Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = "Daily Work Ticket Lines"."Closing Odometer Reading" where("Vehicle Allocated" = field("FA Serial No"));
                }
            }
            group(Posting)
            {
                field("FA Class Code"; "FA Class Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("FA Subclass Code"; "FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("FA Location Code"; "FA Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budgeted Asset"; "Budgeted Asset")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Maintenance)
            {
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Maintenance Vendor No."; "Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Next Service Milleage"; "Next Service Milleage")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next Service Mileage';
                }
                field("Next Service Date"; "Next Service Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Warranty Date"; "Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field(Insured; Insured)
                {
                    ApplicationArea = Basic;
                }
                field("Under Maintenance"; "Under Maintenance")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Vehicle Details")
            {
                field(Make; Make)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Vehicle Make List";
                }
                field(Model; Model)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vehicle Model List";
                    LookupPageID = "Vehicle Model List";
                }
                field("Year Of Manufacture"; "Year Of Manufacture")
                {
                    ApplicationArea = Basic;
                }
                field("Country Of Origin"; "Country Of Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Category";"Vehicle Category")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle CC"; "Vehicle CC")
                {
                    ApplicationArea = Basic;
                }
                field(Ownership; Ownership)
                {
                    ApplicationArea = Basic;
                }
                field("Body Color"; "Body Color")
                {
                    ApplicationArea = Basic;
                }
                field("Chassis Serial No."; "Chassis Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engine Serial No."; "Engine Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Ignition Key Code"; "Ignition Key Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tare Weight"; "Tare Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card No"; "Fuel Card No")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card Pin"; "Fuel Card Pin")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Tonnage(Kgs)"; "Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Tire Size Rear"; "Tire Size Rear")
                {
                    ApplicationArea = Basic;
                }
                field("Tire Size Front"; "Tire Size Front")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Type"; "Fuel Type")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Millage/Hrs Worked Details")
            {
                Caption = 'Mileage/Hrs Worked Details';
                group(Details)
                {
                    Caption = 'Details';
                    field("Readings Based On"; "Readings Based On")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Start Reading"; "Start Reading")
                    {
                        ApplicationArea = Basic;

                        trigger OnValidate()
                        begin
                            Validate("Total Trip Milleage");
                            "Current Reading" := "Start Reading" + "Total Trip Milleage";
                        end;
                    }
                    field("Current Reading"; "Current Reading")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Total Trip Milleage"; "Total Trip Milleage")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Total Trip Mileage';
                    }
                }
                part(Control11; "Fuel Milleage")
                {
                    Caption = 'Fuel Mileage';
                    SubPageLink = No = field("No.");
                }
            }
            part(Control14; "Vehicle Insurance Lines")
            {
                Caption = 'Vehicle Insurance Details';
                Editable = false;
                SubPageLink = "Registration No." = field("FA Serial No");
            }
            part(Control1000000069; "Vehicle Accidents")
            {
                Caption = 'Vehicle Incidents/Occurrences';
                SubPageLink = RegNo = field("FA Serial No");
            }
            part(Control5; "Closed Fleet Requests List")
            {
                Caption = 'Approved Transport Requests';
                SubPageLink = "Vehicle Allocated" = field("FA Serial No");
            }
            part(Control1000000050; "Fuel and Maintenance List")
            {
                Caption = 'Maintenance Requests List';
                SubPageLink = "Vehicle Reg No" = field("FA Serial No"),
                              Type = const(Maintenance);
            }
            part(Control10; "Fuel and Maintenance List")
            {
                Caption = 'Fuel Requisitions List';
                SubPageLink = "Vehicle Reg No" = field("FA Serial No"),
                              Type = const(Fuel);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Maintenance Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;

                trigger OnAction()
                begin
                    FleetVehicles.Reset;
                    FleetVehicles.SetRange(FleetVehicles."FA No.", "No.");
                    Page.Run(5641, FleetVehicles);
                end;
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                Promoted = true;
                RunObject = Page "Comment Sheet";
            }
            action(Picture)
            {
                ApplicationArea = Basic;
                Image = Picture;
                Promoted = true;
            }
            action("Maintenance Registration")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                RunObject = Page "Maintenance Registration";
            }
            action(Statistics)
            {
                ApplicationArea = Basic;
                Image = Statistics;
                Promoted = true;
            }
            action("Main Asset Components")
            {
                ApplicationArea = Basic;
                Image = Components;
                Promoted = true;
            }
            action("Total Value Insured")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                Promoted = true;
                RunObject = Page "Total Value Insured";
            }
            action("Allocate to Departments")
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                //  RunObject = Page UnknownPage52018565;
            }
            action("Create Plan")
            {
                ApplicationArea = Basic;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Vehicles.SetRange("No.", "No.");
                    Report.Run(59017, true, true, Vehicles);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Validate("Start Reading");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Validate("Start Reading");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Validate("Start Reading");
    end;

    trigger OnOpenPage()
    begin
        Validate("Start Reading");
    end;

    var
        MaintenanceLedgerEntries: Page "Maintenance Ledger Entries";
        FleetVehicles: Record "Maintenance Ledger Entry";
        Vehicles: Record "Fleet Vehicles.";
}

