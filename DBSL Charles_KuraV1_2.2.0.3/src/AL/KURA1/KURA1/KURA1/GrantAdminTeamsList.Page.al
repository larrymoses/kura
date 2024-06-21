#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65059 "Grant Admin Teams List"
{
    PageType = List;
    SourceTable = "Grant Admin Team";

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
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Next Task";"Next Task")
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
            group("&Team")
            {
                Caption = '&Team';
                Image = SalesPurchaseTeam;
                action("Admin Team Members")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Admin Team Members';
                    Image = ExportSalesPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Admin Team Members";
                    RunPageLink = "Team Code"=field(Code);
                    ToolTip = 'View a list of admin within the team.';
                }
            }
        }
    }
}

