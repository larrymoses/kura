
Page 92000 "Towns"
{
    ApplicationArea = All;
    CardPageID = "Towns Card";
   // Editable = false;
    PageType = List;
    SourceTable = Towns;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Category;Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Network Length (Km)"; Rec."Total Road Network Length (Km)")
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
                field("Total Budget (Construction)"; Rec."Total Budget (Construction)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget (Maintainenace)"; Rec."Total Budget (Maintainenace)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Cost (Maintainenace)"; Rec."Actual Cost (Maintainenace)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

