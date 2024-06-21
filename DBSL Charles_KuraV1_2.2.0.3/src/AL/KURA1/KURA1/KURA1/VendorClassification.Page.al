#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75034 "Vendor Classification"
{
    PageType = List;
    SourceTable = "Vendor Classification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Category";"Vendor Category")
                {
                    ApplicationArea = Basic;
                }
                field("Certifying Agency";"Certifying Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Certifcate No";"Certifcate No")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate Expiry Date";"Certificate Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
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

