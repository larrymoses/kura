#pragma implicitwith disable
page 99668 "Workplan Project Road Links"
{
    PageType = List;
    SourceTable = "Workplan Project Road Link";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Check Entire Inventory"; Rec."Check Entire Inventory")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No"; Rec."Road Section No")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                }
             
                field("Start Chainage(KM)"; Rec."Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)"; Rec."End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Workplanned Length(KM)"; Rec."Workplanned Length(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Current Pavement Surface Type"; Rec."Current Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Road Reserve Width"; Rec."Actual Road Reserve Width")
                {
                    ApplicationArea = Basic;
                }
                field("KeRRaBudget Code"; Rec."KeRRA Budget Code")
                {
                    Caption = 'KURA Budget Code';
                }
                field("New Pavement Surface Type"; Rec."New Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Road Auth Road Code"; Rec."KeRRA Road Code")
                {
                    Caption = 'KURA Road Code';
                }
                field("Planned Road Width"; Rec."Planned Road Width")
                {
                    ApplicationArea = Basic;
                }
                field("Road Reserve Status"; Rec."Road Reserve Status")
                {
                    ApplicationArea = Basic;
                }
                field("Authentic Road Reserve Width"; Rec."Authentic Road Reserve Width")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Road Reserve Width(M)"; Rec."Desired Road Reserve Width(M)")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Scope of pavement works")
            {
                Caption = 'Scope of pavement works';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page 72412;
                RunPageLink = "Road Code" = FIELD("Road Code");
            }
        }
    }
}

#pragma implicitwith restore

