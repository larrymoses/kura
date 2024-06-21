#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75031 "Special Vendor Category"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Special Vendor Category";
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
                field("Vendor Group";"Vendor Group")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Type";"Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default Certifiying Agency";"Default Certifiying Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Certifiying Agency URL";"Certifiying Agency URL")
                {
                    ApplicationArea = Basic;
                }
                field("No of Active Vendors";"No of Active Vendors")
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
            group(ActionGroup12)
            {
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Current Vendor Class"=field(Code);
                }
            }
        }
    }
}

