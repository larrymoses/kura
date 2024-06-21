#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69227 "Training Cost"
{
    PageType = List;
    SourceTable = "Training Cost";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cost Category";"Cost Category")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Item";"Cost Item")
                {
                    ApplicationArea = Basic;
                }
                field("Item Category";"Item Category")
                {
                    ApplicationArea = Basic;
                }
                field("Service/Item Code";"Service/Item Code")
                {
                    ApplicationArea = Basic;
                }
                field("Item Description";"Item Description")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount";"Line Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

