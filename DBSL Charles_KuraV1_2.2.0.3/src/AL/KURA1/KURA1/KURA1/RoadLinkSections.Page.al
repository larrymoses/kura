#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72170 "Road Link Sections"
{
    PageType = List;
    SourceTable = "Road Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class ID"; Rec."Road Class ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Category"; Rec."Road Category")
                {
                    ApplicationArea = Basic;
                }
                field("Carriageway Type"; Rec."Carriageway Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Constituency ID"; Rec."Primary Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary County ID"; Rec."Primary County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region ID"; Rec."Primary Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(KM)"; Rec."Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)"; Rec."End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Length (KMs)"; Rec."Total Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Latitude"; Rec."Start Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Longitude"; Rec."End Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Latitude"; Rec."End Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length (Km)"; Rec."Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length %"; Rec."Paved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("UnPaved Road Length (Km)"; Rec."UnPaved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaved Road Length %"; Rec."Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("Section Surface Type"; Rec."Section Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Condition Survey ID"; Rec."Last Road Condition Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Cond. Survey Date"; Rec."Last Road Cond. Survey Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Awarded Contracts"; Rec."No. of Awarded Contracts")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Planned Road Projects"; Rec."No. of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Ongoing Road Projects"; Rec."No. of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Completed Road Projects"; Rec."No. of Completed Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (Total Cost)"; Rec."Budget (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual (Total Cost)"; Rec."Actual (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Res. Land Acq. W_orders"; Rec."No. of Res. Land Acq. W_orders")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Roadside Devpt Apps"; Rec."No. of Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Enchmt Stop W_orders"; Rec."No. of Enchmt Stop W_orders")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Axle Load Inspections"; Rec."No. of Axle Load Inspections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Axle Load Exempt Prmts"; Rec."No. of Axle Load Exempt Prmts")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Road Misuse Inc."; Rec."No. of Filed Road Misuse Inc.")
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Fatalities"; Rec."Total No. of Fatalities")
                {
                    ApplicationArea = Basic;
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
                group("&Functions")
                {
                    Caption = '&Functions';
                    action("Major Structures")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Segment;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Road Facility Type";
                        RunPageLink = "Facility Type" = filter(Structure);
                    }
                    action("Road Furniture")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Components;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Road Facility Type";
                        RunPageLink = "Facility Type" = filter(Furniture);
                    }
                    action("Road Environs")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = SelectItemSubstitution;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Road Environ Entries";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageMode = View;
                    }
                    action("Road Condition Data")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = ChangeTo;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Pavement Surface Entries";
                        RunPageLink = "Road Code" = field("Road Code");
                    }
                    action("Road Inventory & Condition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'RRoad Inventory & Condition Surveys';
                        Ellipsis = true;
                        Image = InventorySetup;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        // //RunObject = Page "Road Condition Surveys(Existing)";
                        //RunPageLink = "Road Code" = field("Road Code");
                    }
                    action("Tender Invitations")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Interaction;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Standard Purchase Codes";
                        RunPageLink = "Road Code" = field("Road Code");
                    }
                    action("Purchase Contracts")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = ContractPayment;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Purchase Order";
                        RunPageView = where("Document Type" = filter("Blanket Order"));
                    }
                    action(Workplans)
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = WorkCenterAbsence;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        begin
                            Message('Coming up soon!!');
                        end;
                    }
                    action("Development/Construction Works")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = AssemblyBOM;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter(Construction));
                    }
                    action("Maintenance Works")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = MaintenanceRegistrations;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter("Asset Management"));
                    }
                    action("Studies & Surveys")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Statistics;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter("Studies & Surveys"));
                    }
                    action("Design Works")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Design;
                        Promoted = true;
                        PromotedIsBig = true;

                        PromotedOnly = true;
                        RunObject = Page "Job List";
                        RunPageLink = "Road Code" = field("Road Code");
                        RunPageView = where("Road Project Catergory" = filter("Design Works"));
                    }
                }
            }
        }
    }
}

#pragma implicitwith restore

