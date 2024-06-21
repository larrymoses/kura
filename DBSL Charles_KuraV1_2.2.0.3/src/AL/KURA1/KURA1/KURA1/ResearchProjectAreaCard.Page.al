#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65011 "Research Project Area Card"
{
    PageType = Card;
    SourceTable = "Research Project Area";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Research Program ID";"Research Program ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Program Name";"Program Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Area Description";"Project Area Description")
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
        area(navigation)
        {
            group(ActionGroup9)
            {
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                }
                action("Projects Profile")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Job List";
                    RunPageLink = "Research Project Area"=field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

