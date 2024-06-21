#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69470 "Safety Equipment Registers"
{
    CardPageID = "Safety Equipment Register";
    PageType = List;
    SourceTable = 69435;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment ID";"Equipment ID")
                {
                    ApplicationArea = Basic;
                }
                field(SubType;SubType)
                {
                    ApplicationArea = Basic;
                }
                field("SubType No.";"SubType No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Safety Equipment Category";"Safety Equipment Category")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Notes/Comments";"Safety Notes/Comments")
                {
                    ApplicationArea = Basic;
                }
                field("FA Location Code";"FA Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No.";"Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Quantity";"Inventory Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset/Resource Quantity";"Fixed Asset/Resource Quantity")
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
