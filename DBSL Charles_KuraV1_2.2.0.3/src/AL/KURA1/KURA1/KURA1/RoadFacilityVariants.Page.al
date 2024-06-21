#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72144 "Road Facility Variants"
{
    PageType = List;
    SourceTable = "Road Facility Variant";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Type Code";"Sub Type Code")
                {
                    ApplicationArea = Basic;
                }
                field("Facility Type";"Facility Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Notes";"Additional Notes")
                {
                    ApplicationArea = Basic;
                }
                field(Inventory;Inventory)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

