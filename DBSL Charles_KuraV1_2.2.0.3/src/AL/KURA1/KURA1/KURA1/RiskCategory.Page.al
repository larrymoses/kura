#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95018 "Risk Category"
{
    PageType = Card;
    SourceTable = "Risk Category";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Addditiona Comments"; Rec."Addditiona Comments")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Triggers"; Rec."No. of Risk Triggers")
                {
                    ApplicationArea = Basic;
                }
                field("No of Strategic Risks"; Rec."No of Strategic Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Operational Risks"; Rec."No of Operational Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Project Risks"; Rec."No of Project Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Incidents"; Rec."No. of Incidents")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
            action("Risk Triggers")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Category Triggers";
                RunPageLink = "Risk Category ID" = field(Code);
            }
        }
    }
}

#pragma implicitwith restore

