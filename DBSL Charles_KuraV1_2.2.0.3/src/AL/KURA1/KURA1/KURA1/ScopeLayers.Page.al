#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72589 "Scope Layers"
{
    PageType = List;
    SourceTable = Layer;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
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
            action("Material Improvements")
            {
                ApplicationArea = Basic;
                Image = MapAccounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Standard Material Improvements";
                // RunPageLink = "Material Code"=field(Field15),
                //               "Road  Code"=field(Field9);
            }
        }
    }
}

