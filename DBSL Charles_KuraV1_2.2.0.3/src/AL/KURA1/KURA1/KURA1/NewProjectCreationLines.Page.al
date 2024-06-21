#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72513 "New Project Creation Lines"
{
    PageType = ListPart;
    SourceTable = "Road WorkPlan Package";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; "Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Voucher No';
                }
                field("Budget Entry No"; "Budget Entry No")
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
                }
                field("Road Section No."; "Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; "Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category"; "Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Works Category"; "Road Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Surface Type"; "Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; "Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Category"; "Procurement Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Works Type';
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
                field("Funding Agency ID"; "Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("BoQ Template Code"; "BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; "Directorate ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department ID"; "Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; "Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; "Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID"; "County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Section Length"; "Total Road Section Length")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum"; "Contract Sum")
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
                action("Bill Categories")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = TaskList;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "New Project Creation Tasks";
                    // RunPageLink = "Road Work Program ID" = field("Road Work Program ID"), "Package No." = field("Budget Entry No");
                }
                action("Bill Items")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Planning;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Creation Plan Lines";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Budget Entry No" = field("Budget Entry No");
                }
            }
        }
    }
}

