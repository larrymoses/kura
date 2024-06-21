#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72715 "Pavement Lab Test SubPage"
{
    PageType = ListPart;
    SourceTable = "Pavement Test Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Layer Code";"Layer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Description";"Layer Description")
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
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Detailed Pavemet Tests")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Detailed Pavemet Tests";
                    RunPageLink = "Document No."=field("Document No."),
                                  "Line No."=field("Line No."),
                                  "Layer Code"=field("Layer Code");
                }
            }
        }
    }
}

