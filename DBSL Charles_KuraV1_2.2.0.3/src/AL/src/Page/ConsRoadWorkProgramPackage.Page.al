#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72236 "Cons Road Work Program Package"
{
    PageType = ListPart;
    SourceTable = "Cons Road Work Program Package";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID";"Road Work Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Package No.";"Package No.")
                {
                    ApplicationArea = Basic;
                }
                field("Package Name";"Package Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Works Category";"Road Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Surface Type";"Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID";"Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Workplanned Length (Km)";"Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (Cost) Excl. VAT";"Budget (Cost) Excl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (VAT Amount)";"Budget (VAT Amount)")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (Cost) Incl. VAT";"Budget (Cost) Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID";"Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Template Code";"BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category";"Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class";"Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID";"County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Section Length";"Total Road Section Length")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1";"Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2";"Global Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted Job No.";"Posted Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Type";"Planning Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category";"Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
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
                action(Tasks)
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = TaskList;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Cons Road Work Program Task";
                    RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
                                  "Package No."=field("Package No.");
                }
                action("Planning Lines")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Planning;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Con Road Work Program Activity";
                    RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
                                  "Package No."=field("Package No.");
                }
            }
        }
    }
}

