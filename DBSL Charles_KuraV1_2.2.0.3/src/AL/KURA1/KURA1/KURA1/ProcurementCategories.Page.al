#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75028 "Procurement Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Category";
    SourceTableView = where(Blocked = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; "Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Preferred Vendor Cluster"; "Preferred Vendor Cluster")
                {
                    ApplicationArea = Basic;
                }
                field("Applicable Location"; "Applicable Location")
                {
                    ApplicationArea = Basic;
                }
                field("Specific Responsibility Center"; "Specific Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Type"; "Responsibility Center Type")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Code"; "Responsibility Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Category Type"; "Category Type")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Passmark";"Appraisal Passmark")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }
            chartpart("Q5402-01"; "Q5402-01")
            {
            }
            chartpart("Q9150-01"; "Q9150-01")
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Products)
            {
                ApplicationArea = Basic;
                Image = Item;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Procurement Category Product";
                RunPageLink = "Category ID" = field(Code);
            }
            action("Registered Vendors")
            {
                ApplicationArea = Basic;
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor List";
            }
            action("Specific Category Requirement")
            {
                ApplicationArea = Basic;
                Image = ServiceAccessories;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "RFI Category Requirement";
                RunPageLink = "Category ID" = field(Code);
            }
            action("Procurement Planning")
            {
                ApplicationArea = Basic;
                Image = AbsenceCategory;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Procurement Plan Lines";
                RunPageLink = "Planning Category" = field(Code);
            }
            action("Invitation For Prequalification")
            {
                ApplicationArea = Basic;
                Image = Info;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Request For Information";
            }
            action("Invitation For Supply")
            {
                ApplicationArea = Basic;
                Image = InwardEntry;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Draft Invitation For Supply";
            }
            action(print)
            {
                ApplicationArea = Basic;
                //Image = print;
                Promoted = true;
                PromotedCategory = Category4;
                // RunObject = Report "Procurement categories";
            }
        }
    }
}

