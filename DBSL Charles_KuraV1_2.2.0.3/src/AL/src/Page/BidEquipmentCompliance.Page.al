#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75149 "Bid Equipment Compliance"
{
    PageType = List;
    SourceTable = "Bid Equipment Compliance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Type Code";"Equipment Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Equipment";"Total No. of Equipment")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Required Quantity";"Minimum Required Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Owned Quantity";"Actual Owned Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Leased Equipment";"Actual Leased Equipment")
                {
                    ApplicationArea = Basic;
                }
                field("Total Owned/Leased Quantity";"Total Owned/Leased Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Check";"Compliance Check")
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

