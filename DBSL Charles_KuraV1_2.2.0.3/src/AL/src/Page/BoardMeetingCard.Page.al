#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 55003 "Board Meeting Card"
{
    PageType = Card;
    SourceTable = "Board Meetings";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field("Start date";"Start date")
                {
                    ApplicationArea = Basic;
                }
                field("Start time";"Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("End time";"End time")
                {
                    ApplicationArea = Basic;
                }
                field("Venue/Location";"Venue/Location")
                {
                    ApplicationArea = Basic;
                }
                field("Convened by";"Convened by")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Tel. No";"Contact Tel. No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Email";"Contact Email")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Published;Published)
                {
                    ApplicationArea = Basic;
                }
                field("Meeting group Code";"Meeting group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting group";"Meeting group")
                {
                    ApplicationArea = Basic;
                }
                field("Conference Venue";"Conference Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Parking Arrangement";"Parking Arrangement")
                {
                    ApplicationArea = Basic;
                }
                field("Access requirement";"Access requirement")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22;Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup24)
            {
                action("Board Meeting Attendance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Attendance';
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Attendance";
                    RunPageLink = "Meeting Code"=field(No);
                }
                action("Meeting Agenda")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Agenda';
                    Image = Agreement;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Meeting Agenda";
                    RunPageLink = "Meeting Code"=field(No);
                }
            }
        }
    }
}

