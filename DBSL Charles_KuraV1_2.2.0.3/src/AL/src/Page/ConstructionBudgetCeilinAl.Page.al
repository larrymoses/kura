#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72381 "Construction Budget  Ceilin Al"
{
    Caption = 'Global Budget Ceilings';
    PageType = ListPart;
    SourceTable = "New Road Work Program Package";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Package No."; "Package No.")
                {
                    ApplicationArea = Basic;
                }
                field("Package Name"; "Package Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Road Section No."; "Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Works Category"; "Road Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; "Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; "Constituency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("County ID"; "County ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("BoQ Template Code"; "BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category"; "Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Surface Type"; "Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage"; "Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage"; "End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Workplanned Length (Km)"; "Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (Cost) Excl. VAT"; "Budget (Cost) Excl. VAT")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget (VAT Amount)"; "Budget (VAT Amount)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget (Cost) Incl. VAT"; "Budget (Cost) Incl. VAT")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Budget Cost"; "Total Budget Cost")
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
            group("&Line Function")
            {
                Caption = '&Line Function';
                Visible = false;
                action(Tasks)
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = TaskList;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Work Plan Tasks";
                    // RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
                    //               "Package No."=field("Package No.");
                }
                action("Planning Lines")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Planning;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "WP Plan Lines";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Budget Entry No" = field("Package No.");
                }
            }
        }
    }
}

