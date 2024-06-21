#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70114 "Disposal Sub Page"
{
    PageType = ListPart;
    SourceTable = "Disposal Lines";

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
                field("Disposal Item No";"Disposal Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset/Item No.";"Fixed Asset/Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Issue";"Unit of Issue")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Estimated current value";"Estimated current value")
                {
                    ApplicationArea = Basic;
                }
                field("Description of Item";"Description of Item")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Type";"Disposal Type")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Methods";"Disposal Methods")
                {
                    ApplicationArea = Basic;
                }
                field("FA Name";"FA Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Location;Location)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
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

