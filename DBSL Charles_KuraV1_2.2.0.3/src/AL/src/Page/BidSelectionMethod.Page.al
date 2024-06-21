#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75095 "Bid Selection Method"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Bid Selection Method";
    UsageCategory = Administration;

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Overview;Overview)
                {
                    ApplicationArea = Basic;
                }
                field("Applies To Goods";"Applies To Goods")
                {
                    ApplicationArea = Basic;
                }
                field("Applies To Works";"Applies To Works")
                {
                    ApplicationArea = Basic;
                }
                field("Applies To Services";"Applies To Services")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Invitations For Supply";"No. of Invitations For Supply")
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

