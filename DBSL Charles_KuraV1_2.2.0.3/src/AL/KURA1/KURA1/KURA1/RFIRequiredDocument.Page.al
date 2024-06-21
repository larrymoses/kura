#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75049 "RFI Required Document"
{
    PageType = ListPart;
    SourceTable = "RFI Required Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Document Type ID";"Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Track Certificate Expiry";"Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Specialized Provider Req";"Specialized Provider Req")
                {
                    ApplicationArea = Basic;
                }
                field("Linked To category No";"Linked To category No")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Requirement";"Special Group Requirement")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

