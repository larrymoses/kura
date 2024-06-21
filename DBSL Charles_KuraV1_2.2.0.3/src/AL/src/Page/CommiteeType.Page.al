#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69664 "Commitee Type"
{
    PageType = Card;
    SourceTable = "Committee Type";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Title of Appointing Officer";"Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Staff Allowed";"Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                }
                field("Minimim No. of Members";"Minimim No. of Members")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Appointments Made";"No. of Appointments Made")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20;"Commitee Composition")
            {
                SubPageLink = "Committee Type ID"=field(Code);
            }
        }
        area(factboxes)
        {
            systempart(Control12;Outlook)
            {
            }
            systempart(Control13;Notes)
            {
            }
            systempart(Control14;MyNotes)
            {
            }
            systempart(Control15;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Commitee Function")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Commitee Function";
                RunPageLink = "Committee Type ID"=field(Code);
            }
            action("Commitee Guidelines")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Commitee Guidelines";
                RunPageLink = "Committee Type ID"=field(Code);
            }
            action("Commitee Composition")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Commitee Composition";
                RunPageLink = "Committee Type ID"=field(Code);
                Visible = false;
            }
        }
    }
}

