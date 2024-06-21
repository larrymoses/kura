#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72070 "Road Asset Survey Line"
{
    PageType = ListPart;
    SourceTable = "Road Asset Survey Sheet Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Item;Item)
                {
                    ApplicationArea = Basic;
                }
                field(Unit;Unit)
                {
                    ApplicationArea = Basic;
                }
                field("Simple Quantity";"Simple Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Quantity";"Actual Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension & Condition";"Dimension & Condition")
                {
                    ApplicationArea = Basic;
                }
                field(Remark;Remark)
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

