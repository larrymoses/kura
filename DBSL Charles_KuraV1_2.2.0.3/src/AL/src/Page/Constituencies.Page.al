#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72009 "Constituencies"
{
    ApplicationArea = Basic;
    CardPageID = "Constituency Card";
    Editable = false;
    PageType = List;
    SourceTable = Constituency;
    UsageCategory = Administration;

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
                field("County Code"; "County Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; "Region Code")
                {
                    ApplicationArea = Basic;
                }
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
                field("Total Budget (Maintainenace)"; "Total Budget (Maintainenace)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Cost (Maintainenace)"; "Actual Cost (Maintainenace)")
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

