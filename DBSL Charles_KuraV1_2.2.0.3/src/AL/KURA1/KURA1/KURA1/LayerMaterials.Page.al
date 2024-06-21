#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72407 "Layer Materials"
{
    CardPageID = "Layer Material";
    PageType = List;
    SourceTable = "Layer Material";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Layer Code";"Layer Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Material Code";"Material Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
        area(navigation)
        {
            action("Material Improvements")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedOnly = true;
                RunObject = Page "Material Improvements";
                RunPageLink = "Material Code"=field(Code),
                              "Layer Code"=field("Layer Code");
            }
        }
    }
}

