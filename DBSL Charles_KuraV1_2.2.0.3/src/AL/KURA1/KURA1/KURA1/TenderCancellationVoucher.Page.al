#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75259 "Tender Cancellation Voucher"
{
    PageType = Card;
    SourceTable = "Tender Cancellation Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice No";"Invitation Notice No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender No.";"Tender No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Cancel Reason Code";"Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13;Outlook)
            {
            }
            systempart(Control14;Notes)
            {
            }
            systempart(Control15;MyNotes)
            {
            }
            systempart(Control16;Links)
            {
            }
        }
    }

    actions
    {
    }
}

