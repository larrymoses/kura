#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72655 "Subcontracting Lines"
{
    PageType = List;
    SourceTable = "Subcontracting Line";

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
                field("Tax PIN No.";"Tax PIN No.")
                {
                    ApplicationArea = Basic;
                }
                field("Current Vendor Class";"Current Vendor Class")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Group";"Vendor Group")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Type";"Supplier Type")
                {
                    ApplicationArea = Basic;
                }
                field("Scope of Subcontracting";"Scope of Subcontracting")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
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

