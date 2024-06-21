#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72385 "Project Vendors"
{
    PageType = List;
    SourceTable = "Project Vendors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contract No";"Contract No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vendor Type";"Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name";"Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Current;Current)
                {
                    ApplicationArea = Basic;
                }
                field("E-mail Address";"E-mail Address")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(KM)";"Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)";"End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Scope of Subcontracting";"Scope of Subcontracting")
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

