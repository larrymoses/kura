#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69314 "Training Service Providers"
{
    ApplicationArea = Basic;
    CardPageID = "Training Service Provider";
    PageType = List;
    SourceTable = Vendor;
    SourceTableView = where(Trainer=filter(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Type";"Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field("PIN Number";"PIN Number")
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

