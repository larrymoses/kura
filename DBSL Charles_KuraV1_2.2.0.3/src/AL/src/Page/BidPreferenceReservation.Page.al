#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75255 "Bid Preference & Reservation"
{
    PageType = List;
    SourceTable = "Bid Preference & Reservation";

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
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("AGPO Certificate No";"AGPO Certificate No")
                {
                    ApplicationArea = Basic;
                }
                field("Registered Special Group";"Registered Special Group")
                {
                    ApplicationArea = Basic;
                }
                field("Products/Service Category";"Products/Service Category")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate Effective Date";"Certificate Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate Expiry Date";"Certificate Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Certifying Agency";"Certifying Agency")
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

