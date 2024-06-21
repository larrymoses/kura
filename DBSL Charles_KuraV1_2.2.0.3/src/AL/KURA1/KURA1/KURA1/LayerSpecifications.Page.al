#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72412 "Layer Specifications"
{
    CardPageID = "Layer Specification";
    PageType = List;
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
                    Visible = false;
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
        area(navigation)
        {
            action("Road Materials")
            {
                ApplicationArea = Basic;
                Image = Lot;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Layer Materials";
                RunPageLink = "Layer Code"=field(Code),
                              "Road Code"=field("Road Code");
            }
        }
    }
}

