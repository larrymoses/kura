#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75040 "Vendor Staff Employment"
{
    PageType = List;
    SourceTable = "Vendor Staff Employment";

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
                field("Staff ID";"Staff ID")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Employer";"Previous Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Title Held";"Title Held")
                {
                    ApplicationArea = Basic;
                }
                field("Start Year";"Start Year")
                {
                    ApplicationArea = Basic;
                }
                field("End Year";"End Year")
                {
                    ApplicationArea = Basic;
                }
                field(Country;Country)
                {
                    ApplicationArea = Basic;
                }
                field(Location;Location)
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

