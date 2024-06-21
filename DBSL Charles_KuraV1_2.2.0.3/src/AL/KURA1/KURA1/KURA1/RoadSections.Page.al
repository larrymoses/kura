#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72037 "Road Sections"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Road Section";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Section No."; "Road Section No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paved Road Length (Km)"; "Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Section Name"; "Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)"; "End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Length (KMs)"; "Total Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class ID"; "Road Class ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Category"; "Road Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Carriageway Type"; "Carriageway Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Constituency ID"; "Primary Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary County ID"; "Primary County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region ID"; "Primary Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Start Chainage(KM)"; "Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

