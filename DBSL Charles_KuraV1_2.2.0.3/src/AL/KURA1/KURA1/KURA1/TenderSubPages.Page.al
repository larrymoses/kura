#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70092 "Tender Sub Pages"
{
    PageType = List;
    SourceTable = "Procurement Request Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No";"Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
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
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price";"Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan";"Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Item";"Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Line";"Budget Line")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Amount LCY";"Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field(Select;Select)
                {
                    ApplicationArea = Basic;
                }
                field("Request Generated";"Request Generated")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category";"Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(Ordered;Ordered)
                {
                    ApplicationArea = Basic;
                }
                field("Order Date";"Order Date")
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

