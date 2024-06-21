#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80053 "Workplan Capability Matrixs"
{
    PageType = List;
    SourceTable = "PC Capability Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Capability Category";"Capability Category")
                {
                    ApplicationArea = Basic;
                }
                field("Capability Description";"Capability Description")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Summary";"Inventory Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
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

