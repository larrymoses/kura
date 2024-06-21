#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72210 "Staff Role Code"
{
    PageType = List;
    SourceTable = "Project Staff Role Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; "Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Team Type"; "Team Type")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; "Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Multiple Projects"; "Multiple Projects")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer"; "Resident Engineer")
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
            action("Staff Role Supervisors")
            {
                ApplicationArea = Basic;
                Image = ServiceMan;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Staff Role Supervisors";
                RunPageLink = "Staff Role Code" = field("Staff Role Code");
            }
            action("Staff Functions")
            {
                ApplicationArea = Basic;
                Image = ServiceMan;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Staff Appointment Function";
                RunPageLink = "Staff Role Code" = field("Staff Role Code");
            }
        }
    }
}

