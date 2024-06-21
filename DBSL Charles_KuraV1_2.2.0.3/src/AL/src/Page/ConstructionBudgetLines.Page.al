#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72334 "Construction  Budget Lines"
{
    Caption = 'Budget  Ceilings (Maintenance Works)';
    PageType = ListPart;
    SourceTable = "New Road Work Program Package";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("KeRRA Budget Code"; "KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                }
                field("Package No."; "Package No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Entry No';
                }
                field("Package Name"; "Package Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                }
                field("Road Works Category"; "Road Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category"; "Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1"; "Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                }
                field("Workplanned Length (Km)"; "Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Total Budget Cost"; "Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Year Budget';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Project Details")
            {
                Caption = 'Project Details';
                action("Project Roads")
                {
                    ApplicationArea = Basic;
                    Image = ExportToBank;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                }
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
                    Visible = false;
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
                    Visible = false;
                }
                action("Funding Sources")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Sources';
                    Ellipsis = true;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Funding Sources";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                }
                action("Project Road Facilities")
                {
                    ApplicationArea = Basic;
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Road Facility Items";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                }
            }
        }
    }
}

