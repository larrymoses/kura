#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95014 "Risk Mgt Framework Detail"
{
    Editable = true;
    PageType = List;
    SourceTable = "Risk Mgt Framework Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("RMF Section";"RMF Section")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Description;Description)
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
            group("&Line Functions")
            {
                action("Risk Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Risk Sources";
                    Visible = false;
                }
            }
        }
    }
}

