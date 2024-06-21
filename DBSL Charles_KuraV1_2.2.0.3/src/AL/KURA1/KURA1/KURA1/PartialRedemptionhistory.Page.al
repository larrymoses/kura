#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54058 "Partial Redemption history"
{
    Editable = false;
    PageType = List;
    SourceTable = "Partial Redemption history";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("TBond No";"TBond No")
                {
                    ApplicationArea = Basic;
                }
                field("Redemption Date";"Redemption Date")
                {
                    ApplicationArea = Basic;
                }
                field("Old Face Value";"Old Face Value")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Redeemed";"Amount Redeemed")
                {
                    ApplicationArea = Basic;
                }
                field("New Face Value";"New Face Value")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

