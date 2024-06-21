#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75411 "External Supplier Voucher Line"
{
    PageType = ListPart;
    SourceTable = "External Supplier Voucher Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier No.";"Supplier No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name";"Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("KRA PIN";"KRA PIN")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Email";"Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No.";"Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category ID";"Procurement Category ID")
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

