#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75047 "RFI Restricted Vendor Category"
{
    PageType = List;
    SourceTable = "RFI Restricted Vendor Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Category ID";"Prequalification Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted Vendor Category ID";"Restricted Vendor Category ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

