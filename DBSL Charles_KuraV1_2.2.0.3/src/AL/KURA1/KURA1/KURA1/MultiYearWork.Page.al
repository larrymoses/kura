#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72376 "Multi_Year Work"
{
    PageType = ListPart;
    SourceTable = "Multi_Year Work";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("KeRRA Budget Code"; "KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'KURA Budget Code';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension Code 2"; "Global Dimension Code 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source';
                    Visible = false;
                }
                field("Road Project Category"; "Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Works Category"; "Road Works Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Workplanned Length"; "Total Workplanned Length")
                {
                    ApplicationArea = Basic;
                }
                field("Total Project Cost"; "Total Project Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Estimated Project Cost';
                }
                field("Total Budget Cost"; "Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Allocation';
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
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
            group("Project Details")
            {
                Caption = 'Project Details';
                action("Multi Works Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Multi Year Financing';
                    Image = JobLines;
                    Promoted = true;
                    RunObject = Page "Multi Works Line";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                }
                action("Project Road Links")
                {
                    ApplicationArea = Basic;
                    Image = Price;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                }
                action("Project Road Facility Items")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Project Road Facility Items";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
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
            }
        }
    }
}

