#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95123 "Audit Location"
{
    PageType = Card;
    SourceTable = "Audit Location";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID";"Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Site Type";"Audit Site Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person";"Contact Person")
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
                field("No. of Audit Projects";"No. of Audit Projects")
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

