#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72003 "Road Classes"
{
    ApplicationArea = Basic;
    Editable = TRUE;
    PageType = List;
    SourceTable = "Road Class";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Class ID"; "Road Class ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Purpose)
                {
                    ApplicationArea = Basic;
                }
                field("Road Category"; "Road Category")
                {
                    ApplicationArea = Basic;
                }
                field("Classification Type"; "Classification Type")
                {
                    ApplicationArea = Basic;
                }
                field("Special Purpose Road (SPR)"; "Special Purpose Road (SPR)")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Road Reserve Width (M)"; "Desired Road Reserve Width (M)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Links"; "No. of Road Links")
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
                field(Blocked; Blocked)
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

