#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72594 "Project Funding Sources"
{
    CardPageID = "Project Funding Source";
    PageType = List;
    SourceTable = "Project Funding Source";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID";"Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("KeRRA Budget Code";"KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source ID";"Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Name";"Funding Source Name")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget Cost";"Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Year Budget';
                }
            }
        }
    }

    actions
    {
    }
}

