#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72229 "Inspection & Payment Line"
{
    PageType = ListPart;
    SourceTable = "Inspection & Payment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bill No";"Bill No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Item Code";"Item Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit Of Measure";"Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("BoQ Quantity";"BoQ Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bid Rate(LCY)";"Bid Rate(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bill Item Amount";"Bill Item Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Previous Qty";"Previous Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Previous %";"Previous %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("This Qty";"This Qty")
                {
                    ApplicationArea = Basic;
                }
                field("This Qty %";"This Qty %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Done ToDate Qty";"Done ToDate Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Done ToDate %";"Done ToDate %")
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

