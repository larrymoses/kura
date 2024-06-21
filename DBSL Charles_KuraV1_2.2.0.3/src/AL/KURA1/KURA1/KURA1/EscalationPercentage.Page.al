#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70127 "Escalation Percentage"
{
    PageType = List;
    SourceTable = "Escalation Percentage";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item Catecory";"Item Catecory")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Category';
                }
                field("Item Category Description";"Item Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Escalation Percentage";"Escalation Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Escalation Amount";"Escalation Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Calculate)
            {
                ApplicationArea = Basic;
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
            }
        }
    }

    var
        ItemCategory: Record "Item Category";
        PurchaseLine: Record "Purchase Line";
        BidRegister: Record "Bid Evaluation Register";
        EPercentage: Record "Escalation Percentage";
}

