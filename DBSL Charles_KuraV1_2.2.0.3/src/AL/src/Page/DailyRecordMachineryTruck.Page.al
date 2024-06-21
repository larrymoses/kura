#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72081 "Daily Record Machinery & Truck"
{
    PageType = ListPart;
    SourceTable = "Daily Record Machinery & Truck";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Plate No";"Plate No")
                {
                    ApplicationArea = Basic;
                }
                field("Photo No";"Photo No")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(Number;Number)
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

