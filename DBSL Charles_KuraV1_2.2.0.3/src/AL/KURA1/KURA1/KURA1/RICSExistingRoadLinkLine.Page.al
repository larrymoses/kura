#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72171 "RICS Existing Road Link Line"
{
    PageType = ListPart;
    SourceTable = "RICS Existing Road Link Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RICS No."; "RICS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name"; "Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class ID"; "Road Class ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Road Class ID"; "New Road Class ID")
                {
                    ApplicationArea = Basic;
                }
                field("General Road Surface Condition"; "General Road Surface Condition")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Gen. Road Surf. Condition"; "New Gen. Road Surf. Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Primary County ID"; "Primary County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region ID"; "Primary Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(KM)"; "Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("End  Chainage(KM)"; "End  Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Length (KMs)"; "Total Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Sections"; "No. of Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length (Km)"; "Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length %"; "Paved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaved Road Length %"; "Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; "Entry No")
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
                group(Funtions)
                {
                    Caption = 'Funtions';
                    action("Major Structures")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Segment;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "RICS Existing Road Facility";
                        RunPageLink = "Road Facility Type" = filter('STRUCTURE'),
                                      "RICS No." = field("RICS No."),
                                      "Road Code" = field("Road Code");
                    }
                    action("Road Furniture")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Components;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "RICS Existing Road Facility";
                        RunPageLink = "Road Facility Type" = filter('FURNITURE'),
                                      "Road Code" = field("Road Code");
                    }
                    action("Road Environs")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = SelectItemSubstitution;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "RICS Existing Road Environ";
                        RunPageLink = "RICS No." = field("RICS No."),
                                      "Road Code" = field("Road Code");
                        RunPageMode = View;
                    }
                    action("Pavement Conditions")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = ChangeTo;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        RunObject = Page "RICS Existing Road Pavement";
                        RunPageLink = "Road Code" = field("Road Code"),
                                      "RICS No." = field("RICS No.");
                    }
                    action("Road Inventory & Condition")
                    {
                        ApplicationArea = Basic;
                        Caption = ' Road Inventory & Condition Surveys';
                        Ellipsis = true;
                        Image = InventorySetup;
                        Promoted = true;
                        PromotedIsBig = true;
                        PromotedOnly = true;
                        // RunObject = Page "Road Condition Surveys(Existin";
                        //   RunPageLink = "Road Code"=field("Road Code");
                    }
                    action(Sections)
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "RICS Existing Road Section";
                        RunPageLink = "RICS No." = field("RICS No."),
                                      "Road Code" = field("Road Code");
                    }
                }
            }
        }
    }
}

