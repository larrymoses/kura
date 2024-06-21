#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65012 "Research Project Area List"
{
    CardPageID = "Research Project Area Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Project Area";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Research Program ID";"Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Program Name";"Program Name")
                {
                    ApplicationArea = Basic;
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
    }
}

