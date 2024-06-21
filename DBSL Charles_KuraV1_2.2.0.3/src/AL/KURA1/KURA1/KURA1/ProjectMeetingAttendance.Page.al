#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72256 "Project Meeting Attendance"
{
    PageType = ListPart;
    SourceTable = "Project Meeting Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting ID"; Rec."Meeting ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Attendee Type"; Rec."Attendee Type")
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field(Organization; Rec.Organization)
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Representative Email"; Rec."Representative Email")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Tel No"; Rec."Representative Tel No")
                {
                    ApplicationArea = Basic;
                }
                field("Notified on Email"; Rec."Notified on Email")
                {
                    ApplicationArea = Basic;
                }
                field("DateTime Notified"; Rec."DateTime Notified")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

