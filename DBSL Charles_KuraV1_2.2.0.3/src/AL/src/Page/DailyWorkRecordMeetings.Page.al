#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72450 "Daily Work Record Meetings"
{
    CardPageID = "Daily Work Record Meeting";
    PageType = List;
    SourceTable = "Daily Work Record Meeting";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Meeting Type";"Meeting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Organizer ID";"Meeting Organizer ID")
                {
                    ApplicationArea = Basic;
                }
                field("All Day Event";"All Day Event")
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
                field("Duration(Days)";"Duration(Days)")
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
                field("Meeting Status";"Meeting Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("DWR Meeting Attendances")
            {
                ApplicationArea = Basic;
                Caption = 'Attendance Register';
                Image = ActivateDiscounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "DWR Meeting Attendances";
                RunPageLink = "Document No."=field("Document No."),
                              "Line No."=field("Line No.");
            }
            action("DWR Meeting Agenda")
            {
                ApplicationArea = Basic;
                Caption = 'Meeting Agenda';
                Image = Addresses;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "DWR Meeting Agenda";
                RunPageLink = "Document No."=field("Document No."),
                              "Line No."=field("Line No.");
            }
            action("DWR Meeting Summaries")
            {
                ApplicationArea = Basic;
                Caption = 'Meeting Summary';
                Image = AmountByPeriod;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "DWR Meeting Summaries";
                RunPageLink = "Document No."=field("Document No."),
                              "Line No."=field("Line No.");
                Visible = false;
            }
        }
    }
}

