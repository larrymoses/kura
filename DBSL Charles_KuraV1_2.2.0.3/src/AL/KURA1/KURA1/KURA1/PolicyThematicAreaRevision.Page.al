#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80215 "Policy Thematic Area Revision"
{
    PageType = List;
    SourceTable = "Policy Thematic Area Revision";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Revision No.";"Revision No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy ID";"Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
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

