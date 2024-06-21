#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75081 "Bill items"
{
    PageType = List;
    SourceTable = Item;

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
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Sales Unit of Measure";"Sales Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Purch. Unit of Measure";"Purch. Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Posting Group";"Inventory Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Costing Method";"Costing Method")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Item Category Code";"Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Product Group";"Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Works Technology";"Works Technology")
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

