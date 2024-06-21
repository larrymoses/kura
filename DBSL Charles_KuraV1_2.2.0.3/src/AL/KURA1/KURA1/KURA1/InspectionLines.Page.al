#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70057 "Inspection Lines"
{
    PageType = ListPart;
    SourceTable = "Inspection Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quantity Ordered";"Quantity Ordered")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quantity Received";"Quantity Received")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accepted Quantity';
                }
                field("Inspection Decision";"Inspection Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Rejected Quantity";"Rejected Quantity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Variance';
                    Editable = false;
                }
                field("Reasons for Rejection";"Reasons for Rejection")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reasons for Variance';
                }
                field("Received Qty";"Received Qty")
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

