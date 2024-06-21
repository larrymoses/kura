#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80204 "Policy Related Framework"
{
    PageType = List;
    SourceTable = "Policy Related Framework";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Policy ID";"Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Framework Code";"Framework Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Articles";"No. of Articles")
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

