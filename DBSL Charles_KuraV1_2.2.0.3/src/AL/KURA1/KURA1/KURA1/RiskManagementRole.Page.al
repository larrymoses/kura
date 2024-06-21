#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95024 "Risk Management Role"
{
    PageType = Card;
    SourceTable = "Risk Management Role";

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
                field("Executive Summary";"Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Directly Reports To";"Directly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirectly Reports To";"Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Def Responsibilities";"No. of Def Responsibilities")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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
            action("Risk Responsibilities")
            {
                ApplicationArea = Basic;
                Caption = 'Risk Responsibilities';
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt. Responsibilities";
                RunPageLink = "Role ID"=field(Code);
            }
        }
    }
}

