#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72411 "Layers SubPage"
{
    Caption = 'Layers';
    PageType = ListPart;
    SourceTable = "Layer Specification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Thickness(MM)";"Thickness(MM)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                Image = Line;
                action(Material)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = '&Material';
                    Image = Components;
                    RunObject = Page "Layer Materials";
                    RunPageLink = "Layer Code"=field(Code);
                    ToolTip = 'View how the actual and the projected available balance of an item will develop over time according to supply and demand events.';
                }
            }
        }
    }
}

