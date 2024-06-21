#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70009 "Vendor Target Groups"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Vendor Target Groups";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
        area(navigation)
        {
            action("Supplier List")
            {
                ApplicationArea = Basic;
                Caption = 'Supplier List';
                Image = Vendor;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Vendor List";
                RunPageLink = "Special Groups Type"=field(Code);
            }
        }
    }
}

