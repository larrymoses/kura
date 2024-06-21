#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75233 "Procurement Comm Types Card"
{
    PageType = Card;
    SourceTable = "Procurement Committee Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Committee Type";"Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Mandate Type";"Mandate Type")
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
                field("Min. No. of Members";"Min. No. of Members")
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
            part(Control16;"Procurement Comm Composition")
            {
                SubPageLink = "Committee Type"=field("Committee Type");
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
        area(navigation)
        {
            group(ActionGroup18)
            {
                action("Committee Mandate/Functions")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Committee Function";
                    RunPageLink = "Committee Type"=field("Committee Type");
                }
                action("Committee Appointments")
                {
                    ApplicationArea = Basic;
                    Image = ConfidentialOverview;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Tender Committee";
                    RunPageLink = "Committee Type"=field("Committee Type");
                }
                action(Members)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Tender Committee Member";
                    RunPageLink = "Committee Type"=field("Committee Type");
                }
            }
        }
    }
}

