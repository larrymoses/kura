#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72087 "Daily Patrol Other Activities"
{
    PageType = ListPart;
    SourceTable = "Daily Patrol Other Activities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Chainage;Chainage)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Photo No";"Photo No")
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

