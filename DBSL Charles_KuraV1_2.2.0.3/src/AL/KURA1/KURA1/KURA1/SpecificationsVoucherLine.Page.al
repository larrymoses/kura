#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75082 "Specifications Voucher Line"
{
    PageType = List;
    SourceTable = Item;
    SourceTableView = where("Bill Item Group Code"=filter(<>''),
                            Description=filter(<>''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Group Code";"Bill Item Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Excl. VAT";"Amount Excl. VAT")
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

