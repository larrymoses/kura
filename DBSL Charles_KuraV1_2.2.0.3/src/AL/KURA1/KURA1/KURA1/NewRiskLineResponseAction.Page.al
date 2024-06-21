#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95061 "New Risk Line Response Action"
{
    PageType = Card;
    SourceTable = "New Risk Line Resp. Action";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Action ID";"Action ID")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description";"Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No.";"Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Action Status";"Action Status")
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

