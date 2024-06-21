#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72240 "PCO Planned Meeting"
{
    PageType = List;
    SourceTable = "PCO Planned Meeting";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Notice No.";"Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Type";"Meeting Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time";"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Time";"End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Venue/Location";"Venue/Location")
                {
                    ApplicationArea = Basic;
                }
                field("Project Stage";"Project Stage")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project Meeting ID";"Project Meeting ID")
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

