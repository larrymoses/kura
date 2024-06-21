#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69566 "HSE Training Register"
{
    CardPageID = "HSE Plan Calendar";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = 69429;
    SourceTableView = where("OSH Activity Type" = const("OSH Training"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; "Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Activity Type"; "OSH Activity Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Mission"; "Primary Mission")
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility; Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field("Overall Owner ID"; "Overall Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Due Date"; "Planned Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Action Status"; "Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("% Complete"; "% Complete")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Priority"; "Activity Priority")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date Done"; "Actual Date Done")
                {
                    ApplicationArea = Basic;
                }
                field("Venue/Location"; "Venue/Location")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Medium"; "Meeting Medium")
                {
                    ApplicationArea = Basic;
                }
                field("Evacuation Event ID"; "Evacuation Event ID")
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
