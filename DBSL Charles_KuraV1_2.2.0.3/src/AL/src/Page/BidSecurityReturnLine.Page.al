#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75322 "Bid Security Return Line"
{
    PageType = ListPart;
    SourceTable = "Bid Security Return Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Form of Security";"Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security ID";"Bid Security ID")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer/Guarantor Name";"Issuer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Security Amount (LCY)";"Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed";"Date Closed")
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

