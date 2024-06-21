#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65032 "Funding Source List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Funding Source";
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
                field("Funding Agency";"Funding Agency")
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
            group(ActionGroup7)
            {
                action("Funding Agencies")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Funding Agency List";
                }
                action("Procurement Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Plan Entry";
                    RunPageLink = "Funding Source ID"=field(Code);
                }
                action("Funded Projects")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job List";
                    RunPageLink = "Funding Source"=field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Posted Receipts List";
                }
            }
        }
    }
}

