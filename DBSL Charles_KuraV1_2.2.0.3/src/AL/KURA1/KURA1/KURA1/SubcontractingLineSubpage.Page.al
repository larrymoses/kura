#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72656 "Subcontracting Line Subpage"
{
    PageType = ListPart;
    SourceTable = "Subcontracting Line";

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
                field("Subcontractor Name";"Subcontractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Tax PIN No.";"Tax PIN No.")
                {
                    ApplicationArea = Basic;
                }
                field("Description Of Works";"Description Of Works")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Scope of Subcontracting";"Scope of Subcontracting")
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
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
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

