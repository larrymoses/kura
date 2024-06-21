#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70115 "Disposal Quotes per bidder"
{
    PageType = List;
    SourceTable = "Disposal Bids Per Line 1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disposal No";"Disposal No")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Award;Award)
                {
                    ApplicationArea = Basic;
                }
                field(Customer;Customer)
                {
                    ApplicationArea = Basic;
                }
                field("Quoted Amount";"Quoted Amount")
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

