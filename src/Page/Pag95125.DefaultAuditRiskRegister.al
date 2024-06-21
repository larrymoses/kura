#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95125 "Default Audit Risk Register"
{
    PageType = Card;
    SourceTable = "Default Audit Risk Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Audit Risk ID";"Audit Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Title";"Risk Title")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Risk Type";"Audit Risk Type")
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

