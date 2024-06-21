#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69405 "Evacuation Events"
{
    // CardPageID = "Emergency Evacuation Event";
    Editable = false;
    PageType = List;
    SourceTable = 69403;

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
                field("Hazard Type"; "Hazard Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Planned Emerge Drills"; "No. of Planned Emerge Drills")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Conducted Emerge Drills"; "No. of Conducted Emerge Drills")
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
