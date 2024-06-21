#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75256 "Bid Personnel Compliance"
{
    PageType = List;
    SourceTable = "Bid Personnel Compliance";

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
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Role Code";"Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category";"Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum No. of Required Staff";"Minimum No. of Required Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. of Proposed Staff";"Actual No. of Proposed Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Check";"Compliance Check")
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

