#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69752 "Background Checks Documents"
{
    PageType = ListPart;
    SourceTable = "Background Checks Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Clearance Document Type";"Clearance Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Clearing Agency";"Clearing Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Clearing Status";"Clearing Status")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
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

