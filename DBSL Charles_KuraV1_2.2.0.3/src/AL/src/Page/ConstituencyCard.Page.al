#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72150 "Constituency Card"
{
    PageType = Card;
    SourceTable = Constituency;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("County Code"; "County Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; "Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Cost (Maintainenace)"; "Actual Cost (Maintainenace)")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Road Statistics")
            {
                Editable = false;
                field("No. of Road Sections"; "No. of Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Network Length (Km)"; "Total Road Network Length (Km)")
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
                field("No. of Planned Road Projects"; "No. of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Ongoing Road Projects"; "No. of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Completed Road Projects"; "No. of Completed Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget (Construction)"; "Total Budget (Construction)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Cost (Construction)"; "Actual Cost (Construction)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget (Maintainenace)"; "Total Budget (Maintainenace)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
            }
            systempart(Control21; Notes)
            {
            }
            systempart(Control22; MyNotes)
            {
            }
            systempart(Control23; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup27)
            {
                action("Road Sections")
                {
                    ApplicationArea = Basic;
                    Image = ServiceItem;
                    Promoted = true;
                    // PromotedCategory = Category4;
                    // RunObject = Page "Road Sections";
                    // RunPageLink = "Primary Constituency ID"=field(Code);
                }
                action("Maintenance Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Maintenance Budget  Ceilings";
                    RunPageLink = "Constituency ID" = field(Code);
                }
                action("Construction Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = EntryStatistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Construction Budget  Ceilings";
                    RunPageLink = "Constituency ID" = field(Code);
                }
                action("Road Work Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = WIPLedger;
                    Promoted = true;
                    // PromotedCategory = Category4;
                    // RunObject = Page "Road WorkPlan Package Line";
                    // RunPageLink = "Constituency ID"=field(Code);
                }
                action("Construction Projects")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "Constituency ID" = field(Code),
                                  "Road Project Category" = const('2');
                }
                action("Maintainenace Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "Constituency ID" = field(Code),
                                  "Road Project Category" = const('3');
                }
                action("Studies & Surveys")
                {
                    ApplicationArea = Basic;
                    Image = JobTimeSheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "Constituency ID" = field(Code),
                                  "Road Project Category" = const('1');
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalcFields("Total Road Network Length (Km)", "Paved Road Length (Km)");


        if ("Total Road Network Length (Km)" > 0) and ("Paved Road Length (Km)" <= "Total Road Network Length (Km)") then
            "Paved Road Length %" := ("Paved Road Length (Km)" / "Total Road Network Length (Km)") * 100
        else
            "Paved Road Length %" := 0;
        if "Paved Road Length (Km)" > "Total Road Network Length (Km)" then
            "Paved Road Length %" := 100;

        "Unpaved Road Length %" := 100 - "Paved Road Length %";
    end;
}

