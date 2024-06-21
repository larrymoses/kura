#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72299 "Advance Payment Cert Line"
{
    PageType = ListPart;
    SourceTable = "Payment Certificate Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Qunatity;Qunatity)
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity';
                }
                field("Direct Unit Cost Excl. VAT";"Direct Unit Cost Excl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Line Discount %";"Line Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount Excl. VAT";"Line Amount Excl. VAT")
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

