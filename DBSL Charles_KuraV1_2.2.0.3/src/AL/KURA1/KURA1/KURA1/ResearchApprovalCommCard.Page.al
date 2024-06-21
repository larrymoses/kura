#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65028 "Research Approval Comm Card"
{
    PageType = Card;
    SourceTable = "Research Approval Committee";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contact  ID";"Contact  ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Core Mandate";"Core Mandate")
                {
                    ApplicationArea = Basic;
                }
                field("No of Research Submissions";"No of Research Submissions")
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
            group(ActionGroup9)
            {
                action("GFO Approval Comm Entry List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "GFO Approval Comm Entry List";
                    RunPageLink = "RAC ID"=field("Contact  ID");
                }
            }
        }
    }
}

