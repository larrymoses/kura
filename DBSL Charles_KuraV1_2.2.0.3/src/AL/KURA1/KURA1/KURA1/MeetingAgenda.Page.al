#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 55005 "Meeting Agenda"
{
    PageType = List;
    SourceTable = "Meeting Agenda";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agenda code";"Agenda code")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Code";"Meeting Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Person responsiblee";"Person responsiblee")
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled time";"Scheduled time")
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

