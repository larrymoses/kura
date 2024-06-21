
Page 72148 "Global Road Inventory"
{
    ApplicationArea = Basic;
    CardPageID = "Global Road Inventory C";
    Editable = true;
    PageType = List;
    SourceTable = "Road Inventory";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'KURA Road Reference Code';
                }
                field("KeRRA Road Reference Code"; Rec."KeRRA Road Reference Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Road Code';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Known Name";Rec."Known Name")
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
                field("Primary County ID"; Rec."Primary County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region ID"; Rec."Primary Region ID")
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
                field("Gazetted Road Length (KMs)"; Rec."Gazetted Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Total Section Length (KMs)"; Rec."Total Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("General Road Surface Condition"; Rec."General Road Surface Condition")
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
                field("Unpaved Road Length %"; Rec."Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("Original Road Agency"; Rec."Original Road Agency")
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
                    Caption = 'No. of Pending Roadside Development Applications';
                }
                field("No. of App Roadside Devpt Apps"; Rec."No. of App Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Approved Roadside Development Applications';
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
        area(Processing)
        {
            action(RICS)
            {
                
            }
        }
    }
}



