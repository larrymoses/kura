#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72430 "Material Test Template"
{
    PageType = Card;
    SourceTable = "Material Test Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Material ID";"Material ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control8;"Material Test Template Lines")
            {
                SubPageLink = "Template ID"=field("Template ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Materials Deivered To Site")
            {
                ApplicationArea = Basic;
            }
            action("Materials Removed From Site")
            {
                ApplicationArea = Basic;
            }
            action("Plant & Equipment")
            {
                ApplicationArea = Basic;
            }
            action("Key Contractor Staff")
            {
                ApplicationArea = Basic;
            }
            action("Visitors Register")
            {
                ApplicationArea = Basic;
            }
            action("Risk Incidents")
            {
                ApplicationArea = Basic;
            }
            action("Site Meetings")
            {
                ApplicationArea = Basic;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
            }
            action(Release)
            {
                ApplicationArea = Basic;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
            }
            action(Print)
            {
                ApplicationArea = Basic;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
            }
            action(Post)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

