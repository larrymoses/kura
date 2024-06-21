#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75109 "Tender Security Close Code"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Tender Security Close Code";
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
                field("Security Type";"Security Type")
                {
                    ApplicationArea = Basic;
                }
                field("Close Type";"Close Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Transactions";"No. of Transactions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Determines the No. of Forfeiture and Release transactions done for the bid & performance securities';
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

