#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 55009 "Board Meeting Attendance"
{
    PageType = List;
    SourceTable = "Board Meeting Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting Code";"Meeting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Name";"Meeting Name")
                {
                    ApplicationArea = Basic;
                }
                field("Commitee No";"Commitee No")
                {
                    ApplicationArea = Basic;
                }
                field("Member No";"Member No")
                {
                    ApplicationArea = Basic;
                }
                field("Member Name";"Member Name")
                {
                    ApplicationArea = Basic;
                }
                field("Committee  Name";"Committee  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Date";"Meeting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
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

